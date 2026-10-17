import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { infer, parse } from '../src/language.js';

const definition = name => readFileSync(new URL(`../examples/${name}.pl`, import.meta.url), 'utf8').split('% Answer and Reason')[0];
const relation = (records, name, arity) => records.filter(record => record.goal.relation === `predicate:${name}/${arity}`).map(record => record.goal.terms);
const facts = (program, name, arity) => program.facts.filter(goal => goal.relation === `predicate:${name}/${arity}`).map(goal => goal.terms);
const canonical = values => [...new Set(values.map(value => JSON.stringify(value)))].sort();
const value = term => typeof term === 'string' ? Number(term) : term.atom;

function subsets(values) {
  return Array.from({ length: 2 ** values.length }, (_, mask) => values.filter((_, index) => mask & (1 << index)));
}

test('job-shop feasibility and all optimum schedules match exhaustive start-time enumeration', () => {
  const source = definition('job-shop-scheduling');
  const durations = [3, 2, 2, 4, 2, 3];
  const feasible = [];
  for (let encoding = 0; encoding < 7 ** 6; encoding++) {
    let rest = encoding;
    const starts = durations.map(() => { const start = rest % 7; rest = Math.floor(rest / 7); return start; });
    const ends = starts.map((start, index) => start + durations[index]);
    if (ends[0] > starts[1] || ends[2] > starts[3] || ends[4] > starts[5]) continue;
    const machines = [[0, 3, 4], [1, 2, 5]];
    if (machines.some(operations => operations.some((left, i) => operations.slice(i + 1).some(right =>
      starts[left] < ends[right] && starts[right] < ends[left])))) continue;
    feasible.push([Math.max(...ends), starts]);
  }
  const optimum = Math.min(...feasible.map(([cost]) => cost));
  const records = infer(parse(source + '\n?- best_schedule(Time, Schedule).'));
  const actual = relation(records, 'feasible_schedule', 2).map(([cost, schedule]) => [Number(cost), schedule.list.map(operation => Number(operation.args[1]))]);
  assert.equal(feasible.length, 35);
  assert.equal(optimum, 9);
  assert.deepEqual(canonical(actual), canonical(feasible));
  const optimal = relation(records, 'best_schedule', 2).map(([cost, schedule]) => [Number(cost), schedule.list.map(operation => Number(operation.args[1]))]);
  assert.deepEqual(canonical(optimal), canonical(feasible.filter(([cost]) => cost === optimum)));
  assert.equal(optimal.length, 11);
});

test('charger selection, rejection reasons, and power counterfactuals agree with direct catalog checks', () => {
  const original = definition('explainable-ev-depot-configuration');
  const variants = [original,
    original.replace('site(depot_a, 60,', 'site(depot_a, 80,'),
    original + '\ncharger(economy22, 22, 40, ccs2, three_phase, 100000).\ncharger(portable, 30, 40, ccs2, single_phase, 50000).'];
  for (const source of variants) {
    const program = parse(source + '\n?- blocker(Site, Product, Reason). ?- recommendation(Site, Product). ?- power_upgrade(Site, Product, Extra).');
    const records = infer(program);
    const expectedBlockers = [];
    const compatible = [];
    const upgrades = [];
    for (const site of facts(program, 'site', 5).map(terms => terms.map(value))) {
      const [name, available, required, connector, supply] = site;
      const eligible = [];
      for (const product of facts(program, 'charger', 6).map(terms => terms.map(value))) {
        const [id, rate, power, plug, phases, price] = product;
        const reasons = [];
        if (available < power) reasons.push(['insufficient_site_power', available, power]);
        if (rate < required) reasons.push(['insufficient_charge_rate', rate, required]);
        if (plug !== connector) reasons.push(['connector_mismatch', plug, connector]);
        if (phases !== supply) reasons.push(['supply_mismatch', phases, supply]);
        expectedBlockers.push(...reasons.map(reason => [name, id, reason]));
        if (!reasons.length) eligible.push([id, price]);
        if (power > available && rate >= required && plug === connector && phases === supply) upgrades.push([name, id, power - available]);
      }
      if (eligible.length) {
        const minimum = Math.min(...eligible.map(([, price]) => price));
        compatible.push(...eligible.filter(([, price]) => price === minimum).map(([id]) => [name, id]));
      }
    }
    const actual = relation(records, 'blocker', 3).map(([site, product, reason]) => [site.atom, product.atom, [reason.functor, ...reason.args.map(value)]]);
    assert.deepEqual(canonical(actual), canonical(expectedBlockers));
    assert.deepEqual(canonical(relation(records, 'recommendation', 2).map(terms => terms.map(value))), canonical(compatible));
    assert.deepEqual(canonical(relation(records, 'power_upgrade', 3).map(terms => terms.map(value))), canonical(upgrades));
  }
});

test('supply-chain paths, version ranges, waiver boundaries, and upgrade coverage match an independent search', () => {
  const original = definition('sbom-vulnerability-response');
  const variants = [original, original.replace('current_date(20260828)', 'current_date(20261231)'),
    original.replace('current_date(20260828)', 'current_date(20270101)'),
    original + '\ncomponent(copy, openssl, version(3, 0, 12)). depends(shop_app, copy).'];
  const version = term => term.args.map(part => BigInt(part));
  const compare = (a, b) => { for (let i = 0; i < 3; i++) if (a[i] !== b[i]) return a[i] < b[i] ? -1 : 1; return 0; };
  for (const source of variants) {
    const program = parse(source + '\n?- best_upgrade_plan(Service, Plan, Cost). ?- exposure(Service, Component, Vuln, Path, Score).');
    const records = infer(program);
    const components = new Map(facts(program, 'component', 3).map(([id, name, v]) => [id.atom, [name.atom, version(v)]]));
    const ranges = facts(program, 'affected_range', 5).map(([id, name, lower, upper, score]) => ({ id: id.atom, name: name.atom, lower: version(lower), upper: version(upper), score: Number(score) }));
    const today = BigInt(facts(program, 'current_date', 1)[0][0]);
    const threshold = Number(facts(program, 'blocking_threshold', 1)[0][0]);
    const waivers = facts(program, 'waiver', 3).filter(([, , expiry]) => BigInt(expiry) >= today).map(([service, vuln]) => [service.atom, vuln.atom]);
    const edges = facts(program, 'depends', 2).map(terms => terms.map(value));
    const expectedExposure = [];
    const required = [];
    for (const [serviceTerm, root] of facts(program, 'service', 2)) {
      const service = serviceTerm.atom;
      const stack = [[root.atom]];
      while (stack.length) {
        const path = stack.pop();
        const component = path.at(-1);
        const [name, current] = components.get(component);
        for (const range of ranges) {
          if (range.name !== name || compare(current, range.lower) < 0 || compare(current, range.upper) >= 0) continue;
          expectedExposure.push([service, component, range.id, path, range.score]);
          if (range.score >= threshold && !waivers.some(([s, v]) => s === service && v === range.id)) required.push([service, component, range.id]);
        }
        for (const [from, to] of edges) if (from === component && !path.includes(to)) stack.push([...path, to]);
      }
    }
    const actualExposure = relation(records, 'exposure', 5).map(([service, component, vuln, path, score]) => [service.atom, component.atom, vuln.atom, path.list.map(value), Number(score)]);
    assert.deepEqual(canonical(actualExposure), canonical(expectedExposure));
    assert.deepEqual(canonical(relation(records, 'required_fix', 3).map(terms => terms.map(value))), canonical(required));
    const options = new Map(facts(program, 'upgrade_option', 3).map(([name, cost, upgrades]) =>
      [name.atom, { cost: Number(cost), upgrades: upgrades.list.map(term => [term.args[0].atom, version(term.args[1])]) }]));
    const actions = facts(program, 'upgrade_actions', 1)[0][0].list.map(value);
    const feasible = [];
    for (const [serviceTerm] of facts(program, 'service', 2)) {
      const service = serviceTerm.atom;
      for (const plan of subsets(actions)) {
        const covered = required.filter(([s]) => s === service).every(([, component, vuln]) => {
          const range = ranges.find(range => range.id === vuln);
          return plan.some(action => options.get(action).upgrades.some(([id, fixed]) => id === component && compare(fixed, range.upper) >= 0));
        });
        if (covered) feasible.push([service, plan, plan.reduce((sum, action) => sum + options.get(action).cost, 0)]);
      }
    }
    assert.deepEqual(canonical(relation(records, 'feasible_upgrade_plan', 3).map(([service, plan, cost]) => [service.atom, plan.list.map(value), Number(cost)])), canonical(feasible));
    const best = feasible.length ? Math.min(...feasible.map(row => row[2])) : null;
    assert.deepEqual(canonical(relation(records, 'best_upgrade_plan', 3).map(([service, plan, cost]) => [service.atom, plan.list.map(value), Number(cost)])), canonical(feasible.filter(row => row[2] === best)));
    if (source.includes('current_date(20270101)')) assert.equal(best, 5);
    if (source.includes('component(copy,')) assert.equal(best, null, 'An unpatched second component cannot be covered by patching the first.');
  }
});

function availableNodes(program, plan) {
  const nodes = new Map(facts(program, 'node', 2).map(([name, groups]) => [name.atom, groups.list.map(value)]));
  const providers = facts(program, 'provider', 2).map(terms => terms.map(value));
  const failed = new Set(facts(program, 'failed', 1).map(([name]) => name.atom));
  const available = new Set();
  let changed = true;
  while (changed) {
    changed = false;
    for (const [node, groups] of nodes) {
      if (available.has(node) || failed.has(node) && !plan.includes(node)) continue;
      if (groups.every(group => providers.some(([g, provider]) => g === group && available.has(provider)))) {
        available.add(node); changed = true;
      }
    }
  }
  return available;
}

test('recovery plans respect redundant providers and unseeded cycles cannot bootstrap availability', () => {
  const original = definition('service-outage-recovery');
  for (const source of [original, original.replace('provider(risk_signal, risk_cache).', '')]) {
    const program = parse(source + `
      ?- repair_candidates(All), subset(All, Plan), node(Node, _), operating(Node, Plan).
      ?- best_repair(Plan, Cost).
    `);
    const records = infer(program);
    const candidates = facts(program, 'repair_candidates', 1)[0][0].list.map(value);
    const prices = new Map(facts(program, 'repair_price', 2).map(([node, price]) => [node.atom, Number(price)]));
    const critical = facts(program, 'critical_services', 1)[0][0].list.map(value);
    const expectedOperating = [];
    const feasible = [];
    for (const plan of subsets(candidates)) {
      const available = availableNodes(program, plan);
      expectedOperating.push(...[...available].map(node => [node, plan]));
      if (critical.every(node => available.has(node))) feasible.push([plan, plan.reduce((sum, node) => sum + prices.get(node), 0)]);
    }
    assert.deepEqual(canonical(relation(records, 'operating', 2).map(([node, plan]) => [node.atom, plan.list.map(value)])), canonical(expectedOperating));
    assert.deepEqual(canonical(relation(records, 'feasible_repair', 2).map(([plan, cost]) => [plan.list.map(value), Number(cost)])), canonical(feasible));
    const minimum = feasible.length ? Math.min(...feasible.map(row => row[1])) : null;
    assert.deepEqual(canonical(relation(records, 'best_repair', 2).map(([plan, cost]) => [plan.list.map(value), Number(cost)])), canonical(feasible.filter(row => row[1] === minimum)));
    assert.equal(minimum, source === original ? 3 : null);
  }
});

test('finite sign analysis contains concrete branch and loop executions and detects a removed guard', () => {
  const original = definition('abstract-interpretation');
  const variants = [original, original + '\ntransition(guarded, check, divide, nonpositive, identity).'];
  const sign = number => number < 0 ? 'neg' : number > 0 ? 'pos' : 'zero';
  const accepts = (guard, number) => ({ any: true, negative: number < 0, nonnegative: number >= 0, positive: number > 0, nonpositive: number <= 0 })[guard];
  for (const source of variants) {
    const program = parse(source + '\n?- abs_warning(Program, Warning). ?- nonzero_divisor(Program, Point).');
    const records = infer(program);
    const abstract = new Set(relation(records, 'abs_state', 3).map(terms => terms.map(value).join('/')));
    const transitions = facts(program, 'transition', 5).map(terms => terms.map(value));
    const divisions = new Set(facts(program, 'division', 2).map(terms => terms.map(value).join('/')));
    const concreteWarnings = new Set();
    for (const [nameTerm, entryTerm] of facts(program, 'entry', 2)) {
      const name = nameTerm.atom;
      for (let input = -20; input <= 20; input++) {
        const pending = [[entryTerm.atom, input]];
        const seen = new Set();
        while (pending.length) {
          const [point, current] = pending.pop();
          const key = `${point}/${current}`;
          if (seen.has(key)) continue;
          seen.add(key);
          assert.ok(abstract.has(`${name}/${point}/${sign(current)}`), `${name}: ${point}=${current}`);
          if (current === 0 && divisions.has(`${name}/${point}`)) concreteWarnings.add(`${name}/${point}`);
          for (const [p, from, to, guard, operation] of transitions) {
            if (p !== name || from !== point || !accepts(guard, current)) continue;
            pending.push([to, operation === 'identity' ? current : operation === 'negate' ? -current : current - 1]);
          }
        }
      }
    }
    const actualWarnings = relation(records, 'abs_warning', 2).map(([name, warning]) => `${name.atom}/${warning.args[0].atom}`);
    assert.deepEqual(actualWarnings.sort(), [...concreteWarnings].sort());
    const safe = relation(records, 'nonzero_divisor', 2).map(terms => terms.map(value).join('/'));
    assert.deepEqual(safe, source === original ? ['guarded/divide'] : []);
  }
});

function batteryPlans(program, fromTime, initial) {
  const slots = new Map(facts(program, 'slot', 5).map(terms => terms.map(Number)).map(([time, ...data]) => [time, data]));
  const scalar = name => Number(facts(program, name, 1)[0][0]);
  const actions = facts(program, 'actions', 1)[0][0].list.map(Number);
  const last = scalar('last_slot');
  const results = [];
  const pending = [[fromTime, initial, [], 0]];
  while (pending.length) {
    const [time, charge, plan, cost] = pending.pop();
    if (time > last) { if (charge >= scalar('final_charge_kwh')) results.push([plan, cost]); continue; }
    const [load, solar, tariff, hours] = slots.get(time);
    for (const power of actions) {
      const next = charge + power * hours;
      const grid = load - solar + power;
      if (next < scalar('reserve_kwh') || next > scalar('capacity_kwh') || grid < 0 || grid > scalar('grid_limit_kw') || Math.abs(power) > scalar('power_limit_kw')) continue;
      pending.push([time + 1, next, [...plan, [time, power, grid, next]], cost + grid * hours * tariff]);
    }
  }
  return results;
}

test('battery dynamic-programming values and reconstructed plans match exhaustive physical simulation', () => {
  const original = definition('battery-dispatch');
  const variants = [original, original.replace('slot(1, 2, 0, 2, 1)', 'slot(1, 2, 0, 2, 2)'),
    original.replace('power_limit_kw(2)', 'power_limit_kw(1)')];
  for (const source of variants) {
    const program = parse(source + '\n?- dispatch_plan(Plan, Cost).');
    const records = infer(program);
    const plans = batteryPlans(program, 1, 2);
    const best = Math.min(...plans.map(row => row[1]));
    const actual = relation(records, 'dispatch_plan', 2).map(([plan, cost]) => [plan.list.map(step => step.args.map(Number)), Number(cost)]);
    assert.deepEqual(canonical(actual), canonical(plans.filter(row => row[1] === best)));
    for (const [timeTerm, chargeTerm, result] of relation(records, 'best_cost', 3)) {
      const completions = batteryPlans(program, Number(timeTerm), Number(chargeTerm));
      if (!completions.length) assert.equal(result.atom, 'infeasible');
      else {
        assert.equal(result.functor, 'value');
        assert.equal(Number(result.args[0]), Math.min(...completions.map(row => row[1])));
      }
    }
    if (source === original) { assert.equal(plans.length, 12); assert.equal(best, 28); }
  }
});

test('Pell solutions agree with continued-fraction convergents and satisfy their exact Diophantine equation', () => {
  const records = infer(parse(definition('pell-equation') + '\n?- between(0, 25, N), pell(N, X, Y).'));
  const solutions = relation(records, 'pell', 3);
  assert.ok(solutions.some(([n]) => n === '50'));
  for (const [n, x, y] of solutions) {
    const count = Number(n);
    let expectedX = 1n;
    let expectedY = 0n;
    if (count) {
      let p0 = 0n; let p1 = 1n; let q0 = 1n; let q1 = 0n;
      for (let index = 0; index < 2 * count; index++) {
        const term = index ? 2n : 1n;
        [p0, p1] = [p1, term * p1 + p0];
        [q0, q1] = [q1, term * q1 + q0];
      }
      [expectedX, expectedY] = [p1, q1];
    }
    assert.equal(x, expectedX.toString());
    assert.equal(y, expectedY.toString());
    assert.equal(BigInt(x) ** 2n - 2n * BigInt(y) ** 2n, 1n);
  }
});

test('exact binomial coefficients and Vandermonde sums agree with an independent Pascal triangle', () => {
  const pascal = [[1n]];
  for (let n = 1; n <= 100; n++) pascal.push(Array.from({ length: n + 1 }, (_, k) => (pascal[n - 1][k - 1] ?? 0n) + (pascal[n - 1][k] ?? 0n)));
  const records = infer(parse(definition('binomial-vandermonde') + `
    ?- between(0, 18, N), between(0, N, K), choose(N, K, C).
    ?- vandermonde(4, 3, 3, Sum).
    ?- vandermonde(0, 0, 0, Sum).
  `));
  for (const [n, k, coefficient] of relation(records, 'choose', 3)) assert.equal(coefficient, pascal[Number(n)][Number(k)].toString());
  assert.ok(relation(records, 'choose', 3).some(([n, k]) => n === '100' && k === '50'));
  for (const [n, m, r, sum] of relation(records, 'vandermonde', 4)) {
    let convolution = 0n;
    for (let k = 0; k <= Number(r); k++) convolution += (pascal[Number(n)][k] ?? 0n) * (pascal[Number(m)][Number(r) - k] ?? 0n);
    assert.equal(sum, convolution.toString());
    assert.equal(sum, pascal[Number(n) + Number(m)][Number(r)].toString());
  }
});

test('S3 multiplication and subgroup cosets agree with independent permutation composition', () => {
  const program = parse(definition('lagrange-cosets') + '\n?- lagrange(Order, SubgroupOrder, Index). ?- left_coset(P, Member). ?- normality_counterexample(P, Member).');
  const records = infer(program);
  const permutations = new Map(facts(program, 'element', 2).map(([name, images]) => [name.atom, images.list.map(Number)]));
  const names = new Map([...permutations].map(([name, images]) => [JSON.stringify(images), name]));
  const compose = (p, q) => names.get(JSON.stringify(permutations.get(q).map(image => permutations.get(p)[image - 1])));
  const products = [...permutations.keys()].flatMap(p => [...permutations.keys()].map(q => [p, q, compose(p, q)]));
  assert.deepEqual(canonical(relation(records, 'product', 3).map(terms => terms.map(value))), canonical(products));
  const subgroup = facts(program, 'subgroup', 1).map(([name]) => name.atom);
  const cosets = [];
  const counterexamples = [];
  for (const p of permutations.keys()) {
    const left = subgroup.map(h => compose(p, h)).sort();
    const right = subgroup.map(h => compose(h, p));
    if (p === left[0]) cosets.push(...left.map(member => [p, member]));
    counterexamples.push(...left.filter(member => !right.includes(member)).map(member => [p, member]));
  }
  assert.deepEqual(canonical(relation(records, 'left_coset', 2).map(terms => terms.map(value))), canonical(cosets));
  assert.deepEqual(canonical(relation(records, 'normality_counterexample', 2).map(terms => terms.map(value))), canonical(counterexamples));
  const members = cosets.map(([, member]) => member);
  assert.equal(new Set(members).size, 6);
  assert.equal(members.length, 6);
  assert.deepEqual(relation(records, 'lagrange', 3), [['6', '2', '3']]);
  assert.notEqual(compose('t12', 'c123'), compose('c123', 't12'));
});
