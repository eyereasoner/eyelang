import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { infer, parse, run, say } from '../src/language.js';

const definition = name => readFileSync(new URL(`../examples/${name}.pl`, import.meta.url), 'utf8').split('% Answer and Reason')[0];
const goals = (records, name, arity) => records.filter(record => record.goal.relation === `predicate:${name}/${arity}`).map(record => record.goal);
const sorted = values => [...new Set(values.map(value => JSON.stringify(value)))].sort();

test('service logs agree with an independent parser and correlate only matching user, IP, and trace', () => {
  const source = definition('observability-log-correlation');
  const originals = parse(source).facts.filter(goal => goal.relation === 'predicate:raw_log/2');
  const login = originals.find(goal => goal.terms[0].atom === 'l1').terms[1].atom;
  const payment = originals.find(goal => goal.terms[0].atom === 'l2').terms[1].atom;
  const trace = '4bf92f3577b34da6a3ce929d0e0e4736';
  const extra = [
    ['double_space', login.replace(' level=', '  level=')],
    ['bad_hex', login.replace(trace, 'g'.repeat(32))],
    ['short_hex', login.replace(trace, 'a'.repeat(31))],
    ['empty_user', login.replace('user=alice', 'user=')],
    ['non_ascii', login.replace('user=alice', 'user=álîce')],
    ['trailing', login + ' junk'],
    ['different_trace_login', login.replace('alice', 'charlie').replace(trace, 'c'.repeat(32))],
    ['different_trace_payment', payment.replace('alice', 'charlie').replace(trace, 'd'.repeat(32))],
    ['different_ip_login', login.replace('alice', 'dana')],
    ['different_ip_payment', payment.replace('alice', 'dana').replace('203.0.113.9', '203.0.113.10')],
  ];
  const lines = originals.map(goal => goal.terms.map(term => term.atom)).concat(extra);
  const input = source + extra.map(([id, text]) => say({ relation: 'predicate:raw_log/2', terms: [{ atom: id }, { atom: text }] }) + '.').join('\n') + `
    ?- parsed_event(Log, Event, User, Ip, Trace).
    ?- captured_field(Log, Name, Value).
    ?- unparsed_log(Log).
    ?- trace_alert(User, Trace, Ip).
  `;
  const records = infer(parse(input));
  const parsed = [];
  const rejected = [];
  for (const [id, line] of lines) {
    const tokens = line.split(' ');
    const keys = ['ts', 'level', 'event', 'user', 'ip', 'traceparent'];
    if (tokens.length !== keys.length || !tokens.every((token, i) => token.startsWith(keys[i] + '=') && /^[!-~]+$/.test(token.slice(keys[i].length + 1)))) {
      rejected.push(id); continue;
    }
    const values = tokens.map((token, i) => token.slice(keys[i].length + 1));
    const hex = /^00-([0-9a-f]{32})-([0-9a-f]{16})-([0-9a-f]{2})$/.exec(values[5]);
    if (!hex || !values.slice(1, 4).every(value => /^[A-Za-z0-9_]+$/.test(value))) { rejected.push(id); continue; }
    parsed.push({ id, ts: values[0], level: values[1], event: values[2], user: values[3], ip: values[4], trace_id: hex[1], span_id: hex[2], flags: hex[3] });
  }
  const expectedEvents = parsed.map(row => [row.id, row.event, row.user, row.ip, row.trace_id]);
  assert.deepEqual(sorted(goals(records, 'parsed_event', 5).map(goal => goal.terms.map(term => term.atom))), sorted(expectedEvents));
  const expectedFields = parsed.flatMap(({ id, ...fields }) => Object.entries(fields).map(([name, value]) => [id, name, value]));
  assert.deepEqual(sorted(goals(records, 'captured_field', 3).map(goal => goal.terms.map(term => term.atom))), sorted(expectedFields));
  assert.deepEqual(goals(records, 'unparsed_log', 1).map(goal => goal.terms[0].atom).sort(), rejected.sort());
  const alerts = [];
  for (const left of parsed) for (const right of parsed) {
    if (left.id !== right.id && left.event === 'login_failed' && right.event === 'payment_denied' &&
      left.user === right.user && left.ip === right.ip && left.trace_id === right.trace_id) alerts.push([left.user, left.trace_id, left.ip]);
  }
  assert.deepEqual(sorted(goals(records, 'trace_alert', 3).map(goal => goal.terms.map(term => term.atom))), sorted(alerts));
  assert.equal(alerts.length, 1);
});

test('record audits detect all findings and completed repairs remove the corresponding findings', () => {
  const source = definition('data-quality-audit');
  const query = '\n?- finding(Subject, Reason).';
  const findings = program => goals(infer(parse(program + query)), 'finding', 2).map(say).sort();
  const expected = [
    'finding(customer(c1), conflicting_email("ada@example.org", "ada.new@example.org"))',
    'finding(customer(c2), empty_email)', 'finding(customer(c3), missing_email)',
    'finding(order(o2), unknown_customer(c9))', 'finding(order(o3), invalid_amount(-5))',
    'finding(order(o3), duplicate_key(r09, r10))', 'finding(record(r11), unsupported_shape(shipment, 1))',
  ];
  assert.deepEqual(findings(source), expected.sort());
  const repaired = source.replace('record(r09, order(o3, c2, -5)).', '') + `
    record(r12, email(c3, "mira@example.org")).
    record(r13, customer(c9, "New customer")).
    record(r14, email(c9, "new@example.org")).
    record(r15, email(c2, "")).
  `;
  assert.deepEqual(findings(repaired), expected.filter(text => text.includes('conflicting_email') || text.includes('empty_email') || text.includes('unsupported_shape')).sort());
});

test('critical-path schedules and tied critical branches agree with an independent topological calculation', () => {
  const original = definition('critical-path-schedule');
  const tied = original.replace('[backend, frontend, auth]', '[backend, parallel_backend, frontend, auth]') + '\ntask(parallel_backend, 11, [api_design]).';
  for (const source of [original, tied]) {
    const tasks = new Map(parse(source).facts.filter(goal => goal.relation === 'predicate:task/3').map(goal =>
      [goal.terms[0].atom, { duration: Number(goal.terms[1]), predecessors: goal.terms[2].list.map(term => term.atom) }]));
    const remaining = new Set(tasks.keys());
    const schedule = new Map();
    while (remaining.size) {
      const ready = [...remaining].filter(task => tasks.get(task).predecessors.every(pred => schedule.has(pred)));
      assert.ok(ready.length, 'The fixture must be a DAG.');
      for (const task of ready) {
        const data = tasks.get(task);
        const start = Math.max(0, ...data.predecessors.map(pred => schedule.get(pred).finish));
        schedule.set(task, { start, finish: start + data.duration });
        remaining.delete(task);
      }
    }
    const finish = Math.max(...[...schedule.values()].map(task => task.finish));
    const critical = new Set();
    const pending = [...schedule.keys()].filter(task => schedule.get(task).finish === finish);
    while (pending.length) {
      const task = pending.pop();
      if (critical.has(task)) continue;
      critical.add(task);
      pending.push(...tasks.get(task).predecessors.filter(pred => schedule.get(pred).finish === schedule.get(task).start));
    }
    const records = infer(parse(source + '\n?- critical_path_answer(Kind, Value).'));
    const actualSchedule = goals(records, 'critical_path_answer', 2).filter(goal => goal.terms[0].atom === 'schedule')
      .map(goal => [goal.terms[1].args[0].atom, Number(goal.terms[1].args[1]), Number(goal.terms[1].args[2])]);
    assert.deepEqual(sorted(actualSchedule), sorted([...schedule].map(([name, task]) => [name, task.start, task.finish])));
    assert.deepEqual(goals(records, 'critical_task', 1).map(goal => goal.terms[0].atom).sort(), [...critical].sort());
    assert.deepEqual(goals(records, 'project_finish', 1).map(goal => Number(goal.terms[0])), [finish]);
    if (source === tied) assert.ok(critical.has('api_design') && critical.has('parallel_backend'));
  }
});

test('weighted interval schedules are compatible and globally optimal, including ties and empty choices', () => {
  const original = definition('weighted-interval-scheduling');
  const base = parse(original).facts.filter(goal => goal.relation === 'predicate:interval/4').map(goal => goal.terms.map(Number));
  const fixtures = [base, [[1, 0, 3, 5], [2, 1, 4, 5], [3, 0, 5, 100], [4, 3, 6, 90]],
    [[1, 0, 2, 5], [2, 1, 2, 5]], [[1, 0, 1, -3], [2, 1, 2, -1]], [[1, 0, 1, 4], [2, 1, 2, 9]], []];
  for (const intervals of fixtures) {
    let best = 0;
    const optima = [];
    for (let mask = 0; mask < 2 ** intervals.length; mask++) {
      const selected = intervals.filter((_, index) => mask & (1 << index));
      if (selected.some((left, index) => selected.slice(index + 1).some(right => left[1] < right[2] && right[1] < left[2]))) continue;
      const value = selected.reduce((sum, interval) => sum + interval[3], 0);
      if (value > best) { best = value; optima.length = 0; }
      if (value === best) optima.push(selected.map(interval => interval[0]));
    }
    const source = original.replace(/^interval\(.*\)\.\n/gm, '').replace('last_interval(8).', `last_interval(${intervals.length}).`) +
      intervals.map(interval => `interval(${interval.join(', ')}).`).join('\n') + '\n?- optimal_schedule(Ids, Value).';
    const actual = goals(infer(parse(source)), 'optimal_schedule', 2);
    assert.equal(actual.length, 1);
    const selected = actual[0].terms[0].list.map(Number);
    assert.equal(Number(actual[0].terms[1]), best);
    assert.ok(optima.some(optimum => JSON.stringify(optimum) === JSON.stringify(selected)), JSON.stringify(intervals));
    if (intervals === fixtures[2]) assert.deepEqual(selected, [2], 'The documented tie policy takes the current interval.');
  }
});

test('full airport routes match independent bounded graph search and small cyclic graphs never revisit nodes', () => {
  const source = definition('path-discovery');
  const program = parse(source + '\n?- airroute(From, To, Stops, Route).');
  const labels = new Map(program.facts.filter(goal => goal.relation === 'predicate:airport/2').map(goal => goal.terms.map(term => term.atom)));
  const adjacency = new Map();
  const flights = program.facts.filter(goal => goal.relation === 'predicate:flight/2');
  for (const goal of flights) {
    const [from, to] = goal.terms.map(term => term.atom);
    if (!adjacency.has(from)) adjacency.set(from, []);
    adjacency.get(from).push(to);
  }
  assert.equal(labels.size, 7698);
  assert.equal(flights.length, 37274);
  const request = program.facts.find(goal => goal.relation === 'predicate:route_request/3');
  const [from, to] = request.terms.slice(0, 2).map(term => term.atom);
  const start = [...labels].find(([, label]) => label === from)[0];
  const end = [...labels].find(([, label]) => label === to)[0];
  const expected = [];
  const stack = [[start]];
  while (stack.length) {
    const path = stack.pop();
    const tail = path.at(-1);
    if (tail === end) { expected.push(path.map(node => labels.get(node)).join(' -> ')); continue; }
    if (path.length > Number(request.terms[2]) + 1) continue;
    for (const next of adjacency.get(tail) ?? []) if (!path.includes(next)) stack.push([...path, next]);
  }
  const actual = goals(infer(program), 'airroute', 4).map(goal => goal.terms[3].atom);
  assert.equal(expected.length, 3);
  assert.deepEqual(actual.sort(), expected.sort());
  const helpers = source.split('% Airport names and directed routes.')[0];
  const output = run(helpers + `
    airport(a, 'Aé'). airport(b, 'B'). airport(c, 'C').
    flight(a, a). flight(a, b). flight(b, a). flight(b, c). flight(a, c). flight(c, a).
    ?- route_between('Aé', 'C', 3, Route).
    ?- route_between('Aé', 'Aé', 0, Route).
    ?- aggregate_all(count, route_between('Aé', 'C', 0, Route), Count).
  `);
  assert.deepEqual(output[0].split('\n').sort(), ["Route = 'Aé -> B -> C'.", "Route = 'Aé -> C'."].sort());
  assert.equal(output[1], "Route = 'Aé'.");
  assert.equal(output[2], 'Count = 1.');
});
