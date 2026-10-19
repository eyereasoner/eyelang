import test from 'node:test';
import assert from 'node:assert/strict';
import { mkdtempSync, readFileSync, readdirSync, rmSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { infer, parse, run, say, renderProof, checkProof } from '../src/language.js';
import { exampleCases, updateExampleGoldens } from '../scripts/example-goldens.js';

const examples = new URL('../examples/', import.meta.url);
const taxonomyDepths = [10, 100, 1000, 10000];
const cases = exampleCases();
const definition = name => readFileSync(new URL(`${name}.pl`, examples), 'utf8').split('% Answer and Reason')[0];
const goals = (records, name, arity) => records.filter(record => record.goal.relation === `predicate:${name}/${arity}`).map(record => record.goal);
const relation = (records, name, arity) => goals(records, name, arity).map(goal => goal.terms);
const facts = (program, name, arity) => program.facts.filter(goal => goal.relation === `predicate:${name}/${arity}`).map(goal => goal.terms);
const canonical = values => [...new Set(values.map(value => JSON.stringify(value)))].sort();
const bag = terms => terms.map(term => JSON.stringify(term)).sort();
const value = term => typeof term === 'string' ? Number(term) : term.atom;
const number = term => typeof term === 'string' ? Number(term) : term.real;
const solve = (name, extra) => infer(parse(definition(name) + '\n' + extra));
const close = (actual, expected, tolerance = 1.0e-10) => assert.ok(Math.abs(actual - expected) <= tolerance * Math.max(1, Math.abs(expected)), `${actual} != ${expected}`);
const closeTo = (actual, expected) => close(actual, expected, 1.0e-9);

// Saved ARC transcripts for every bundled example.

test('every example has a golden, without missing or stale transcripts', () => {
  assert.deepEqual(readdirSync(new URL('output/', examples)).sort(),
    cases.map(example => example.file.replace(/\.pl$/, '.txt')));
});

for (const { file, source, golden } of cases) {
  test(`bundled Prolog example: ${file}`, () => {
    const result = run(readFileSync(source, 'utf8'), { arc: true });
    assert.match(result[0], /^% Answer\n/);
    assert.match(result[1], /^% Reason\n/);
    assert.match(result[2], /^% Check\ncheck passed:/);
    assert.doesNotMatch(result[1], /No explanation was requested/);
    assert.doesNotMatch(result[2], /No checks were requested/);
    assert.equal(result.join('\n\n') + '\n', readFileSync(golden, 'utf8').replace(/\r\n/g, '\n'),
      `${file}: ARC transcript changed. Review the difference before running npm run examples:update.`);
  });
}

// Independent certificate checks on complete examples.

for (const name of ['aggregation', 'ackermann', 'text-processing', 'term-structure', 'statistics-summary',
  'vector-similarity', 'turing', 'type-inference', 'critical-path-schedule', 'weighted-interval-scheduling',
  'battery-dispatch', 'abstract-interpretation', 'sbom-vulnerability-response', 'path-discovery', 'deep-taxonomy-10000']) {
  test(`${name}: a complete certificate passes independent checking`, () => {
    const program = readFileSync(new URL(`../examples/${name}.pl`, import.meta.url), 'utf8');
    const parsed = parse(program);
    const proof = renderProof(parsed, infer(parsed, { validateChecks: true }));
    const report = checkProof(parsed, proof);
    assert.equal(report.valid, true);
    assert.equal(checkProof(program, proof).valid, true);
    if (name === 'deep-taxonomy-10000') {
      assert.equal(report.trusted.length, 0);
      assert.ok(report.steps > 10000);
    }
  });
}

// Golden update tooling uses isolated temporary fixtures.

function goldenFixture(t) {
  const directory = mkdtempSync(join(tmpdir(), 'eyeon-goldens-'));
  t.after(() => rmSync(directory, { recursive: true, force: true }));
  writeFileSync(join(directory, 'sample.pl'), 'p(a). ?- p(X). ?- why. :- assertion(p(a)).');
  return directory;
}

test('the golden updater writes full ARC transcripts for every example, including large taxonomies', t => {
  const directory = goldenFixture(t);
  const files = ['deep-taxonomy-1000', 'deep-taxonomy-10000', 'sample'];
  for (const name of files.slice(0, -1)) {
    writeFileSync(join(directory, name + '.pl'), readFileSync(join(directory, 'sample.pl'), 'utf8'));
  }
  assert.equal(updateExampleGoldens(directory), files.length);
  assert.deepEqual(readdirSync(join(directory, 'output')).sort(), files.map(name => name + '.txt'));
  const expected = `% Answer
?- p(X).
X = a.

% Reason
certificate(eyeon, 1).

claim(query(1), [p(a)]).

clause(1, p(a), []).

% step 1
step(p(a), fact(1), [], []).

% Check
check passed: p(a).

condition('C1', resolution, ok, 1).
condition('C2', well_founded, ok, 1).
condition('C3', justification, ok, 1).
condition('C4', coverage, ok, 1).
condition('C5', re_decision, ok, 0).
condition('C6', boundary_consistency, ok, 0).
condition('C7', relevance, ok, 2).
steps(1).
verified(1).
recomputed(0).
trusted(0).
claims(1).
verdict(checked).
`;
  for (const name of files) assert.equal(readFileSync(join(directory, 'output', name + '.txt'), 'utf8'), expected);
});

test('a failed example prevents the updater from overwriting existing goldens', t => {
  const directory = goldenFixture(t);
  updateExampleGoldens(directory);
  const path = join(directory, 'output/sample.txt');
  const saved = readFileSync(path, 'utf8');
  writeFileSync(join(directory, 'sample.pl'), 'p(b). ?- p(X). ?- why. :- assertion(p(b)).');
  writeFileSync(join(directory, 'z-failing.pl'), ':- assertion(missing).');
  assert.throws(() => updateExampleGoldens(directory), /Check failed: missing/);
  assert.equal(readFileSync(path, 'utf8'), saved);
  assert.deepEqual(readdirSync(join(directory, 'output')), ['sample.txt']);
});

// Foundational examples, arithmetic, lists, and supporting evidence.

test('Delfour answers identify the question for each substitution and ground result', () => {
  const source = readFileSync(new URL('delfour.pl', examples), 'utf8');
  const [answer] = run(source, { arc: true });
  assert.ok(answer.includes('?- \'case-name\'(delfour, What).\nWhat = "delfour".'));
  assert.ok(answer.includes('?- outcome(delfour, What).\nWhat = "Allowed".'));
  assert.ok(answer.includes("?- is_a(delfour, 'low-sugar-case').\ntrue."));
  assert.match(answer, /\?- is_a\(Who, 'passed-check'\)\.\nWho = \[delfour,/);
  assert.ok(answer.endsWith("?- is_a(delfour, 'checked-case').\ntrue."));
});

test('complex polar-angle clauses normalize quadrants and rounded full turns', () => {
  const source = readFileSync(new URL('complex.pl', examples), 'utf8');
  assert.doesNotThrow(() => run(source + `
    :- assertion(normalized_angle(0.0, 0.0)).
    :- assertion((Angle is pi/2, normalized_angle(Angle, Angle))).
    :- assertion((Signed is -pi/2, Angle is 3*pi/2, normalized_angle(Signed, Angle))).
    :- assertion((Signed is -pi, Angle is pi, normalized_angle(Signed, Angle))).
    :- assertion(normalized_angle(-1.0e-17, 0.0)).
  `));
});

test('turbine problem maintenance requires a nonempty list of issues', () => {
  const source = readFileSync(new URL('wind-turbine.pl', examples), 'utf8');
  const records = infer(parse(source + `
    turbine(empty, 0, 0, [], 100).
    turbine(atom, 0, 0, vibration, 100).
    turbine(text, 0, 0, "vibration", 100).
    turbine(issues, 0, 0, [vibration, noise], 100).
    ?- needs_maintenance(Turbine, problem_based_maintenance).
  `));
  const turbines = records.filter(({ goal }) => goal.relation === 'predicate:needs_maintenance/2' &&
    goal.terms[1].atom === 'problem_based_maintenance').map(({ goal }) => goal.terms[0].atom);
  assert.deepEqual(turbines.sort(), ['issues', 't456', 't789']);
});

test('population statistics retain repeated observations and agree with independent calculations', () => {
  const samples = [[3, 3, 3], [-4, 1, 1, 6], [2, 9]];
  const fixtures = samples.map((values, index) => `sample(case${index}, [${values.join(',')}]).`).join('\n');
  const records = infer(parse(definition('statistics-summary') + fixtures + '\n?- populationStddev(Name, Value).'));
  for (const [index, values] of samples.entries()) {
    const mean = values.reduce((sum, value) => sum + value, 0) / values.length;
    const variance = values.reduce((sum, value) => sum + (value - mean) ** 2, 0) / values.length;
    for (const [name, expected] of [['mean', mean], ['populationVariance', variance], ['populationStddev', Math.sqrt(variance)]]) {
      const results = records.filter(({ goal }) => goal.relation === `predicate:${name}/2` && goal.terms[0].atom === `case${index}`);
      assert.equal(results.length, 1);
      closeTo(number(results[0].goal.terms[1]), expected);
    }
  }
});

test('vector similarity agrees with independent dot products and lengths', () => {
  const pairs = [[[1, 0], [0, 1]], [[1, -2, 3], [-2, 4, -6]], [[3, 4], [4, 3]]];
  const fixtures = pairs.map(([a, b], index) =>
    `vector(case${index}, a, [${a.join(',')}]). vector(case${index}, b, [${b.join(',')}]).`).join('\n');
  const records = infer(parse(definition('vector-similarity') + fixtures + '\n?- cosineSimilarity(Name, Value).'));
  for (const [index, [a, b]] of pairs.entries()) {
    const expected = a.reduce((sum, value, i) => sum + value * b[i], 0) / (Math.hypot(...a) * Math.hypot(...b));
    const results = records.filter(({ goal }) => goal.relation === 'predicate:cosineSimilarity/2' && goal.terms[0].atom === `case${index}`);
    assert.equal(results.length, 1);
    closeTo(number(results[0].goal.terms[1]), expected);
  }
});

test('annotated type inference respects shadowing and rejects ill-typed expressions', () => {
  const output = run(definition('type-inference') + `
    ?- type_expr([], lam(x, int, lam(x, bool, var(x))), Type).
    ?- type_expr([], app(lam(x, int, var(x)), bool_lit(true)), Type).
    ?- type_expr([], add(int_lit(1), bool_lit(false)), Type).
    ?- type_expr([], if(int_lit(1), int_lit(2), int_lit(3)), Type).
    ?- type_expr([], var(unbound), Type).
  `);
  assert.deepEqual(output, ['Type = fun(int, fun(bool, bool)).', 'false.', 'false.', 'false.', 'false.']);
});

test('symbolic derivatives agree with numerical differences on valid domains', () => {
  const records = infer(parse(definition('symbolic-derivative') + `
    expr(quotient, divide(add(var(x), const(1)), sub(var(x), const(1)))).
    ?- derivative_result(Name, Derivative).
  `));
  const expressions = new Map(records.filter(({ goal }) => goal.relation === 'predicate:expr/2')
    .map(({ goal }) => [goal.terms[0].atom, goal.terms[1]]));
  const derivatives = records.filter(({ goal }) => goal.relation === 'predicate:derivative_result/2');
  assert.equal(derivatives.length, 5);
  function evaluate(term, x) {
    if (term.functor === 'const') return number(term.args[0]);
    if (term.functor === 'var') { assert.equal(term.args[0].atom, 'x'); return x; }
    const left = evaluate(term.args[0], x);
    if (term.functor === 'log') return Math.log(left);
    const right = term.functor === 'pow' ? number(term.args[1]) : evaluate(term.args[1], x);
    switch (term.functor) {
      case 'add': return left + right;
      case 'sub': return left - right;
      case 'mul': return left * right;
      case 'divide': return left / right;
      case 'pow': return left ** right;
      default: assert.fail('Unknown expression constructor: ' + term.functor);
    }
  }
  for (const { goal: { terms: [name, derivative] } } of derivatives) {
    for (const x of [1.5, 2, 3]) {
      const h = 1e-5;
      const expression = expressions.get(name.atom);
      const expected = (evaluate(expression, x + h) - evaluate(expression, x - h)) / (2 * h);
      const actual = evaluate(derivative, x);
      assert.ok(Math.abs(actual - expected) < 1e-7 * Math.max(1, Math.abs(expected)), `${name.atom} at x = ${x}`);
    }
  }
});

test('knapsack feasible and optimal packs match exhaustive enumeration at several capacities', () => {
  const source = definition('knapsack-optimization');
  const items = parse(source).facts.filter(goal => goal.relation === 'predicate:item/3')
    .map(goal => ({ name: goal.terms[0].atom, weight: Number(goal.terms[1]), value: Number(goal.terms[2]) }));
  assert.equal(items.length, 8);
  for (const capacity of [0, 10, 15]) {
    const expected = [];
    for (let mask = 0; mask < 2 ** items.length; mask++) {
      const chosen = items.filter((_, i) => mask & (1 << i));
      const weight = chosen.reduce((sum, item) => sum + item.weight, 0);
      const value = chosen.reduce((sum, item) => sum + item.value, 0);
      if (weight <= capacity) expected.push([chosen.map(item => item.name), weight, value]);
    }
    const best = Math.max(...expected.map(pack => pack[2]));
    const records = infer(parse(source.replace('capacity(15).', `capacity(${capacity}).`) + '\n?- best_pack(Pack, Weight, Value).'));
    for (const [predicate, packs] of [['feasible_pack', expected], ['best_pack', expected.filter(pack => pack[2] === best)]]) {
      const actual = records.filter(({ goal }) => goal.relation === `predicate:${predicate}/3`)
        .map(({ goal }) => [goal.terms[0].list.map(item => item.atom), Number(goal.terms[1]), Number(goal.terms[2])]);
      assert.deepEqual(actual.map(JSON.stringify).sort(), packs.map(JSON.stringify).sort(), `${predicate}, capacity ${capacity}`);
    }
  }
});

for (const depth of taxonomyDepths) {
  test(`taxonomy ${depth}: all classifications retain their supporting steps`, () => {
    const source = readFileSync(new URL(`deep-taxonomy-${depth}.pl`, examples), 'utf8');
    const facts = infer(parse(source)).filter(record=>record.goal.relation === 'predicate:is_a/2');
    assert.equal(facts.length, 3*depth+2);
    const classes = new Map(facts.map(record => [record.goal.terms[1].atom,record]));
    assert.equal(classes.get('n0').rule, null);
    assert.equal(classes.get('a2').premises[0], classes.get(`n${depth}`));
    for (let level=1; level<=depth; level++) {
      for (const branch of ['n','i','j']) {
        const record = classes.get(`${branch}${level}`);
        assert.equal(record.premises.length, 1);
        assert.equal(record.premises[0], classes.get(`n${level-1}`));
      }
    }
  });
}

test('Fibonacci 10000 retains every digit and verifies Cassini independently', () => {
  const source = readFileSync(new URL('fibonacci.pl', examples), 'utf8');
  const result = run(source);
  let previous=0n; let current=1n;
  for(let index=0;index<10000;index++) [previous,current]=[current,previous+current];
  assert.ok(result.includes(`What = ${previous}.`));
  assert.equal(previous.toString().length, 2090);
  assert.ok(result.some(line=>line.startsWith('check passed: cassini(10000, -1)')));
});

test('Hanoi moves are legal, reach the destination, and use seven moves', () => {
  const source = readFileSync(new URL('hanoi.pl', examples), 'utf8');
  const solution = infer(parse(source)).find(record =>
    record.goal.relation === 'predicate:moves/5' && record.goal.terms[0] === '3' &&
    record.goal.terms[1].atom === 'left' && record.goal.terms[2].atom === 'right');
  assert.ok(solution);
  const moves = solution.goal.terms[4].list;
  assert.equal(moves.length, 7);
  const pegs = { left: [3, 2, 1], center: [], right: [] };
  for (const move of moves) {
    assert.equal(move.functor, 'move');
    const [from, to] = move.args.map(peg => peg.atom);
    assert.notEqual(from, to);
    const disk = pegs[from].pop();
    assert.notEqual(disk, undefined, 'A move needs a disk on its source peg.');
    assert.ok(!pegs[to].length || pegs[to].at(-1) > disk, 'A larger disk cannot cover a smaller disk.');
    pegs[to].push(disk);
  }
  assert.deepEqual(pegs, { left: [], center: [], right: [3, 2, 1] });
});

test('Peano arithmetic enumerates every split of three and computes factorial five as 120', () => {
  const source = readFileSync(new URL('peano.pl', examples), 'utf8');
  const records = infer(parse(source));
  const natural = term => {
    let value = 0;
    while (term.functor === 's' && term.args.length === 1) {
      value++;
      term = term.args[0];
    }
    assert.deepEqual(term, { atom: 'zero' });
    return value;
  };
  const splits = records.filter(record => record.goal.relation === 'predicate:add/3' &&
    natural(record.goal.terms[2]) === 3).map(record => record.goal.terms.slice(0, 2).map(natural));
  assert.deepEqual(splits.sort((a, b) => a[0] - b[0]), [[0, 3], [1, 2], [2, 1], [3, 0]]);
  const factorials = new Map(records.filter(record => record.goal.relation === 'predicate:factorial/2')
    .map(record => record.goal.terms.map(natural)));
  let expected = 1;
  for (let n = 0; n <= 5; n++) {
    if (n) expected *= n;
    assert.equal(factorials.get(n), expected);
  }
});

test('Collatz trajectories agree with an independent iterative calculation for starts 1 through 20', () => {
  const source = readFileSync(new URL('collatz.pl', examples), 'utf8');
  const trajectories = new Map(infer(parse(source))
    .filter(record => record.goal.relation === 'predicate:trajectory/2')
    .map(record => [record.goal.terms[0], record.goal.terms[1].list]));
  for (let start = 1n; start <= 20n; start++) {
    const expected = [];
    let n = start;
    while (n !== 1n) {
      expected.push(n.toString());
      n = n % 2n === 0n ? n / 2n : 3n * n + 1n;
    }
    expected.push('1');
    assert.deepEqual(trajectories.get(start.toString()), expected, `Starting value ${start}`);
  }
});

test('the sieve produces exactly the primes found independently by trial division', () => {
  const source = readFileSync(new URL('sieve.pl', examples), 'utf8');
  const results = new Map(infer(parse(source))
    .filter(record => record.goal.relation === 'predicate:primes/2')
    .map(record => [record.goal.terms[0], record.goal.terms[1].list]));
  for (const limit of [1, 2, 10, 100]) {
    const expected = [];
    for (let number = 2; number <= limit; number++) {
      let prime = true;
      for (let divisor = 2; divisor * divisor <= number; divisor++) {
        if (number % divisor === 0) { prime = false; break; }
      }
      if (prime) expected.push(String(number));
    }
    assert.deepEqual(results.get(String(limit)), expected, `Limit ${limit}`);
  }
});

test('interval relations classify every ordered pair by its normalized endpoint order', () => {
  const source = readFileSync(new URL('interval-relations.pl', examples), 'utf8');
  const records = infer(parse(source));
  const intervals = new Map(records.filter(record => record.goal.relation === 'predicate:interval/3')
    .map(record => [record.goal.terms[0].atom, record.goal.terms.slice(1).map(Number)]));
  assert.equal(intervals.size, 10);
  // Endpoint ranks give an independent classification of all thirteen cases.
  const patterns = new Map([
    ['0123', 'before'], ['0112', 'meets'], ['0213', 'overlaps'],
    ['0102', 'starts'], ['1203', 'during'], ['1202', 'finishes'],
    ['0101', 'equals'], ['2301', 'after'], ['1201', 'met_by'],
    ['1302', 'overlapped_by'], ['0201', 'started_by'],
    ['0312', 'contains'], ['0212', 'finished_by'],
  ]);
  const actual = new Map();
  for (const record of records.filter(record => record.goal.relation === 'predicate:relation/3')) {
    const [first, relation, second] = record.goal.terms.map(term => term.atom);
    const pair = `${first}:${second}`;
    if (!actual.has(pair)) actual.set(pair, []);
    actual.get(pair).push(relation);
  }
  assert.equal(actual.size, 100);
  const observed = new Set();
  for (const [first, left] of intervals) for (const [second, right] of intervals) {
    const endpoints = [...left, ...right];
    const ordered = [...new Set(endpoints)].sort((a, b) => a - b);
    const signature = endpoints.map(value => ordered.indexOf(value)).join('');
    const expected = patterns.get(signature);
    assert.ok(expected, `Unknown endpoint order ${signature}`);
    assert.deepEqual(actual.get(`${first}:${second}`), [expected], `${first} and ${second}`);
    observed.add(expected);
  }
  assert.deepEqual([...observed].sort(), [...patterns.values()].sort());
});

test('Padovan results agree with an independent iterative recurrence through index 3674', () => {
  const source = readFileSync(new URL('padovan.pl', examples), 'utf8');
  const records = infer(parse(source)).filter(record => record.goal.relation === 'predicate:padovan/2');
  const expected = [0n, 1n, 1n];
  for (let n = 3; n <= 3674; n++) expected.push(expected[n - 2] + expected[n - 3]);
  for (const { goal } of records) {
    assert.equal(goal.terms[1], expected[Number(goal.terms[0])].toString());
  }
  assert.ok(records.some(record => record.goal.terms[0] === '3674'));
});

test('the Gray-code counter matches binary-reflected Gray code and holds on zero clock pulses', () => {
  const source = readFileSync(new URL('gray-code-counter.pl', examples), 'utf8');
  const counters = infer(parse(source)).filter(record => record.goal.relation === 'predicate:gcc/3');
  for (const clocks of [Array(9).fill(1), [0, 1, 0]]) {
    const record = counters.find(({ goal }) => goal.terms[0].list?.join(',') === clocks.join(',') &&
      goal.terms[1].list?.join(',') === '0,0,0');
    assert.ok(record);
    let value = 0;
    const expected = clocks.map(clock => {
      value = (value + clock) % 8;
      const gray = value ^ (value >> 1);
      return [2, 1, 0].map(shift => String((gray >> shift) & 1));
    });
    assert.deepEqual(record.goal.terms[2].list.map(state => state.list), expected);
  }
});

test('all 92 eight-queen boards have one queen per row and column and no shared diagonals', () => {
  const source = readFileSync(new URL('queens.pl', examples), 'utf8');
  const boards = infer(parse(source)).filter(record => record.goal.relation === 'predicate:queens/2' &&
    record.goal.terms[0] === '8').map(record => record.goal.terms[1].list.map(Number));
  assert.equal(boards.length, 92);
  assert.equal(new Set(boards.map(board => board.join(','))).size, 92);
  for (const board of boards) {
    assert.deepEqual([...board].sort((a, b) => a - b), [1, 2, 3, 4, 5, 6, 7, 8]);
    assert.equal(new Set(board.map((column, row) => column - row)).size, 8);
    assert.equal(new Set(board.map((column, row) => column + row)).size, 8);
  }
});

test('access control rejects a missing required attribute, a missing alternative, or a forbidden attribute', () => {
  const source = readFileSync(new URL('access-control-policy.pl', examples), 'utf8').split('% query')[0];
  for (const [program, accepted] of [
    [source, true],
    [source.replace("has(test1, 'B').", ''), false],
    [source.replace("has(test1, 'C').", ''), false],
    [source + "has(test1, 'D').", false],
  ]) {
    const records = infer(parse(program + '\n?- accepted(Policy).'));
    assert.equal(records.some(record => record.goal.relation === 'predicate:accepted/1'), accepted);
  }
});

// Log parsing, record audits, project schedules, and airport routes.

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
  assert.deepEqual(canonical(goals(records, 'parsed_event', 5).map(goal => goal.terms.map(term => term.atom))), canonical(expectedEvents));
  const expectedFields = parsed.flatMap(({ id, ...fields }) => Object.entries(fields).map(([name, value]) => [id, name, value]));
  assert.deepEqual(canonical(goals(records, 'captured_field', 3).map(goal => goal.terms.map(term => term.atom))), canonical(expectedFields));
  assert.deepEqual(goals(records, 'unparsed_log', 1).map(goal => goal.terms[0].atom).sort(), rejected.sort());
  const alerts = [];
  for (const left of parsed) for (const right of parsed) {
    if (left.id !== right.id && left.event === 'login_failed' && right.event === 'payment_denied' &&
      left.user === right.user && left.ip === right.ip && left.trace_id === right.trace_id) alerts.push([left.user, left.trace_id, left.ip]);
  }
  assert.deepEqual(canonical(goals(records, 'trace_alert', 3).map(goal => goal.terms.map(term => term.atom))), canonical(alerts));
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
    assert.deepEqual(canonical(actualSchedule), canonical([...schedule].map(([name, task]) => [name, task.start, task.finish])));
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

// Optimization, dependency models, static analysis, and exact mathematics.

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

// STEM calculations and independent numerical checks.

test('matrix products match a row-column loop, including integers beyond binary64 precision', () => {
  const matrices = [[1n, 2n, 0n, 1n], [1n, 0n, 3n, 1n], [1n, 0n, 0n, 1n], [0n, 0n, 0n, 0n], [-2n, 3n, 4n, -5n], [9007199254740993n, 1n, -1n, 2n]];
  const input = matrices.map(values => `operand(m(${values.join(',')})).`).join('\n');
  const products = relation(solve('matrix-multiplication', input + '\n?- operand(A), operand(B), multiply(A, B, C).'), 'multiply', 3);
  assert.equal(products.length, matrices.length ** 2);
  for (const [left, right, result] of products) {
    const a = left.args.map(BigInt); const b = right.args.map(BigInt);
    const expected = [0n, 0n, 0n, 0n];
    for (let row = 0; row < 2; row++) for (let col = 0; col < 2; col++) {
      for (let k = 0; k < 2; k++) expected[2 * row + col] += a[2 * row + k] * b[2 * k + col];
    }
    assert.deepEqual(result.args, expected.map(String));
  }
});

test('Hamming decoding corrects every single-bit error for all sixteen payloads', () => {
  const cases = [];
  for (let payload = 0; payload < 16; payload++) {
    const data = [0, 1, 2, 3].map(shift => (payload >> shift) & 1);
    // Encode by XOR-ing the position labels of the set data bits.
    const word = [0, 0, data[0], 0, data[1], data[2], data[3]];
    let parity = 0;
    word.forEach((bit, index) => { if (bit) parity ^= index + 1; });
    for (const position of [1, 2, 4]) word[position - 1] = (parity & position) ? 1 : 0;
    for (let error = 0; error <= 7; error++) {
      const received = [...word];
      if (error) received[error - 1] ^= 1;
      cases.push({ received, word, data, error });
    }
  }
  const queries = cases.map(({ received }) => `?- decode([${received}], Syndrome, Corrected, Data).`).join('\n');
  const decoded = relation(solve('hamming-code', queries), 'decode', 4);
  assert.equal(decoded.length, cases.length);
  for (const [received, syndrome, corrected, data] of decoded) {
    const expected = cases.find(row => row.received.join(',') === received.list.join(','));
    assert.ok(expected);
    assert.equal(Number(syndrome), expected.error);
    assert.deepEqual(corrected.list.map(Number), expected.word);
    assert.deepEqual(data.list.map(Number), expected.data);
  }
});

test('FFT butterflies match a direct DFT, preserve energy, and have conjugate symmetry', () => {
  const inputs = [[0, 1, 2, 3, 4, 5, 6, 7], [1, -1, 1, -1, 1, -1, 1, -1], Array(8).fill(3), [0.25, -2, 7, 0, -3.5, 1, 8, -0.5]];
  for (let index = 0; index < 8; index++) inputs.push(Array.from({ length: 8 }, (_, n) => n === index ? 1 : 0));
  const queries = inputs.map(samples => `?- fft8([${samples}], Bins).`).join('\n');
  const transforms = relation(solve('fft8-numeric', queries), 'fft8', 2);
  assert.equal(transforms.length, inputs.length);
  for (const [samplesTerm, binsTerm] of transforms) {
    const samples = samplesTerm.list.map(number);
    const bins = binsTerm.list.map(bin => bin.args.map(number));
    for (let k = 0; k < 8; k++) {
      const expected = [0, 0];
      for (let n = 0; n < 8; n++) {
        const phase = -2 * Math.PI * k * n / 8;
        expected[0] += samples[n] * Math.cos(phase);
        expected[1] += samples[n] * Math.sin(phase);
      }
      close(bins[k][0], expected[0]); close(bins[k][1], expected[1]);
      close(bins[k][0], bins[(8 - k) % 8][0]); close(bins[k][1], -bins[(8 - k) % 8][1]);
    }
    close(bins.reduce((sum, [r, i]) => sum + r * r + i * i, 0) / 8, samples.reduce((sum, x) => sum + x * x, 0));
  }
});

test('modular powers agree with direct BigInt powers, including negative bases and zero exponents', () => {
  const cases = [];
  for (const base of [-7n, 0n, 2n, 17n, 12345678901234567890n]) {
    for (const exponent of [0n, 1n, 2n, 3n, 30n, 99n, 1000n]) {
      for (const modulus of [1n, 7n, 1009n]) cases.push([base, exponent, modulus]);
    }
  }
  const queries = cases.map(args => `?- pow_mod(${args.join(',')}, Result).`).join('\n');
  const records = relation(solve('modular-exponentiation', queries), 'pow_mod', 4);
  const found = new Set();
  for (const [b, e, m, result] of records) {
    const base = BigInt(b); const exponent = BigInt(e); const modulus = BigInt(m);
    const remainder = base ** exponent % modulus;
    assert.equal(BigInt(result), (remainder + modulus) % modulus);
    found.add([b, e, m].join(','));
  }
  for (const args of cases) assert.ok(found.has(args.join(',')));
  assert.equal(relation(solve('modular-exponentiation', '?- pow_mod(2, -1, 7, X). ?- pow_mod(2, 3, 0, X).'), 'pow_mod', 4).length, 0);
});

test('least squares matches centered covariance and residual-based R squared', () => {
  const datasets = [[[1, 2], [2, 3], [3, 5], [4, 4]], [[-2, 7], [0, 3], [4, -5]], [[0.5, 4], [1.5, 1], [3.5, 2], [5, -1]]];
  const queries = datasets.map(points => `?- regression([${points.map(p => `point(${p})`).join(',')}], Slope, Intercept, R2).`).join('\n');
  const fits = relation(solve('least-squares-regression', queries), 'regression', 4);
  assert.equal(fits.length, datasets.length);
  for (const [pointsTerm, slopeTerm, interceptTerm, r2Term] of fits) {
    const points = pointsTerm.list.map(point => point.args.map(number));
    const meanX = points.reduce((s, [x]) => s + x, 0) / points.length;
    const meanY = points.reduce((s, [, y]) => s + y, 0) / points.length;
    const covariance = points.reduce((s, [x, y]) => s + (x - meanX) * (y - meanY), 0);
    const slope = covariance / points.reduce((s, [x]) => s + (x - meanX) ** 2, 0);
    const intercept = meanY - slope * meanX;
    const residual = points.reduce((s, [x, y]) => s + (y - slope * x - intercept) ** 2, 0);
    const total = points.reduce((s, [, y]) => s + (y - meanY) ** 2, 0);
    close(number(slopeTerm), slope); close(number(interceptTerm), intercept); close(number(r2Term), 1 - residual / total);
  }
  const invalid = '?- regression([], A, B, C). ?- regression([point(1, 2)], A, B, C). ?- regression([point(1, 2), point(1, 3)], A, B, C). ?- regression([point(0, 2), point(1, 2)], A, B, C).';
  const withoutDataset = definition('least-squares-regression').replace(/^dataset\(.*\n/m, '');
  assert.equal(relation(infer(parse(withoutDataset + invalid)), 'regression', 4).length, 0);
});

test('RC cutoff scales inversely with either component and rejects nonpositive components', () => {
  const records = solve('electrical-rc-filter', 'components(double_r, 20000.0, 0.000001). components(double_c, 10000.0, 0.000002). components(zero, 0, 1). components(negative, 1, -1). ?- response(Name, Tau, F).');
  const responses = new Map(relation(records, 'response', 3).map(([id, tau, f]) => [id.atom, [number(tau), number(f)]]));
  assert.equal(responses.size, 3);
  for (const name of ['double_r', 'double_c']) {
    close(responses.get(name)[0], 2 * responses.get('filter1')[0]);
    close(responses.get(name)[1], responses.get('filter1')[1] / 2);
  }
  close(responses.get('filter1')[1], 100 / (2 * Math.PI));
});

test('radioactive activity halves each half-life and conserves the initial activity', () => {
  const input = Array.from({ length: 7 }, (_, n) => `sample(t${n}, 80.0, 8.0, ${n * 8}.0).`).join('\n');
  const records = solve('radioactive-decay', input + '\nsample(half_step, 80.0, 8.0, 4.0). sample(invalid, 80.0, 0, 4). ?- decay(Name, N, Remaining, Decayed).');
  const rows = relation(records, 'decay', 4);
  assert.equal(rows.length, 9);
  for (const [name, count, remaining, decayed] of rows) {
    const n = name.atom === 'demo' ? 2 : name.atom === 'half_step' ? 0.5 : Number(name.atom.slice(1));
    close(number(count), n);
    close(number(remaining), n === 0.5 ? 80 / Math.sqrt(2) : 80 / (2 ** n));
    close(number(remaining) + number(decayed), 80);
  }
});

test('cantilever deflection scales with load, length cubed, and inverse stiffness', () => {
  const input = 'beam(load, 2400.0, 2.5, 200000000000.0, 0.000008, 5.0). beam(length, 1200.0, 5.0, 200000000000.0, 0.000008, 5.0). beam(stiffness, 1200.0, 2.5, 400000000000.0, 0.000008, 5.0).';
  const records = solve('beam-deflection', input + '\n?- deflection_mm(Name, D). ?- within_limit(Name).');
  const values = new Map(relation(records, 'deflection_mm', 2).map(([id, d]) => [id.atom, number(d)]));
  close(values.get('demo'), 3.90625);
  close(values.get('load'), 2 * values.get('demo'));
  close(values.get('length'), 8 * values.get('demo'));
  close(values.get('stiffness'), values.get('demo') / 2);
  assert.deepEqual(relation(records, 'within_limit', 1).map(([id]) => id.atom).sort(), ['demo', 'stiffness']);
});

test('buck ripple obeys inductor volt-seconds and capacitor charge balance', () => {
  const input = 'converter(double_l, 24.0, 5.0, 2.0, 500000.0, 0.000044, 0.000047). converter(double_c, 24.0, 5.0, 2.0, 500000.0, 0.000022, 0.000094). converter(discontinuous, 24.0, 5.0, 0.01, 500000.0, 0.000022, 0.000047).';
  const records = solve('buck-converter-design', input + '\n?- ripple(Name, D, I, Ratio, V).');
  const values = new Map(relation(records, 'ripple', 5).map(([id, ...terms]) => [id.atom, terms.map(number)]));
  assert.equal(values.size, 3, 'The continuous-conduction model excludes the low-load case.');
  const [duty, current, ratio, voltage] = values.get('demo');
  close(duty * 24, 5);
  close(22.0e-6 * current, 5 * (1 - duty) / 500000);
  close(current, ratio * 2);
  close(47.0e-6 * voltage, current / (8 * 500000));
  close(values.get('double_l')[1], current / 2);
  close(values.get('double_c')[3], voltage / 2);
  const strict = definition('buck-converter-design').replace('limits(demo, 0.30, 0.05)', 'limits(demo, 0.10, 0.05)');
  assert.equal(relation(infer(parse(strict + '\n?- within_ripple_limits(Name).')), 'within_ripple_limits', 1).length, 0);
});

test('Hohmann transfer is symmetric under orbit reversal and follows Kepler scaling', () => {
  const input = 'transfer(reverse, 132712440018.0, 227939200.0, 149597870.7). transfer(scaled, 132712440018.0, 598391482.8, 911756800.0). transfer(same, 132712440018.0, 149597870.7, 149597870.7). transfer(invalid, 1, 0, 1).';
  const records = solve('orbital-transfer-design', input + '\n?- hohmann(Name, D1, D2, Days).');
  const values = new Map(relation(records, 'hohmann', 4).map(([id, ...terms]) => [id.atom, terms.map(number)]));
  assert.equal(values.size, 4);
  const [out, arrival, days] = values.get('earth_mars');
  close(values.get('reverse')[0], arrival); close(values.get('reverse')[1], out); close(values.get('reverse')[2], days);
  close(values.get('scaled')[0], out / 2); close(values.get('scaled')[1], arrival / 2); close(values.get('scaled')[2], days * 8);
  close(values.get('same')[0], 0); close(values.get('same')[1], 0);
  // At equal radii the transfer time is half the circular orbital period.
  close(values.get('same')[2], Math.PI * Math.sqrt(149597870.7 ** 3 / 132712440018) / 86400);
});

test('braking gaps use inclusive thresholds and distances follow constant-deceleration kinematics', () => {
  const input = 'scenario(equal, 0, 0.5, 0). scenario(invalid, 10, 0, 50). scenario(double_speed, 27.8, 0.8, 40.0).';
  const records = solve('braking-distance', input + '\n?- gap_status(Name, Status).');
  const rows = relation(records, 'distance', 4);
  assert.equal(rows.length, 6);
  for (const [name, reaction, braking, total] of rows) {
    const r = number(reaction); const b = number(braking); const d = number(total);
    const speed = name.atom === 'equal' ? 0 : ['highway_short_gap', 'double_speed'].includes(name.atom) ? 27.8 : 13.9;
    const mu = name.atom === 'city_wet' ? 0.4 : name.atom === 'city_ice' ? 0.2 : name.atom === 'equal' ? 0.5 : 0.8;
    close(r, speed);
    close(speed ** 2 - 2 * mu * 9.8 * b, 0);
    close(d, r + b);
  }
  const statuses = new Map(relation(records, 'gap_status', 2).map(([id, status]) => [id.atom, status.atom]));
  assert.equal(statuses.size, 6);
  assert.equal(statuses.get('equal'), 'sufficient_in_model');
  assert.equal(statuses.get('double_speed'), 'insufficient_in_model');
});

test('nitrogen budgets conserve mass and classify both ten-percent boundaries inclusively', () => {
  const input = 'field(lower_boundary, 90.0, 0.0, 0.0, 100.0). field(upper_boundary, 110.0, 0.0, 0.0, 100.0). field(all_lost, 20.0, 80.0, 1.0, 100.0). field(invalid, 20.0, 80.0, 1.1, 100.0).';
  const records = solve('field-nitrogen-balance', input + '\n?- status(Field, Status).');
  const budgets = relation(records, 'balance', 7);
  assert.equal(budgets.length, 7);
  const demand = { low_input: 130, balanced_loam: 130, high_input: 160, sandy_high_input: 150, lower_boundary: 100, upper_boundary: 100, all_lost: 100 };
  const expected = new Map();
  for (const [id, ...terms] of budgets) {
    const [total, lost, available, deficit, surplus, index] = terms.map(number);
    close(total, lost + available);
    close(available + deficit - surplus, demand[id.atom]);
    assert.ok(deficit === 0 || surplus === 0);
    close(index, total === 0 ? 0 : surplus * lost / total);
    expected.set(id.atom, available < 0.9 * demand[id.atom] ? 'under' : available > 1.1 * demand[id.atom] ? 'over' : 'balanced');
  }
  const statuses = relation(records, 'status', 2);
  assert.equal(statuses.length, expected.size);
  for (const [id, status] of statuses) assert.equal(status.atom, expected.get(id.atom));
  assert.equal(expected.get('lower_boundary'), 'balanced'); assert.equal(expected.get('upper_boundary'), 'balanced');
});

// Complex polynomial roots and Dijkstra shortest paths.

const add = ([a, b], [c, d]) => [a + c, b + d];
const multiply = ([a, b], [c, d]) => [a * c - b * d, a * d + b * c];
const magnitude = ([r, i]) => Math.hypot(r, i);
const distance = ([a, b], [c, d]) => Math.hypot(a - c, b - d);
const complex = ([r, i]) => `c(${r}, ${i})`;

function coefficients(roots, leading = [1, 0]) {
  let result = [leading];
  for (const [r, i] of roots) {
    const next = Array.from({ length: result.length + 1 }, () => [0, 0]);
    result.forEach((coefficient, index) => {
      next[index] = add(next[index], coefficient);
      next[index + 1] = add(next[index + 1], multiply(coefficient, [-r, -i]));
    });
    result = next;
  }
  return result;
}

test('polynomial formulas recover known complex roots, multiplicities, and coefficients for degrees one through four', () => {
  const rootSets = [
    [[-3, 2]], [[0, 1], [0, -1]], [[1, 0], [2, 0]], [[0, 0], [0, 0]],
    [[1, 0], [2, 0], [3, 0]], [[0, 0], [0, 0], [0, 0]],
    [[0, 1], [0, -1], [2, 0]], [[-1, 0], [-1, 0], [2, 0]],
    [[1, 0], [2, 0], [3, 0], [4, 0]], [[1, 1], [0, 1], [5, 1], [3, 2]],
    [[1, 0], [-1, 0], [0, 1], [0, -1]], [[1, 0], [1, 0], [1, 0], [1, 0]],
    [[0, 0], [0, 0], [2, 0], [-2, 0]], [[1, 0], [1, 0], [2, 0], [3, 0]],
    [[-2, 1], [1, -2], [3, 2], [-1, -1]],
  ];
  const cases = rootSets.map((roots, index) => ({ roots, coefficients: coefficients(roots, index % 2 ? [2, -1] : [1, 0]) }));
  const fixtures = cases.map((row, index) => `input(p${index}, [${row.coefficients.map(complex).join(',')}]).`).join('\n');
  const source = definition('polynomial') + fixtures + '\nactual(Name, Roots) :- input(Name, Coefficients), roots(Coefficients, Roots). ?- actual(Name, Roots).';
  const answers = relation(infer(parse(source)), 'actual', 2);
  assert.equal(answers.length, cases.length);
  for (const [name, rootsTerm] of answers) {
    const expected = cases[Number(name.atom.slice(1))];
    const actual = rootsTerm.list.map(root => root.args.map(number));
    assert.equal(actual.length, expected.roots.length);
    const unmatched = [...expected.roots];
    for (const root of actual) {
      const best = unmatched.reduce((index, candidate, next) => distance(root, candidate) < distance(root, unmatched[index]) ? next : index, 0);
      assert.ok(distance(root, unmatched[best]) < 1.0e-5, `${name.atom}: unexpected root ${root}`);
      unmatched.splice(best, 1);
      const value = expected.coefficients.reduce((accumulator, coefficient) => add(multiply(accumulator, root), coefficient), [0, 0]);
      const scale = expected.coefficients.reduce((sum, coefficient) => sum * magnitude(root) + magnitude(coefficient), 0);
      assert.ok(magnitude(value) < 1.0e-9 * Math.max(1, scale), `${name.atom}: nonzero polynomial residual`);
    }
    // Reconstructing all coefficients also checks that no repeated root is lost.
    const reconstructed = coefficients(actual, expected.coefficients[0]);
    reconstructed.forEach((value, index) => assert.ok(distance(value, expected.coefficients[index]) < 1.0e-7 * Math.max(1, magnitude(expected.coefficients[index])), `${name.atom}: coefficient ${index}`));
  }
});

test('polynomial solver rejects unsupported degrees and zero leading coefficients', () => {
  const source = definition('polynomial') + `
    invalid([]).
    invalid([c(1, 0)]).
    invalid([c(0, 0), c(1, 0)]).
    invalid([c(0, 0), c(1, 0), c(2, 0)]).
    invalid([c(0, 0), c(1, 0), c(2, 0), c(3, 0)]).
    invalid([c(0, 0), c(1, 0), c(2, 0), c(3, 0), c(4, 0)]).
    invalid([c(1, 0), c(0, 0), c(0, 0), c(0, 0), c(0, 0), c(1, 0)]).
    invalid_result(Coefficients, Roots) :- invalid(Coefficients), roots(Coefficients, Roots).
    ?- invalid_result(Coefficients, Roots).
  `;
  assert.equal(relation(infer(parse(source)), 'invalid_result', 2).length, 0);
});

function allPairs(nodes, edges) {
  const matrix = nodes.map((a, i) => nodes.map((b, j) => i === j ? 0n : null));
  for (const [from, to, weight] of edges) {
    const i = nodes.indexOf(from); const j = nodes.indexOf(to);
    if (matrix[i][j] === null || weight < matrix[i][j]) matrix[i][j] = weight;
  }
  for (let k = 0; k < nodes.length; k++) for (let i = 0; i < nodes.length; i++) for (let j = 0; j < nodes.length; j++) {
    if (matrix[i][k] === null || matrix[k][j] === null) continue;
    const candidate = matrix[i][k] + matrix[k][j];
    if (matrix[i][j] === null || candidate < matrix[i][j]) matrix[i][j] = candidate;
  }
  return matrix;
}

test('Dijkstra paths match Floyd-Warshall distances across directed graphs, ties, zero cycles, and large integers', () => {
  const nodes = ['a', 'b', 'c', 'd'];
  const graphs = [[], [['a', 'b', 1n]],
    [['a', 'b', 1n], ['a', 'c', 1n], ['b', 'd', 2n], ['c', 'd', 2n]],
    [['a', 'a', 0n], ['a', 'b', 0n], ['b', 'a', 0n], ['b', 'c', 2n], ['a', 'c', 9n]],
    [['a', 'b', 10n], ['a', 'b', 3n], ['b', 'c', 1n], ['c', 'd', 1n], ['a', 'd', 7n]],
    [['a', 'b', 9007199254740993n], ['b', 'c', 5n], ['a', 'c', 9007199254740999n], ['c', 'd', 1n]],
  ];
  const fixtures = graphs.map((edges, index) => `graph(g${index}, [${edges.map(([a, b, w]) => `edge(${a}, ${b}, ${w})`).join(',')}]).`).join('\n');
  const requests = nodes.flatMap(start => nodes.map(goal => `request(${start}, ${goal}).`)).join('\n');
  const source = definition('dijkstra') + fixtures + '\n' + requests + `
    result(Name, Start, Goal, Path, Cost) :-
      graph(Name, Edges), request(Start, Goal), dijkstra(Edges, Start, Goal, Path, Cost).
    ?- result(Name, Start, Goal, Path, Cost).
  `;
  const results = relation(infer(parse(source)), 'result', 5);
  let count = 0;
  for (const [index, edges] of graphs.entries()) {
    const expected = allPairs(nodes, edges);
    for (let i = 0; i < nodes.length; i++) for (let j = 0; j < nodes.length; j++) {
      const matches = results.filter(([name, start, goal]) => name.atom === `g${index}` && start.atom === nodes[i] && goal.atom === nodes[j]);
      assert.equal(matches.length, expected[i][j] === null ? 0 : 1, `g${index}: ${nodes[i]} -> ${nodes[j]}`);
      if (!matches.length) continue;
      count++;
      const [, , , pathTerm, cost] = matches[0];
      const path = pathTerm.list.map(node => node.atom);
      assert.equal(BigInt(cost), expected[i][j]);
      assert.equal(path[0], nodes[i]); assert.equal(path.at(-1), nodes[j]);
      assert.equal(new Set(path).size, path.length, 'A settled path has no cycles.');
      let sum = 0n;
      for (let step = 1; step < path.length; step++) {
        const weights = edges.filter(([a, b]) => a === path[step - 1] && b === path[step]).map(([, , w]) => w);
        assert.ok(weights.length > 0, 'Each path step is an input edge.');
        sum += weights.reduce((a, b) => a < b ? a : b);
      }
      assert.equal(sum, BigInt(cost));
    }
  }
  assert.equal(results.length, count);
});

test('Dijkstra accepts finite real weights and rejects a negative edge even outside the requested component', () => {
  const source = definition('dijkstra') + `
    ?- dijkstra([edge(a, b, 0.25), edge(b, c, 0.5), edge(a, c, 1.0)], a, c, Path, Cost).
    rejected(Path, Cost) :- dijkstra([edge(a, b, 1), edge(c, d, -1)], a, b, Path, Cost).
    ?- rejected(Path, Cost).
  `;
  const records = infer(parse(source));
  const answers = relation(records, 'dijkstra', 5);
  assert.equal(answers.length, 1);
  assert.deepEqual(answers[0][3].list.map(node => node.atom), ['a', 'b', 'c']);
  assert.equal(number(answers[0][4]), 0.75);
  assert.equal(relation(records, 'rejected', 2).length, 0);
});

// Grouped list collection from order lines.

test('order pick lists match independently grouped line facts, including equal projections and empty orders', () => {
  for (const extra of ['', '\nline(alpha,4,bolts,4). line(empty,1,tape,20).', '\nline(beta,2,washers,12). line(beta,2,washers,12).']) {
    const program = parse(definition('list-collection') + extra + '\n?- pick_list(Order, Items). ?- bulk_list(Order, Items).');
    const records = infer(program);
    const lines = [...new Map(program.facts.filter(fact => fact.relation === 'predicate:line/4')
      .map(fact => [JSON.stringify(fact.terms), fact.terms])).values()];
    const orders = program.facts.filter(fact => fact.relation === 'predicate:order/1').map(fact => fact.terms[0].atom);
    for (const [relation, bulk] of [['pick_list', false], ['bulk_list', true]]) {
      const actual = records.filter(record => record.goal.relation === `predicate:${relation}/2`);
      assert.equal(actual.length, orders.length);
      for (const order of orders) {
        const expected = lines.filter(([id, , , quantity]) => id.atom === order && (!bulk || BigInt(quantity) >= 10n))
          .map(([, , product, quantity]) => ({ functor: 'item', args: [product, quantity] }));
        const matches = actual.filter(record => record.goal.terms[0].atom === order);
        assert.equal(matches.length, 1);
        assert.deepEqual(bag(matches[0].goal.terms[1].list), bag(expected));
      }
    }
    const proof = renderProof(program, records);
    const report = checkProof(program, proof);
    assert.equal(report.valid, true, JSON.stringify(report.failures));
    assert.ok(report.trusted.every(obligation => obligation.reason === 'collection_completeness'));
  }
});
