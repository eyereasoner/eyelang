import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import { run, check, parse, format, formatResult } from '../index.js';
import { array, termKey, ground } from '../src/terms.js';
import { exampleNames, exampleSource, examplesDirectory } from '../tools/example-sources.js';

const heads = source => parse(source).rules.map(rule => rule.head);
const relation = (terms, name) => terms.filter(term => term.name === name);

function templateMatches(template, actual, values) {
  if (template.kind === 'struct' && template.name === 'var' && template.args.length === 1 && template.args[0].kind === 'string') {
    return values.has(template.args[0].value) && termKey(values.get(template.args[0].value)) === termKey(actual);
  }
  if (template.kind === 'struct' && template.name === 'anonymous' && template.args.length === 1) return true;
  if (template.kind !== actual.kind) return false;
  if (template.kind !== 'struct') return termKey(template) === termKey(actual);
  return template.name === actual.name && template.args.length === actual.args.length
    && template.args.every((arg, index) => templateMatches(arg, actual.args[index], values));
}

for (const name of exampleNames()) {
  test(`answers and proofs close over Eyelang syntax: ${name}`, () => {
    const result = run(exampleSource(name));
    for (const proof of [false, true]) {
      const source = formatResult(result, { proof });
      check(source);
      assert.equal(run(source).status, 'complete');
      const terms = heads(source);
      // Parse/print/parse preserves every term, including variable sharing,
      // open lists, strings, exact integers, and nested proof metadata.
      assert.deepEqual(heads(terms.map(term => `${format(term)}.`).join('\n')).map(termKey), terms.map(termKey));
      assert.equal(relation(terms, 'answer').length, result.queries.reduce((n, query) => n + query.answers.length, 0));
      assert.equal(relation(terms, 'proof').length, proof ? result.proofs.length : 0);
      const golden = fs.readFileSync(new URL(`${proof ? 'proof' : 'output'}/${name}`, examplesDirectory), 'utf8');
      assert.equal(source, golden);
    }
  });
}

test('no answers and ground success have distinct facts, not invalid false/true statements', () => {
  const source = formatResult(run('p(a). ask p(b). ask p(a).'));
  assert.match(source, /result\(1, complete, 0\)\./);
  assert.match(source, /result\(2, complete, 1\)\./);
  assert.match(source, /answer\(2, \[\]\)\./);
  assert.equal(relation(heads(source), 'answer').length, 1);
  assert.equal(run(`${source}\nask result(1, complete, 0).`).queries[0].answers.length, 1);
});

test('answers can be queried again with variable sharing intact', () => {
  const source = formatResult(run('id(?x,?x). ask id(?left,?right).'));
  const queries = run(`${source}
    ask answer(1,[binding("left",a),binding("right",a)]).
    ask answer(1,[binding("left",a),binding("right",b)]).`).queries;
  assert.equal(queries[0].answers.length, 1);
  assert.equal(queries[1].answers.length, 0);
  const independent = formatResult(run('any(?x). ask any(?left),any(?right).'));
  assert.equal(run(`${independent}\nask answer(1,[binding("left",a),binding("right",b)]).`).queries[0].answers.length, 1);
});

test('proof conclusions are real terms and linked source facts can be queried', () => {
  const source = formatResult(run('human(socrates). mortal(?x) if human(?x). ask mortal(socrates).'), { proof: true });
  const result = run(`${source}\nask proof(?id, mortal(socrates), ?rule, [uses(?parent, human(socrates))]), proof(?parent, human(socrates), ?fact, []).`);
  assert.equal(result.queries[0].answers.length, 1);
  assert.equal(format(result.queries[0].answers[0].bindings.id), '2');
  assert.doesNotMatch(source, /\$query/);
});

test('proof output includes clause templates and explicit substitutions', () => {
  const source = formatResult(run('source(a,b). pair(?x,?x) if source(?x,?_). ask pair(?left,?right).'), { proof: true });
  assert.match(source, /clause\(2, pair\(var\("x"\), var\("x"\)\), \[call\(source\(var\("x"\), anonymous\(1\)\)\)\]\)\./);
  assert.match(source, /substitution\(2, \[binding\("x", a\)\]\)\./);
  assert.match(source, /substitution\(3, \[binding\("left", a\), binding\("right", a\)\]\)\./);
  assert.doesNotMatch(source, /binding\("_"/);
  check(source);
});

test('explicit substitutions preserve residual variable sharing', () => {
  const source = formatResult(run('any(?x). ask any(?value).'), { proof: true });
  const substitutions = relation(heads(source), 'substitution');
  assert.equal(substitutions.length, 2);
  const ruleValue = substitutions[0].args[1].args[0].args[1];
  assert.equal(ruleValue.kind, 'var');
  check(source);
});

test('query substitutions contain projected variables, not collection locals', () => {
  const source = formatResult(run('item(a). ask collect ?items = ?local where { item(?local) }.'), { proof: true });
  const substitutions = relation(heads(source), 'substitution');
  const queryBindings = array(substitutions.at(-1).args[1]);
  assert.deepEqual(queryBindings.map(binding => binding.args[0].value), ['items']);
});

test('every ground rule conclusion is an instance of its recorded clause and substitution', () => {
  for (const name of exampleNames()) {
    const terms = heads(formatResult(run(exampleSource(name)), { proof: true }));
    const clauses = new Map(relation(terms, 'clause').map(term => [term.args[0].value, term]));
    const substitutions = new Map(relation(terms, 'substitution').map(term => [term.args[0].value, term]));
    const proofs = relation(terms, 'proof');
    assert.equal(substitutions.size, proofs.length, name);
    for (const proof of proofs) {
      const [id, conclusion, source] = proof.args;
      if (source.kind !== 'struct' || source.name !== 'rule' || !ground(conclusion)) continue;
      const recordedClause = clauses.get(source.args[0].value);
      assert.ok(recordedClause, `${name}: missing clause ${source.args[0].value}`);
      const recordedSubstitution = substitutions.get(id.value);
      assert.ok(recordedSubstitution, `${name}: missing substitution ${id.value}`);
      const values = new Map(array(recordedSubstitution.args[1]).map(binding => [binding.args[0].value, binding.args[1]]));
      assert.ok(templateMatches(recordedClause.args[1], conclusion, values), `${name}: proof ${id.value} is not a clause instance`);
    }
  }
});

test('proofs of proof queries are also readable Eyelang programs', () => {
  const source = formatResult(run(exampleSource('proof-audit.eye')), { proof: true });
  const next = run(`${source}\nask proof(?id, support(1, instance_of(socrates, human)), ?source, ?premises).`);
  assert.equal(next.queries[0].answers.length, 1);
  check(formatResult(next, { proof: true }));
});

test('positive proof references include instantiated calls', () => {
  const result = run('same(?x,?x). pair(?x,?y) if same(?x,?y), ?x = a. ask pair(?x,?y).');
  const proof = result.proofs.find(entry => entry.conclusionTerm.name === 'pair');
  assert.equal(format(proof.premises[0].callTerm), 'same(a, a)');
  assert.ok(ground(proof.premises[0].callTerm));
});

test('collection proof locals are not rebound by later enclosing goals', () => {
  const result = run('p(a). ask collect ?xs = ?x where { p(?x) }, ?x = b.');
  const collected = result.proofs.at(-1).premises[0];
  assert.equal(collected.kind, 'collect');
  assert.equal(collected.template.kind, 'var');
  assert.equal(format(collected.valueTerm), '[a]');
  check(formatResult(result, { proof: true }));
});

test('numeric extremes, strings, open lists and independent variables round-trip', () => {
  const result = run(`p(9007199254740993123456789,1e30,"line\\n\\"quote\\"",[a|?tail],pair(?x,?y)). ask p(?a,?b,?c,?d,?e).`);
  const output = formatResult(result, { proof: true });
  const terms = heads(output);
  assert.deepEqual(heads(terms.map(term => `${format(term)}.`).join('\n')).map(termKey), terms.map(termKey));
});

test('serialization is independent of variable allocation in previous runs', () => {
  const source = 'pair(?x,?y). ask pair(?a,?b).';
  const first = formatResult(run(source), { proof: true });
  run(exampleSource('type-inference.eye'));
  assert.equal(formatResult(run(source), { proof: true }), first);
});

test('serialized answers and proofs are independent of source layout', () => {
  const compact = 'human(socrates). mortal(?who) if human(?who). ask mortal(socrates).';
  const spaced = `
# Empty lines, comments, and line wrapping are not proof identity.
human(socrates).

mortal(?who) if
    human(?who).

ask mortal(socrates).
`;
  assert.equal(formatResult(run(spaced)), formatResult(run(compact)));
  assert.equal(formatResult(run(spaced), { proof: true }), formatResult(run(compact), { proof: true }));
});
