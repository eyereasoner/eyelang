import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync, mkdtempSync, writeFileSync, rmSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { spawnSync } from 'node:child_process';
import { parse, infer, run, renderProof, checkProof, checkReportTerms } from '../src/language.js';

function prove(source, options) {
  const program = parse(source);
  const proof = renderProof(program, infer(program, { validateChecks: true }));
  const report = checkProof(program, proof, options);
  if (!report.valid) throw new Error(`Cannot certify this result: ${report.failures[0].detail}`);
  return { proof, report };
}

const source = 'p(a). q(X) :- p(X). r(X) :- q(X). ?- r(X).';
const certificate = () => prove(source).proof;
const header = 'certificate(eyeon, 1).\n';
const invalid = (program, proof, condition, options) => {
  const report = checkProof(program, proof, options);
  assert.equal(report.valid, false, proof);
  assert.ok(report.failures.some(failure => failure.condition === condition), JSON.stringify(report));
  return report;
};

test('certificates cite source clauses and check all seven conditions', () => {
  const { proof, report } = prove(source, { allowTrusted: false });
  assert.equal(report.valid, true);
  assert.equal(report.verified, 3);
  assert.equal(report.trusted.length, 0);
  assert.deepEqual(report.conditions.map(condition => condition.id), ['C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7']);
  assert.ok(report.conditions.every(condition => condition.failed === 0));
  assert.match(proof, /clause\(2, q\(var\('X'\)\), \[p\(var\('X'\)\)\]\)/);
  assert.match(checkReportTerms(report), /verdict\(checked\)\./);
  assert.equal(checkProof(source, proof).valid, true);
});

test('source is authoritative even without clause display records', () => {
  const proof = certificate();
  invalid(source, proof.replace('clause(1, p(a), [])', 'clause(1, p(b), [])'), 'C1');
  invalid(source.replace('p(a)', 'p(b)'), proof, 'C1');
  const without = proof.replace(/^clause\(.*\n/gm, '');
  assert.equal(checkProof(source, without).valid, true);
  invalid(source.replace('p(a)', 'p(b)'), without, 'C1');
});

test('altered conclusions, premises, bindings and citations fail resolution', () => {
  for (const [before, after] of [
    ['step(q(a)', 'step(q(b)'], ['[p(a)]', '[p(b)]'], ["'='('X', a)", "'='('X', b)"],
    ['rule(2)', 'rule(999)'], ['rule(2)', 'fact(2)'],
  ]) invalid(source, certificate().replace(before, after), 'C1');
  invalid(source, certificate().replace("'='('X', a)", "'='('Alien', a)"), 'C1');
  invalid(source, certificate().replace("['='('X', a)]", "['='('X', a), '='('X', a)]"), 'C1');
});

test('source variable sharing and body bindings cannot be forged', () => {
  invalid('same(X, X). ?- same(a,b).', header + 'claim(query(1),[same(a,b)]). step(same(a,b),fact(1),[],[]).', 'C1');
  const program = 'p(a). p(b). q(X) :- p(X), p(X). ?- q(X).';
  const proof = prove(program).proof.replace('rule(3),', 'rule(3),').replace('[p(a), p(a)]', '[p(a), p(b)]');
  invalid(program, proof, 'C1');
});

test('missing supporting steps and unsupported claims fail coverage', () => {
  invalid(source, certificate().replace(/^step\(q\(a\).*\n/m, ''), 'C4');
  invalid(source, certificate() + 'claim(query(1),[r(b)]).\n', 'C4');
  invalid(source, '', 'C4');
  assert.throws(() => prove('p(a). ?- missing.'), /successful claims/);
});

test('certificates cannot justify themselves with cycles', () => {
  invalid('p :- p. ?- p.', header + 'claim(query(1),[p]). step(p,rule(1),[],[p]).', 'C2');
  invalid('p :- q. q :- p. ?- p.', header +
    'claim(query(1),[p]). step(p,rule(1),[],[q]). step(q,rule(2),[],[p]).', 'C2');
});

test('malformed records, unknown justifications, directives and versions fail shape checks', () => {
  for (const proof of [
    certificate().replace('rule(2)', 'magic'), certificate() + 'step(q(a),rule(2),[],[]).',
    header + 'step(q(a),rule(2),broken,[]).', header + 'step(q(a),rule(2),[],[]):-true.',
    certificate() + ':- table q/1.', certificate() + '?- r(X).', certificate() + ':- assertion(r(a)).',
    certificate().replace('certificate(eyeon, 1)', 'certificate(eyeon, 99)'),
    certificate() + header, certificate().replace(header, ''), 'unterminated(',
  ]) invalid(source, proof, 'C3');
});

test('builtins are recomputed without consulting source definitions', () => {
  const program = '?- X is 2+3.';
  const { proof, report } = prove(program, { allowTrusted: false });
  assert.equal(report.redecided, 1);
  invalid(program, proof.replaceAll('is(5,', 'is(7,'), 'C5');
  invalid('evil. ?- evil.', header + 'claim(query(1),[evil]). step(evil,builtin,[],[]).', 'C5');
  invalid('?- true.', header + 'claim(query(1),[true]). step(false,builtin,[],[]).', 'C5');
  assert.equal(prove('?- X = f(a), X =.. L.', { allowTrusted: false }).report.valid, true);
  assert.equal(prove('?- atom_codes(A, [233, 128512]), string_codes(S, [97]).', { allowTrusted: false }).report.valid, true);
});

test('builtin names at other arities remain source predicates in programs and certificates', () => {
  const program = `
    true(a). false(b). is(c). atom_codes(d). string_codes(e). contains_text(f). '='(g). '=..'(h).
    ?- true, \\+ false, true(a), false(b), is(c), atom_codes(d), string_codes(e), contains_text(f), '='(g), '=..'(h).
  `;
  assert.deepEqual(run(program), ['true.']);
  assert.equal(prove(program, { allowTrusted: false }).report.valid, true);
});

test('certificate notation preserves negative operands, types and exact large integers', () => {
  for (const program of [
    'p(-3.0). q(S) :- p(X), S is X ** 2. ?- q(S).',
    '?- X is -(2^3), Y is (-2)^4, Z is 123456789012345678901234567890^2.',
    String.raw`?- \+ (1 = 1.0), 1 =:= 1.0, "a" @< "b", contains_text("Hello", "EL").`,
  ]) assert.equal(prove(program, { allowTrusted: false }).report.valid, true);
});

test('later bindings resolve earlier unification evidence and open list templates', () => {
  for (const program of [
    'p(a). q(X) :- Y=Z, p(X), Z=X. ?- q(X).',
    ':- table member/2. member(X,[X|_]). member(X,[_|T]):-member(X,T). ?- member(X,[a,b]).',
    '?- _ = _.', 'same(X,X). ?- same(a,a).',
  ]) assert.equal(prove(program, { allowTrusted: false }).report.valid, true);
});

test('absence is an explicit obligation and strict mode rejects it', () => {
  const program = String.raw`p(a). q(X) :- p(X), \+ blocked(X). ?- q(X).`;
  const { proof, report } = prove(program);
  assert.equal(report.trusted.length, 1);
  assert.equal(report.trusted[0].kind, 'absent');
  assert.match(checkReportTerms(report), /verdict\(checked_with_obligations\)/);
  invalid(program, proof, 'C5', { allowTrusted: false });
  assert.throws(() => prove(program, { allowTrusted: false }), /Trusted boundary forbidden/);
  invalid(program + ' blocked(a).', proof, 'C6');
  invalid(String.raw`blocked(X). ?- \+ blocked(a).`, header +
    String.raw`claim(query(1),['\\+'(blocked(a))]). step('\\+'(blocked(a)),absent,[],[]).`, 'C6');
});

test('absence contradicts derived evidence already carried by the certificate', () => {
  const program = String.raw`p(a). blocked(X) :- p(X). ?- blocked(X). ?- \+ blocked(a).`;
  const proof = prove(program).proof +
    String.raw`claim(query(2), ['\\+'(blocked(a))]). step('\\+'(blocked(a)), absent, [], []).`;
  invalid(program, proof, 'C6');
});

test('aggregates recompute recorded tuples while exposing completeness obligations', () => {
  const program = 'score(a,2). score(b,2). score(c,5). ?- aggregate_all(sum(V),score(P,V),N).';
  const { proof, report } = prove(program);
  assert.equal(report.redecided, 1);
  assert.deepEqual(report.trusted.map(item => item.reason), ['collection_completeness']);
  invalid(program, proof.replaceAll('], 9)', '], 8)'), 'C5');
  invalid(program, proof.replace('[[score(a, 2)], [score(b, 2)], [score(c, 5)]]',
    '[[score(a, 2)], [score(a, 2)], [score(c, 5)]]'), 'C5');
  invalid(program, proof.replace('[[score(a, 2)], [score(b, 2)], [score(c, 5)]]', '[[score(a, 2)]]'), 'C5');
  invalid(program + ' score(d,1).', proof, 'C6');
  invalid(program, proof, 'C5', { allowTrusted: false });
});

test('each aggregate calculation is checked against its recorded numeric inputs', () => {
  for (const [operation, expected] of [['count', 2], ['sum', 7], ['min', 2], ['max', 5]]) {
    const template = operation === 'count' ? 'count' : `${operation}(V)`;
    const program = `score(a,2). score(b,5). ?- aggregate_all(${template},score(P,V),N).`;
    assert.deepEqual(run(program), [`N = ${expected}.`]);
    const { proof } = prove(program);
    invalid(program, proof.replaceAll(`], ${expected})`, `], ${expected + 1})`), 'C5');
  }
});

test('list aggregate certificates preserve term values, multiplicity, and completeness obligations', () => {
  const program = 'score(a,2). score(b,2). score(c,5). ?- aggregate_all(list(item(V)),score(P,V),Items).';
  const { proof, report } = prove(program);
  assert.equal(report.redecided, 1);
  assert.deepEqual(report.trusted.map(item => item.reason), ['collection_completeness']);
  invalid(program, proof.replaceAll('[item(2), item(2), item(5)]', '[item(2), item(5)]'), 'C5');
  invalid(program, proof.replaceAll('[item(2), item(2), item(5)]', '[item(2), item(2), item(6)]'), 'C5');
  invalid(program, proof.replace('[[score(a, 2)], [score(b, 2)], [score(c, 5)]]',
    '[[score(a, 2)], [score(a, 2)], [score(c, 5)]]'), 'C5');
  invalid(program, proof.replace('[[score(a, 2)], [score(b, 2)], [score(c, 5)]]',
    '[[score(a, 2)], [score(c, 5)]]'), 'C5');
  invalid(program + ' score(d,9).', proof, 'C6');
  invalid(program, proof, 'C5', { allowTrusted: false });
  for (const source of [
    '?- aggregate_all(list(V),missing(V),Values).',
    '?- aggregate_all(list(1+2),true,Values).',
    '?- aggregate_all(list(V),(V=[a,b]),[X|Tail]).',
  ]) assert.equal(prove(source).report.valid, true);
});

test('aggregate boundary checks use joins, repeated variables, and bound arithmetic', () => {
  const program = 'a(x,2). a(y,3). b(x). ?- aggregate_all(sum(W),(a(P,V),b(P),W is V*2),N).';
  const { proof } = prove(program);
  assert.equal(checkProof(program, proof).valid, true);
  invalid(program + ' b(y).', proof, 'C6');
  const same = 'p(a,a). p(a,b). ?- aggregate_all(count,p(X,X),N).';
  assert.equal(prove(same).report.valid, true);
  const empty = '?- aggregate_all(count,missing(X),0), aggregate_all(sum(X),missing(X),0).';
  assert.equal(prove(empty).report.valid, true);
});

test('claims must preserve conjunction bindings and refer to a source request', () => {
  invalid(source, certificate().replace('query(1)', 'query(99)'), 'C7');
  invalid(source, certificate().replace('claim(query(1), [r(a)])', 'claim(query(1), [p(a)])'), 'C7');
  const program = 'p(a). p(b). ?- p(X), p(X).';
  invalid(program, prove(program).proof.replace('claim(query(1), [p(a), p(a)])', 'claim(query(1), [p(a), p(b)])'), 'C7');
  invalid(source, certificate() + 'step(unrelated, fact(1), [], []).', 'C7');
  invalid(source, certificate() + 'claim(query(1), [r(a)]).', 'C3');
  invalid('?- X=X.', header + "claim(query(1), ['='(A,A)]). step('='(B,B), builtin, [], []).", 'C7');
});

test('certificates prove selected successful answers, not exhaustive search or failed assertions', () => {
  const program = 'p(a). p(b). ?- p(X). ?- missing.';
  const proof = prove(program).proof;
  assert.doesNotMatch(proof, /claim\(query\(2\)/);
  const subset = proof.replace('claim(query(1), [p(b)]).\n', '').replace(/^step\(p\(b\).*\n/m, '');
  assert.equal(checkProof(program, subset).valid, true);
  assert.throws(() => prove('p(a). ?- p(X). :- assertion(missing).'), /Check failed/);
});

test('checking never executes an unrelated infinite producer or source assertion', () => {
  const proof = prove('p(a). ?- p(X).').proof;
  const program = 'p(a). ?- p(X). n(0). n(Y) :- n(X), Y is X+1. :- assertion(false).';
  assert.equal(checkProof(program, proof, { allowTrusted: false }).valid, true);
});

test('check reports are executable data and retain structured failure and obligation goals', () => {
  const { report } = prove(source);
  const data = checkReportTerms(report);
  assert.equal(parse(data).rules.length, 0);
  assert.deepEqual(run(data + "?- condition('C1',Name,ok,Count). ?- verdict(V)."),
    ['Name = resolution, Count = 3.', 'V = checked.']);
  const program = String.raw`?- \+ missing(a).`;
  const conditional = prove(program).report;
  assert.deepEqual(run(checkReportTerms(conditional) + String.raw`?- obligation(absent,Reason,'\\+'(missing(a))).`), ['Reason = theory_scoped.']);
  const collection = prove('p(a). ?- aggregate_all(count,p(X),N).').report;
  const collectionData = checkReportTerms(collection);
  assert.equal(parse(collectionData).rules.length, 0);
  assert.deepEqual(run(collectionData + '?- obligation(collected,Reason,Goal).').length, 1);
  const bad = invalid(source, certificate().replace('rule(2)', 'rule(99)'), 'C1');
  assert.match(checkReportTerms(bad), /failure\('C1', q\(a\),/);
  assert.doesNotThrow(() => JSON.stringify(bad));
  assert.doesNotThrow(() => parse(checkReportTerms(checkProof('', "unterminated('"))));
});

for (const name of ['aggregation', 'ackermann', 'text-processing', 'term-structure', 'statistics-summary',
  'vector-similarity', 'turing', 'type-inference', 'critical-path-schedule', 'weighted-interval-scheduling',
  'battery-dispatch', 'abstract-interpretation', 'sbom-vulnerability-response', 'path-discovery', 'deep-taxonomy-10000']) {
  test(`${name}: a complete certificate passes independent checking`, () => {
    const program = readFileSync(new URL(`../examples/${name}.pl`, import.meta.url), 'utf8');
    const { proof, report } = prove(program);
    assert.equal(report.valid, true);
    assert.equal(checkProof(program, proof).valid, true);
    if (name === 'deep-taxonomy-10000') {
      assert.equal(report.trusted.length, 0);
      assert.ok(report.steps > 10000);
    }
  });
}

test('the ordinary CLI puts one checked certificate in Reason and its report in Check', t => {
  const directory = mkdtempSync(join(tmpdir(), 'eyeon-proof-'));
  t.after(() => rmSync(directory, { recursive: true, force: true }));
  const file = join(directory, 'program.pl');
  const program = source + ' ?- why. ?- why.';
  writeFileSync(file, program);
  const cli = (args, input) => {
    const result = spawnSync(process.execPath, ['eyeon.js', ...args], { input, encoding: 'utf8', timeout: 10000 });
    assert.ifError(result.error);
    return result;
  };
  const result = cli([file]);
  assert.equal(result.status, 0, result.stderr);
  assert.equal(cli(['-'], program).stdout, result.stdout);
  const proof = result.stdout.split('% Reason\n')[1].split('\n\n% Check')[0];
  assert.equal(checkProof(program, proof, { allowTrusted: false }).valid, true);
  assert.equal([...proof.matchAll(/^certificate\(/gm)].length, 1);
  assert.match(result.stdout, /% Check\ncondition\('C1'/);
  assert.match(result.stdout, /verdict\(checked\)/);
  const help = cli(['--help']);
  assert.doesNotMatch(help.stdout, /--proof|--check-proof|--strict-proof|--json/);
  for (const option of ['--proof', '--check-proof', '--strict-proof', '--json']) {
    assert.notEqual(cli([option, file]).status, 0);
  }
});
