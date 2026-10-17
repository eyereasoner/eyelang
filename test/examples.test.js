import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync, readdirSync } from 'node:fs';
import { infer, parse, run } from '../src/language.js';
import { exampleCases } from '../scripts/example-goldens.js';

const examples = new URL('../examples/', import.meta.url);
const taxonomyDepths = [10, 100, 1000, 10000];
const cases = exampleCases();

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
