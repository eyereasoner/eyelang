import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import { run, parse } from '../index.js';
import { array } from '../src/terms.js';
import { exampleSource, examplesDirectory } from '../tools/example-sources.js';

test('Hanoi moves obey disk ordering and reach the target peg', () => {
  const answer = run(exampleSource('hanoi.eye')).queries[0].answers[0];
  const pegs = { left: [3, 2, 1], center: [], right: [] };
  for (const move of array(answer.bindings.moves)) {
    const [from, to] = array(move).map(value => value.name);
    const disk = pegs[from].pop();
    assert.notEqual(disk, undefined);
    assert.ok(!pegs[to].length || pegs[to].at(-1) > disk);
    pegs[to].push(disk);
  }
  assert.deepEqual(pegs, { left: [], center: [], right: [3, 2, 1] });
});

test('every river crossing is legal and leaves both banks safe', () => {
  for (const { bindings } of run(exampleSource('wolf-goat-cabbage.eye')).queries[0].answers) {
    const bank = { person: 0, wolf: 0, goat: 0, cabbage: 0 };
    for (const move of array(bindings.moves)) {
      const cargo = move.name;
      if (cargo !== 'nothing') {
        assert.equal(bank[cargo], bank.person);
        bank[cargo] = 1 - bank[cargo];
      }
      bank.person = 1 - bank.person;
      assert.ok(bank.person === bank.goat || (bank.goat !== bank.wolf && bank.goat !== bank.cabbage));
    }
    assert.deepEqual(bank, { person: 1, wolf: 1, goat: 1, cabbage: 1 });
  }
});

test('project schedule meets every dependency and duration with no avoidable delay', () => {
  const source = exampleSource('critical-path-schedule.eye');
  const facts = parse(source).rules.filter(rule => rule.fact).map(rule => rule.head);
  const durations = new Map(facts.filter(term => term.name === 'task').map(term => [term.args[0].name, term.args[1].value]));
  const dependencies = facts.filter(term => term.name === 'depends').map(term => term.args.map(arg => arg.name));
  const schedule = new Map(run(source).queries[2].answers.map(({ bindings }) => [bindings.task.name, bindings]));
  assert.equal(schedule.size, durations.size);
  for (const [task, { start, finish }] of schedule) {
    const predecessorFinishes = dependencies.filter(([child]) => child === task).map(([, parent]) => schedule.get(parent).finish.value);
    const earliest = predecessorFinishes.reduce((max, value) => value > max ? value : max, 0n);
    assert.equal(start.value, earliest);
    assert.equal(finish.value - start.value, durations.get(task));
  }
});

test('Gray counter changes one bit at a time and visits all eight states', () => {
  const answer = run(exampleSource('gray-code-counter.eye')).queries[0].answers[0];
  const states = [[0n, 0n, 0n], ...array(answer.bindings.states).map(term => array(term).map(bit => bit.value))];
  for (let i = 1; i < states.length; i++) {
    assert.equal(states[i].filter((bit, j) => bit !== states[i - 1][j]).length, 1);
  }
  assert.equal(new Set(states.slice(0, 8).map(bits => bits.join(''))).size, 8);
  assert.deepEqual(states[8], states[0]);
});

test('modular exponentiation agrees with direct integer powers on independent small cases', () => {
  const source = exampleSource('modular-exponentiation.eye');
  const cases = [[2n, 0n, 1n], [2n, 1n, 13n], [11n, 7n, 19n], [13n, 12n, 101n]];
  const result = run(`${source}\n${cases.map(([base, exp, mod]) => `ask mod_pow(${base},${exp},${mod},?value).`).join('\n')}`);
  result.queries.slice(2).forEach((query, i) => {
    assert.equal(query.answers.length, 1);
    const [base, exponent, modulus] = cases[i];
    assert.equal(query.answers[0].bindings.value.value, base ** exponent % modulus);
  });
});

test('dog counts use distinct identities and a strict greater-than-four threshold', () => {
  const source = `${exampleSource('dog-license.eye')}\nhas_dog(alice,dog1). has_dog(bob,dog8). has_dog(bob,dog9).`;
  const result = run(source);
  assert.deepEqual(result.queries[0].answers.map(answer => answer.bindings.person.name), ['alice']);
  assert.deepEqual(result.queries[1].answers.map(({ bindings }) => [bindings.person.name, bindings.count.value]), [['alice', 5n], ['bob', 4n]]);
});

test('metadata from another graph cannot complete the context association', () => {
  const source = exampleSource('context-association.eye').replace(
    'quad(blank(signature2), sec_proofPurpose, "assertionMethod", blank(g3)).',
    'quad(blank(signature2), sec_proofPurpose, "assertionMethod", blank(other)).',
  );
  assert.equal(run(source).queries[0].answers.length, 0);
});

test('sister-source catalog accounts for four new ports from each repository', () => {
  const catalog = JSON.parse(fs.readFileSync(new URL('sources.json', examplesDirectory), 'utf8'));
  const counts = {};
  assert.equal(new Set(catalog.examples.map(entry => entry.example)).size, 12);
  for (const entry of catalog.examples) {
    const project = catalog.projects[entry.project];
    assert.match(project.revision, /^[0-9a-f]{40}$/);
    assert.ok(entry.sources.length);
    assert.ok(entry.adaptation.length);
    const source = exampleSource(entry.example);
    assert.ok(source.includes(`${entry.project}/${entry.sources[0]}`));
    assert.ok(source.includes(project.revision.slice(0, 12)));
    counts[entry.project] = (counts[entry.project] || 0) + 1;
  }
  assert.deepEqual(counts, { eyeprolog: 4, eyeling: 4, eyeleng: 4 });
});
