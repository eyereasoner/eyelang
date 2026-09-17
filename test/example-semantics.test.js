import test from 'node:test';
import assert from 'node:assert/strict';
import { run, parse } from '../index.js';
import { array } from '../src/terms.js';
import { exampleSource } from '../tools/example-sources.js';

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

test('alignment closure includes reflexive and side-scheme roll-ups', () => {
  const answers = run(exampleSource('alignment-demo.eye')).queries[0].answers
    .map(answer => answer.bindings.concept.name).sort();
  assert.deepEqual(answers, ['car', 'heavy_vehicle', 'passenger_car', 'plate_vehicle', 'tel_car']);
});

test('closed graph terms derive social classification and mentioned resources', () => {
  const queries = run(exampleSource('graph-term-emulation.eye')).queries;
  assert.deepEqual(queries[0].answers.map(answer => answer.bindings.graph.name), ['g1']);
  assert.deepEqual(queries[1].answers.map(({ bindings }) => [bindings.graph.name, bindings.resource.name]).sort(), [
    ['g1', 'alice'], ['g1', 'bob'], ['g1', 'carol'], ['g2', 'alice'], ['g2', 'tea'],
  ]);
});

test('RDF example derives a new RDF statement from imported N-Quads', () => {
  const source = exampleSource('rdf12-interoperability.eye');
  const result = run(`${source}\nask rdf(iri("https://example/alice"), iri("https://example/displayName"), ?label, default_graph).`);
  assert.equal(result.queries.at(-1).answers.length, 1);
  const label = result.queries.at(-1).answers[0].bindings.label;
  assert.equal(label.name, 'literal');
  assert.equal(label.args[0].value, 'Bonjour');
  assert.equal(label.args[1].name, 'language');
  assert.equal(label.args[1].args[0].value, 'fr');
});

test('Dijkstra example derives the minimum path from weighted edges', () => {
  const source = exampleSource('dijkstra.eye');
  const answer = run(source).queries[0].answers[0].bindings;
  const path = array(answer.path).map(node => node.name);
  const facts = parse(source).rules.filter(rule => rule.fact && rule.head.name === 'edge').map(rule => rule.head.args);
  const weights = new Map();
  for (const [left, right, weight] of facts) {
    weights.set(`${left.name}:${right.name}`, weight.value);
    weights.set(`${right.name}:${left.name}`, weight.value);
  }
  let cost = 0n;
  for (let i = 1; i < path.length; i++) {
    const weight = weights.get(`${path[i - 1]}:${path[i]}`);
    assert.notEqual(weight, undefined);
    cost += weight;
  }
  assert.deepEqual(path, ['a', 'c', 'b', 'd', 'e', 'f']);
  assert.equal(answer.cost.value, 13n);
  assert.equal(cost, answer.cost.value);
});

test('BMI report derives its category and healthy-weight band from the input', () => {
  const report = run(exampleSource('bmi.eye')).queries[0].answers[0].bindings;
  assert.equal(report.category.name, 'normal');
  assert.ok(Math.abs(report.bmi.value - 22.72) < 1e-12);
  assert.ok(Math.abs(report.healthy_min.value - 58.6) < 1e-12);
  assert.ok(Math.abs(report.healthy_max.value - 78.9) < 1e-12);
});

test('ODRL risks are derived from missing safeguards and ranked by normalized DPV score', () => {
  const source = exampleSource('odrl-dpv-risk-ranked.eye');
  const result = run(source);
  const report = result.queries[0].answers[0].bindings;
  assert.equal(report.agreement.value, 'Example Agreement');
  assert.equal(report.profile.value, 'Example consumer profile');
  const rows = array(report.risks).map(row => {
    const clause = row.args[1], risk = row.args[2], mitigations = row.args[3];
    return {
      rank: row.args[0].value,
      clause: clause.args[0].value,
      clauseText: clause.args[1].value,
      risk: risk.args[0].name,
      score: risk.args[1].value,
      level: risk.args[2].args[0].value,
      severity: risk.args[3].args[0].value,
      explanation: risk.args[4].value,
      mitigations: array(mitigations.args[0]).map(item => item.args[2].value),
    };
  });
  assert.deepEqual(rows, [
    {
      rank: 1n, clause: 'C1', clauseText: 'Provider may remove the user account and associated data at its discretion.',
      risk: 'risk_delete_without_safeguards', score: 100n,
      level: 'https://w3id.org/dpv/risk#HighRisk', severity: 'https://w3id.org/dpv/risk#HighSeverity',
      explanation: 'Risk: account/data removal is permitted without notice safeguards (no notice constraint and no duty to inform). Clause C1: Provider may remove the user account and associated data at its discretion.',
      mitigations: ['Add a notice constraint (minimum noticeDays) before account removal.', 'Add a duty to inform the consumer prior to account removal.'],
    },
    {
      rank: 2n, clause: 'C3', clauseText: 'Provider may share user data with partners for business purposes.',
      risk: 'risk_share_without_consent', score: 97n,
      level: 'https://w3id.org/dpv/risk#HighRisk', severity: 'https://w3id.org/dpv/risk#HighSeverity',
      explanation: 'Risk: user data sharing is permitted without an explicit consent constraint. Clause C3: Provider may share user data with partners for business purposes.',
      mitigations: ['Add an explicit consent constraint before data sharing.'],
    },
    {
      rank: 3n, clause: 'C2', clauseText: 'Provider may change terms by informing users at least 3 days in advance.',
      risk: 'risk_notice_too_short', score: 85n,
      level: 'https://w3id.org/dpv/risk#HighRisk', severity: 'https://w3id.org/dpv/risk#HighSeverity',
      explanation: 'Risk: terms may change with notice (3 days) below consumer requirement (14 days). Clause C2: Provider may change terms by informing users at least 3 days in advance.',
      mitigations: ['Increase minimum noticeDays in the inform duty to meet the consumer requirement.'],
    },
    {
      rank: 4n, clause: 'C4', clauseText: 'Users are not permitted to export their data.',
      risk: 'risk_no_portability', score: 70n,
      level: 'https://w3id.org/dpv/risk#ModerateRisk', severity: 'https://w3id.org/dpv/risk#ModerateSeverity',
      explanation: 'Risk: portability is restricted because exporting user data is prohibited. Clause C4: Users are not permitted to export their data.',
      mitigations: ['Add a permission allowing data export (or remove the prohibition) to support portability.'],
    },
  ]);

  const safeguarded = source.replace(
    'constraint(perm_change_terms, notice_days, gteq, 3).',
    `constraint(perm_change_terms, notice_days, gteq, 14).
constraint(perm_delete_account, notice_days, gteq, 14).
duty(perm_delete_account, inform).
constraint(perm_share_data, consent, eq, true).`,
  );
  const remaining = array(run(safeguarded).queries[0].answers[0].bindings.risks);
  assert.deepEqual(remaining.map(row => [row.args[1].args[0].value, row.args[2].args[0].name]), [['C4', 'risk_no_portability']]);
});

const computedRelations = {
  'aggregation.eye': ['report'],
  'ancestor.eye': ['ancestor'],
  'bayes-diagnosis.eye': ['score', 'screened_in', 'rank'],
  'bmi.eye': ['report'],
  'critical-path-schedule.eye': ['project_finish', 'critical_task', 'schedule'],
  'derivative.eye': ['d'],
  'dijkstra.eye': ['best'],
  'dog-license.eye': ['must_have', 'dog_count'],
  'family-cousins.eye': ['cousin'],
  'fibonacci.eye': ['fib'],
  'four-queens.eye': ['place'],
  'grammar.eye': ['sentence', 'sentence'],
  'graph-join.eye': ['trusted'],
  'gray-code-counter.eye': ['counter', 'gcc'],
  'hanoi.eye': ['hanoi'],
  'modular-exponentiation.eye': ['small_check', 'large_case'],
  'odrl-dpv-risk-ranked.eye': ['ranked_report'],
  'peano-arithmetic.eye': ['factorial'],
  'property-paths.eye': ['grandparent_of', 'has_parent'],
  'query.eye': ['ancestor'],
  'relational-cube-lookup.eye': ['cube'],
  'shortest-path.eye': ['best'],
  'socrates.eye': ['instance_of'],
  'sudoku.eye': ['solve'],
  'type-inference.eye': ['type', 'type'],
  'wolf-goat-cabbage.eye': ['solution'],
};

for (const [file, relations] of Object.entries(computedRelations)) {
  test(`${file} derives computed answers instead of asserting them`, () => {
    const result = run(exampleSource(file));
    assert.equal(result.queries.length, relations.length);
    result.queries.forEach((query, index) => {
      for (const answer of query.answers) {
        const queryProof = result.proofs[answer.proof - 1];
        const call = queryProof.premises.find(premise => premise.kind === 'answer' && premise.callTerm.name === relations[index]);
        assert.ok(call, `${relations[index]} is not a query premise`);
        const derivation = result.proofs[call.proof - 1];
        assert.ok(derivation.premises.length > 0, `${relations[index]} was asserted as a result fact`);
      }
    });
  });
}

test('family generations are inferred from parent links', () => {
  const source = exampleSource('family-cousins.eye');
  const generationFacts = parse(source).rules.filter(rule => rule.fact && rule.head.name === 'generation');
  assert.equal(generationFacts.length, 1);
  assert.deepEqual(run(`${source}\nask generation(?person,?level).`).queries.at(-1).answers
    .map(({ bindings }) => [bindings.person.name, bindings.level.value]).sort(), [
    ['adam', 0n], ['bob', 1n], ['carol', 1n], ['dave', 2n], ['eve', 2n], ['frank', 2n], ['grace', 2n],
    ['heidi', 3n], ['ivan', 3n], ['judy', 3n],
  ]);
});

test('library ancestry, ordinary levels, and event years are derived', () => {
  const descendants = run(exampleSource('import-lib.eye')).queries[0].answers.map(answer => answer.bindings.descendant.name).sort();
  assert.deepEqual(descendants, ['jules', 'kai']);
  const levels = run(exampleSource('version-and-in.eye')).queries;
  assert.deepEqual(levels[0].answers.map(answer => answer.bindings.person.name).sort(), ['alice', 'carol']);
  assert.deepEqual(levels[1].answers.map(answer => answer.bindings.person.name), ['bob']);
  const year = run(exampleSource('now-and-language-builtins.eye')).queries[1].answers[0].bindings.year.value;
  assert.equal(year, 2026n);
});
