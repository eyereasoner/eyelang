#!/usr/bin/env node
// Supplemental regression runner.
// This file collects focused checks that do not belong to the public
// conformance corpus or the example-output corpus: CLI regressions, public API
// checks, and small white-box tests for maintenance-sensitive internals.
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
import publicDefaultApi from '../index.js';
import * as publicApi from '../src/index.js';
import {
  run as runEyeProlog,
  Program,
  makeProgram,
  Solver,
  Env,
  BuiltinRegistry,
  createDefaultRegistry,
  getStrictIsoRegistry,
  getEyePrologRegistry,
  standardLibrarySources,
  eyePrologLibraryIndicators,
  eyePrologNativeLibraryIndicators,
  eyePrologPortableLibraryIndicators,
  eyePrologInteropAutoload,
  eyePrologInteropLibraryIndicators,
  eyePrologInteropLibraryModules,
  atom,
  compound,
  listFromItems,
  numberTerm,
  numberTextFromDouble,
  stringTerm,
  variable,
  copyResolved,
  flattenConjunction,
  properListItems,
  termIsGround,
  termToString,
  unify,
  variantTerms,
  parseProgramText,
} from '../src/index.js';
import { ISO_OPERATOR_DEFINITIONS, parseGoalText, parseNumberTokenText } from '../src/parser.js';
import { PrologError, formalErrorTerm } from '../src/iso.js';
import { compareTerms } from '../src/term.js';
import { formatTermForWrite } from '../src/write.js';
import { selectClauseCandidates } from '../src/program.js';
import {
  TestReporter,
  assertEqual,
  assertIncludes,
  assertNotIncludes,
  isMainModule,
  runStandalone,
} from './test-style.mjs';
import { buildConformanceReport, formatConformanceReport } from './run-conformance-report.mjs';
import { proofExamples } from './run-examples.mjs';
import { goalsFromSource } from './goal-metadata.mjs';
import { renderWg17SyntaxStatus } from '../tools/report-wg17-syntax-coverage.mjs';
import { parseWg17SyntaxTable } from '../tools/upgrade-wg17.mjs';
import { executeWg17Item, matchesUpstreamExpectation, readWg17SyntaxFixture } from './run-wg17.mjs';
import { withStandardModules } from './test-support.mjs';

const testRoot = path.resolve(path.dirname(fileURLToPath(import.meta.url)));
const packageRoot = path.resolve(testRoot, '..');
const bin = path.join(packageRoot, 'bin', 'eyeprolog.js');
const pkg = JSON.parse(fs.readFileSync(path.join(packageRoot, 'package.json'), 'utf8'));
let tmp = null;
let tmpCounter = 0;

function run(source, options = {}) {
  const programSource = Array.isArray(source) ? source.join('\n') : source;
  const text = programSource instanceof Program ? programSource : withStandardModules(String(programSource));
  const goals = options.goals ?? (options.goal == null
    ? (programSource instanceof Program ? [] : goalsFromSource(text))
    : [options.goal]);
  return runEyeProlog(programSource instanceof Program ? programSource : text, { ...options, goals });
}

function sourceAtom(value) {
  return `'${String(value).replaceAll('\\', '\\\\').replaceAll("'", "''")}'`;
}

export function runRegression(reporter = new TestReporter(), requestedSection = null) {
  const sections = [
    { key: 'regression', name: 'Regression', cases: regressionCases },
    { key: 'docs', name: 'Documentation sync', cases: documentationSyncCases },
    { key: 'api', name: 'API', cases: apiCases },
    { key: 'white-box', name: 'White-box', cases: whiteBoxCases },
  ];
  const selected = requestedSection == null
    ? sections
    : sections.filter((section) => section.key === requestedSection);
  if (selected.length === 0) {
    throw new Error(`unknown regression section: ${requestedSection}; expected ${sections.map(({ key }) => key).join(', ')}`);
  }

  tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'eyeprolog-regression.'));
  tmpCounter = 0;
  try {
    for (const section of selected) runSection(reporter, section.name, section.cases());
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
    tmp = null;
  }
}

function regressionCases() {
  return [
    {
      name: 'dif/2 keeps a delayed disequality across later unification (issue #68)',
      run: () => {
        assertEqual(run('', { goal: 'dif(1,Y),Y=1' }).stats.completed_goal_lists, 0,
          'binding a constrained variable to the forbidden value fails');
        assertEqual(run('', { goal: 'dif(1,Y),Y=2' }).stats.completed_goal_lists, 1,
          'binding a constrained variable to a different value succeeds');
        assertEqual(run('', { goal: 'dif(X,Y),X=Y' }).stats.completed_goal_lists, 0,
          'aliasing two constrained variables fails');
        assertEqual(run('', { goal: 'dif(X-Y,1-2),X=Y,Y=1' }).stats.completed_goal_lists, 1,
          'a specialization that makes the terms non-unifiable discharges the constraint');
        assertEqual(run('', { goal: 'dif(X-Y,1-2),X=Y,X=2' }).stats.completed_goal_lists, 1,
          'a second specialization discharges the same structural constraint');
        assertEqual(run('p(a).', { goal: 'dif(X,a),p(X)' }).stats.completed_goal_lists, 0,
          'scalar-fact fast matching still validates annotated variables');
        assertEqual(run('p(b).', { goal: 'dif(X,a),p(X)' }).stats.completed_goal_lists, 1,
          'scalar-fact fast matching can discharge an annotated disequality');
      },
    },
    {
      name: 'library(atts) provides Scryer-style attributed-variable hooks',
      run: () => {
        const source = `:- module(attr_probe, [check_get/0, check_alias/0, check_ok/0, check_bad/0, check_conflict/0, check_backtrack/0, check_term_vars/0]).
:- use_module(library(atts)).
:- attribute mark/1.
attach(X, V) :- put_atts(X, mark(V)).
verify_attributes(Var, Other, Goals) :-
    ( get_atts(Var, mark(V)) ->
        ( var(Other) ->
            ( get_atts(Other, mark(W)) -> V = W ; put_atts(Other, mark(V)) ),
            Goals = []
        ; Goals = [same(Other, V)] )
    ; Goals = [] ).
same(X, Y) :- X = Y.
check_get :- attach(X, a), get_atts(X, mark(a)), X = a.
check_alias :- attach(X, a), X = Y, get_atts(Y, mark(a)), Y = a.
check_ok :- attach(X, 3), X = 3.
check_bad :- attach(X, 3), X = 4.
check_conflict :- attach(X, a), attach(Y, b), X = Y.
check_backtrack :- (attach(X, a), fail ; true), \\+ get_atts(X, mark(_)).
check_term_vars :- attach(X, a), term_attributed_variables(pair(X,Y), [X]), var(Y), X = a.
`;
        assertIncludes(run(source, { goal: 'attr_probe:check_get' }).stdout, 'attr_probe:check_get.', 'get_atts/2');
        assertIncludes(run(source, { goal: 'attr_probe:check_alias' }).stdout, 'attr_probe:check_alias.', 'attribute transfer on aliasing');
        assertIncludes(run(source, { goal: 'attr_probe:check_ok' }).stdout, 'attr_probe:check_ok.', 'post-binding hook goals');
        assertEqual(run(source, { goal: 'attr_probe:check_bad' }).stdout, '', 'post-binding hook can reject a binding');
        assertEqual(run(source, { goal: 'attr_probe:check_conflict' }).stdout, '', 'same-module attributes are verified before aliasing');
        assertIncludes(run(source, { goal: 'attr_probe:check_backtrack' }).stdout, 'attr_probe:check_backtrack.', 'attributes backtrack with Env branches');
        assertIncludes(run(source, { goal: 'attr_probe:check_term_vars' }).stdout, 'attr_probe:check_term_vars.', 'term_attributed_variables/2');

        const residualFile = path.join(tmp, `atts-residual-${++tmpCounter}.pl`);
        fs.writeFileSync(residualFile, `:- use_module(library(atts)).
:- attribute required/1.
attach(X,V) :- put_atts(X, required(V)).
verify_attributes(Var, Other, Goals) :-
    ( get_atts(Var, required(V)) ->
        ( var(Other) -> put_atts(Other, required(V)), Goals=[] ; Goals=[same(Other,V)] )
    ; Goals=[] ).
same(X,X).
attribute_goals(X) --> { get_atts(X, required(V)) }, [required(X,V)].
`);
        const repl = runCli([], { input: `[${sourceAtom(residualFile)}].\nattach(X,a).\nhalt.\n` });
        assertEqual(repl.status, 0, 'attribute residual REPL status');
        assertIncludes(repl.stdout, 'required(X, a).', 'attribute_goals//1 residual projection');

        const scryerShape = Program.parse(`:- module(scryer_shape, [op(700, xfx, #=), probe/0]).
:- op(700, xfx, #=).
:- use_module(library(atts)).
:- attribute first/1, second/0.
probe.
`);
        assertEqual(scryerShape.findGroup('probe', 0, 'scryer_shape')?.module, 'scryer_shape',
          'Scryer-style operator exports and multi-attribute directives load');
      },
    },
    {
      name: 'user source expansion supports Scryer-style generated predicates and DCGs',
      run: () => {
        const termSource = `term_expansion(make_generated, [generated(one),generated(two)]).
make_generated.
`;
        const generated = Program.parse(termSource, { sourceMetadata: false });
        assertEqual(generated.findGroup('generated', 1, 'user')?.clauses.length, 2,
          'term_expansion/2 may emit a list of clauses');
        assertEqual(generated.findGroup('make_generated', 0, 'user'), null,
          'the source marker is replaced by its expansion');

        const dcgSource = `term_expansion(make_dcg, Clause) :-
    expand_term((generated_nt --> [a]), Clause).
make_dcg.
check :- phrase(generated_nt, [a]).
`;
        assertIncludes(run(dcgSource, { goal: 'check' }).stdout, 'check.',
          'expand_term/2 exposes system DCG expansion to a source hook');

        const duoSource = `:- op(1200, xfx, ++>).
term_expansion((Head ++> Body), (Head :- Body)).
generated_duo(ok) ++> true.
`;
        assertEqual(run(duoSource, { goal: 'generated_duo(ok)' }).stats.completed_goal_lists, 1,
          'custom Duo-DCG-style operators can be lowered by term_expansion/2');

        const goalSource = `:- module(expansion_probe, [check/0]).
helper(ok).
user:goal_expansion(old(X), new(X)) :- helper(ok).
new(ok).
check :- old(X), X = ok.
`;
        const goalProgram = Program.parse(goalSource, { sourceMetadata: false });
        const check = goalProgram.findGroup('check', 0, 'expansion_probe')?.clauses[0];
        assertEqual(check?.body[0]?.name, 'new', 'goal_expansion/2 rewrites a later source goal');
        assertEqual(check?.body[0]?.args[0]?.name, check?.body[1]?.args[0]?.name,
          'goal expansion preserves sharing with the surrounding clause');
        assertEqual(goalProgram.findGroup('goal_expansion', 2, 'user')?.clauses[0]?.body[0]?.module,
          'expansion_probe', 'qualified hook clauses retain their lexical body module');
        assertIncludes(run(goalSource, { goal: 'expansion_probe:check' }).stdout, 'expansion_probe:check.',
          'a user hook defined by a library module executes in its lexical module');
      },
    },
    {
      name: 'Scryer CLP(Z) support libraries provide the dependency surface',
      run: () => {
        const source = `:- module(scryer_support, [snapshot/6, blackboard_rollback/1, copy_drops_attrs/0]).
:- use_module(library(assoc)).
:- use_module(library(pairs)).
:- use_module(library(between)).
:- use_module(library(dcgs)).
:- use_module(library(terms)).
:- use_module(library(error)).
:- use_module(library(si)).
:- use_module(library(freeze)).
:- use_module(library(arithmetic)).
:- use_module(library(debug)).
:- use_module(library(format)).
:- use_module(library(atts)).
snapshot(Pairs, Keys, Values, Ns, Bits, Wake) :-
    empty_assoc(A0),
    put_assoc(2, A0, b, A1),
    put_assoc(1, A1, a, A2),
    assoc_to_list(A2, Pairs),
    pairs_keys_values(Pairs, Keys, Values),
    numlist(1, 3, Ns),
    list_si(Ns),
    arithmetic:popcount(13, Bits),
    freeze(X, Wake = awake),
    X = go.
blackboard_rollback(Value) :-
    bb_b_put(k, base),
    ( bb_b_put(k, temporary), fail ; bb_get(k, Value) ).
copy_drops_attrs :-
    put_attr(X, probe, value),
    copy_term_nat(X, Copy),
    term_attributed_variables(Copy, []).
`;
        const snapshot = run(source, { goal: 'scryer_support:snapshot(Pairs,Keys,Values,Ns,Bits,Wake)' });
        assertIncludes(snapshot.stdout,
          'scryer_support:snapshot([1 - a, 2 - b], [1, 2], "ab", [1, 2, 3], 3, awake).',
          'assoc, pairs, between, si, freeze, and arithmetic compatibility');
        assertIncludes(run(source, { goal: 'scryer_support:blackboard_rollback(V)' }).stdout,
          'scryer_support:blackboard_rollback(base).',
          'backtrackable blackboard writes roll back with Env branches');
        assertIncludes(run(source, { goal: 'scryer_support:copy_drops_attrs' }).stdout,
          'scryer_support:copy_drops_attrs.',
          'copy_term_nat/2 omits attributed-variable state');
        assertEqual(run(source, { goal: 'debug:bb_get(missing,_V)' }).stats.completed_goal_lists, 0,
          'bb_get/2 is semidet for an absent key');
        const prelude = `:- module(scryer_clpz_prelude, [probe/0]).
:- use_module(library(assoc)).
:- use_module(library(pairs)).
:- use_module(library(between)).
:- use_module(library(lists)).
:- use_module(library(atts)).
:- use_module(library(iso_ext)).
:- use_module(library(dcgs)).
:- use_module(library(terms)).
:- use_module(library(error), [domain_error/3, type_error/3, can_be/2]).
:- use_module(library(si)).
:- use_module(library(freeze)).
:- use_module(library(arithmetic)).
:- use_module(library(debug)).
:- use_module(library(format)).
:- attribute clpz/1, clpz_aux/1, clpz_relation/1, edges/1, flow/1,
             parent/1, free/1, queue/2, disabled/0.
probe :- empty_assoc(A), copy_term_nat(A, _), bb_b_put(current, ok), bb_get(current, ok).
`;
        assertIncludes(run(prelude, { goal: 'scryer_clpz_prelude:probe' }).stdout,
          'scryer_clpz_prelude:probe.',
          'the dependency and attribute prelude used by upstream clpz.pl loads unchanged');
      },
    },
    {
      name: 'write_term variable_names/1 errors preserve the instantiated option culprit (issue #69)',
      run: () => {
        const scalar = run('', {
          isoStrict: true,
          goal: "catch((VN=1,write_term(T,[variable_names(VN)])),error(E,_),writeq(E))",
        });
        assertEqual(scalar.stdout, 'domain_error(write_option,variable_names(1))', 'scalar culprit');

        const list = run('', {
          isoStrict: true,
          goal: "catch((VN=[[]],write_term(T,[variable_names(VN)])),error(E,_),writeq(E))",
        });
        assertEqual(list.stdout, 'domain_error(write_option,variable_names([[]]))', 'list culprit');

        assertEqual(run('', { isoStrict: true, goal: 'writeq(-(1^2))' }).stdout.split('writeq(')[0],
          '- (1^2)', 'writeq negative power layout');
        assertEqual(run('', { isoStrict: true, goal: 'writeq(-(a^2))' }).stdout.split('writeq(')[0],
          '- (a^2)', 'writeq symbolic negative power layout');
        assertEqual(run('', {
          isoStrict: true,
          goal: "write_term(-X^2,[variable_names(['X'=X])])",
        }).stdout, '- (X^2)', 'write_term variable_names negative power layout');
        assertEqual(run('', {
          isoStrict: true,
          goal: "X=1,write_term(-X^2,[variable_names(['X'=X])])",
        }).stdout.split('1 = 1')[0], '- (1^2)', 'write_term bound variable negative power layout');
      },
    },
    {
      name: 'large source scanning avoids quadratic full-stop lookback',
      run: () => {
        const result = runCli(['examples/path-discovery.pl'], { timeout: 10000 });
        if (result.error) throw new Error(`path-discovery timed out or failed to launch: ${result.error.message}`);
        assertEqual(result.status, 0, `path-discovery status; stderr=${result.stderr}`);
        assertIncludes(result.stdout, "airroute('Ostend-Bruges International Airport', 'Václav Havel Airport Prague'",
          'path-discovery result');
      },
    },
    {
      name: '--proof rule fact explanation output',
      run: () => runWhy({
        program: 'type(socrates, man).\ntype(X, mortal) :- type(X, man).\n',
        goalText: 'type(socrates, mortal)',
        expected: `type(socrates, mortal).
why(
  type(socrates, mortal),
  proof(
    goal(type(socrates, mortal)),
    by(rule("__FILE__", clause(2))),
    bindings([binding("X", socrates)]),
    uses([
      proof(
        goal(type(socrates, man)),
        by(fact("__FILE__", clause(1)))
      )
    ])
  )
).

`,
      }),
    },
    {
      name: '--proof numeric builtin explanation output',
      run: () => runWhy({
        program: 'p(X) :- between(536, 536, X).\n',
        goalText: 'p(536)',
        expected: `p(536).
why(
  p(536),
  proof(
    goal(p(536)),
    by(rule("__FILE__", clause(1))),
    bindings([binding("X", 536)]),
    uses([
      proof(
        goal(between(536, 536, 536)),
        by(library(between, 3))
      )
    ])
  )
).

`,
      }),
    },
    {
      name: '--proof list builtin explanation output',
      run: () => runWhy({
        program: 'p(X) :- member(X, [a]).\n',
        goalText: 'p(a)',
        expected: `p(a).
why(
  p(a),
  proof(
    goal(p(a)),
    by(rule("__FILE__", clause(1))),
    bindings([binding("X", a)]),
    uses([
      proof(
        goal(member(a, "a")),
        by(library(member, 2))
      )
    ])
  )
).

`,
      }),
    },
    {
      name: 'explanation backtracks across earlier subgoal alternatives',
      run: () => {
        const result = runWhyLoose({
          program: 'p(ok) :- q(X), r(X).\nq(a).\nq(b).\nr(b).\n',
          goalText: 'p(ok)',
        });
        assertIncludes(result.stdout, 'goal(q(b)),\n        by(fact("', 'stdout');
        assertIncludes(result.stdout, 'goal(r(b)),\n        by(fact("', 'stdout');
        assertNotIncludes(result.stdout, 'no_proof', 'stdout');
      },
    },
    {
      name: 'explanation releases active call before caller rest goals',
      run: () => {
        const result = runWhyLoose({
          program: 'p(ok) :- q(1), q(1).\nq(0).\nq(1) :- q(0).\n',
          goalText: 'p(ok)',
        });
        assertIncludes(result.stdout, 'goal(p(ok)),\n    by(rule("', 'stdout');
        assertIncludes(result.stdout, 'goal(q(1)),\n        by(rule("', 'stdout');
        assertNotIncludes(result.stdout, 'no_proof', 'stdout');
      },
    },
    {
      name: 'parser records embedded quads without indexing them as clauses',
      run: () => {
        const source = `p(1).\n\nnamed ?- p(X).\n   X = 1.\n\nq(2).\n`;
        const program = Program.parseSources([{ text: source, filename: 'embedded-quads.pl' }]);
        assertEqual(program.clauses.length, 2, 'ordinary clause count');
        assertEqual(program.quads.length, 1, 'quad count');
        assertEqual(program.quads[0].id.name, 'named', 'quad label');
        assertEqual(program.quads[0].source.filename, 'embedded-quads.pl', 'quad filename');
        assertEqual(program.quads[0].source.line, 3, 'quad line');
        assertEqual(Boolean(program.findGroup('p', 1)), true, 'preceding clause indexed');
        assertEqual(Boolean(program.findGroup('q', 1)), true, 'following clause indexed');
        assertEqual(Boolean(program.findGroup('?-', 2)), false, 'quad is inert');
      },
    },
    {
      name: 'parser separates compact ISO solo tokens and atom dots',
      run: () => {
        const program = Program.parse(
          `compact ?- call((!;\\+1)).\n   true.\n\n` +
          `dot ?- functor([_],.,2).\n   true.\n`,
        );
        assertEqual(program.quads.length, 2, 'quad count');
        assertEqual(program.quads[0].query.args[0].name, ';', 'disjunction');
        assertEqual(program.quads[0].query.args[0].args[1].name, '\\+', 'negation');
        assertEqual(program.quads[1].query.args[1].name, '.', 'dot atom');
      },
    },
    {
      name: 'quad parser treats regular term spellings of ?- equivalently',
      run: () => {
        const labelled = Program.parse(
          `0,passes
  ?- X = 1.
     X = 1.
`,
        );
        assertEqual(labelled.quads.length, 1, 'labelled quad count');
        assertEqual(labelled.clauses.length, 0, 'labelled quad clause count');
        assertEqual(labelled.quads[0].id.name, ',', 'comma label functor');
        assertEqual(labelled.quads[0].query.name, '=', 'labelled quad query');
        const labelledReport = publicApi.runQuads(labelled);
        assertEqual(labelledReport.stdout, 'quads: 1 run, 1 passed, 0 failed.\n', 'labelled quad report');

        const functional = Program.parse(
          `?-(','(0,passes),=(X,1)).
   X = 1.
`,
        );
        assertEqual(functional.quads.length, 1, 'functional quad count');
        assertEqual(functional.clauses.length, 0, 'functional quad clause count');
        assertEqual(functional.quads[0].id.name, ',', 'functional comma label functor');
        assertEqual(functional.quads[0].query.name, '=', 'functional quad query');
        assertEqual(termToString(functional.quads[0].id), termToString(labelled.quads[0].id),
          'operator and functional labels are equivalent');
        assertEqual(termToString(functional.quads[0].query), termToString(labelled.quads[0].query),
          'operator and functional queries are equivalent');
        const functionalReport = publicApi.runQuads(functional);
        assertEqual(functionalReport.stdout, 'quads: 1 run, 1 passed, 0 failed.\n', 'functional quad report');

        // Issue #11 is about ordinary term syntax, not one privileged
        // canonical spelling. Parentheses, quoted functor syntax, and mixed
        // operator/functional notation must all denote the same ?-/2 term and
        // therefore the same quad in the normal EyeProlog profile.
        for (const [name, source] of [
          ['mixed', `?-((0,passes), X = 1).\n   X = 1.\n`],
          ['parenthesized', `(?-(','(0,passes),=(X,1))).\n   X = 1.\n`],
          ['parenthesized mixed', `(?-((0,passes), X = 1)).\n   X = 1.\n`],
          ['quoted functor', `'?-'(','(0,passes),=(X,1)).\n   X = 1.\n`],
          ['quoted parenthesized', `('?-'(','(0,passes),=(X,1))).\n   X = 1.\n`],
        ]) {
          const regular = Program.parse(source);
          assertEqual(regular.quads.length, 1, `${name} quad count`);
          assertEqual(regular.clauses.length, 0, `${name} quad clause count`);
          assertEqual(termToString(regular.quads[0].id), termToString(labelled.quads[0].id), `${name} label`);
          assertEqual(termToString(regular.quads[0].query), termToString(labelled.quads[0].query), `${name} query`);
          assertEqual(publicApi.runQuads(regular).stdout, 'quads: 1 run, 1 passed, 0 failed.\n', `${name} report`);
        }

        const strict = Program.parse(`(?-(','(0,passes),=(X,1))).\n`, { isoStrict: true });
        assertEqual(strict.quads.length, 0, 'strict mode has no quads');
        assertEqual(strict.clauses.length, 1, 'strict ?-/2 remains an ordinary term');
      },
    },
    {
      name: 'quad ids use ordinary term syntax and each answer description is independent',
      run: () => {
        // Issue #21: the first argument of ?-/2 is an ordinary Prolog term.
        // The commas here are the normal priority-1000 comma operator, not a
        // special metadata grammar owned by the quad parser.
        const source = `9, "✳54·43", passes
` +
          `?- X is 1+1.
` +
          `   X = 3, unexpected. % almost
` +
          `   X = 1, unexpected. % too low
` +
          `   X = 2.0, unexpected.
` +
          `% and after checking PM:
` +
          `   X = 2.
`;
        const program = Program.parseSources([{ text: source, filename: 'issue-21.pl' }]);
        assertEqual(program.quads.length, 1, 'query group count');
        assertEqual(program.quads[0].answers.length, 4, 'answer-description count');
        assertEqual(program.quads[0].id.name, ',', 'ordinary outer comma operator');
        assertEqual(program.quads[0].id.args[1].name, ',', 'ordinary right-associated comma operator');
        const result = publicApi.runQuads(program);
        assertEqual(result.total, 4, 'answer-description total');
        assertEqual(result.passed, 4, 'answer-description passed');
        assertEqual(result.failed, 0, 'answer-description failed');
        assertEqual(result.stdout, 'quads: 4 run, 4 passed, 0 failed.\n', 'issue #21 report');

        // No convention is imposed on the id term. Functional/list/curly and
        // non-comma operator forms all go through the same ordinary term parser.
        const ordinaryIds = Program.parse(
          `meta(9, passes) ?- true.
   true.
` +
          `[9, passes] ?- true.
   true.
` +
          `{passes} ?- true.
   true.
` +
          `(alpha ; beta) ?- true.
   true.
`,
        );
        assertEqual(ordinaryIds.quads.length, 4, 'ordinary id term count');
        assertEqual(publicApi.runQuads(ordinaryIds).stdout, 'quads: 4 run, 4 passed, 0 failed.\n',
          'ordinary id term report');

        // Groundness is a quad semantic check, not source syntax. A bad id is
        // reported as a test failure and processing continues to the next quad.
        const nonGround = publicApi.runQuads(
          `Id ?- true.
   true.
` +
          `ok ?- true.
   true.
`,
        );
        assertEqual(nonGround.total, 2, 'non-ground id does not abort parsing');
        assertEqual(nonGround.passed, 1, 'following quad still passes');
        assertEqual(nonGround.failed, 1, 'non-ground id is a quad failure');
        assertIncludes(nonGround.stdout, 'quads: BAD_ID Id, <input>:1', 'non-ground id diagnostic');
        assertIncludes(nonGround.stdout, 'quads: 2 run, 1 passed, 1 failed.', 'non-ground continuation summary');

        const continuing = publicApi.runQuads(
          `case ?- X is 1+1.
   X = 3.
   X = 2.
`,
        );
        assertEqual(continuing.total, 2, 'later descriptions still run after failure');
        assertEqual(continuing.passed, 1, 'later passing description counted');
        assertEqual(continuing.failed, 1, 'failed description counted');
        assertIncludes(continuing.stdout, 'quads: 2 run, 1 passed, 1 failed.', 'continuation summary');
      },
    },
    {
      name: 'runQuads checks portable answer descriptions',
      run: () => {
        const source = `p(1).\np(2).\np(3).\n\n` +
          `ordered ?- p(X).\n   X = 1 ; X = 2 ; X = 3.\n\n` +
          `?- p(4).\n   false.\n\n` +
          `?- X = 1.\n   X = 2, unexpected.\n\n` +
          `?- p(X).\n   X = 1, ... .\n\n` +
          `?- atom_length(1, L).\n   type_error(atom, 1).\n\n` +
          `?- atom_length(1, L).\n   error(type_error(atom, 1), _).\n\n` +
          `?- throw(ball).\n   throw(ball).\n\n` +
          `?- write(ok), nl.\n   outputs("ok\\n"), true.\n\n` +
          `?- get_char(C).\n   inputs("a"), C = a.\n\n` +
          `?- get_char(C).\n   inputs("ab"), C = a, unexpected.\n\n` +
          `?- X = 1.\n   X = 2, unexpected.\n   X = 1.\n\n` +
          `?- catch(throw(ball), E, true).\n   E = ball | error(system_error, ...).\n`;
        const result = publicApi.runQuads(Program.parseSources([{ text: source, filename: 'quads.pl' }]));
        assertEqual(result.total, 13, 'answer-description total');
        assertEqual(result.passed, 13, 'answer-description passed');
        assertEqual(result.failed, 0, 'answer-description failed');
        assertEqual(result.stdout, 'quads: 13 run, 13 passed, 0 failed.\n', 'quad report');
      },
    },
    {
      name: 'runQuads distinguishes query variables from renamed throw variables',
      run: () => {
        const source = `?- throw(g(X)).\n` +
          `   throw(g(_X)).\n` +
          `   throw(g(X)), unexpected.\n`;
        const result = publicApi.runQuads(Program.parseSources([{ text: source, filename: 'throw-copy-quad.pl' }]));
        assertEqual(result.total, 2, 'answer-description total');
        assertEqual(result.passed, 2, 'answer-description passed');
        assertEqual(result.failed, 0, 'answer-description failed');
        assertEqual(result.stdout, 'quads: 2 run, 2 passed, 0 failed.\n', 'quad report');

        const forbiddenFresh = publicApi.runQuads(
          `?- throw(g(X)).\n   throw(g(_X)), unexpected.\n`,
        );
        assertEqual(forbiddenFresh.failed, 1, 'fresh thrown variable is detected');
      },
    },
    {
      name: 'runQuads matches the corrected ISO phrase quad boundaries',
      run: () => {
        const source = String.raw`c2 ?- call((1,fail)).
   type_error(callable,(1,fail)).

c3 ?- call((fail,1)).
   type_error(callable,(fail,1)).

c4 ?- call((!;1)).
   type_error(callable,(!;1)).

24 ?- asserta((a-->b)).
   permission_error(modify,static_procedure,(-->)/2).

25 ?- clause((a-->b),B).
   permission_error(access,private_procedure,(-->)/2).

26 ?- (X-->Y).
   existence_error(procedure,(-->)/2).

5 ?- phrase([a|b],L).
   type_error(list,[a|b]).

10 ?- phrase(([a],{1}),[]).
   type_error(callable,(...,...)).

37 ?- phrase((!,[a],{1}),[]).
   type_error(callable,(...,...)).

12 ?- phrase('|'([],[a]),[a]).
   true.

14 ?- phrase(([a];[]),L).
   L=[a] ; L=[].

15 ?- phrase({fail,1},L).
   type_error(callable,((fail,1),...)).

29 ?- phrase(([a],\+1),[]).
   false.

30 ?- phrase(([a],\+1;[]),[]).
   true.

31 ?- phrase(phrase(phrase,[]),L).
   existence_error(procedure,phrase/4).

32 ?- phrase(call([]),[]).
   existence_error(procedure,[]/2).

41 ?- phrase([],non_list).
   type_error(list,non_list).

42 ?- phrase([],[a|non_list]).
   type_error(list,[a|non_list]).

43 ?- phrase([],L,non_list).
   type_error(list,non_list).

44 ?- phrase([],L,[a|non_list]).
   type_error(list,[a|non_list]).

46 ?- phrase((1,{2}),[]).
   type_error(callable,1).

47 ?- phrase(({2},1),[]).
   type_error(callable,1).
`;
        const result = publicApi.runQuads(source);
        assertEqual(result.total, 22, 'quad total');
        assertEqual(result.passed, 22, 'quad passed');
        assertEqual(result.stdout, 'quads: 22 run, 22 passed, 0 failed.\n', 'quad report');
      },
    },
    {
      name: 'negation observes disjunction through direct and call/1 execution',
      run: () => {
        const reported = publicApi.runQuads(String.raw`?- \+ (true ; true).
   false.

?- call(\+ (true ; true)).
   false.
`);
        assertEqual(reported.total, 2, 'reported query count');
        assertEqual(reported.passed, 2, 'reported queries pass');

        const program = Program.parse('');
        const answerCount = (text) => {
          const solver = new Solver(program, { registry: getEyePrologRegistry() });
          return [...solver.solve([parseGoalText(text)], new Env(), 0)].length;
        };

        assertEqual(answerCount(String.raw`\+ (true ; true)`), 0, 'direct successful disjunction is negated');
        assertEqual(answerCount(String.raw`call(\+ (true ; true))`), 0, 'called negation fails');
        assertEqual(answerCount(String.raw`\+ (true ; fail)`), 0, 'successful left branch is observed');
        assertEqual(answerCount(String.raw`\+ (fail ; true)`), 0, 'successful right branch is observed');
        assertEqual(answerCount(String.raw`\+ (fail ; fail)`), 1, 'failed disjunction is negated');
        assertEqual(answerCount('once((true ; true))'), 1, 'once keeps the first disjunction answer');
      },
    },
    {
      name: 'runQuads passes the complete vendored ISO phrase quad corpus',
      run: () => {
        const source = fs.readFileSync(path.join(testRoot, 'fixtures', 'phrase_quad.pl'), 'utf8');
        const result = publicApi.runQuads(Program.parseSources([{
          text: source,
          filename: 'test/fixtures/phrase_quad.pl',
        }]));
        assertEqual(result.total, 58, 'quad total');
        assertEqual(result.passed, 58, 'quad passed');
        assertEqual(result.stdout, 'quads: 58 run, 58 passed, 0 failed.\n', 'quad report');
      },
    },
    {
      name: 'runQuads passes the complete vendored number_chars continuation corpus',
      run: () => {
        const filename = path.join(testRoot, 'fixtures', 'number_chars_cont_quad.pl');
        const source = fs.readFileSync(filename, 'utf8');
        const numbered = new Set([...source.matchAll(/^(\d+)\s+\?-/gm)].map((match) => Number(match[1])));
        assertEqual(numbered.size, 74, 'numbered case total');
        for (let id = 1; id <= 74; id++) {
          if (!numbered.has(id)) throw new Error(`number_chars continuation case #${id} is missing`);
        }
        const result = publicApi.runQuads(Program.parseSources([{
          text: source,
          filename,
        }]));
        assertEqual(result.total, 78, 'answer-description total');
        assertEqual(result.passed, 78, 'answer-description passed');
        assertEqual(result.stdout, 'quads: 78 run, 78 passed, 0 failed.\n', 'quad report');
      },
    },
    {
      name: 'number conversion accepts line-comment layout after a minus token',
      run: () => {
        const source = String.raw`
?- number_chars(N,"-%\n0").
   N = 0.
?- number_chars(N,"-% comment\n1").
   N = -1.
?- number_codes(N,[45,37,10,48]).
   N = 0.
?- number_codes(N,[45,37,32,99,111,109,109,101,110,116,10,49]).
   N = -1.
`;
        const result = publicApi.runQuads(source);
        assertEqual(result.total, 4, 'quad total');
        assertEqual(result.passed, 4, 'quad passed');
        assertEqual(result.stdout, 'quads: 4 run, 4 passed, 0 failed.\n', 'quad report');

        // Keep the eager-consumer distinction from continuation case #24:
        // an adjacent bracketed comment can be consumed as part of a graphic
        // token after `-`, so it is not equivalent to the `%` line comment.
        for (const goal of ['number_chars(N,"-/**/1")', 'number_codes(N,[45,47,42,42,47,49])']) {
          let caught = null;
          try {
            publicApi.run('', { goal });
          } catch (error) {
            caught = error;
          }
          if (caught == null) throw new Error(`${goal} should throw`);
          assertIncludes(String(caught?.message ?? caught), 'syntax_error(number)', goal);
        }
      },
    },
    {
      name: 'apostrophe character-code constants parse in source and number conversion',
      run: () => {
        const source = String.raw`
?- N = 0'''.
   N = 39.
?- number_chars(N,"0'''").
   N = 39.
?- number_chars(N,"0'\\'").
   N = 39.
?- number_codes(N,[48,39,39,39]).
   N = 39.
`;
        const result = publicApi.runQuads(source);
        assertEqual(result.total, 4, 'quad total');
        assertEqual(result.passed, 4, 'quad passed');
        assertEqual(result.stdout, 'quads: 4 run, 4 passed, 0 failed.\n', 'quad report');

        for (const goal of ["N = 0''", 'number_chars(N,"0\'\'")']) {
          let caught = null;
          try {
            publicApi.run('', { goal });
          } catch (error) {
            caught = error;
          }
          if (caught == null) throw new Error(`${goal} should reject an undoubled apostrophe`);
        }
      },
    },
    {
      name: 'number conversion accepts ISO space and Unicode character-code constants exactly',
      run: () => {
        const source = String.raw`
?- N = 0' .
   N = 32.
?- number_chars(N,"0' ").
   N = 32.
?- number_codes(N,[48,39,32]).
   N = 32.
?- N = 0'😀.
   N = 128512.
?- number_chars(N,"0'😀").
   N = 128512.
?- number_codes(N,[48,39,128512]).
   N = 128512.
?- number_codes(N,[48,39,34]).
   N = 34.
?- number_codes(N,[48,39,96]).
   N = 96.
?- number_codes(N,[48,39,92,92]).
   N = 92.
?- number_chars(01,Chars).
   Chars = "1".
?- number_codes(01,Codes).
   Codes = [49].
?- 1.2 = 1.20.
   true.
?- 1.2 == 1.20.
   true.
?- 1 = 1.0.
   false.
?- number_chars(1.20,C), number_chars(Y,C), 1.20 == Y.
   C = "1.20", Y = 1.2.
`;
        const result = publicApi.runQuads(source);
        assertEqual(result.total, 15, 'quad total');
        assertEqual(result.passed, 15, 'quad passed');
        assertEqual(result.stdout, 'quads: 15 run, 15 passed, 0 failed.\n', 'quad report');

        for (const goal of [
          'number_chars(N,"3/**/")',
          'number_codes(N,[51,47,42,42,47])',
          'number_chars(N,"0\'  ")',
          'number_codes(N,[48,39,32,32])',
        ]) {
          let caught = null;
          try {
            publicApi.run('', { goal });
          } catch (error) {
            caught = error;
          }
          if (caught == null) throw new Error(`${goal} should reject trailing layout`);
          assertIncludes(String(caught?.message ?? caught), 'syntax_error(number)', goal);
        }
      },
    },
    {
      name: 'number conversion uses a bounded number-only scanner',
      run: () => {
        for (const [source, expected] of [
          ['123', '123'], ['-1.25e+3', '-1.25e+3'], ['0xff', '255'],
          ["0'.", '46'], ["0'😀", '128512'], ["0'\\x21\\", '33'],
        ]) {
          assertEqual(parseNumberTokenText(source).name, expected, source);
        }

        for (let i = 0; i < 500000; i++) {
          const text = String(i);
          assertEqual(parseNumberTokenText(text).name, text, `conversion ${i}`);
        }

        const numberChars = createDefaultRegistry().get('number_chars', 2).handler;
        const converted = variable('Converted');
        for (let i = 0; i < 10000; i++) {
          const text = String(i);
          const chars = listFromItems(Array.from(text, atom));
          const goal = compound('number_chars', [converted, chars]);
          const answer = numberChars({ goal, env: new Env() }).next();
          if (answer.done) throw new Error(`number_chars/2 failed at ${i}`);
          assertEqual(copyResolved(converted, answer.value).name, text, `number_chars/2 conversion ${i}`);
        }
      },
    },
    {
      name: 'number_chars and number_codes keep exponent floats syntactically readable (issue #50)',
      run: () => {
        const source = `
?- number_chars(1.0e-8,Cs).
   Cs = "1.0e-8".
?- number_chars(N,"1.0e-8"), number_chars(N,Cs).
   N = 1.0e-8, Cs = "1.0e-8".
?- number_codes(N,[49,46,48,101,45,56]), number_codes(N,Codes).
   N = 1.0e-8, Codes = [49,46,48,101,45,56].
`;
        const result = publicApi.runQuads(source);
        assertEqual(result.total, 3, 'quad total');
        assertEqual(result.passed, 3, 'quad passed');
        assertEqual(result.failed, 0, 'quad failed');

        const generated = numberTerm(numberTextFromDouble(1e-8));
        assertEqual(generated.name, '1.0e-8', 'generated float spelling');
        assertEqual(parseNumberTokenText(generated.name).name, '1.0e-8', 'generated spelling parses as a float');

        for (const value of [1e-8, -1e-8, 1e20, 1e21, Number.MIN_VALUE, Number.MAX_VALUE]) {
          const text = numberTextFromDouble(value);
          if (/[eE]/.test(text)) {
            assertEqual(/^-?\d+\.\d+[eE][+-]?\d+$/.test(text), true, `exponent float syntax ${text}`);
          }
          assertEqual(Number(parseNumberTokenText(text).name), value, `generated float round-trip ${text}`);
        }
      },
    },
    {
      name: 'number syntax and number_chars normalize floating-point negative zero',
      run: () => {
        const result = runCli([], {
          input: 'X = -0.0, number_chars(X,C), number_chars(Y,C), X == Y, number_chars(Y,D).\nhalt.\n',
        });
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stdout, 'X = 0.0, C = "0.0", Y = 0.0, D = "0.0".', 'answer');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'arithmetic and float-token underflow both round to zero (issue #56)',
      run: () => {
        assertEqual(run('', { goal: 'N is 0.1*10** -999' }).stdout, '0.0 is 0.1 * 10 ** -999.\n', 'operation underflow');
        assertEqual(run('', { goal: 'N is exp(-1000.0)' }).stdout, '0.0 is exp(-1000.0).\n', 'function underflow');
        assertEqual(run('', { goal: 'N = 0.1e-999' }).stdout, '0.0 = 0.0.\n', 'float-token input underflow');
      },
    },
    {
      name: 'float literals reject overflow and normalize underflow (issue #54)',
      run: () => {
        const result = runCli([], {
          input: [
            'T = 1.0e-99999, F is T.',
            'T = 1.0e99999, float(T).',
            'T = -1.0e99999, float(T).',
            'T = 1.0e99999, float(T), F is T.',
            'T = 1.0e99999, U = 2.0e99999, T > U.',
            'T = 1.0e99999, U = 2.0e99999, T < U.',
            'T = 1.0e99999, U = 2.0e99999, T = U.',
            'T = 1.0e99999, U = 2.0e99999, T =:= U.',
            'halt.',
            '',
          ].join('\n'),
        });
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stdout, 'T = 0.0, F = 0.0.', 'underflow rounds on input');
        assertEqual(
          (result.stdout.match(/error\(representation_error\(max_float\)\)\./g) ?? []).length,
          6,
          'positive overflowing literals fail while being read',
        );
        assertEqual(
          (result.stdout.match(/error\(representation_error\(min_float\)\)\./g) ?? []).length,
          1,
          'negative overflowing literal reports min_float',
        );
        assertEqual(result.stderr, '', 'stderr');

        let overflow = null;
        try {
          parseNumberTokenText('1.0e99999');
        } catch (error) {
          overflow = error;
        }
        assertEqual(overflow?.formal, 'representation_error(max_float)', 'positive number token overflow');
        let negativeOverflow = null;
        try {
          parseNumberTokenText('-1.0e99999');
        } catch (error) {
          negativeOverflow = error;
        }
        assertEqual(negativeOverflow?.formal, 'representation_error(min_float)', 'negative number token overflow');
        assertEqual(parseNumberTokenText('1.0e-99999').name, '0.0', 'number token underflow');

        const chars = Array.from('1.0e99999', atom);
        const numberChars = createDefaultRegistry().get('number_chars', 2).handler;
        let numberCharsError = null;
        try {
          numberChars({
            goal: compound('number_chars', [variable('N'), listFromItems(chars)]),
            env: new Env(),
          }).next();
        } catch (error) {
          numberCharsError = error;
        }
        assertEqual(numberCharsError?.formal, 'representation_error(max_float)', 'number_chars positive overflow');

        const negativeChars = Array.from('-1.0e99999', atom);
        let negativeNumberCharsError = null;
        try {
          numberChars({
            goal: compound('number_chars', [variable('N'), listFromItems(negativeChars)]),
            env: new Env(),
          }).next();
        } catch (error) {
          negativeNumberCharsError = error;
        }
        assertEqual(negativeNumberCharsError?.formal, 'representation_error(min_float)', 'number_chars negative overflow');

        let boundNegativeNumberCharsError = null;
        try {
          numberChars({
            goal: compound('number_chars', [numberTerm('-1.0e99999'), variable('Chars')]),
            env: new Env(),
          }).next();
        } catch (error) {
          boundNegativeNumberCharsError = error;
        }
        assertEqual(
          boundNegativeNumberCharsError?.formal,
          'representation_error(min_float)',
          'number_chars host-created negative overflow',
        );

        let readError = null;
        try {
          runEyeProlog('', {
            goal: 'read(X)',
            ioOptions: { input: '1.0e99999.\n' },
          });
        } catch (error) {
          readError = error;
        }
        assertEqual(readError?.formal, 'representation_error(max_float)', 'read/1 overflow');

        let readTermError = null;
        try {
          runEyeProlog('', {
            goal: 'read_term(X, [])',
            ioOptions: { input: '-1.0e99999.\n' },
          });
        } catch (error) {
          readTermError = error;
        }
        assertEqual(readTermError?.formal, 'representation_error(min_float)', 'read_term/2 overflow (STC #73)');

        const numberCodes = createDefaultRegistry().get('number_codes', 2).handler;
        let numberCodesError = null;
        try {
          numberCodes({
            goal: compound('number_codes', [variable('N'), listFromItems(Array.from('1.0e99999', (c) => numberTerm(String(c.codePointAt(0))))) ]),
            env: new Env(),
          }).next();
        } catch (error) {
          numberCodesError = error;
        }
        assertEqual(numberCodesError?.formal, 'representation_error(max_float)', 'number_codes positive overflow (STC #74)');

        const isHandler = createDefaultRegistry().get('is', 2).handler;
        let hostTermError = null;
        try {
          isHandler({
            goal: compound('is', [variable('F'), numberTerm('1.0e99999')]),
            env: new Env(),
          }).next();
        } catch (error) {
          hostTermError = error;
        }
        assertEqual(hostTermError?.formal, 'evaluation_error(float_overflow)', 'host-created non-finite term');
      },
    },
    {
      name: 'mixed integer/float arithmetic comparison preserves exact order (STC #50)',
      run: () => {
        const hugeInteger = `1${'0'.repeat(309)}`;
        const program = `
          check :-
            9007199254740993 > 9007199254740992.0,
            9007199254740992.0 < 9007199254740993,
            9007199254740993 =\\= 9007199254740992.0,
            -9007199254740993 < -9007199254740992.0,
            ${hugeInteger} > 1.0e308,
            -${hugeInteger} < -1.0e308,
            Max is max(9007199254740993, 9007199254740992.0),
            integer(Max),
            Max =:= 9007199254740993,
            Min is min(9007199254740993, 9007199254740992.0),
            float(Min),
            Min =:= 9007199254740992.0.
        `;
        const result = runEyeProlog(program, { goal: 'check' });
        assertEqual(result.stdout, 'check.\n', 'mixed integer/float ordering');
      },
    },
    {
      name: 'readers keep a full stop inside a character-code constant (WG17 #367)',
      run: () => {
        const streamResult = runEyeProlog('', {
          goal: 'read((46 = 46))',
          ioOptions: { input: "X = 0'. .\n" },
        });
        assertEqual(streamResult.stdout, 'read(46 = 46).\n', 'read/1 character-code full stop');

        // A complete term must be recognized from its full stop alone. Do not
        // consult the interactive refill hook (which would amount to waiting
        // for EOF or another line) once the terminator has been seen.
        const program = Program.parse('');
        const solver = new Solver(program, {
          registry: getEyePrologRegistry(),
          ioOptions: { input: "X = 0'. .\n" },
        });
        const inputStream = solver.io.resolve('user_input');
        let refillRequests = 0;
        inputStream.interactiveReadTerm = () => {
          refillRequests++;
          throw new Error('reader requested input after a complete term');
        };
        const readGoal = parseGoalText('read(T)', { operatorDefinitions: [...program.operators.values()] });
        const readAnswers = [...solver.solve([readGoal], new Env(), 0)];
        assertEqual(readAnswers.length, 1, 'read/1 answer without EOF');
        assertEqual(refillRequests, 0, 'read/1 terminates without EOF assistance');
        const readTerm = copyResolved(readGoal.args[0], readAnswers[0]);
        assertEqual(readTerm.name, '=', 'read/1 parsed assignment');
        assertEqual(readTerm.args[1].name, '46', 'read/1 parsed character code');

        const cliResult = runCli([], { input: "X = 0'. .\nhalt.\n" });
        assertEqual(cliResult.status, 0, 'top-level character-code full stop status');
        assertIncludes(cliResult.stdout, 'X = 46', 'top-level character-code answer');
        assertNotIncludes(cliResult.stdout, 'syntax_error', 'top-level character-code syntax');

        const upstreamResult = runCli([], { input: "writeq(0'. ).\nhalt.\n" });
        assertEqual(upstreamResult.status, 0, 'WG17 #367 exit status');
        assertIncludes(upstreamResult.stdout, '46 true.', 'WG17 #367 output');
      },
    },
    {
      name: 'top level separates terminal full stop from graphic answers (issue #44)',
      run: () => {
        const result = runCli([], { input: 'X = .* .\nhalt.\n' });
        assertEqual(result.status, 0, 'issue #44 exit status');
        assertIncludes(result.stdout, 'X = .* .\n', 'graphic binding is separated from terminal full stop');
        assertNotIncludes(result.stdout, 'X = .*.\n', 'terminal full stop is not absorbed into graphic atom');
        assertEqual(result.stderr, '', 'issue #44 stderr');
      },
    },
    {
      name: 'writeq leaves ISO dotted graphic atoms unquoted (WG17 #371-373)',
      run: () => {
        const result = runCli([], {
          input: 'writeq(./*).\nwriteq(.*).\nwriteq(...*).\nhalt.\n',
        });
        assertEqual(result.status, 0, 'dotted graphic writeq exit status');
        assertIncludes(result.stdout, '  ./* true.\n', 'writeq ./* is unquoted');
        assertIncludes(result.stdout, '  .* true.\n', 'writeq .* is unquoted');
        assertIncludes(result.stdout, '  ...* true.\n', 'writeq ...* is unquoted');
        assertNotIncludes(result.stdout, "'./*'", 'writeq ./* has no quotes');
        assertNotIncludes(result.stdout, "'.*'", 'writeq .* has no quotes');
        assertNotIncludes(result.stdout, "'...*'", 'writeq ...* has no quotes');
      },
    },
    {
      name: 'readers distinguish graphic tokens, comments, and full stops (issue #41)',
      run: () => {
        const parsed = parseProgramText('./* .');
        assertEqual(parsed.length, 1, 'graphic atom clause count');
        assertEqual(parsed[0].head.name, './*', 'comment opener stays inside graphic atom');

        // A dot immediately after a graphic token belongs to that maximal
        // token. A separate end char is therefore required even at a line
        // boundary; this is the waiting behavior called out in WG17 #370-373.
        const waitProgram = Program.parse('');
        const waitSolver = new Solver(waitProgram, {
          registry: getEyePrologRegistry(),
          ioOptions: { input: '*.\n' },
        });
        const waitStream = waitSolver.io.resolve('user_input');
        let refillRequests = 0;
        waitStream.interactiveReadTerm = () => {
          refillRequests++;
          return '.\n';
        };
        const waitGoal = parseGoalText('read(T)', {
          operatorDefinitions: [...waitProgram.operators.values()],
        });
        const waitAnswers = [...waitSolver.solve([waitGoal], new Env(), 0)];
        assertEqual(waitAnswers.length, 1, 'graphic token read answer after refill');
        assertEqual(refillRequests, 1, 'graphic token boundary waits for a separate end char');
        assertEqual(copyResolved(waitGoal.args[0], waitAnswers[0]).name, '*.', 'maximal graphic token after refill');

        const read = runEyeProlog('', {
          goal: 'read(T)',
          ioOptions: { input: './*. .' },
        });
        assertEqual(read.stdout, "read(./*.).\n", 'dotted graphic atom writeq readback');

        const ellipsisGraphic = runEyeProlog('', {
          goal: 'read(T)',
          ioOptions: { input: '...*\n.\n' },
        });
        assertEqual(ellipsisGraphic.stdout, "read(...*).\n", 'ellipsis prefix remains inside maximal graphic atom');

        const consecutive = runEyeProlog('answer(A, B) :- read(A), read(B).\n', {
          goal: 'answer(A, B)',
          ioOptions: { input: './*. .\nok.\n' },
        });
        assertEqual(consecutive.stdout, "answer(./*., ok).\n", 'following read starts after the complete term');

        // Issue #41 follow-up: read/1 consumes an ordinary term, not a program
        // clause head. A comma chain therefore has no program-level two-comma
        // limit, and source operators such as :- and ?- remain term data.
        const commaChain = runEyeProlog('', {
          goal: 'read(T)',
          ioOptions: { input: '!,!,! .\n' },
        });
        assertEqual(commaChain.stdout, 'read((!, !, !)).\n', 'three-element comma term');

        const ruleAsData = runEyeProlog('', {
          goal: 'read(T)',
          ioOptions: { input: 'a :- b.\n' },
        });
        assertEqual(ruleAsData.stdout, 'read((a :- b)).\n', 'rule operator remains term data');

        const queryAsData = runEyeProlog('', {
          goal: 'read(T)',
          ioOptions: { input: '?- foo.\n' },
        });
        assertEqual(queryAsData.stdout, 'read((?- foo)).\n', 'query operator remains term data');

        // A possible full stop can fail to complete the term while still
        // extending a current graphic operator into an ordinary atom.  The
        // later standalone full stop then completes the read term.  Exercise
        // every predefined graphic operator, including the tokenizer's
        // special :- and ?- cases, so they cannot diverge from * again.
        const graphicOperator = /^[#$&*+\-./<=>?@^~\\:]+$/;
        const graphicOperators = [...new Set(ISO_OPERATOR_DEFINITIONS.map(([, , name]) => name))]
          .filter((name) => graphicOperator.test(name));
        for (const name of graphicOperators) {
          const program = Program.parse('');
          const solver = new Solver(program, {
            registry: getEyePrologRegistry(),
            ioOptions: { input: `!,${name}.\n.\n` },
          });
          const readGoal = parseGoalText('read(T)', {
            operatorDefinitions: [...program.operators.values()],
          });
          const answers = [...solver.solve([readGoal], new Env(), 0)];
          assertEqual(answers.length, 1, `graphic operator read answer for ${name}`);
          const term = copyResolved(readGoal.args[0], answers[0]);
          assertEqual(term.name, ',', `graphic operator conjunction for ${name}`);
          assertEqual(term.args[0].name, '!', `graphic operator left operand for ${name}`);
          assertEqual(term.args[1].name, `${name}.`, `graphic operator atom for ${name}`);
        }

        // Unlike an interactive reader waiting at a line boundary, a buffered
        // stream can see later non-layout input.  Its first dot therefore
        // remains in the maximal graphic token, making the adjacent ! invalid
        // rather than prematurely returning the shorter atom.
        for (const name of [...graphicOperators, '?', '#', '@', './*', '//*']) {
          let bufferedError = null;
          try {
            runEyeProlog('', {
              goal: 'read_term(T, [])',
              ioOptions: { input: `${name}.\n!\n.` },
            });
          } catch (caught) {
            bufferedError = caught;
          }
          assertEqual(
            bufferedError?.message,
            'error(syntax_error(read_term))',
            `buffered graphic atom boundary for ${name}`,
          );
        }

        const bufferedPath = path.join(tmp, 'graphic-atom-boundary.pl');
        fs.writeFileSync(bufferedPath, '*.\n!\n.');
        const namedStream = runEyeProlog([
          `caught(ok) :- open(${sourceAtom(bufferedPath)}, read, S),`,
          '  catch(read_term(S, _, []), error(syntax_error(read_term), _), true),',
          '  close(S).',
          '',
        ].join('\n'), { goal: 'caught(ok)' });
        assertEqual(namedStream.stdout, 'caught(ok).\n', 'named buffered stream syntax error');

        let error = null;
        try {
          runEyeProlog('', { goal: 'read(T)', ioOptions: { input: '!.!.' } });
        } catch (caught) {
          error = caught;
        }
        assertEqual(error?.message, 'error(syntax_error(read_term))', 'solo-token sequence rejection');

        const repl = runCli([], {
          input: 'read(T).\n./*. .\nread(T).\nok.\nread(T).\n!.!.\nhalt.\n',
        });
        assertEqual(repl.status, 0, 'REPL exit status');
        assertIncludes(repl.stdout, 'T = ./*. .', 'REPL dotted graphic atom answer');
        assertNotIncludes(repl.stdout, "T = './*.'", 'REPL dotted graphic atom has no spurious quotes');
        assertIncludes(repl.stdout, 'T = ok.', 'REPL following read answer');
        assertIncludes(repl.stdout, 'error(syntax_error(read_term), eyeprolog)', 'REPL syntax error');
        assertEqual(repl.stderr, '', 'REPL stderr');

        const continuedGraphic = runCli([], {
          input: 'read(T).\n!,*.\n.\nread(T).\na\n.\nhalt.\n',
        });
        assertEqual(continuedGraphic.status, 0, 'continued graphic operator REPL status');
        assertIncludes(continuedGraphic.stdout, 'T = (!, *.).', 'continued graphic operator answer');
        assertIncludes(continuedGraphic.stdout, 'T = a.', 'read after continued graphic operator');
        assertNotIncludes(continuedGraphic.stdout, 'syntax_error', 'continued graphic operator syntax');
        assertEqual(continuedGraphic.stderr, '', 'continued graphic operator REPL stderr');
      },
    },
    {
      name: 'question mark is a graphic character and writeq keeps graphic atoms unquoted',
      run: () => {
        const result = runCli([], { input: 'writeq(?).\nwriteq(??).\nwriteq(?-).\nhalt.\n' });
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stdout, '? true.', 'writeq(?)');
        assertIncludes(result.stdout, '?? true.', 'writeq(??)');
        assertIncludes(result.stdout, '?- true.', 'writeq(?-)');
        assertNotIncludes(result.stdout, "'?-'", 'writeq(?-) has no quotes');
      },
    },
    {
      name: 'curly brackets accept ISO and custom operator atoms (issue #41)',
      run: () => {
        const operatorNames = [...new Set(ISO_OPERATOR_DEFINITIONS.map(([, , name]) => name))]
          .filter((name) => name !== ',');
        for (const name of operatorNames) {
          const holder = parseGoalText(`holder({${name}})`);
          const curly = holder.args[0];
          assertEqual(curly.name, '{}', `curly functor for ${name}`);
          assertEqual(curly.args[0].name, name, `curly operator atom ${name}`);
        }

        const customProgram = parseProgramText([
          ':- op(100, fx, pre).',
          ':- op(100, xf, post).',
          ':- op(100, xfx, infix).',
          'custom({pre}, {post}, {infix}).',
          '',
        ].join('\n'));
        const custom = customProgram.find((clause) => clause.head.name === 'custom').head;
        assertEqual(
          custom.args.map((curly) => curly.args[0].name).join(','),
          'pre,post,infix',
          'custom prefix, postfix, and infix operator atoms',
        );

        const repl = runCli([], { input: 'read(T).\n{*}.\nhalt.\n' });
        assertEqual(repl.status, 0, 'curly operator REPL status');
        assertIncludes(repl.stdout, 'T = {*}.', 'curly operator REPL answer');
        assertNotIncludes(repl.stdout, '{(*)}', 'curly operator has no unnecessary parentheses');
      },
    },
    {
      name: 'normal parser rejects non-conforming bare operator operands',
      run: () => {
        let caught = null;
        try {
          parseGoalText('write_canonical((- = - 1))');
        } catch (error) {
          caught = error;
        }
        if (!caught) throw new Error('non-conforming operator operand unexpectedly parsed');
        assertIncludes(caught.message, 'operator atom', 'syntax rejection');
      },
    },
    {
      name: 'CLP(Z) operator declarations avoid unnecessary quoted atoms',
      run: () => {
        const filename = path.join(packageRoot, 'src', 'lib', 'clpz.pl');
        const source = fs.readFileSync(filename, 'utf8');
        for (const name of ['#>', '#<', '#>=', '#=<', '#=', '#\\=', '#<==>', '#==>', '#<==', '#\\/', '#/\\']) {
          assertIncludes(source, `(${name})/2`, `${name}/2 export is parenthesized`);
          assertNotIncludes(source, `('${name}')/2`, `${name}/2 export is not quoted`);
          assertNotIncludes(source, `'${name}'(`, `${name} functional notation is not quoted`);
        }
        assertIncludes(source, '(#\\)/1', '#\\/1 export is parenthesized');
        assertIncludes(source, '(#\\)/2', '#\\/2 export is parenthesized');
        assertIncludes(source, '(in)/2', 'in/2 export is parenthesized');
        assertIncludes(source, '(ins)/2', 'ins/2 export is parenthesized');
        assertNotIncludes(source, "('in')/2", 'in/2 export is not quoted');
        assertNotIncludes(source, "('ins')/2", 'ins/2 export is not quoted');

        const canonicalOptions = { quoted: true, ignoreOps: true, compact: true, operators: [] };
        assertEqual(
          formatTermForWrite(compound('#>', [atom('a'), atom('b')]), new Env(), canonicalOptions),
          '#>(a,b)',
          'canonical #> functor has no quotes',
        );
        assertEqual(
          formatTermForWrite(compound('#\\=', [atom('a'), atom('b')]), new Env(), canonicalOptions),
          '#\\=(a,b)',
          'canonical #\\= functor has no quotes',
        );
      },
    },
    {
      name: 'layout distinguishes prefix notation from functional notation',
      run: () => {
        const functional = parseGoalText(String.raw`\+(true, false)`);
        assertEqual(functional.name, '\\+', 'functional name');
        assertEqual(functional.arity, 2, 'adjacent functional arity');

        const prefix = parseGoalText(String.raw`\+ (true, false)`);
        assertEqual(prefix.name, '\\+', 'prefix name');
        assertEqual(prefix.arity, 1, 'spaced prefix arity');
        assertEqual(prefix.args[0].name, ',', 'prefix parenthesized conjunction');
        assertEqual(prefix.args[0].arity, 2, 'prefix conjunction arity');

        const result = runEyeProlog('', { goal: String.raw`\+ (true, false)` });
        assertEqual(result.stdout, '\\+ (true, false).\n', 'spaced negation result');
      },
    },
    {
      name: 'number conversion rejects parenthesized numeric terms',
      run: () => {
        for (const goal of ['number_chars(N,"(0)")', 'number_codes(N,[40,48,41])']) {
          let caught = null;
          try {
            publicApi.run('', { goal });
          } catch (error) {
            caught = error;
          }
          if (caught == null) throw new Error(`${goal} should throw`);
          assertIncludes(String(caught?.message ?? caught), 'syntax_error(number)', goal);
        }
      },
    },
    {
      name: 'vendored Prolog Prologue corpus records the bounded=false max_integer divergence',
      run: () => {
        const filename = path.join(testRoot, 'fixtures', 'prologue_quad_runner.pl');
        const source = fs.readFileSync(filename, 'utf8');
        const program = Program.parseSources([{
          text: source,
          filename,
          baseDir: path.dirname(filename),
        }]);
        assertEqual(program.quads.length, 33, 'vendored quad total');
        const maxIntegerQuads = program.quads.filter(({ query }) =>
          termToString(query).includes('current_prolog_flag(max_integer, Max)'));
        assertEqual(maxIntegerQuads.length, 1, 'max_integer quad count');

        // This regression is about the one deliberate ISO divergence in the
        // upstream Prologue fixture. Running all 33 records also explores two
        // intentionally non-terminating STO examples and used to dominate the
        // regression suite by several seconds, without adding evidence for
        // max_integer. Keep the full vendored corpus intact, but execute only
        // the relevant record here.
        program.quads = maxIntegerQuads;
        const result = publicApi.runQuads(program);
        // The upstream working-draft quad accepts either integer overflow or
        // Max=unbounded. ISO/IEC 13211-1 7.11.1.1 instead says that when
        // bounded=false, current_prolog_flag(max_integer, N) fails. Preserve
        // the upstream fixture unchanged and make that one deliberate
        // standards-driven divergence explicit in the regression gate.
        assertEqual(result.total, 1, 'quad total');
        assertEqual(result.passed, 0, 'quad passed');
        assertEqual(result.failed, 1, 'quad failed');
        assertIncludes(result.stdout, 'current_prolog_flag(max_integer, Max)', 'max_integer divergence');
        assertIncludes(result.stdout, 'quads: 1 run, 0 passed, 1 failed.', 'quad report');
      },
    },
    {
      name: 'runQuads passes the authoritative Prologue call_nth quad corpus',
      run: () => {
        const filename = path.join(testRoot, 'fixtures', 'prologue_call_nth_quad_runner.pl');
        const source = fs.readFileSync(filename, 'utf8');
        const result = publicApi.runQuads(Program.parseSources([{
          text: source,
          filename,
          baseDir: path.dirname(filename),
        }]));
        assertEqual(result.total, 13, 'quad total');
        assertEqual(result.passed, 13, 'quad passed');
        assertEqual(result.stdout, 'quads: 13 run, 13 passed, 0 failed.\n', 'quad report');
      },
    },
    {
      name: 'CLI passes the complete authoritative length quad corpus',
      run: () => {
        const filename = path.join(testRoot, 'fixtures', 'length_quad.pl');
        const source = fs.readFileSync(filename, 'utf8');
        assertEqual(Program.parse(source).quads.length, 37, 'vendored quad total');
        const result = runCli(['-q', filename]);
        assertEqual(result.status, 0, 'quad exit status');
        assertEqual(result.stdout, 'quads: 37 run, 37 passed, 0 failed.\n', 'quad report');
        assertEqual(result.stderr, '', 'quad stderr');
      },
    },
    {
      name: 'REPL advances anonymous Prologue length checks through I = 28',
      run: () => {
        const result = runCli([], {
          input:
            'use_module(library(prologue)).\n' +
            'length(_,I),I>9,N is 2^I,\\+ \\+ length(_,N).\n' +
            'f\nf\nf\n;\n;\n;\n;\n\nhalt.\n',
        });
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stdout, ';  I = 28, N = 268435456\n;  ... .\n?- ', 'large anonymous length answer');
        assertNotIncludes(result.stdout, 'resource_error(memory)', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'Prologue freeze wakes delayed goals with their bindings',
      run: () => {
        const result = runEyeProlog(
          ':- use_module(library(prologue)).\nwake(X, Y) :- freeze(X, Y = awake), X = ready.\n',
          { goal: 'wake(X, Y)' },
        );
        assertEqual(result.stdout, 'wake(ready, awake).\n', 'freeze answer');
      },
    },
    {
      name: 'runQuads covers the remaining finite Prologue examples and arities',
      run: () => {
        const filename = path.join(testRoot, 'fixtures', 'prologue_extended_quad_runner.pl');
        const source = fs.readFileSync(filename, 'utf8');
        const result = publicApi.runQuads(Program.parseSources([{
          text: source,
          filename,
          baseDir: path.dirname(filename),
        }]));
        assertEqual(result.total, 37, 'quad total');
        assertEqual(result.passed, 37, 'quad passed');
        assertEqual(result.stdout, 'quads: 37 run, 37 passed, 0 failed.\n', 'quad report');
      },
    },
    {
      name: 'runQuads rejects malformed answer substitutions',
      run: () => {
        const source = `?- X = f(Y), Y = 1.\n   X = f(Y), Y = 1.\n`;
        const result = publicApi.runQuads(Program.parseSources([{ text: source, filename: 'malformed-quad.pl' }]));
        assertEqual(result.total, 1, 'quad total');
        assertEqual(result.failed, 1, 'quad failed');
        assertIncludes(result.stdout, 'quads: MALFORMED malformed-quad.pl:1', 'malformed report');
      },
    },
    {
      name: 'runQuads recognizes bounded nontermination descriptions',
      run: () => {
        const result = publicApi.runQuads(`?- repeat, fail.\n   loops.\n`);
        assertEqual(result.passed, 1, 'quad passed');
        assertEqual(result.stdout, 'quads: 1 run, 1 passed, 0 failed.\n', 'quad report');
      },
    },
    {
      name: 'runQuads preserves output before a delayed call/1 instantiation error (issue #57)',
      run: () => {
        const result = publicApi.runQuads(`16, "7.8.3.4#9"\n?- call((write(3), X)).\n   outputs("3"), instantiation_error.\n`);
        assertEqual(result.passed, 1, 'quad passed');
        assertEqual(result.stdout, 'quads: 1 run, 1 passed, 0 failed.\n', 'quad report');
      },
    },
    {
      name: 'runQuads recognizes recursion-guard cycle evidence as loops (issue #58)',
      run: () => {
        const result = publicApi.runQuads(`inf :- inf, inf.\n\n23\n?- inf.\n   loops.\n`);
        assertEqual(result.passed, 1, 'quad passed');
        assertEqual(result.stdout, 'quads: 1 run, 1 passed, 0 failed.\n', 'quad report');
      },
    },
    {
      name: 'quad recursion-cycle evidence consistently refutes finite failure (issue #58 comment 5381101420)',
      run: () => {
        const result = publicApi.runQuads(`inf :- inf, inf.

23
?- inf.
   loops.
   false.
`);
        assertEqual(result.total, 2, 'quad total');
        assertEqual(result.passed, 1, 'loops passed');
        assertEqual(result.failed, 1, 'false failed');
        assertEqual(result.undecided, 0, 'no undecided result');
        assertIncludes(result.stdout, 'expected: false.', 'finite failure diagnostic');
        assertNotIncludes(result.stdout, 'undecided: recursion cycle encountered.', 'cycle is decisive');
      },
    },
    {
      name: 'quad search-budget exhaustion is undecided rather than loops or failure (issue #58)',
      run: () => {
        const result = runCli(['--quads', '-'], {
          input:
            '24,passes/too_expensive\n' +
            '?- N is 10^9, between(1,N,I), I = 1.\n' +
            '   N = ..., I = 1\n' +
            ';  false.\n',
          timeout: 5000,
        });
        if (result.error) throw result.error;
        assertEqual(result.status, 2, 'undecided exit status');
        assertIncludes(result.stdout,
          'quads: UNDECIDED 24, passes / too_expensive, <stdin>:1',
          'undecided diagnostic');
        assertIncludes(result.stdout, 'undecided: inference limit reached.', 'undecided reason');
        assertIncludes(result.stdout,
          'quads: 1 run, 0 passed, 0 failed, 1 undecided.',
          'undecided summary');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'quad sto uses observed occurs-check evidence instead of unconditional acceptance (issue #60)',
      run: () => {
        const sto = publicApi.runQuads(String.raw`33
?- X = s(X).
   X = ..., unexpected.
   false, unexpected.
   sto, false
|  sto, true.
`);
        assertEqual(sto.total, 3, 'STO description total');
        assertEqual(sto.passed, 3, 'STO descriptions passed');
        assertEqual(sto.failed, 0, 'STO descriptions failed');
        assertEqual(sto.undecided, 0, 'STO descriptions undecided');
        assertEqual(sto.stdout, 'quads: 3 run, 3 passed, 0 failed.\n', 'STO report');

        const nsto = publicApi.runQuads(String.raw`34
?- true.
   sto.
`);
        assertEqual(nsto.total, 1, 'NSTO description total');
        assertEqual(nsto.passed, 0, 'NSTO description passed');
        assertEqual(nsto.failed, 1, 'NSTO description failed');
        assertEqual(nsto.undecided, 0, 'NSTO description undecided');
        assertIncludes(nsto.stdout, 'quads: FAILED 34, <input>:1', 'NSTO diagnostic');
      },
    },
    {
      name: 'quads peeks/1 supplies one unconsumed look-ahead character (issue #62)',
      run: () => {
        const result = publicApi.runQuads(`29
?- read(X).
   inputs("1."), X = 1, unexpected.
   inputs("1."), peeks(" "), X = 1.
   inputs("1. "), peeks(" "), X = 1, unexpected.
`);
        assertEqual(result.total, 3, 'quad total');
        assertEqual(result.passed, 3, 'quad passed');
        assertEqual(result.failed, 0, 'quad failed');
        assertEqual(result.stdout, 'quads: 3 run, 3 passed, 0 failed.\n', 'quad report');
      },
    },
    {
      name: 'outputs/1 accepts DCG bodies over captured characters (issue #59)',
      run: () => {
        const source = [
          'pair --> "_", "A".',
          '22',
          "?- write('_A').",
          '   outputs("_A").',
          '   outputs("_"), unexpected.',
          '   outputs(("_","A")).',
          '   outputs(("_",...,"A")).',
          '   outputs(("_",...,"B")), unexpected.',
          '   outputs(("_",[_],[_])), unexpected.',
          '   outputs(pair).',
          '',
        ].join('\n');
        const result = publicApi.runQuads(source);
        assertEqual(result.total, 7, 'quad total');
        assertEqual(result.passed, 7, 'quad passed');
        assertEqual(result.failed, 0, 'quad failed');
        assertEqual(result.undecided, 0, 'quad undecided');
        assertEqual(result.stdout, 'quads: 7 run, 7 passed, 0 failed.\n', 'quad report');
      },
    },
    {
      name: '--quads runs embedded tests and reports failures through exit status',
      run: () => {
        const passing = runCli(['--quads', '-'], {
          input: `p(ok).\n\nsmoke ?- p(X).\n   X = ok.\n`,
        });
        assertEqual(passing.status, 0, 'passing quad exit status');
        assertEqual(passing.stdout, 'quads: 1 run, 1 passed, 0 failed.\n', 'passing quad stdout');
        assertEqual(passing.stderr, '', 'passing quad stderr');

        const failing = runCli(['-q', '-'], {
          input: `p(actual).\n\nsmoke ?- p(X).\n   X = expected.\n`,
        });
        assertEqual(failing.status, 1, 'failing quad exit status');
        assertIncludes(failing.stdout, 'quads: FAILED smoke, <stdin>:3', 'failing quad report');
        assertIncludes(failing.stdout, 'quads: 1 run, 0 passed, 1 failed.', 'failing quad summary');
        assertEqual(failing.stderr, '', 'failing quad stderr');
      },
    },
    {
      name: 'seeded random/3 sequence is reproducible',
      run: () => {
        const result = run(
          'seeded(A, B, C, Seeds) :- random(1, A, S1), random(S1, B, S2), random(1, C, S3), Seeds = [S1, S2, S3].\n',
          { goal: 'seeded(A, B, C, Seeds)' },
        );
        assertEqual(result.stdout, 'seeded(0.00002247747035927835, 0.085032448717423201, 0.00002247747035927835, [48271, 182605794, 48271]).\n', 'stdout');
      },
    },
    {
      name: 'seeded uuid/3 sequence is reproducible',
      run: () => {
        const result = run(
          'seeded_uuid(U1, U2, true) :- uuid(1, U1, S1), uuid(1, U1, _), uuid(S1, U2, _), U1 \\= U2.\n',
          { goal: 'seeded_uuid(U1, U2, Same)' },
        );
        assertEqual(result.stdout, "seeded_uuid('f26d1319-3f3f-4bd9-b92f-f414794a43b5', '4be874d3-166b-4107-b0dc-9c53074b3de1', true).\n", 'stdout');
      },
    },
    {
      name: '-h shows CLI help',
      run: () => {
        const result = runCli(['-h']);
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stdout, 'Usage:\n  eyeprolog\n  eyeprolog [options] [file-or-url.pl|- ...]', 'stdout');
        assertIncludes(result.stdout, 'With no arguments, start a Prolog REPL.', 'stdout');
        assertIncludes(result.stdout, '-g, --goal goal', 'stdout');
        assertIncludes(result.stdout, '-p, --proof', 'stdout');
        assertIncludes(result.stdout, '-q, --quads', 'stdout');
        assertIncludes(result.stdout, '-s, --stats', 'stdout');
        assertIncludes(result.stdout, '--portable', 'stdout');
        assertIncludes(result.stdout, '--no-autoload', 'stdout');
        assertIncludes(result.stdout, '-v, --version', 'stdout');
        assertIncludes(result.stdout, '-w, --warnings', 'stdout');
        assertIncludes(result.stdout, '-v, --version         Show the package version and exit.\n  -w, --warnings        Print non-fatal portability warnings to stderr.', 'stdout');
        assertIncludes(result.stdout, 'Read an EyeProlog program', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'bare CLI starts a REPL with truth, failure, and bindings',
      run: () => {
        const result = runCli([], { input: 'true.\nfalse.\nX = hello.\nhalt.\n' });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, '?-    true.\n?-    false.\n?-    X = hello.\n?- ', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL hides aliases to fresh throw variables while preserving query aliases',
      run: () => {
        const result = runCli([], {
          input: 'catch(throw(g(X)),g(V),true).\nX = Y.\nhalt.\n',
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, '?-    true.\n?-    X = Y.\n?- ', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL freshens variables displayed in uncaught ISO errors',
      run: () => {
        const result = runCli([], {
          input: 'number_chars(V,[1,[],X|2]).\nnumber_chars(V,[1,[],Xx|2]).\nhalt.\n',
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout,
          '?-    error(type_error(list, [1, [], _A | 2]), eyeprolog).\n' +
          '?-    error(type_error(list, [1, [], _A | 2]), eyeprolog).\n' +
          '?- ',
          'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL uncaught ISO errors retain the error/2 implementation context',
      run: () => {
        const result = runCli([], {
          input: '_ is _.\ncatch(_ is _, error(Error, Imp_def), true).\nhalt.\n',
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout,
          '?-    error(instantiation_error, eyeprolog).\n' +
          '?-    Error = instantiation_error, Imp_def = eyeprolog.\n' +
          '?- ',
          'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'occurs_check error mode reports representation_error(term) while ISO occurs-check unification still fails',
      run: () => {
        const filename = path.join(tmp, `occurs-check-${++tmpCounter}.pl`);
        fs.writeFileSync(filename, ':- set_prolog_flag(occurs_check, error).\nsame(X, X).\n');
        const result = runCli([], {
          input:
            'current_prolog_flag(occurs_check, Mode).\n' +
            'set_prolog_flag(occurs_check, error).\n' +
            'X = f(X).\n' +
            'catch((Y = g(Y)), E, true).\n' +
            'unify_with_occurs_check(Z, h(Z)).\n' +
            `[${sourceAtom(filename)}].\n` +
            'same(W, k(W)).\n' +
            'set_prolog_flag(occurs_check, true).\n' +
            'Q = q(Q).\n' +
            'halt.\n',
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout,
          '?-    Mode = true.\n' +
          '?-    true.\n' +
          '?-    error(representation_error(term), []).\n' +
          '?-    E = error(representation_error(term), []).\n' +
          '?-    false.\n' +
          '?-    true.\n' +
          '?-    error(representation_error(term), []).\n' +
          '?-    true.\n' +
          '?-    false.\n' +
          '?- ',
          'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'proven-nonoccurrence first-use shortcut preserves finite-tree occurs checking',
      run: () => {
        const program = Program.parse(`
          first_use_cycle :- X = f(Y), Y = g(X).
          repeated_cycle :- X = f(X).
          first_use_ok(T) :- X = f(Y), Y = a, T = X.
          pass(_).
          handed_off_cycle :- pass(X), Y = f(X), X = g(Y).
          handed_off_alias_cycle :- pass(X), Y = X, X = f(Y).
        `);
        const solver = new Solver(program);
        const solveCount = (text) => {
          const goal = parseGoalText(text, {
            doubleQuotes: 'chars',
            operatorDefinitions: [...program.operators.values()],
          });
          let count = 0;
          for (const _ of solver.solve([goal], new Env(), 0)) count++;
          return count;
        };
        assertEqual(solveCount('first_use_cycle'), 0, 'cycle across later first-use binding');
        assertEqual(solveCount('repeated_cycle'), 0, 'same-goal repeated variable still checks occurs');
        assertEqual(solveCount('first_use_ok(f(a))'), 1, 'acyclic first-use bindings still succeed');
        assertEqual(solveCount('handed_off_cycle'), 0, 'nested use globalizes a handed-off local before a cycle');
        assertEqual(solveCount('handed_off_alias_cycle'), 0, 'aliasing does not hide a later cycle');
      },
    },
    {
      name: 'phrase/2 fixes the final remainder before running the grammar',
      run: () => {
        const program = Program.parse('probe(_, Out) :- var(Out).\n');
        const solver = new Solver(program);
        const goal = parseGoalText('phrase(probe, [])', {
          doubleQuotes: 'chars',
          operatorDefinitions: [...program.operators.values()],
        });
        let count = 0;
        for (const _ of solver.solve([goal], new Env(), 0)) count++;
        assertEqual(count, 0, 'phrase/2 exposes [] rather than a temporary output variable');
      },
    },
    {
      name: 'deep tail-consuming DCG avoids quadratic occurs scans and recursive ground-goal copying',
      run: () => {
        const engineUrl = new URL('../src/index.js', import.meta.url).href;
        const script = `
          import { Program, Solver, Env, atom, compound, listFromItems } from ${JSON.stringify(engineUrl)};
          const program = Program.parse(${JSON.stringify('s --> [].\ns --> [x], s.\n')});
          const input = listFromItems(Array.from({ length: 2500 }, () => atom('x')));
          const solver = new Solver(program, { solutionLimit: 1, maxMemoryBytes: Infinity });
          const goal = compound('phrase', [atom('s'), input]);
          let count = 0;
          for (const _ of solver.solve([goal], new Env(), 0)) { count++; break; }
          if (count !== 1) throw new Error('deep DCG did not succeed');
          process.stdout.write('ok');
        `;
        const result = spawnSync(process.execPath, [
          '--input-type=module',
          '--eval',
          script,
        ], { cwd: packageRoot, encoding: 'utf8', timeout: 10000 });
        if (result.error) throw result.error;
        assertEqual(result.status, 0, `deep DCG child status; stderr=${result.stderr}`);
        assertEqual(result.stdout, 'ok', 'deep DCG result');
      },
    },
    {
      name: 'Trealla-style DCG hand-off autoloads time/1 and ... //0 without quadratic occurs checks (issue #49)',
      run: () => {
        const engineUrl = new URL('../src/index.js', import.meta.url).href;
        const script = `
          import { run } from ${JSON.stringify(engineUrl)};
          const source = ${JSON.stringify('a --> ..., epsilon.\nepsilon --> [].\n')};
          const result = run(source, {
            goal: ${JSON.stringify('length(_,E), E>12, N is 2^E, \\+ \\+ (length(L,N), time(phrase(a,L)))')},
            solutionLimit: 1,
          });
          if (!result.stdout.startsWith('% Time elapsed ') || !result.stdout.endsWith('s\\n')) {
            throw new Error('unexpected time/1 output: ' + JSON.stringify(result.stdout));
          }
          process.stdout.write('ok');
        `;
        const result = spawnSync(process.execPath, ['--input-type=module', '--eval', script], {
          cwd: packageRoot,
          encoding: 'utf8',
          timeout: 10000,
        });
        if (result.error) throw result.error;
        assertEqual(result.status, 0, `DCG hand-off child status; stderr=${result.stderr}`);
        assertEqual(result.stdout, 'ok', 'DCG hand-off benchmark result');
      },
    },
    {
      name: 'DCG state hand-off reaches the next non-terminal at 8192 cells (issue #49 comment 5347991607)',
      run: () => {
        const filename = path.join(tmp, `issue49-small-handoff-${tmpCounter++}.pl`);
        fs.writeFileSync(filename,
          ':- set_prolog_flag(occurs_check, true).\na --> ..., epsilon.\nepsilon --> [].\n');
        const result = runCli([], {
          input:
            `[${sourceAtom(filename)}].\n` +
            'use_module(library(lists)).\n' +
            '\\+ \\+ (length(L,8192), phrase(a,L)).\n' +
            'halt.\n',
          timeout: 3000,
        });
        if (result.error) throw result.error;
        assertEqual(result.status, 0, `small DCG hand-off status; stderr=${result.stderr}`);
        assertNotIncludes(result.stdout, 'resource_error', 'small DCG hand-off resource error');
        assertNotIncludes(result.stdout, 'depth_limit_exceeded', 'small DCG hand-off depth error');
        assertEqual(result.stderr, '', 'small DCG hand-off stderr');
      },
    },
    {
      name: 'Trealla-style DCG hand-off reaches 65536 cells without the solver depth ceiling',
      run: () => {
        const engineUrl = new URL('../src/index.js', import.meta.url).href;
        const script = `
          import { run } from ${JSON.stringify(engineUrl)};
          const source = ${JSON.stringify(':- set_prolog_flag(occurs_check, true).\na --> ..., epsilon.\nepsilon --> [].\n')};
          const result = run(source, {
            goal: ${JSON.stringify('\\+ \\+ (length(L,65536), time(phrase(a,L)))')},
            solutionLimit: 1,
          });
          if (!result.stdout.startsWith('% Time elapsed ')) {
            throw new Error('65536-cell hand-off did not succeed: ' + JSON.stringify(result.stdout));
          }
          process.stdout.write('ok');
        `;
        const result = spawnSync(process.execPath, ['--input-type=module', '--eval', script], {
          cwd: packageRoot,
          encoding: 'utf8',
          timeout: 5000,
        });
        if (result.error) throw result.error;
        assertEqual(result.status, 0, `65536-cell hand-off status; stderr=${result.stderr}`);
        assertEqual(result.stdout, 'ok', '65536-cell hand-off result');
      },
    },
    {
      name: 'REPL applies conservative autoloading to interactive time/1 and consulted ... //0',
      run: () => {
        const filename = path.join(tmp, `issue49-handoff-${tmpCounter++}.pl`);
        fs.writeFileSync(filename, 'a --> ..., epsilon.\nepsilon --> [].\n');
        const result = runCli([], {
          input:
            `[${sourceAtom(filename)}].\n` +
            'use_module(library(lists)).\n' +
            'length(_,E),E>12,N is 2^E,\\+ \\+ (length(L,N),time(phrase(a,L))).\n' +
            '\n' +
            'halt.\n',
          timeout: 10000,
        });
        if (result.error) throw result.error;
        assertEqual(result.status, 0, `REPL hand-off status; stderr=${result.stderr}`);
        assertIncludes(result.stdout, '% Time elapsed ', 'REPL time/1 output');
        assertEqual((result.stdout.match(/% Time elapsed /g) ?? []).length, 1,
          'REPL timed query does not prefetch an unrequested next answer');
        assertIncludes(result.stdout, 'E = 13, N = 8192', 'REPL first benchmark answer');
        assertNotIncludes(result.stdout, 'existence_error(procedure', 'REPL autoload errors');
        assertEqual(result.stderr, '', 'REPL hand-off stderr');
      },
    },
    {
      name: 'REPL Trealla hand-off benchmark reaches E=16 on demand without OOM fallthrough',
      run: () => {
        const filename = path.join(tmp, `issue49-handoff-deep-${tmpCounter++}.pl`);
        fs.writeFileSync(filename, ':- set_prolog_flag(occurs_check, true).\na --> ..., epsilon.\nepsilon --> [].\n');
        const result = runCli([], {
          input:
            `[${sourceAtom(filename)}].\n` +
            'use_module(library(lists)).\n' +
            'length(_,E),E>12,N is 2^E,\\+ \\+ (length(L,N),time(phrase(a,L))).\n' +
            ';\n;\n;\n\n' +
            'halt.\n',
          timeout: 5000,
        });
        if (result.error) throw result.error;
        assertEqual(result.status, 0, `deep REPL hand-off status; stderr=${result.stderr}`);
        for (const [e, n] of [[13, 8192], [14, 16384], [15, 32768], [16, 65536]]) {
          assertIncludes(result.stdout, `E = ${e}, N = ${n}`, `REPL hand-off E=${e}`);
        }
        assertEqual((result.stdout.match(/% Time elapsed /g) ?? []).length, 4,
          'exactly four requested timed answers');
        assertEqual(result.stderr, '', 'deep REPL hand-off stderr');
      },
    },
    {
      name: 'REPL enumerates and stops answers like the Scryer top level',
      run: () => {
        const result = runCli([], {
          input: '(X = a; X = b).\n;\n(X = one; X = two).\n\nhalt.\n',
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, '?-    X = a\n;  X = b.\n?-    X = one\n;  ... .\n?- ', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL does not precompute an unrequested future alternative (issue #48)',
      run: () => {
        const result = runCli([], {
          input: '(X = first; (repeat, fail)).\nhalt.\n',
          timeout: 2000,
        });
        if (result.error) throw result.error;
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, '?-    X = first.\n?- ', 'first answer is immediate');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL executes future side effects only after another answer is requested (issue #48)',
      run: () => {
        const stopped = runCli([], {
          input:
            '(X = first; (assertz(issue48_seen), X = second)).\n' +
            'current_predicate(issue48_seen/0).\n' +
            'halt.\n',
        });
        assertEqual(stopped.status, 0, 'stopped status');
        assertEqual(
          stopped.stdout,
          '?-    X = first.\n?-    false.\n?- ',
          'unrequested branch has no side effect',
        );

        const advanced = runCli([], {
          input:
            '(X = first; (assertz(issue48_seen), X = second)).\n' +
            ';\n' +
            'current_predicate(issue48_seen/0).\n' +
            'halt.\n',
        });
        assertEqual(advanced.status, 0, 'advanced status');
        assertEqual(
          advanced.stdout,
          '?-    X = first\n;  X = second.\n?-    true.\n?- ',
          'requested branch performs its side effect',
        );
        assertEqual(stopped.stderr, '', 'stopped stderr');
        assertEqual(advanced.stderr, '', 'advanced stderr');
      },
    },
    {
      name: 'REPL bindings use argument syntax for operator atoms',
      run: () => {
        const result = runCli([], {
          input: 'L=[:-,-], writeq(L), nl.\nhalt.\n',
        });
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stdout, '[:-,-]', 'writeq output');
        assertIncludes(result.stdout, 'L = [:-, -].', 'binding output');
        assertNotIncludes(result.stdout, "L = [':-', '-']", 'spurious quotes');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL query and answer prompts distinguish waiting from computation',
      run: () => {
        const helper = `
          import { spawn } from 'node:child_process';

          const child = spawn(${JSON.stringify(process.execPath)}, [${JSON.stringify(bin)}], {
            cwd: ${JSON.stringify(packageRoot)},
            stdio: ['pipe', 'pipe', 'pipe'],
          });
          child.stdout.setEncoding('utf8');
          child.stderr.setEncoding('utf8');
          let stdout = '';
          let stderr = '';
          let sawQueryComputingPrompt = false;
          let sawComputingPrompt = false;
          child.stdout.on('data', (text) => {
            stdout += text;
            if (stdout.endsWith('?-   ')) sawQueryComputingPrompt = true;
            if (stdout.includes('\\n; ')) sawComputingPrompt = true;
          });
          child.stderr.on('data', (text) => { stderr += text; });

          async function waitFor(predicate, label) {
            const deadline = Date.now() + 5000;
            while (!predicate()) {
              if (Date.now() >= deadline) {
                throw new Error(label + ' timeout; stdout=' + JSON.stringify(stdout) + '; stderr=' + JSON.stringify(stderr));
              }
              await new Promise((resolve) => setTimeout(resolve, 10));
            }
          }

          child.stdin.write('use_module(library(prologue)).\\n');
          await waitFor(() => stdout.includes('   true.\\n?- '), 'module import');
          sawQueryComputingPrompt = false;
          child.stdin.write('between(0,0xff,I),I<0.\\n');
          await waitFor(() => sawQueryComputingPrompt, 'query computing prompt');
          await waitFor(() => stdout.endsWith('   false.\\n?- '), 'query result');
          child.stdin.write('(N = 0; N = 1; (call_nth(repeat, 100000), N = 2)).\\n');
          await waitFor(() => stdout.endsWith('   N = 0'), 'first answer');
          child.stdin.write(';\\n');
          await waitFor(() => sawComputingPrompt, 'computing prompt');
          await waitFor(() => stdout.endsWith(';  N = 1'), 'formatted answer');
          child.stdin.write('\\n');
          await waitFor(() => stdout.endsWith('  ... .\\n?- '), 'stopped enumeration');
          child.stdin.write('halt.\\n');
          const status = await new Promise((resolve) => child.once('exit', resolve));
          if (status !== 0) throw new Error('child status ' + status + '; stderr=' + stderr);
          process.stdout.write('query-computing;waiting;computing;formatting');
        `;
        const result = spawnSync(process.execPath, [
          '--input-type=module',
          '--eval',
          helper,
        ], { cwd: packageRoot, encoding: 'utf8', timeout: 10000 });
        if (result.error) throw result.error;
        assertEqual(result.status, 0, `prompt helper status; stderr=${result.stderr}`);
        assertEqual(result.stdout, 'query-computing;waiting;computing;formatting', 'prompt state sequence');
      },
    },
    {
      name: 'REPL f stops at five-answer boundaries instead of adding five answers',
      run: () => {
        const result = runCli([], {
          input:
            'use_module(library(prologue), [between/3]).\n' +
            'between(0,11,I).\nf\n\n' +
            'between(0,11,J).\n;\n;\nf\n\n' +
            'between(0,11,K).\nf\nf\n\n' +
            'halt.\n',
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout,
          '?-    true.\n' +
          '?-    I = 0\n' +
          ';  I = 1\n' +
          ';  I = 2\n' +
          ';  I = 3\n' +
          ';  I = 4\n' +
          ';  ... .\n' +
          '?-    J = 0\n' +
          ';  J = 1\n' +
          ';  J = 2\n' +
          ';  J = 3\n' +
          ';  J = 4\n' +
          ';  ... .\n' +
          '?-    K = 0\n' +
          ';  K = 1\n' +
          ';  K = 2\n' +
          ';  K = 3\n' +
          ';  K = 4\n' +
          ';  K = 5\n' +
          ';  K = 6\n' +
          ';  K = 7\n' +
          ';  K = 8\n' +
          ';  K = 9\n' +
          ';  ... .\n' +
          '?- ',
          'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL parenthesizes operator-valued answer substitutions',
      run: () => {
        const result = runCli([], {
          input: 'T = (a=b).\nU = (a,b).\nV = (a;b).\nW = (a+b).\nhalt.\n',
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout,
          '?-    T = (a = b).\n' +
          '?-    U = (a, b).\n' +
          '?-    V = (a ; b).\n' +
          '?-    W = a + b.\n' +
          '?- ',
          'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL recognizes ISO octal and hexadecimal escapes in quoted atoms',
      run: () => {
        const result = runCli([], {
          input: "writeq('\\7\\').\nwriteq('\\x7\\').\nwriteq('\\a').\nhalt.\n",
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout,
          "?-   '\\a' true.\n" +
          "?-   '\\a' true.\n" +
          "?-   '\\a' true.\n" +
          '?- ',
          'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'writeq preserves the NUL character with an ISO octal escape',
      run: () => {
        const result = runCli([], {
          input: "writeq('\\0\\').\nhalt.\n",
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, "?-   '\\0\\' true.\n?- ", 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL rejects non-octal numeric escapes without waiting for continuation',
      run: () => {
        const result = runCli([], {
          input: "'\\8\\'.\nhalt.\n",
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout,
          '?-    parse line 1: bad octal escape.\n' +
          '?- ',
          'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL rejects an unterminated quote at the line boundary instead of waiting',
      run: () => {
        const result = runCli([], {
          input: "'\nhalt.\n",
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout,
          '?-    parse line 1: unterminated quoted term.\n' +
          '?- ',
          'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL rejects a literal newline in a quoted token immediately',
      run: () => {
        const result = runCli([], {
          // The first input line ends while a quote is open. ISO 6.4.2.1
          // makes that newline a lexical error unless it is escaped by the
          // immediately preceding backslash. The following true/0 proves
          // that the top level did not consume another line as continuation.
          input: "writeq('\ntrue.\nhalt.\n",
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout,
          '?-    parse line 1: unterminated quoted term.\n' +
          '?-    true.\n' +
          '?- ',
          'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'parser matches WG17 quoted-character and escape syntax cluster',
      run: () => {
        const invalid = [
          ['#2 lone quote', "'\n"],
          ['#5 literal horizontal tab', "writeq('\t')"],
          ['#6 literal newline', "writeq('\n')"],
          ['#11 backslash-space', String.raw`writeq('\ ')`],
          ['#12 backslash-horizontal-tab', "writeq('\\\t')"],
          ['#16 non-ISO c escape', String.raw`writeq('\ca')`],
          ['#241 non-ISO d escape', String.raw`writeq('\d')`],
          ['#17 non-ISO e escape', String.raw`writeq('\e')`],
          ['#19 non-ISO e in char_code/2', String.raw`char_code('\e', C)`],
          ['#21 non-ISO d in char_code/2', String.raw`char_code('\d', C)`],
          ['#22 non-ISO u escape', String.raw`writeq('\u1')`],
          ['#312 non-ISO Unicode escape', String.raw`writeq('\u0021')`],
          ['#314 non-ISO Unicode double-quote escape', String.raw`writeq("\u0021")`],
          ['#23 non-ISO character-code escape', String.raw`X = 0'\u1`],
          ['#24 unterminated quoted argument', "writeq('\n"],
          ['#26 continuation followed by unterminated quote', "'\\\n''"],
          ['#210 escaped dot character code', String.raw`X = 0'\.`],
          ['#211 escaped dot character code before layout', String.raw`X = 0'\. `],
        ];
        for (const [label, source] of invalid) {
          let error = null;
          try {
            parseGoalText(source);
          } catch (caught) {
            error = caught;
          }
          if (error == null) throw new Error(`${label} unexpectedly parsed`);
        }

        const valid = [
          ['#7 empty continuation', "writeq('\\\n')"],
          ['#8 leading continuation', "writeq('\\\na')"],
          ['#9 embedded continuation', "writeq('a\\\nb')"],
          ['#10 continuation before space', "writeq('a\\\n b')"],
          ['#13 symbolic tab', String.raw`writeq('\t')`],
          ['#14 symbolic alert', String.raw`writeq('\a')`],
          ['#15 octal alert', String.raw`writeq('\7\')`],
          ['#18 octal escape', String.raw`writeq('\033\')`],
          ['#301 NUL escape', String.raw`writeq('\0\')`],
          ['#315 hexadecimal escape', String.raw`writeq('\x21\')`],
          ['#316 padded hexadecimal escape', String.raw`writeq('\x0021\')`],
          ['#38 double-quoted meta escapes', "\"\\'\\`\\\"\" = \"'`\"\"\""],
          ['#39 single-quoted meta escapes', "'\\'\\`\\\"' = '''`\"'"],
          ['#40 writeq meta escapes', "writeq('\\'\\`\\\"\\\"')"],
          ['#41 meta backslash escape', String.raw`('\\') = (\)`],
        ];
        for (const [label, source] of valid) {
          try {
            parseGoalText(source);
          } catch (error) {
            throw new Error(`${label} should parse: ${error?.message ?? error}`);
          }
        }
      },
    },
    {
      name: 'stream term input reports malformed quoted layout as syntax_error',
      run: () => {
        for (const [label, input] of [
          ['lone quote', "'\n"],
          ['literal newline', "writeq('\n').\n"],
          ['literal tab', "writeq('\t').\n"],
        ]) {
          let error = null;
          try {
            runEyeProlog('', { goal: 'read(X)', ioOptions: { input } });
          } catch (caught) {
            error = caught;
          }
          assertEqual(error?.message, 'error(syntax_error(read_term))', `${label} read error`);
        }
      },
    },
    {
      name: 'writeq uses ISO numeric escapes for non-symbolic control characters',
      run: () => {
        const result = runCli([], {
          input: "writeq('\\033\\').\nhalt.\n",
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, "?-   '\\33\\' true.\n?- ", 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL read predicates consume following interactive term input',
      run: () => {
        const result = runCli([], {
          input:
            'read(X).\n' +
            'foo.\n' +
            'read_term(Y, []).\n' +
            "'\\7\\'.\n" +
            'read(user_input, Z).\n' +
            'bar.\n' +
            'halt.\n',
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout,
          '?-   |:  X = foo.\n' +
          "?-   |:  Y = '\\a'.\n" +
          '?-   |:  Z = bar.\n' +
          '?- ',
          'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'read terms have a variable scope distinct from the calling query',
      run: () => {
        const result = runCli([], {
          input:
            'read(X).\n' +
            'X=a.\n' +
            'read(X).\n' +
            'Y=a.\n' +
            'read_term(X, [variables(Vs), variable_names(Names), singletons(Singletons)]).\n' +
            'X = pair(X, Y).\n' +
            'halt.\n',
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout,
          '?-   |:  X = (_A = a).\n' +
          '?-   |:  X = (_A = a).\n' +
          "?-   |:  X = (_A = pair(_A, _B)), Vs = [_A, _B], Names = ['X' = _A, 'Y' = _B], Singletons = ['Y' = _B].\n" +
          '?- ',
          'stdout');
        assertEqual(result.stderr, '', 'stderr');

        const distinctReads = run(
          'check :- read(A), read(B), A \\== B, write_canonical(pair(A, B)), nl.\n',
          { goal: 'check', ioOptions: { input: 'V.\nV.\n' } },
        );
        assertEqual(distinctReads.stdout, 'pair(_A,_B)\ncheck.\n', 'separate read variable sets');
      },
    },
    {
      name: 'REPL term input is on demand in conjunctions and Ctrl-D does not exit the top level',
      run: () => {
        if (!hasUtilLinuxScript()) return;
        const result = runScriptedRepl([
          { waitFor: '?- ', send: 'read(X), read(Y).\n' },
          { waitFor: '  |: ', send: 'foo.\n' },
          { waitFor: '|: ', send: 'bar.\n' },
          { waitFor: 'X = foo, Y = bar.', send: 'read(Z).\n' },
          { waitFor: '  |: ', send: '\u0004' },
          { waitFor: 'Z = end_of_file.', send: 'true.\n' },
          { waitFor: '   true.', send: 'halt.\n' },
        ]);
        assertEqual(result.error?.code, undefined, 'interactive read timeout');
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stdout, 'X = foo, Y = bar.', 'conjunction reads');
        assertIncludes(result.stdout, 'Z = end_of_file.', 'Ctrl-D read result');
        assertIncludes(result.stdout, '?- true.', 'top level resumes after Ctrl-D');
        assertIncludes(result.stdout, '   true.', 'post-EOF query executes');
      },
    },
    {
      name: 'REPL character input is on demand and Ctrl-D stays local (issue #55)',
      run: () => {
        if (!hasUtilLinuxScript()) return;
        const result = runScriptedRepl([
          { waitFor: '?- ', send: 'peek_char(P), get_char(C), get_code(K).\n' },
          { waitFor: '  |: ', send: 'ab\n' },
          { waitFor: 'P = a, C = a, K = 98.', send: 'get_char(N).\n' },
          { waitFor: '  |: ', send: 'z\n' },
          { waitFor: 'N = z.', send: 'get_char(E).\n' },
          { waitFor: '  |: ', send: '\u0004' },
          { waitFor: 'E = end_of_file.', send: 'get_char(D).\n' },
          { waitFor: '  |: ', send: 'q\n' },
          { waitFor: 'D = q.', send: 'halt.\n' },
        ]);
        assertEqual(result.error?.code, undefined, 'interactive character input timeout');
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stdout, 'P = a, C = a, K = 98.', 'peek/get char and code input');
        assertIncludes(result.stdout, 'N = z.', 'Enter submits but is not buffered as the next character');
        assertIncludes(result.stdout, 'E = end_of_file.', 'Ctrl-D character result');
        assertIncludes(result.stdout, 'D = q.', 'character input resumes after Ctrl-D');
      },
    },
    {
      name: 'interactive user_input hook serves reads reached through user predicates',
      run: () => {
        const program = Program.parse('pair(A, B) :- read(A), read(B).\n');
        const solver = new Solver(program, { registry: getEyePrologRegistry() });
        const stream = solver.io.resolve('user_input');
        const pending = ['left.\n', 'right.\n'];
        let requests = 0;
        stream.interactiveReadTerm = () => {
          requests++;
          return pending.shift() ?? null;
        };
        const goal = parseGoalText('pair(X, Y)');
        const answers = [...solver.solve([goal], new Env(), 0)];
        assertEqual(answers.length, 1, 'answer count');
        assertEqual(termToString(copyResolved(goal.args[0], answers[0])), 'left', 'first read');
        assertEqual(termToString(copyResolved(goal.args[1], answers[0])), 'right', 'second read');
        assertEqual(requests, 2, 'on-demand read count');
      },
    },
    {
      name: 'REPL releases terminal signals while a query computes',
      run: () => {
        if (process.platform === 'win32') return;
        const available = spawnSync('sh', ['-c',
          'command -v script >/dev/null 2>&1 && script --version 2>/dev/null | grep -qi util-linux']);
        if (available.status !== 0) return;
        const command = `${shellQuote(process.execPath)} ${shellQuote(bin)}`;
        const scriptCommand =
          `{ printf 'repeat, fail.\n'; sleep 0.2; printf '\\003'; } | ` +
          `script -qefc ${shellQuote(command)} /dev/null`;
        const result = spawnSync('sh', ['-c', scriptCommand], {
          cwd: packageRoot,
          encoding: 'utf8',
          timeout: 3000,
        });
        assertEqual(result.error?.code, undefined, 'terminal interrupt timeout');
        assertEqual(result.status, 130, 'SIGINT exit status');
        assertIncludes(result.stdout, '?- repeat, fail.', 'terminal query echo');
      },
    },
    {
      name: 'REPL stops at the end token before parsing unmatched brackets (issue #51)',
      run: () => {
        const result = runCli([], { input: '[l.\ntrue.\n{.\ntrue.\nhalt.\n' });
        assertEqual(result.status, 0, 'exit status');
        assertNotIncludes(result.stdout, '|    ', 'no continuation prompt after malformed end token');
        assertEqual((result.stdout.match(/\?-    true\./g) ?? []).length, 2,
          'following lines remain separate top-level queries');
        assertEqual((result.stdout.match(/parse line 1:/g) ?? []).length, 2,
          'both malformed bracketed queries report syntax errors');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL accepts multiline period-terminated queries',
      run: () => {
        const result = runCli([], { input: '(X =\n  one).\nhalt.\n' });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, '?- |       X = one.\n?- ', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL consult shorthand loads local Prolog files',
      run: () => {
        const filename = path.join(tmp, `repl-consult-${++tmpCounter}.pl`);
        fs.writeFileSync(filename, 'color(red).\ncolor(blue).\n');
        const result = runCli([], {
          input: `[${sourceAtom(filename)}].\ncolor(X).\n;\nhalt.\n`,
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, '?-    true.\n?-    X = red\n;  X = blue.\n?- ', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL consult prefers .pl over an unsuffixed file (issue #47)',
      run: () => {
        const stem = path.join(tmp, `repl-consult-order-${++tmpCounter}`);
        fs.writeFileSync(stem, 'chosen(bare).\n');
        fs.writeFileSync(`${stem}.pl`, 'chosen(pl).\n');
        const result = runCli([], {
          input: `[${sourceAtom(stem)}].\nchosen(X).\nhalt.\n`,
        });
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stdout, 'X = pl.', 'consulted .pl source');
        assertNotIncludes(result.stdout, 'X = bare', 'unsuffixed source is fallback only');
        assertEqual(result.stderr, '', 'stderr');

        const explicit = runCli([], {
          input: `consult(${sourceAtom(stem)}).\nchosen(X).\nhalt.\n`,
        });
        assertEqual(explicit.status, 0, 'consult/1 exit status');
        assertIncludes(explicit.stdout, 'X = pl.', 'consult/1 prefers .pl source');
        assertNotIncludes(explicit.stdout, 'X = bare', 'consult/1 does not prefer unsuffixed source');
        assertEqual(explicit.stderr, '', 'consult/1 stderr');

        fs.rmSync(`${stem}.pl`);
        const fallback = runCli([], {
          input: `[${sourceAtom(stem)}].\nchosen(X).\nhalt.\n`,
        });
        assertEqual(fallback.status, 0, 'fallback exit status');
        assertIncludes(fallback.stdout, 'X = bare.', 'unsuffixed fallback source');
        assertEqual(fallback.stderr, '', 'fallback stderr');
      },
    },
    {
      name: 'REPL consultation replaces earlier clauses from the same file (issue #46)',
      run: () => {
        const filename = path.join(tmp, `repl-reconsult-${++tmpCounter}.pl`);
        fs.writeFileSync(filename, 'factum(f).\n');
        const harness = path.join(tmp, `repl-reconsult-harness-${++tmpCounter}.mjs`);
        const consultedAtom = sourceAtom(filename);
        fs.writeFileSync(harness, `
import fs from 'node:fs';
import process from 'node:process';
import { spawn } from 'node:child_process';

const child = spawn(process.execPath, [${JSON.stringify(bin)}], { stdio: ['pipe', 'pipe', 'pipe'] });
let stdout = '';
let stderr = '';
let advanced = false;
let failed = false;
const timer = setTimeout(() => {
  failed = true;
  child.kill();
}, 5000);

child.stdout.setEncoding('utf8');
child.stderr.setEncoding('utf8');
child.stdout.on('data', (chunk) => {
  stdout += chunk;
  if (!advanced && stdout.includes('?-    true.\\n?- ')) {
    advanced = true;
    fs.writeFileSync(${JSON.stringify(filename)}, 'factum(g).\\n');
    child.stdin.write(\`[${consultedAtom}].\\nfindall(F,factum(F),Fs).\\nhalt.\\n\`);
  }
});
child.stderr.on('data', (chunk) => { stderr += chunk; });
child.on('close', (code) => {
  clearTimeout(timer);
  process.stdout.write(stdout);
  process.stderr.write(stderr);
  process.exitCode = failed ? 99 : (code ?? 98);
});
child.stdin.write(\`[${consultedAtom}].\\n\`);
`);
        const result = spawnSync(process.execPath, [harness], {
          cwd: packageRoot,
          encoding: 'utf8',
          timeout: 7000,
        });
        assertEqual(result.error?.code, undefined, 'reconsult harness timeout');
        assertEqual(result.status, 0, `exit status; stderr=${result.stderr}`);
        assertIncludes(result.stdout, 'Fs = \"g\".', 'reconsulted clauses');
        assertNotIncludes(result.stdout, 'f', 'stale clause removed');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL consult/1 has reconsult semantics',
      run: () => {
        const filename = path.join(tmp, `repl-consult-predicate-${++tmpCounter}.pl`);
        fs.writeFileSync(filename, 'factum(f).\n');
        const harness = path.join(tmp, `repl-consult-predicate-harness-${++tmpCounter}.mjs`);
        const consultedAtom = sourceAtom(filename);
        fs.writeFileSync(harness, `
import fs from 'node:fs';
import process from 'node:process';
import { spawn } from 'node:child_process';

const child = spawn(process.execPath, [${JSON.stringify(bin)}], { stdio: ['pipe', 'pipe', 'pipe'] });
let stdout = '';
let stderr = '';
let advanced = false;
let failed = false;
const timer = setTimeout(() => {
  failed = true;
  child.kill();
}, 5000);

child.stdout.setEncoding('utf8');
child.stderr.setEncoding('utf8');
child.stdout.on('data', (chunk) => {
  stdout += chunk;
  if (!advanced && stdout.includes('?-    true.\\n?- ')) {
    advanced = true;
    fs.writeFileSync(${JSON.stringify(filename)}, 'factum(g).\\n');
    child.stdin.write(\`consult(${consultedAtom}).\\nfindall(F,factum(F),Fs).\\nhalt.\\n\`);
  }
});
child.stderr.on('data', (chunk) => { stderr += chunk; });
child.on('close', (code) => {
  clearTimeout(timer);
  process.stdout.write(stdout);
  process.stderr.write(stderr);
  process.exitCode = failed ? 99 : (code ?? 98);
});
child.stdin.write(\`consult(${consultedAtom}).\\n\`);
`);
        const result = spawnSync(process.execPath, [harness], {
          cwd: packageRoot,
          encoding: 'utf8',
          timeout: 7000,
        });
        assertEqual(result.error?.code, undefined, 'consult/1 reconsult harness timeout');
        assertEqual(result.status, 0, `exit status; stderr=${result.stderr}`);
        assertIncludes(result.stdout, 'Fs = "g".', 'consult/1 replaced earlier clauses');
        assertNotIncludes(result.stdout, 'f', 'consult/1 removed stale clause');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL preserves runtime unknown flag across consultation',
      run: () => {
        const filename = path.join(tmp, `repl-empty-${++tmpCounter}.pl`);
        fs.writeFileSync(filename, '');
        const result = runCli([], {
          input:
            'current_prolog_flag(unknown, V).\n' +
            'set_prolog_flag(unknown, fail).\n' +
            `[${sourceAtom(filename)}].\n` +
            'current_prolog_flag(unknown, V).\n' +
            'set_prolog_flag(unknown, error).\n' +
            `[${sourceAtom(filename)}].\n` +
            'missing_after_consult.\n' +
            'halt.\n',
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout,
          '?-    V = error.\n' +
          '?-    true.\n' +
          '?-    true.\n' +
          '?-    V = fail.\n' +
          '?-    true.\n' +
          '?-    true.\n' +
          '?-    error(existence_error(procedure, missing_after_consult / 0), eyeprolog).\n' +
          '?- ',
          'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL use_module imports Part 2 library predicates',
      run: () => {
        const result = runCli([], {
          input: 'append(X, Y, [1, 2, 3, 4]).\nuse_module(library(lists)).\nappend(X, Y, [1, 2, 3, 4]).\n\nhalt.\n',
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout,
          '?-    error(existence_error(procedure, append / 3), eyeprolog).\n' +
          '?-    true.\n' +
          '?-    X = [], Y = [1, 2, 3, 4]\n;  ... .\n?- ',
          'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'REPL halt status is returned by the CLI',
      run: () => {
        const result = runCli([], { input: 'halt(7).\n' });
        assertEqual(result.status, 7, 'exit status');
        assertEqual(result.stdout, '?- ', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'CLI loads an explicitly imported standard library module',
      run: () => {
        const result = runCli(['-'], {
          input: ':- use_module(library(lists), [member/2]).\n%% goal: answer(X)\nanswer(X) :- member(X, [library]).\n',
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'answer(library).\n', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'version comes from package.json',
      run: () => {
        const result = runCli(['--version']);
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, `eyeprolog ${pkg.version}\n`, 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: '-v shows package version',
      run: () => {
        const result = runCli(['-v']);
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, `eyeprolog ${pkg.version}\n`, 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'npm exec can run package CLI bin from checkout',
      run: () => {
        const result = spawnSync('npm', ['exec', '--offline', '--loglevel=silent', '--yes', '--package=.', '--', 'eyeprolog', '--version'], {
          cwd: packageRoot,
          encoding: 'utf8',
          env: { ...process.env, npm_config_update_notifier: 'false' },
        });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, `eyeprolog ${pkg.version}\n`, 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'npm can install the CLI under a user-owned prefix',
      run: () => {
        const prefix = path.join(tmp, `npm-prefix-${++tmpCounter}`);
        const installed = spawnSync('npm', [
          'install', '--global', '--prefix', prefix, '--loglevel=silent', '--no-audit', '--no-fund', '.',
        ], {
          cwd: packageRoot,
          encoding: 'utf8',
          env: { ...process.env, npm_config_update_notifier: 'false' },
        });
        assertEqual(installed.status, 0, 'install exit status');
        const executable = process.platform === 'win32'
          ? path.join(prefix, 'eyeprolog.cmd')
          : path.join(prefix, 'bin', 'eyeprolog');
        const result = spawnSync(executable, ['--version'], { encoding: 'utf8' });
        assertEqual(result.status, 0, 'installed CLI exit status');
        assertEqual(result.stdout, `eyeprolog ${pkg.version}\n`, 'installed CLI stdout');
        assertEqual(result.stderr, '', 'installed CLI stderr');
      },
    },
    {
      name: 'stdin input is accepted',
      run: () => {
        const result = runCli(['-'], { input: '%% goal: q(X, Y)\np(a, b).\nq(X, Y) :- p(X, Y).\n' });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'q(a, b).\n', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },

    {
      name: 'CLI reads repeated goal comments when --goal is omitted',
      run: () => {
        const input = [
          '%% goal: answer(first, X)',
          '%% goal: answer(second, X)',
          'value(first, one).',
          'value(second, two).',
          'answer(Kind, Value) :- value(Kind, Value).',
          '',
        ].join('\n');
        const result = runCli(['-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'answer(first, one).\nanswer(second, two).\n', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'explicit CLI goals override goal comments',
      run: () => {
        const input = [
          '%% goal: answer(metadata, X)',
          'value(metadata, ignored).',
          'value(explicit, selected).',
          'answer(Kind, Value) :- value(Kind, Value).',
          '',
        ].join('\n');
        const result = runCli(['--goal', 'answer(explicit, X)', '-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'answer(explicit, selected).\n', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: '-g supplies an explicit CLI goal',
      run: () => {
        const input = [
          '%% goal: answer(metadata, X)',
          'value(metadata, ignored).',
          'value(explicit, selected).',
          'answer(Kind, Value) :- value(Kind, Value).',
          '',
        ].join('\n');
        const result = runCli(['-g', 'answer(explicit, X)', '-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'answer(explicit, selected).\n', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: '-g requires a goal argument',
      run: () => {
        const result = runCli(['-g']);
        assertEqual(result.status, 1, 'exit status');
        assertEqual(result.stdout, '', 'stdout');
        assertEqual(result.stderr, 'eyeprolog: option -g requires a goal\n', 'stderr');
      },
    },

    {
      name: '--proof enables query explanations',
      run: () => {
        const result = runCli(['--proof', '-'], { input: '%% goal: q(X, Y)\np(a, b).\nq(X, Y) :- p(X, Y).\n' });
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stdout, 'q(a, b).\nwhy(', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: '-p enables query explanations',
      run: () => {
        const result = runCli(['-p', '-'], { input: '%% goal: q(X, Y)\np(a, b).\nq(X, Y) :- p(X, Y).\n' });
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stdout, 'q(a, b).\nwhy(', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: '-pw combines proof and warning flags',
      run: () => {
        const input = [
          '%% goal: answer(ok)',
          'p :- \\+ q.',
          'q :- \\+ p.',
          'seed.',
          'answer(ok) :- seed.',
          '',
        ].join('\n');
        const result = runCli(['-pw', '-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stdout, 'answer(ok).\nwhy(', 'stdout');
        assertIncludes(result.stderr, 'eyeprolog warning: unstratified negation\n', 'stderr');
      },
    },
    {
      name: 'unknown option in a short cluster is rejected',
      run: () => {
        const result = runCli(['-px']);
        assertEqual(result.status, 1, 'exit status');
        assertEqual(result.stdout, '', 'stdout');
        assertIncludes(result.stderr, 'eyeprolog: unknown option: -px\n', 'stderr');
      },
    },


    {
      name: '--stats prints solver and memory statistics to stderr',
      run: () => {
        const result = runCli(['--stats', '-'], { input: '%% goal: q(X, Y)\np(a, b).\nq(X, Y) :- p(X, Y).\n' });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'q(a, b).\n', 'stdout');
        assertIncludes(result.stderr, 'eyeprolog stats:\n', 'stderr');
        assertIncludes(result.stderr, '  solve_goals_calls:', 'stderr');
        assertIncludes(result.stderr, '  memory_heap_used_bytes:', 'stderr');
        assertIncludes(result.stderr, '  memory_old_generation_used_bytes:', 'stderr');
        assertIncludes(result.stderr, '  memory_guard_used_bytes:', 'stderr');
        assertIncludes(result.stderr, '  memory_rss_bytes:', 'stderr');
        assertIncludes(result.stderr, '  memory_soft_limit_bytes:', 'stderr');
        assertIncludes(result.stderr, '  memory_hard_limit_bytes:', 'stderr');
      },
    },
    {
      name: '--stats is still printed when a query raises an error',
      run: () => {
        const result = runCli(['--stats', '-'], { input: "%% goal: number_chars(N, ['x'])\n" });
        assertEqual(result.status, 1, 'exit status');
        assertIncludes(result.stderr, 'eyeprolog stats:\n', 'stderr');
        assertIncludes(result.stderr, '  memory_heap_used_bytes:', 'stderr');
        assertIncludes(result.stderr, 'eyeprolog: error(syntax_error(number))', 'stderr');
      },
    },
    {
      name: '-s prints solver statistics to stderr',
      run: () => {
        const result = runCli(['-s', '-'], { input: '%% goal: q(X, Y)\np(a, b).\nq(X, Y) :- p(X, Y).\n' });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'q(a, b).\n', 'stdout');
        assertIncludes(result.stderr, 'eyeprolog stats:\n', 'stderr');
        assertIncludes(result.stderr, '  solve_goals_calls:', 'stderr');
      },
    },
    {
      name: 'statistics/0 prints snapshots during execution',
      run: () => {
        const input = '%% goal: live\nlive :- statistics, statistics.\n';
        const result = runCli(['-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertEqual((result.stdout.match(/eyeprolog stats:/g) ?? []).length, 2, 'in-run snapshot count');
        assertIncludes(result.stdout, '  memory_guard_used_bytes:', 'stdout');
        assertIncludes(result.stdout, 'live.\n', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'statistics/2 exposes current counters and memory values',
      run: () => {
        const input = '%% goal: live(Used)\nlive(Used) :- statistics(memory_guard_used_bytes, Used).\n';
        const result = runCli(['-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(/^live\(\d+\)\.\n$/.test(result.stdout), true, 'numeric memory statistic');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'statistics/2 rejects unknown keys instead of silently failing (issue #45)',
      run: () => {
        const result = runCli([], { input: 'statistics(nonsense, Value).\nhalt.\n' });
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stdout,
          'error(domain_error(statistics_key, nonsense), eyeprolog).',
          'statistics key error');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'statistics predicates are excluded from strict ISO mode',
      run: () => {
        const result = runCli(['--iso-strict', '-'], { input: '%% goal: statistics\n' });
        assertEqual(result.status, 1, 'exit status');
        assertIncludes(result.stderr, 'existence_error(procedure)', 'stderr');
      },
    },
    {
      name: 'portable library predicates autoload without use_module directives',
      run: () => {
        const input = '%% goal: answer(X)\nanswer(X) :- member(X, [a,b]).\n';
        const result = runCli(['-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'answer(a).\nanswer(b).\n', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'between/3 autoload removes the EyeProlog-specific prologue dependency',
      run: () => {
        const input = '%% goal: answer(X)\nanswer(X) :- between(1, 3, X).\n';
        const result = runCli(['-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'answer(1).\nanswer(2).\nanswer(3).\n', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'between/3 generated values avoid recursive environment chains (issue #52)',
      run: () => {
        const goalText = 'between(1, 1024, X), X < 0';
        const program = Program.parse('', { autoloadGoals: [goalText] });
        const solver = new Solver(program, { registry: getEyePrologRegistry() });
        const goal = parseGoalText(goalText, {
          operatorDefinitions: [...solver.program.operators.values()],
        });
        let answers = 0;
        for (const _env of solver.solve([goal], new Env(), 0)) answers++;
        assertEqual(answers, 0, 'positive generated values fail X < 0');
        assertEqual(solver.stats.unify_calls, 1024, 'one output unification per generated integer');
        assertEqual(solver.stats.max_depth <= 4, true, 'generation stays at bounded solver depth');
      },
    },
    {
      name: 'library(lists) length/2 stays relational and call_nth/2 autoloads (issue #28)',
      run: () => {
        const input = [
          ':- use_module(library(lists)).',
          '%% goal: fourth_length(N)',
          'fourth_length(N) :- call_nth(length(_Xs, N), 4).',
          '',
        ].join('\n');
        const result = runCli(['-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'fourth_length(3).\n', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'library(lists) and library(iso_ext) co-import without collisions',
      run: () => {
        const input = [
          ':- use_module(library(lists)).',
          ':- use_module(library(iso_ext)).',
          '%% goal: answer(N)',
          'answer(N) :- call_nth(member(_, [a,b,c]), N), N = 2.',
          '',
        ].join('\n');
        const result = runCli(['--portable', '--no-autoload', '-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'answer(2).\n', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'strict ISO mode disables interop autoloading',
      run: () => {
        const input = '%% goal: answer(X)\nanswer(X) :- member(X, [a,b]).\n';
        const result = runCli(['--iso-strict', '-'], { input });
        assertEqual(result.status, 1, 'exit status');
        assertIncludes(result.stderr, 'existence_error(procedure)', 'stderr');
        assertIncludes(result.stderr, '/(member, 2)', 'stderr');
      },
    },
    {
      name: 'CLI top-level goals participate in interop autoloading',
      run: () => {
        const result = runCli(['-g', 'member(X,[a,b])', '-'], { input: '' });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'member(a, "ab").\nmember(b, "ab").\n', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: '--no-autoload also applies to CLI top-level goals',
      run: () => {
        const result = runCli(['--no-autoload', '-g', 'member(X,[a])', '-'], { input: '' });
        assertEqual(result.status, 1, 'exit status');
        assertIncludes(result.stderr, 'existence_error(procedure)', 'stderr');
        assertIncludes(result.stderr, '/(member, 2)', 'stderr');
      },
    },
    {
      name: '--portable checks non-portable predicates used only by top-level goals',
      run: () => {
        const input = ':- use_module(library(lists)).\n';
        const result = runCli(['--portable', '-g', 'set_nth0(0,[a],b,X)', '-'], { input });
        assertEqual(result.status, 1, 'exit status');
        assertEqual(result.stdout, '', 'stdout');
        assertIncludes(result.stderr, 'non-portable library predicate', 'stderr');
        assertIncludes(result.stderr, 'set_nth0/4', 'stderr');
      },
    },
    {
      name: '--portable accepts the common interop profile',
      run: () => {
        const input = ':- use_module(library(lists)).\n%% goal: answer(X)\nanswer(X) :- member(X, [a]).\n';
        const result = runCli(['--portable', '-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'answer(a).\n', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: '--portable rejects implementation-specific library dependencies',
      run: () => {
        const input = ':- use_module(library(prologue), [between/3]).\n%% goal: answer\nanswer :- between(1, 1, _).\n';
        const result = runCli(['--portable', '-'], { input });
        assertEqual(result.status, 1, 'exit status');
        assertEqual(result.stdout, '', 'stdout');
        assertIncludes(result.stderr, 'non-portable library dependency', 'stderr');
      },
    },
    {
      name: '--no-autoload exposes unresolved portable dependencies',
      run: () => {
        const input = '%% goal: answer(X)\nanswer(X) :- member(X, [a]).\n';
        const result = runCli(['--no-autoload', '-'], { input });
        assertEqual(result.status, 1, 'exit status');
        assertIncludes(result.stderr, 'existence_error(procedure)', 'stderr');
        assertIncludes(result.stderr, '/(member, 2)', 'stderr');
      },
    },
    {
      name: '--warnings flags explicit library(prologue) dependencies',
      run: () => {
        const input = ':- use_module(library(prologue), [between/3]).\n%% goal: answer\nanswer :- between(1, 1, _).\n';
        const result = runCli(['--warnings', '-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stderr, 'eyeprolog warning: non-portable library dependency\n', 'stderr');
        assertIncludes(result.stderr, 'library(prologue) is outside the EyeProlog/Trealla/Scryer interop profile', 'stderr');
      },
    },
    {
      name: '--warnings flags EyeProlog-only predicates from library(lists)',
      run: () => {
        const input = ':- use_module(library(lists)).\n%% goal: answer(X)\nanswer(X) :- set_nth0(0, [a], b, X).\n';
        const result = runCli(['--warnings', '-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stderr, 'eyeprolog warning: non-portable library predicate\n', 'stderr');
        assertIncludes(result.stderr, 'set_nth0/4 from library(lists) is outside the interop profile', 'stderr');
      },
    },
    {
      name: '--warnings stays quiet for the common library(lists) profile',
      run: () => {
        const input = ':- use_module(library(lists)).\n%% goal: answer(X)\nanswer(X) :- member(X, [a]).\n';
        const result = runCli(['--warnings', '-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'answer(a).\n', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: '--warnings prints unstratified negation diagnostics without failing',
      run: () => {
        const input = [
          '%% goal: answer(X)',
          'p(a) :- \\+ q(a).',
          'q(a) :- \\+ p(a).',
          'answer(ok).',
          '',
        ].join('\n');
        const result = runCli(['--warnings', '-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, '', 'stdout');
        assertIncludes(result.stderr, 'eyeprolog warning: unstratified negation\n', 'stderr');
        assertIncludes(result.stderr, 'p/1 depends negatively on q/1', 'stderr');
        assertIncludes(result.stderr, 'q/1 depends negatively on p/1', 'stderr');
      },
    },
    {
      name: '-w prints unstratified negation diagnostics without failing',
      run: () => {
        const input = [
          '%% goal: answer(X)',
          'p(a) :- \\+ q(a).',
          'q(a) :- \\+ p(a).',
          'answer(ok).',
          '',
        ].join('\n');
        const result = runCli(['-w', '-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, '', 'stdout');
        assertIncludes(result.stderr, 'eyeprolog warning: unstratified negation\n', 'stderr');
      },
    },
    {
      name: '--warnings stays quiet for stratified negation',
      run: () => {
        const input = '%% goal: answer(X)\np(a).\nq(_) :- fail.\nanswer(ok) :- \\+ q(a).\n';
        const result = runCli(['--warnings', '-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'answer(ok).\n', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'double dash permits option-shaped file names',
      run: () => {
        const file = path.join(tmp, '-h');
        fs.writeFileSync(file, '%% goal: q(X, Y)\np(a, b).\nq(X, Y) :- p(X, Y).\n');
        const result = runCli(['--', file]);
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'q(a, b).\n', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'explicit CLI conjunction goals execute every conjunct',
      run: () => {
        const failing = runCli(['--goal', 'a(X), b', '-'], {
          input: 'a(ok) :- true.\nb :- fail.\n',
        });
        assertEqual(failing.status, 0, 'failing conjunction status');
        assertEqual(failing.stdout, '', 'failing conjunction stdout');

        const succeeding = runCli(['--goal', 'a(X), b', '-'], {
          input: 'a(ok) :- true.\nb.\n',
        });
        assertEqual(succeeding.status, 0, 'succeeding conjunction status');
        assertEqual(succeeding.stdout, 'a(ok), b.\n', 'succeeding conjunction stdout');
      },
    },
    {
      name: 'CLI answers render nested active operators with precedence',
      run: () => {
        const result = runCli(['--goal', 'answer(Domain)', '-'], {
          input: ':- use_module(library(clpz)).\nanswer(Domain) :- X in 2..4 \\/ 7, fd_dom(X, Domain).\n',
        });
        assertEqual(result.status, 0, 'operator answer status');
        assertEqual(result.stdout, 'answer(2..4 \\/ 7).\n', 'operator answer stdout');
        assertEqual(result.stderr, '', 'operator answer stderr');
      },
    },
    {
      name: 'include shares operator declarations in both directions',
      run: () => {
        const directory = path.join(tmp, `include-operators-${++tmpCounter}`);
        fs.mkdirSync(directory);
        fs.writeFileSync(path.join(directory, 'child.pl'), [
          'child_rule :- carol likes dave.',
          ':- op(500, xfx, trusts).',
          '',
        ].join('\n'));
        const parent = [
          ':- op(500, xfx, likes).',
          ":- include('child.pl').",
          'parent_rule :- alice trusts bob.',
          '',
        ].join('\n');
        const program = Program.parseSources([{
          text: parent,
          filename: 'parent.pl',
          baseDir: directory,
        }], { sourceMetadata: false });
        assertEqual(
          termToString(program.findGroup('child_rule', 0).clauses[0].body[0], new Env(), true),
          'likes(carol, dave)',
          'operator declared by parent',
        );
        assertEqual(
          termToString(program.findGroup('parent_rule', 0).clauses[0].body[0], new Env(), true),
          'trusts(alice, bob)',
          'operator declared by child',
        );
      },
    },
    {
      name: 'ensure_loaded treats the top-level source as already loaded',
      run: () => {
        const directory = path.join(tmp, `ensure-self-${++tmpCounter}`);
        fs.mkdirSync(directory);
        const filename = path.join(directory, 'self.pl');
        const text = "a.\n:- ensure_loaded('self.pl').\nb.\n";
        fs.writeFileSync(filename, text);
        const program = Program.parseSources([{
          text,
          filename: 'self.pl',
          baseDir: directory,
        }], { sourceMetadata: false });
        assertEqual(program.clauses.length, 2, 'clause count');
        assertEqual(program.findGroup('a', 0).clauses.length, 1, 'a/0 count');
        assertEqual(program.findGroup('b', 0).clauses.length, 1, 'b/0 count');
      },
    },
    {
      name: 'ISO operator atoms are valid functional and list arguments',
      run: () => {
        const source = [
          'operator_argument(ok) :- current_op(1200, xfx, :-), [:-,-] = [:-,-].',
          '',
        ].join('\n');
        assertEqual(run(source, { goal: 'operator_argument(ok)' }).stdout, 'operator_argument(ok).\n', 'operator argument syntax');
      },
    },
    {
      name: 'ISO writeq preserves operator atoms in argument syntax',
      run: () => {
        const source = [
          'emit_operator_arguments :-',
          "  writeq([:-,-]), put_char('|'),",
          "  writeq(f(*)), put_char('|'),",
          "  writeq(f(;,'|',';;')).",
          '',
        ].join('\n');
        assertEqual(
          run(source, { goal: 'emit_operator_arguments' }).stdout,
          "[:-,-]|f(*)|f(;,'|',';;')emit_operator_arguments.\n",
          'operator argument output',
        );
      },
    },
    {
      name: 'ISO query operator and quad infix extension are visible through current_op/3',
      run: () => {
        assertEqual(
          run('', { goal: 'current_op(Priority, Specifier, ?-)' }).stdout,
          "current_op(1200, fx, ?-).\ncurrent_op(1200, xfx, ?-).\n",
          'query operator definitions',
        );
        assertEqual(
          run('', { goal: 'current_op(1200, fx, ?-)' }).stdout,
          "current_op(1200, fx, ?-).\n",
          'ISO query prefix operator',
        );
        assertEqual(
          run('', { goal: 'current_op(1200, xfx, ?-)' }).stdout,
          "current_op(1200, xfx, ?-).\n",
          'quad query infix operator',
        );
        const prefix = parseGoalText('(?- true)');
        assertEqual(prefix.name, '?-', 'prefix query functor');
        assertEqual(prefix.arity, 1, 'prefix query arity');
        const infix = parseGoalText('(label ?- true)');
        assertEqual(infix.name, '?-', 'quad query functor');
        assertEqual(infix.arity, 2, 'quad query arity');
      },
    },
    {
      name: 'normal EyeProlog uses the ISO unknown=error default',
      run: () => {
        const program = Program.parse('');
        const solver = new Solver(program, { registry: getEyePrologRegistry() });
        assertEqual(solver.prologFlags.get('unknown')?.value?.name, 'error', 'normal unknown default');
        assertEqual(
          run('', { goal: 'current_prolog_flag(unknown, V)' }).stdout,
          'current_prolog_flag(unknown, error).\n',
          'public runner unknown default',
        );
      },
    },
    {
      name: 'strict ISO core mode exposes only the Part 1 registry and flag surface',
      run: () => {
        const program = Program.parse('', { isoStrict: true });
        const solver = new Solver(program, { isoStrict: true });
        const registry = getStrictIsoRegistry();
        assertEqual(Boolean(registry.get('subsumes_term', 2)), true, 'Corrigendum 2 predicate');
        assertEqual(Boolean(registry.get('phrase', 2)), false, 'Part 3 phrase excluded');
        assertEqual(Boolean(registry.get('phrase', 3)), false, 'Part 3 phrase/3 excluded');
        assertEqual(Boolean(registry.get('true', 0)), true, 'Part 1 true/0');
        assertEqual(solver.prologFlags.has('occurs_check'), false, 'implementation-specific flag excluded');
        assertEqual(solver.prologFlags.get('unknown')?.value?.name, 'error', 'ISO unknown default');
      },
    },
    {
      name: 'strict ISO core mode keeps prefix ?- but removes the predefined quad infix form',
      run: () => {
        const program = Program.parse('', { isoStrict: true });
        assertEqual(program.operators.has('fx\u0000?-'), true, 'ISO ?-/1');
        assertEqual(program.operators.has('xfx\u0000?-'), false, 'quad ?-/2');
        const added = Program.parse(':- op(1200,xfx,?-).\nleft ?- right.\n', { isoStrict: true });
        assertEqual(Boolean(added.findGroup('?-', 2)), true, 'explicit conforming op/3 may add ?-/2');
        assertEqual(added.quads.length, 0, 'strict source never records quads');
      },
    },
    {
      name: 'strict ISO core mode rejects EyeProlog module directives',
      run: () => {
        let caught = null;
        try {
          Program.parse(':- use_module(library(lists)).\n', { isoStrict: true });
        } catch (error) {
          caught = error;
        }
        if (!caught) throw new Error('strict ISO source unexpectedly accepted use_module/1');
        assertIncludes(caught.message, 'implementation-specific directive use_module/1', 'strict directive error');
      },
    },
    {
      name: 'strict ISO core mode does not expand Part 3 grammar rules',
      run: () => {
        const strict = Program.parse('sentence --> [a].\n', { isoStrict: true });
        const normal = Program.parse('sentence --> [a].\n');
        assertEqual(Boolean(strict.findGroup('-->', 2)), true, 'strict -->/2 ordinary predicate');
        assertEqual(Boolean(strict.findGroup('sentence', 2)), false, 'strict no DCG expansion');
        assertEqual(Boolean(normal.findGroup('sentence', 2)), true, 'normal DCG expansion');
      },
    },
    {
      name: 'strict ISO core mode rejects clauses for standardized built-ins',
      run: () => {
        let caught = null;
        try {
          Program.parse('true.\n', { isoStrict: true });
        } catch (error) {
          caught = error;
        }
        if (!caught) throw new Error('strict ISO source unexpectedly redefined true/0');
        assertEqual(caught.formal, 'permission_error(modify, static_procedure)', 'strict static-procedure error');
      },
    },
    {
      name: 'strict ISO clause/2 keeps static procedures private and dynamic procedures public',
      run: () => {
        const staticProgram = Program.parse('p.\n', { isoStrict: true });
        const staticSolver = new Solver(staticProgram, { isoStrict: true });
        let caught = null;
        try {
          [...staticSolver.solve([parseGoalText('clause(p,B)', { isoStrict: true })], new Env(), 0)];
        } catch (error) {
          caught = error;
        }
        if (!caught) throw new Error('strict clause/2 unexpectedly inspected a static procedure');
        assertEqual(caught.formal, 'permission_error(access, private_procedure)', 'static clause privacy');

        const dynamicProgram = Program.parse(':- dynamic(p/0).\np.\n', { isoStrict: true });
        const dynamicSolver = new Solver(dynamicProgram, { isoStrict: true });
        const answers = [...dynamicSolver.solve([parseGoalText('clause(p,B)', { isoStrict: true })], new Env(), 0)];
        assertEqual(answers.length, 1, 'dynamic clause answer count');
      },
    },
    {
      name: 'strict ISO core mode disables automatic tabling and recursion guards',
      run: () => {
        const strict = Program.parse('p :- p.\n', { isoStrict: true });
        const normal = Program.parse('p :- p.\n');
        const strictGroup = strict.findGroup('p', 0);
        const normalGroup = normal.findGroup('p', 0);
        assertEqual(strictGroup?.recursive, false, 'strict recursive planner disabled');
        assertEqual(strictGroup?.tabled, false, 'strict tabling disabled');
        assertEqual(normalGroup?.recursive, true, 'normal recursion detected');
      },
    },
    {
      name: '--iso-strict rejects quad execution mode',
      run: () => {
        const result = runCli(['--iso-strict', '--quads', '-'], { input: '' });
        assertEqual(result.status, 1, 'exit status');
        assertIncludes(result.stderr, '--iso-strict cannot be combined with --quads', 'stderr');
      },
    },
    {
      name: '--iso-strict rejects extension directives from source input',
      run: () => {
        const result = runCli(['--iso-strict', '-'], { input: ':- use_module(library(lists)).\n' });
        assertEqual(result.status, 1, 'exit status');
        assertIncludes(result.stderr, 'implementation-specific directive use_module/1', 'stderr');
      },
    },
    {
      name: 'term input accepts ISO numeric escapes through read predicates',
      run: () => {
        const escapePath = path.join(tmp, `read-escapes-${++tmpCounter}.term`);
        // Two raw read-terms: '\7\'. and '\x7\'.  Build the file from
        // character codes so this regression tests stream parsing rather than
        // the parser which reads this JavaScript fixture.
        fs.writeFileSync(escapePath, String.fromCharCode(
          39, 92, 55, 92, 39, 46, 10,
          39, 92, 120, 55, 92, 39, 46, 10,
        ));
        const source = [
          `read_escapes(A, B) :-`,
          `  current_input(Old),`,
          `  open(${sourceAtom(escapePath)}, read, Input, []),`,
          `  set_input(Input),`,
          `  read(A),`,
          `  read_term(B, []),`,
          `  set_input(Old),`,
          `  close(Input).`,
          '',
        ].join('\n');
        assertEqual(
          run(source, { goal: 'read_escapes(A, B)' }).stdout,
          "read_escapes('\\a', '\\a').\n",
          'read/1 and read_term/2 numeric escapes',
        );

        assertEqual(
          run('answer(T) :- read(T).\n', {
            goal: 'answer(T)',
            ioOptions: { input: "'\\7\\'." },
          }).stdout,
          "answer('\\a').\n",
          'read/1 user_input numeric escape',
        );

        const invalidOctal = String.fromCharCode(39, 92, 56, 92, 39, 46);
        assertEqual(
          run('answer(T) :- catch(read(T), E, T=E).\n', {
            goal: 'answer(T)',
            ioOptions: { input: invalidOctal },
          }).stdout,
          'answer(error(syntax_error(read_term), eyeprolog)).\n',
          'read/1 rejects non-octal numeric escape',
        );
      },
    },
    {
      name: 'term input keeps dotted operators intact and uses program operators',
      run: () => {
        const univPath = path.join(tmp, `read-univ-${++tmpCounter}.term`);
        const customPath = path.join(tmp, `read-custom-${++tmpCounter}.term`);
        const invalidPath = path.join(tmp, `read-invalid-${++tmpCounter}.term`);
        const quotesPath = path.join(tmp, `read-quotes-${++tmpCounter}.term`);
        fs.writeFileSync(univPath, 'foo =.. [bar]/* term end */.\n');
        fs.writeFileSync(customPath, 'alice likes bob.\n');
        fs.writeFileSync(invalidPath, 'a..b.\n');
        fs.writeFileSync(quotesPath, '"ab".\n');
        const source = [
          `read_univ(T) :- open(${sourceAtom(univPath)}, read, S, []), read(S, T), close(S).`,
          `read_custom(T) :- op(500, xfx, likes), open(${sourceAtom(customPath)}, read, S, []), read(S, T), close(S).`,
          `read_invalid(ok) :- open(${sourceAtom(invalidPath)}, read, S, []), catch(read(S, _), error(syntax_error(read_term), _), true), close(S).`,
          `read_codes(ok) :- set_prolog_flag(double_quotes, codes), open(${sourceAtom(quotesPath)}, read, S, []), read(S, [97, 98]), close(S).`,
          '',
        ].join('\n');
        assertEqual(run(source, { goal: 'read_univ(T)' }).stdout, 'read_univ(foo =.. [bar]).\n', 'univ term');
        assertEqual(run(source, { goal: 'read_custom(T)' }).stdout, 'read_custom(alice likes bob).\n', 'custom operator term');
        assertEqual(run(source, { goal: 'read_invalid(ok)' }).stdout, 'read_invalid(ok).\n', 'invalid dotted term');
        assertEqual(run(source, { goal: 'read_codes(ok)' }).stdout, 'read_codes(ok).\n', 'double_quotes read flag');
      },
    },
    {
      name: 'get_char and peek_char report invalid UTF-8 as representation_error(character)',
      run: () => {
        const invalidPath = path.join(tmp, `invalid-utf8-${++tmpCounter}.bin`);
        fs.writeFileSync(invalidPath, Buffer.from([0xff]));
        const quotedPath = sourceAtom(invalidPath);
        for (const predicate of ['peek_char', 'get_char']) {
          let caught = null;
          try {
            run('', { goal: `open(${quotedPath}, read, S, []), ${predicate}(S, C)` });
          } catch (error) {
            caught = error;
          }
          assertEqual(caught?.formal, 'representation_error(character)', `${predicate}/2 invalid UTF-8`);
        }
      },
    },
    {
      name: 'read and read_term report invalid UTF-8 as representation_error(character) (issue #64, STC #76)',
      run: () => {
        const invalidPath = path.join(tmp, `read-invalid-utf8-${++tmpCounter}.bin`);
        fs.writeFileSync(invalidPath, Buffer.from([0xff]));
        const quotedPath = sourceAtom(invalidPath);
        for (const goal of [
          `open(${quotedPath}, read, S, []), read(S, C)`,
          `open(${quotedPath}, read, S, []), read_term(S, C, [])`,
          `open(${quotedPath}, read, S, []), set_input(S), read(C)`,
          `open(${quotedPath}, read, S, []), set_input(S), read_term(C, [])`,
        ]) {
          let caught = null;
          try {
            run('', { goal });
          } catch (error) {
            caught = error;
          }
          assertEqual(caught?.formal, 'representation_error(character)', `${goal} invalid UTF-8`);
        }
      },
    },
    {
      name: 'writeq gives unnamed variables underscore-prefixed names (issue #53)',
      run: () => {
        const result = runCli([], {
          input: "writeq(E).\nwriteq(pair(X,X,Y)).\nwrite_term(pair(X,Y), [variable_names(['Left'=X])]).\nhalt.\n",
        });
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stdout, '  _A true.\n', 'single unnamed variable');
        assertIncludes(result.stdout, '  pair(_A,_A,_B) true.\n', 'stable repeated variable names');
        assertIncludes(result.stdout, '  pair(Left,_A) true.\n', 'explicit variable name plus generated fallback');
        const fresh = run('emit :- writeq(E), nl.\n', { goal: 'emit' });
        assertEqual(fresh.stdout, '_A\nemit.\n', 'fresh clause variable hides its internal suffix');
      },
    },
    {
      name: 'write predicates keep generated variable names stable across calls (issue #53 comment 5356861151)',
      run: () => {
        const result = run([
          "emit :- write_term(pair(A,B), []), write(' / '), write_term(user_output,B,[]), write(' / '), writeq(A), write(' / '), write_canonical(B), nl.",
          "again :- write_canonical(B+B), nl.",
        ].join('\n'), { goals: ['emit', 'again'] });
        assertEqual(
          result.stdout,
          'pair(_A,_B) / _B / _A / _B\nemit.\n+(_A,_A)\nagain.\n',
          'stable names across calls and reset at the next top-level query',
        );
      },
    },
    {
      name: 'writeq separates operators only where lexical ambiguity requires it (issue #63)',
      run: () => {
        const source = "emit :- writeq(1+2), put_char('|'), writeq(a+ -b), put_char('|'), writeq(a+b*c), nl.\n";
        assertEqual(run(source, { goal: 'emit' }).stdout, '1+2|a+ -b|a+b*c\nemit.\n', 'minimal operator spacing');
      },
    },
    {
      name: 'write predicates and write_term options select distinct formats',
      run: () => {
        const source = [
          'emit :-',
          "  write('hello world'), put_char('|'),",
          "  writeq('hello world'), put_char('|'),",
          "  write(a+b*c), put_char('|'),",
          "  write_canonical(a+b*c), put_char('|'),",
          "  write_term('hello world', [quoted(false)]), put_char('|'),",
          "  write_term('hello world', [quoted(true)]), put_char('|'),",
          "  write_term(a+b, [ignore_ops(true)]), put_char('|'),",
          "  write_term(a+b, [ignore_ops(false)]), put_char('|'),",
          "  write_term('$VAR'(0), [numbervars(true)]), put_char('|'),",
          "  write_term('$VAR'(0), [numbervars(false)]), put_char('|'),",
          "  write_term(pair(X, Y), [variable_names(['Left'=X, 'Right'=Y])]), put_char('|'),",
          `  write_term("ab", [double_quotes(true)]), put_char('|'),`,
          '  write_term("ab", [double_quotes(false)]).',
          '',
        ].join('\n');
        assertEqual(
          run(source, { goal: 'emit' }).stdout,
          "hello world|'hello world'|a+b*c|+(a,*(b,c))|hello world|'hello world'|+(a,b)|a+b|A|$VAR(0)|pair(Left,Right)|\"ab\"|[a,b]emit.\n",
          'stdout',
        );
      },
    },
    {
      name: 'REPL renders character lists with double quotes',
      run: () => {
        const result = runCli([], { input: 'L="UN-READABLE, ...".\nhalt.\n' });
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stdout, 'L = "UN-READABLE, ...".', 'top-level character-list rendering');
      },
    },
    {
      name: 'CLI false/0 fails as an ordinary goal',
      run: () => {
        const input = '%% goal: answer(X)\nanswer(ok) :- false.\n';
        const result = runCli(['-'], { input });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, '', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'CLI rejects clauses headed by false/0',
      run: () => {
        const input = 'false :- true.\n';
        const result = runCli(['-'], { input });
        assertEqual(result.status, 1, 'exit status');
        assertEqual(result.stdout, '', 'stdout');
        assertIncludes(result.stderr, 'error(permission_error(modify, static_procedure), /(false, 0))', 'stderr');
      },
    },
  ];
}


function documentationSyncCases() {
  return [
    {
      name: 'WG17 syntax status matches its executable-coverage manifest',
      run: () => {
        const filename = path.join(testRoot, 'conformance', 'WG17-SYNTAX-STATUS.md');
        assertEqual(fs.readFileSync(filename, 'utf8'), renderWg17SyntaxStatus(), 'WG17 syntax status');
      },
    },
    {
      name: 'WG17 upgrader accepts omitted HTML table end tags',
      run: () => {
        // HTML permits </td> and </tr> to be omitted. TU Wien uses this
        // compact form, so the upgrader must not depend on explicit closes.
        const rows = Array.from({ length: 120 }, (_, index) =>
          `<tr><td>${index + 1}<td><code>write(${index + 1}).</code><td>ok`).join('\n');
        const html = `<table><tr><th>#<th>Query<th>Codex${rows}</table>`;
        const parsed = parseWg17SyntaxTable(html);
        assertEqual(parsed.length, 120, 'parsed row count');
        assertEqual(parsed[0].id, 1, 'first id');
        assertEqual(parsed[0].query, 'write(1).', 'first query');
        assertEqual(parsed.at(-1).id, 120, 'last id');
      },
    },
    {
      name: 'WG17 upgrader normalizes presentation non-breaking spaces',
      run: () => {
        const rows = Array.from({ length: 120 }, (_, index) =>
          `<tr><td>${index + 1}<td>set_prolog_flag(&nbsp;double_quotes,chars).<td>succeeds`).join('\n');
        const html = `<table><tr><th>#<th>Query<th>Codex${rows}</table>`;
        const parsed = parseWg17SyntaxTable(html);
        assertEqual(parsed[0].query, 'set_prolog_flag( double_quotes,chars).', 'normalized query');
      },
    },
    {
      name: 'WG17 upgrader removes presentation footnote markers from Codex text',
      run: () => {
        const rows = Array.from({ length: 120 }, (_, index) =>
          `<tr><td>${index + 1}<td>writeq(-(1^2)).<td>- (1^2)&sup3;`).join('\n');
        const html = `<table><tr><th>#<th>Query<th>Codex${rows}</table>`;
        const parsed = parseWg17SyntaxTable(html);
        assertEqual(parsed[0].expected, '- (1^2)', 'normalized Codex expectation');
      },
    },
    {
      name: 'WG17 upstream expectations independently validate reviewed outcomes',
      run: () => {
        assertEqual(matchesUpstreamExpectation('succeeds', { type: 'success', stages: [] }), true, 'succeeds');
        assertEqual(matchesUpstreamExpectation('fails', { type: 'failure' }), true, 'fails');
        assertEqual(matchesUpstreamExpectation('waits', { type: 'waits' }), true, 'waits');
        assertEqual(
          matchesUpstreamExpectation('syntax err.', { type: 'error', formal: 'syntax_error(read_term)' }),
          true,
          'syntax error',
        );
        assertEqual(
          matchesUpstreamExpectation("'a b'", { type: 'success', stages: [{ output: "'a b'", variables: '[]' }] }),
          true,
          'observable output',
        );
        const negativePower = { id: 183, input: 'writeq(-(1^2)).' };
        assertEqual(
          matchesUpstreamExpectation('- (1^2)', { type: 'success', stages: [{ output: '-(1^2)', variables: '[]' }] }, negativePower),
          false,
          'mandatory operator/parenthesis layout is not erased',
        );
        assertEqual(
          matchesUpstreamExpectation('- (a^2)', { type: 'success', stages: [{ output: '-a^2', variables: '[]' }] }, negativePower),
          false,
          'mandatory negative-power parentheses are not erased',
        );
        assertEqual(
          matchesUpstreamExpectation('- (1^2)', { type: 'success', stages: [{ output: '- (1 ^ 2)', variables: '[]' }] }, negativePower),
          true,
          'non-semantic internal operator spacing remains flexible',
        );
        const repeated = {
          id: 227, input: 'write_canonical(B+B).',
          outcome: { type: 'success', stages: [{ output: '+(_A,_A)', variables: "['B' = B]" }] },
        };
        assertEqual(
          matchesUpstreamExpectation('e.g. +(_1,_1)', repeated.outcome, repeated),
          true,
          'anonymous spelling accepted',
        );
        assertEqual(
          matchesUpstreamExpectation(
            'e.g. +(_1,_1)',
            { type: 'success', stages: [{ output: '+(B,B)', variables: "['B' = B]" }] },
            repeated,
          ),
          false,
          'named-variable spelling rejected',
        );
      },
    },
    {
      name: 'normal syntax extensions preserve successful WG17 Part 1 outcomes',
      run: () => {
        const fixture = readWg17SyntaxFixture();
        let checked = 0;
        for (const item of fixture.cases) {
          const strict = executeWg17Item(item);
          if (strict.type !== 'success') continue;
          const normal = executeWg17Item(item, { isoStrict: false });
          assertEqual(JSON.stringify(normal), JSON.stringify(strict), `WG17 #${item.id} cross-profile outcome`);
          checked++;
        }
        if (checked === 0) throw new Error('WG17 fixture has no successful Part 1 syntax cases');
      },
    },
    {
      name: 'WG17 stream-sensitive cases #270 and #271 follow the upstream input protocol',
      run: () => {
        const fixture = readWg17SyntaxFixture();
        const byId = new Map(fixture.cases.map((item) => [item.id, item]));
        for (const [id, expected] of [[270, "C = ' '"], [271, "C = '%'"]]) {
          const item = byId.get(id);
          if (item == null) throw new Error(`missing WG17 #${id}`);
          assertEqual(item.expected, expected, `WG17 #${id} upstream expectation`);
          const actual = executeWg17Item(item);
          assertEqual(matchesUpstreamExpectation(item.expected, actual, item), true, `WG17 #${id} result`);
          assertEqual(JSON.stringify(actual), JSON.stringify(item.outcome), `WG17 #${id} reviewed outcome`);
        }
      },
    },
    {
      name: 'book builtins match runtime registry',
      run: () => assertArrayEqual(bookBuiltinNames(), registeredBuiltinNames(), 'builtins'),
    },
    {
      name: 'book builtin catalog matches runtime registry',
      run: () => {
        assertArrayEqual(bookBuiltinNames(), registeredBuiltinNames(), 'builtins');
        const summary = bookBuiltinSummary();
        const actual = registeredBuiltinSummary();
        assertEqual(summary.entries, actual.entries, 'builtin entry count');
        assertEqual(summary.names, actual.names, 'builtin predicate name count');
      },
    },
    {
      name: 'book EyeProlog library matches runtime registry',
      run: () => assertArrayEqual(bookEyePrologLibraryNames(), registeredEyePrologLibraryNames(), 'EyeProlog library predicates'),
    },
    {
      name: 'README cover links to the book and the book documents runtime boundaries',
      run: () => {
        const readme = fs.readFileSync(path.join(packageRoot, 'README.md'), 'utf8');
        const book = fs.readFileSync(path.join(packageRoot, 'the-art-of-eyeprolog.md'), 'utf8');
        assertIncludes(
          readme,
          '<a href="https://eyereasoner.github.io/eyeprolog/the-art-of-eyeprolog">\n    <img src="book-assets/title-page.svg" alt="Read The Art of EyeProlog"',
          'README cover links to the book',
        );
        for (const filename of ['src/iso.js', 'src/dcg.js', 'src/atts.js', 'src/standard-library.js',
          'src/lib/aggregate.pl', 'src/lib/atts.pl', 'src/lib/comparison.pl', 'src/lib/dates.pl',
          'src/lib/iso_ext.pl', 'src/lib/lists.pl', 'src/lib/primes.pl', 'src/lib/prologue.pl',
          'src/lib/random.pl', 'src/lib/strings.pl', 'src/lib/uuid.pl',
          'src/playground-worker.js']) {
          assertEqual(fs.existsSync(path.join(packageRoot, filename)), true, `${filename} exists`);
          assertIncludes(book, filename, `book documents ${filename}`);
        }
        assertEqual(fs.existsSync(path.join(packageRoot, 'src', 'portable-library.js')), false, 'obsolete duplicate library module is absent');
        assertEqual('portableLibrarySource' in publicApi, false, 'obsolete portable source API is absent');
        assertEqual(readme.includes('portable-library.js') || readme.includes('portableLibrarySource'), false, 'README has no obsolete portable layer');
        assertEqual(book.includes('portable-library.js') || book.includes('portableLibrarySource'), false, 'book has no obsolete portable layer');
        assertEqual(fs.existsSync(path.join(packageRoot, 'src', 'builtins')), false, 'obsolete builtins directory is absent');
      },
    },
    {
      name: 'book example catalog names resolve in examples directory',
      run: () => assertArrayEqual(bookExampleCatalogIssues(), [], 'guide example catalog'),
    },
    {
      name: 'documented runnable example count and goldens match corpus',
      run: () => assertArrayEqual(exampleCorpusSyncIssues(), [], 'example corpus sync'),
    },
    {
      name: 'documented proof example count and runner match proof goldens',
      run: () => assertArrayEqual(proofCorpusSyncIssues(), [], 'proof corpus sync'),
    },
    {
      name: 'playground example catalog and relative loaders match examples directory',
      run: () => assertArrayEqual(playgroundExampleIssues(), [], 'playground examples'),
    },
    {
      name: 'playground static page is browser-ready and packaged',
      run: () => assertArrayEqual(playgroundStaticIssues(), [], 'playground static page'),
    },
    {
      name: 'documentation local links and anchors resolve',
      run: () => assertArrayEqual(findBrokenDocLinks(), [], 'broken documentation links'),
    },
    {
      name: 'book example extraction matches the Markdown source',
      run: () => {
        const result = spawnSync(process.execPath, ['tools/extract-book-examples.mjs', '--check'], {
          cwd: packageRoot,
          encoding: 'utf8',
        });
        assertEqual(result.status, 0, `exit status${result.stderr ? `\nstderr: ${result.stderr}` : ''}`);
        assertIncludes(result.stdout, 'extracted book examples are up to date.', 'stdout');
      },
    },
    {
      name: 'book introductory output matches the checked Socrates example',
      run: () => assertArrayEqual(bookIntroOutputIssues(), [], 'book introductory output'),
    },
    {
      name: 'documentation imports only public JavaScript API names',
      run: () => assertArrayEqual(documentedPublicApiImportIssues(), [], 'documentation API imports'),
    },
    {
      name: 'documentation uses EyeProlog source style',
      run: () => assertArrayEqual(documentationSourceStyleIssues(), [], 'documentation source style'),
    },
    {
      name: 'DCG nonterminal indicator prose uses valid ... //0 spacing',
      run: () => {
        for (const filename of ['README.md', 'the-art-of-eyeprolog.md', 'src/standard-library.js', 'src/solver.js']) {
          const text = fs.readFileSync(path.join(packageRoot, filename), 'utf8');
          assertNotIncludes(text, '...' + '//0', `${filename} invalid compact nonterminal indicator`);
        }
      },
    },
    {
      name: 'ISO 5.4 decision index inventories implementation-defined choices',
      run: () => {
        const filename = path.join(testRoot, 'conformance', 'ISO-IMPLEMENTATION-DEFINED.md');
        const text = fs.readFileSync(filename, 'utf8');
        for (const clause of [
          '5.5.11', '6.5', '6.6', '7.1.2.2', '7.1.4.1', '7.4.2.4', '7.4.2.5',
          '7.4.2.6', '7.4.2.7', '7.4.2.8', '7.4.2.9', '7.5.1', '7.7.1', '7.7.3',
          '7.10.1', '7.10.2.6', '7.10.2.7', '7.10.2.8', '7.10.2.9', '7.10.2.11',
          '7.10.2.13', '7.11.1.1', '7.11.1.2', '7.11.1.3', '7.11.1.4', '7.11.2.1',
          '7.11.2.2', '7.11.2.3', '7.11.2.5', '7.12.1', '7.12.2(f)', '8.17.1',
          '8.17.3', '8.17.4', '9.1.3.1', '9.1.4.1', '9.1.4.2', '9.1.4.3', '9.4',
          '9.4.1', '9.4.2', '9.4.3', '9.4.4', '9.4.5', 'Cor.2 9.4.6',
        ]) assertIncludes(text, `| ${clause} |`, `ISO 5.4 clause ${clause}`);
        assertIncludes(text, 'Floating underflow policy', 'floating underflow policy explanation');
        assertIncludes(text, 'Implementation-specific features required to be documented by 5.4', '5.5 extension inventory');
      },
    },
    {
      name: 'ISO term and arithmetic row matrices are closed and linked',
      run: () => {
        const compliance = fs.readFileSync(path.join(testRoot, 'conformance', 'ISO-COMPLIANCE.md'), 'utf8');
        const terms = fs.readFileSync(path.join(testRoot, 'conformance', 'ISO-TERM-SEMANTICS-MATRIX.md'), 'utf8');
        const arithmetic = fs.readFileSync(path.join(testRoot, 'conformance', 'ISO-EVALUABLE-FUNCTOR-MATRIX.md'), 'utf8');
        assertIncludes(compliance, '| 7.1-7.3 — term types, term order, unification | covered |', '7.1-7.3 covered');
        assertIncludes(compliance, '| 7.9 — expression evaluation | covered |', '7.9 covered');
        assertIncludes(compliance, '| Clause 9 — evaluable functors | covered |', 'Clause 9 covered');
        assertIncludes(terms, '## 7.3 - unification', 'term unification row matrix');
        assertIncludes(arithmetic, '## 9.4 - bitwise functors', 'Clause 9.4 row matrix');
        assertIncludes(arithmetic, '`float_integer_part/1`, `float_fractional_part/1`', 'float-only conversion row');
      },
    },
    {
      name: 'ISO 7.4-7.8 execution matrix is closed',
      run: () => {
        const compliance = fs.readFileSync(path.join(testRoot, 'conformance', 'ISO-COMPLIANCE.md'), 'utf8');
        const matrix = fs.readFileSync(path.join(testRoot, 'conformance', 'ISO-PROLOG-TEXT-EXECUTION-MATRIX.md'), 'utf8');
        for (const row of [
          '| 7.4 — Prolog text and directives | covered |',
          '| 7.5-7.6 — database and term/clause conversion | covered |',
          '| 7.7 — execution and backtracking | covered |',
          '| 7.8 — control constructs and exceptions | covered |',
        ]) assertIncludes(compliance, row, row);
        for (const section of ['## 7.4 - Prolog text and preparation', '## 7.5 - database model', '## 7.6 - conversion between terms and clauses/goals', '## 7.7 - execution and backtracking', '## 7.8 - control constructs and exceptions']) {
          assertIncludes(matrix, section, section);
        }
      },
    },
    {
      name: 'ISO Clause 6, 7.10, and 7.12 closure is documented',
      run: () => {
        const compliance = fs.readFileSync(path.join(testRoot, 'conformance', 'ISO-COMPLIANCE.md'), 'utf8');
        const processor = fs.readFileSync(path.join(testRoot, 'conformance', 'ISO-PROCESSOR-REQUIREMENTS.md'), 'utf8');
        for (const row of [
          '| Clause 6 — tokens, terms, lists, operators, quoted text | covered |',
          '| 7.10 — input/output concepts | covered |',
          '| 7.12 — errors | covered |',
        ]) assertIncludes(compliance, row, row);
        assertIncludes(processor, '## Clause 6 syntax-preservation closure', 'Clause 6 closure map');
        assertIncludes(processor, '| 5.5.1 syntax extensions preserve standard token/text meaning | covered |', '5.5.1 covered');
      },
    },
    {
      name: 'ISO release-facing exit criteria are explicitly closed',
      run: () => {
        const exit = fs.readFileSync(path.join(testRoot, 'conformance', 'ISO-COMPLIANCE.md'), 'utf8');
        for (const item of [
          '| Clause 5 processor obligations have explicit dispositions | covered |',
          '| Clause 6 lexical/syntactic requirements have explicit dispositions | covered |',
          '| Clause 7 semantic requirements have explicit dispositions | covered |',
          '| Clause 8 built-in modes/errors have explicit dispositions | covered |',
          '| Clause 9 evaluable-functor requirements have explicit dispositions | covered |',
          '| Independent external syntax corpus is an offline release gate | covered |',
          '| No unexplained deviation remains in the release-facing ledger | covered |',
        ]) assertIncludes(exit, item, item);
        assertNotIncludes(exit, '| audit |', 'no release-facing audit rows remain');
      },
    },
    {
      name: 'public ISO documentation keeps README concise and the book authoritative',
      run: () => {
        const readme = fs.readFileSync(path.join(packageRoot, 'README.md'), 'utf8');
        const book = fs.readFileSync(path.join(packageRoot, 'the-art-of-eyeprolog.md'), 'utf8');
        const profile = fs.readFileSync(path.join(packageRoot, 'why-eyeprolog.md'), 'utf8');
        for (const name of [
          'ISO-TERM-SEMANTICS-MATRIX.md',
          'ISO-PROLOG-TEXT-EXECUTION-MATRIX.md',
          'ISO-EVALUABLE-FUNCTOR-MATRIX.md',
        ]) assertIncludes(book, name, `book ${name}`);
        assertIncludes(readme, 'implementation reference is [*The Art of EyeProlog*]', 'README book hand-off');
        assertIncludes(readme, 'test/conformance/ISO-COMPLIANCE.md', 'README concise audit link');
        assertEqual(readme.includes('2026-08-23 draft items #73-#76'), false, 'README omits audit-history detail');
        assertIncludes(profile, 'Part 1 processor, syntax, semantic, built-in, and arithmetic', 'Why EyeProlog audit state');
      },
    },
    {
      name: 'documentation avoids repository issue references',
      run: () => {
        for (const file of listMarkdownFiles(packageRoot)) {
          const text = fs.readFileSync(file, 'utf8');
          assertEqual(/github\.com\/eyereasoner\/eyeprolog\/issues\//.test(text), false, `${path.relative(packageRoot, file)} repository issue URL`);
          assertEqual(/\bissue\s+#\d+\b/i.test(text), false, `${path.relative(packageRoot, file)} repository issue number`);
        }
      },
    },
    {
      name: 'book is the single implementation reference',
      run: () => assertArrayEqual(bookReferenceDocumentationIssues(), [], 'book reference documentation'),
    },
    {
      name: 'documented npm scripts exist in package.json',
      run: () => assertArrayEqual(missingDocumentedPackageScripts(), [], 'missing documented npm scripts'),
    },
    {
      name: 'CI verifies the supported Node floor and gates npm publishing',
      run: () => {
        const testWorkflow = fs.readFileSync(path.join(packageRoot, '.github', 'workflows', 'test.yml'), 'utf8');
        assertIncludes(testWorkflow, "node-version: ['18', '24']", 'test workflow Node matrix');
        assertIncludes(testWorkflow, 'run: npm test', 'test workflow suite');
        assertIncludes(testWorkflow, 'run: npm pack --dry-run', 'test workflow package check');

        const publishWorkflow = fs.readFileSync(path.join(packageRoot, '.github', 'workflows', 'publish-npm.yml'), 'utf8');
        const testIndex = publishWorkflow.indexOf('run: npm test');
        const packIndex = publishWorkflow.indexOf('run: npm pack --dry-run');
        const publishIndex = publishWorkflow.indexOf('run: npm publish');
        assertEqual(testIndex >= 0 && testIndex < publishIndex, true, 'publish workflow test gate');
        assertEqual(packIndex >= 0 && packIndex < publishIndex, true, 'publish workflow package gate');
        assertEqual(pkg.scripts?.['test:openrulebench'], 'node test/run-openrulebench.mjs', 'OpenRuleBench test script');
      },
    },
    {
      name: 'documented conformance totals match the generated report',
      run: () => assertArrayEqual(documentedConformanceMetricIssues(), [], 'documented conformance totals'),
    },
    {
      name: 'conformance report summarizes public corpus',
      run: () => {
        const report = buildConformanceReport();
        assertArrayEqual(report.issues, [], 'conformance report issues');
        assertEqual(report.total.total >= 475, true, 'conformance case count');
        assertEqual(report.total.positive + report.total.errors + report.total.warnings + report.total.proofs, report.total.total, 'conformance total');
        assertEqual(report.rows.some((row) => row.category === 'legacy-numbered'), false, 'legacy-numbered category');
        const text = formatConformanceReport(report);
        assertIncludes(text, '| variables |', 'report');
        assertIncludes(text, '| Proofs |', 'report');
        assertIncludes(text, '| **Total** |', 'report');
      },
    },

    {
      name: 'committed conformance report is current',
      run: () => {
        const reportFile = path.join(packageRoot, 'conformance-report.md');
        assertEqual(fs.existsSync(reportFile), true, 'conformance-report.md exists');
        assertEqual(fs.readFileSync(reportFile, 'utf8'), formatConformanceReport(buildConformanceReport()), 'conformance-report.md');
      },
    },
    {
      name: 'source-checkout setup docs match package bin',
      run: () => {
        assertEqual(pkg.bin?.eyeprolog, './bin/eyeprolog.js', 'package eyeprolog bin');
        const binPath = path.join(packageRoot, pkg.bin.eyeprolog);
        const binText = fs.readFileSync(binPath, 'utf8');
        assertEqual(binText.startsWith('#!/usr/bin/env node\n'), true, 'bin shebang');
        assertArrayEqual(misleadingDependencyInstallDocs(), [], 'misleading dependency install docs');
      },
    },
    {
      name: 'installation docs avoid unsupported Node and global npm permission traps',
      run: () => {
        assertEqual(pkg.engines?.node, '>=18', 'supported Node range');
        for (const filename of ['README.md', 'the-art-of-eyeprolog.md']) {
          const text = fs.readFileSync(path.join(packageRoot, filename), 'utf8');
          assertIncludes(text, 'node --version', `${filename} checks Node version`);
          assertIncludes(text, 'npx --yes eyeprolog', `${filename} offers a non-global launch`);
          assertIncludes(text, 'npm install --global --prefix "$HOME/.local" eyeprolog', `${filename} uses a user prefix`);
          assertIncludes(text, 'https://nodejs.org/en/download', `${filename} links Node upgrades`);
          assertIncludes(text, 'https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally/', `${filename} links npm EACCES guidance`);
          assertEqual(text.includes('sudo npm install'), true, `${filename} explicitly warns against sudo npm`);
          assertEqual(/^\s*sudo npm install/m.test(text), false, `${filename} never recommends sudo npm`);
        }
      },
    },
  ];
}

function apiCases() {
  return [
    {
      name: 'public type declarations match runtime exports',
      run: () => assertArrayEqual(declaredValueExportNames(), runtimeExportNames(), 'public value exports'),
    },
    {
      name: 'default export type declarations match runtime exports',
      run: () => assertArrayEqual(declaredDefaultExportNames(), runtimeDefaultExportNames(), 'default export values'),
    },
    {
      name: 'run queries through public API without proof by default',
      run: () => {
        const result = run('%% goal: q(X, Y)\np(a, b).\nq(X, Y) :- p(X, Y).\n');
        assertEqual(result.stdout, 'q(a, b).\n', 'stdout');
      },
    },
    {
      name: 'ISO standard streams use API input and ordered output',
      run: () => {
        const writes = [];
        const result = run(
          'answer(T) :- read(T), write(read_back(T)), nl.\n',
          { goal: 'answer(T)', ioOptions: { input: 'sample(42).', write: (text) => writes.push(text) } },
        );
        assertEqual(result.stdout, 'read_back(sample(42))\nanswer(sample(42)).\n', 'stdout');
        assertEqual(writes.join(''), 'read_back(sample(42))\n', 'write callback');
      },
    },
    {
      name: 'ISO directives initialize state before queries',
      run: () => {
        const result = run([
          ':- dynamic(saved/1).',
          ':- initialization(assertz(saved(ready))).',
          ':- op(500, xfy, joins).',
          '%% goal: answer(X)',
          'answer(X) :- saved(ready), X = (a joins b joins c).',
        ].join('\n'));
        assertEqual(result.stdout, 'answer(a joins b joins c).\n', 'stdout');
      },
    },
    {
      name: 'empty dynamic predicates fail as defined procedures',
      run: () => {
        const result = run([
          ':- dynamic(cache/1).',
          '%% goal: answer(X)',
          'answer(X) :- cache(X), !.',
          'answer(computed) :- assertz(cache(computed)).',
        ].join('\n'));
        assertEqual(result.stdout, 'answer(computed).\n', 'stdout');
      },
    },
    {
      name: 'scalar fact acceleration preserves Prolog term types',
      run: () => {
        const result = run([
          '%% goal: number_fact(X)',
          '%% goal: atom_fact(X)',
          '%% goal: string_fact(X)',
          '%% goal: repeated(X)',
          'number_fact(X) :- scalar(7, X).',
          "atom_fact(X) :- scalar('7', X).",
          'string_fact(X) :- scalar("7", X).',
          'repeated(X) :- pair(X, X).',
          'scalar(7, number).',
          "scalar('7', atom).",
          'scalar("7", string).',
          "pair(7, '7').",
        ].join('\n'));
        assertEqual(result.stdout, [
          'number_fact(number).',
          'atom_fact(atom).',
          'string_fact(string).',
          '',
        ].join('\n'), 'stdout');
      },
    },
    {
      name: 'dynamic updates invalidate tabled answers',
      run: () => {
        const result = run([
          ':- dynamic(edge/2).',
          'path(X, Y) :- edge(X, Y).',
          'path(X, Y) :- edge(X, Z), path(Z, Y).',
          '%% goal: test(Before, After)',
          'test(Before, After) :-',
          '  assertz(edge(a, b)),',
          '  findall(X, path(a, X), Before),',
          '  assertz(edge(b, c)),',
          '  findall(Y, path(a, Y), After).',
        ].join('\n'));
        assertEqual(result.stdout, 'test("b", "bc").\n', 'stdout');
      },
    },
    {
      name: 'default EyeProlog registry keeps dynamic program state consistent',
      run: () => {
        const program = Program.parse([
          ':- dynamic(item/1).',
          '%% goal: done',
          'done :- assertz(item(a)), retract(item(a)), assertz(item(b)), abolish(item/1).',
        ].join('\n'));
        const result = run(program, { goal: 'done', registry: getEyePrologRegistry() });
        assertEqual(result.stdout, 'done.\n', 'stdout');
        assertEqual(program.findGroup('item', 1), null, 'abolished group');
        assertEqual(
          program.clauses.some((clause) => clause.head?.name === 'item'),
          false,
          'abolished clauses removed from original program',
        );
      },
    },
    {
      name: 'halt returns processor status through the API',
      run: () => {
        const result = run('stop :- write(stopping), halt(7).\n', { goal: 'stop' });
        assertEqual(result.stdout, 'stopping', 'stdout before halt');
        assertEqual(result.haltCode, 7, 'halt code');
      },
    },
    {
      name: 'query constants restrict answers',
      run: () => {
        const result = run('%% goal: answer(a, X)\nseed(a, one).\nseed(b, two).\nanswer(K, V) :- seed(K, V).\n');
        assertEqual(result.stdout, 'answer(a, one).\n', 'stdout');
      },
    },
    {
      name: 'programs without queries produce no answer output',
      run: () => {
        const result = run('seed(a, one).\nanswer(K, V) :- seed(K, V).\n');
        assertEqual(result.stdout, '', 'stdout');
      },
    },
    {
      name: 'run exposes false/0 as an always-failing built-in',
      run: () => {
        const result = run('answer(ok) :- false.\n', { goal: 'answer(X)' });
        assertEqual(result.stdout, '', 'stdout');
        assertEqual(Boolean(createDefaultRegistry().get('false', 0)), true, 'false/0 is registered');
      },
    },
    {
      name: 'source clauses cannot redefine false/0',
      run: () => {
        for (const source of ['false.\n', 'false :- true.\n', ':- dynamic(false/0).\n']) {
          let error = null;
          try {
            Program.parse(source);
          } catch (caught) {
            error = caught;
          }
          assertEqual(error?.name, 'PrologError', 'error name');
          assertEqual(error?.message, 'error(permission_error(modify, static_procedure), /(false, 0))', 'error');
        }
      },
    },

    {
      name: 'compound factory canonicalizes zero arity to atoms',
      run: () => {
        const nil = compound('nil', []);
        assertEqual(nil.type, 'atom', 'type');
        assertEqual(nil.name, 'nil', 'name');
        assertEqual(nil.arity, 0, 'arity');
        assertEqual(termToString(nil, new Env(), true), 'nil', 'readback');
        assertEqual(unify(nil, atom('nil'), new Env()), true, 'unifies with atom');
      },
    },


    {
      name: 'run query can enable proof explanations',
      run: () => {
        const result = run('%% goal: q(X, Y)\np(a, b).\nq(X, Y) :- p(X, Y).\n', { proof: true });
        assertIncludes(result.stdout, 'q(a, b).\nwhy(', 'stdout');
      },
    },

    {
      name: 'run accepts Program instances',
      run: () => {
        const program = Program.parse('p(a, b).\nq(X, Y) :- p(X, Y).\n');
        const result = run(program, { goal: 'q(X, Y)' });
        assertEqual(result.stdout, 'q(a, b).\n', 'stdout');
      },
    },
    {
      name: 'run keeps recursive queries independent in one solver',
      run: () => {
        const text = fs.readFileSync(path.join(packageRoot, 'examples', 'alignment-demo.pl'), 'utf8');
        const program = Program.parseSources([{ text, filename: 'alignment-demo.pl' }]);
        const result = run(program, { goals: goalsFromSource(text) });
        assertIncludes(result.stdout, 'broaderTransitive(anpr_passenger_car, ref_car).\n', 'stdout');
        assertIncludes(result.stdout, 'narrowerOrEqualOf(anpr_passenger_car, ref_car).\n', 'stdout');
      },
    },
    {
      name: 'makeProgram creates indexed programs',
      run: () => {
        const program = makeProgram('edge(a, b).\npath(X, Y) :- edge(X, Y).\n');
        const group = program.findGroup('path', 2);
        assertEqual(Boolean(group), true, 'path/2 group exists');
        assertEqual(group.groupName ?? group.name, 'path', 'group name');
        assertEqual(group.arity, 2, 'group arity');
      },
    },
    {
      name: 'program keeps negation diagnostics lazy by default',
      run: () => {
        const program = Program.parse('p(a).\nq(X) :- \\+ p(X).\n');
        assertEqual(program._negationAnalysis, null, 'analysis starts lazy');
        assertEqual(program.negationDependencies.length, 1, 'dependency count');
        assertEqual(program._negationAnalysis !== null, true, 'analysis computed on demand');
      },
    },
    {
      name: 'analyzeNegation option computes diagnostics eagerly',
      run: () => {
        const program = Program.parse('p(a).\nq(X) :- \\+ p(X).\n', { analyzeNegation: true });
        assertEqual(program._negationAnalysis !== null, true, 'analysis computed eagerly');
        assertEqual(program.stratifiedNegation, true, 'stratified negation');
      },
    },
    {
      name: 'program reports stratified negation metadata',
      run: () => {
        const program = Program.parse(`
%% goal: open(X0)
candidate(a).
blocked(b).
closed(X) :- blocked(X).
open(X) :- candidate(X), \\+ closed(X).
`);
        assertEqual(program.isStratifiedNegation(), true, 'stratified negation');
        assertEqual(program.negationStratificationErrors.length, 0, 'stratification errors');
        assertEqual(program.findGroup('closed', 1).negationStratum, 0, 'closed stratum');
        assertEqual(program.findGroup('open', 1).negationStratum, 1, 'open stratum');
      },
    },
    {
      name: 'program detects unstratified negation cycles',
      run: () => {
        const program = Program.parse('p(X) :- q(X).\nq(X) :- \\+ p(X).\n');
        assertEqual(program.isStratifiedNegation(), false, 'unstratified negation');
        assertEqual(program.negationStratificationErrors.length, 1, 'stratification error count');
        assertEqual(program.negationStratificationErrors[0].from, 'q/1', 'error source');
        assertEqual(program.negationStratificationErrors[0].to, 'p/1', 'error target');
        let threw = false;
        try { program.assertStratifiedNegation(); } catch (err) {
          threw = true;
          assertIncludes(err.message, 'unstratified negation', 'error message');
        }
        assertEqual(threw, true, 'assertion throws');
      },
    },
    {
      name: 'strictNegation option rejects unstratified programs',
      run: () => {
        let threw = false;
        try { Program.parse('p(X) :- \\+ p(X).\n', { strictNegation: true }); } catch (err) {
          threw = true;
          assertIncludes(err.message, 'p/1 depends negatively on p/1', 'error message');
        }
        assertEqual(threw, true, 'strict negation throws');
      },
    },
    {
      name: 'run executes an explicitly imported list module',
      run: () => {
        const result = run(':- use_module(library(lists), [append/3]).\nanswer(X) :- append([a], [b], X).', { goal: 'answer(X)' });
        assertEqual(result.stdout, 'answer("ab").\n', 'stdout');
      },
    },
    {
      name: 'Solver executes an explicitly imported list module',
      run: () => {
        const program = Program.parse(':- use_module(library(lists)).\nanswer(X) :- append([a], [b], X).');
        const solver = new Solver(program);
        const goal = parseGoalText('answer(X)');
        const answers = [...solver.solve([goal], new Env(), 0)].map((env) => termToString(goal, env, true));
        assertEqual(answers.join('\n'), 'answer("ab")', 'answers');
      },
    },
    {
      name: 'library(lists) exposes the Trealla/Scryer common surface',
      run: () => {
        const program = Program.parse(`:- use_module(library(lists)).
identity(X, X).
pair(A, B, A-B).
step(X, A0, A) :- A is A0 + X.
check(A, B, C, D, E, F) :-
  append([[a],[b]], A),
  memberchk(a, A),
  same_length(A, [_,_]),
  nth0(1, A, b, B),
  maplist(identity, A, C),
  maplist(pair, A, [1,2], D),
  foldl(step, [1,2,3], 0, E),
  nth1(2, A, b, F).
`);
        assertEqual(program.findGroup('append', 2)?.module, 'lists', 'append/2 import');
        assertEqual(program.findGroup('memberchk', 2)?.module, 'lists', 'memberchk/2 import');
        assertEqual(program.findGroup('same_length', 2)?.module, 'lists', 'same_length/2 import');
        assertEqual(program.findGroup('nth0', 4)?.module, 'lists', 'nth0/4 import');
        assertEqual(program.findGroup('maplist', 2)?.module, 'lists', 'maplist/2 import');
        assertEqual(program.findGroup('maplist', 3)?.module, 'lists', 'maplist/3 import');
        assertEqual(program.findGroup('foldl', 4)?.module, 'lists', 'foldl/4 import');
        const result = run(program, { goal: 'check(A,B,C,D,E,F)' });
        assertIncludes(result.stdout, 'check("ab", "a", "ab", [a - 1, b - 2], 6, "a").\n', 'stdout');
      },
    },
    {
      name: 'library(lambda) supports Scryer-style maplist lambdas',
      run: () => {
        const source = String.raw`:- use_module(library(lambda)).
:- use_module(library(lists)).
answer :- maplist(\X^(X>3), [4,5,9]).
`;
        const result = run(source, { goal: 'answer' });
        assertEqual(result.stdout, 'answer.\n', 'stdout');
      },
    },
    {
      name: 'library(lambda) refreshes local variables on each invocation',
      run: () => {
        const source = String.raw`:- use_module(library(lambda)).
:- use_module(library(lists)).
answer :- maplist(\X^(Y=X), [a,b]).
`;
        const result = run(source, { goal: 'answer' });
        assertEqual(result.stdout, 'answer.\n', 'fresh local variables');
      },
    },
    {
      name: 'library(lambda) preserves explicitly free variables with +\\',
      run: () => {
        const source = String.raw`:- use_module(library(lambda)).
:- use_module(library(lists)).
answer(Y) :- maplist(Y+\X^(Y=X), [a,a]).
`;
        const program = Program.parse(source);
        const imported = [...program.operators.values()].find((operator) => operator.name === '+\\');
        assertEqual(`${imported?.priority}/${imported?.specifier}`, '201/xfx', '+\\ operator import');
        const result = run(program, { goal: 'answer(Y)' });
        assertEqual(result.stdout, 'answer(a).\n', 'free variable sharing');
      },
    },
    {
      name: 'library(lambda) supports continuations and seven call arguments',
      run: () => {
        const source = String.raw`:- use_module(library(lambda)).
f(x,y).
tuple(a,b,c,d,e,f,g).
answer(A,B) :-
  call(\X^f(X), A, B),
  call(\X^Y^f(X,Y), A, B),
  call(\P^Q^R^S^T^U^V^tuple(P,Q,R,S,T,U,V), a,b,c,d,e,f,g).
`;
        const result = run(source, { goal: 'answer(A,B)' });
        assertEqual(result.stdout, 'answer(x, y).\n', 'continuations');
      },
    },
    {
      name: 'library(lambda) diagnoses a missing lambda parameter',
      run: () => {
        const source = String.raw`:- use_module(library(lambda)).
answer(ok) :-
  catch(call(\X^true), error(existence_error(lambda_parameter,_),_), true).
`;
        const result = run(source, { goal: 'answer(X)' });
        assertEqual(result.stdout, 'answer(ok).\n', 'lambda parameter error');
      },
    },
    {
      name: 'autoload metadata records canonical interop imports',
      run: () => {
        const program = Program.parse('answer(X) :- member(X, [a]), between(1, 1, _).\n');
        assertEqual(program.autoloadedPredicates.length, 2, 'autoloaded predicate count');
        assertEqual(program.autoloadedPredicates.map((entry) => `${entry.indicator}:${entry.library}`).sort().join(','),
          'between/3:prologue,member/2:lists', 'autoload mapping');
        assertEqual(program.interopPortabilityWarnings.length, 0, 'autoloaded portable calls are warning-free');
      },
    },
    {
      name: 'JavaScript run top-level goals participate in interop autoloading',
      run: () => {
        const result = runEyeProlog('', { goal: 'member(X,[a,b])' });
        assertEqual(result.stdout, 'member(a, "ab").\nmember(b, "ab").\n', 'stdout');
      },
    },
    {
      name: 'JavaScript run autoloads top-level goals for parsed Program instances',
      run: () => {
        const program = Program.parse('');
        const revision = program.revision;
        program.stratifiedNegation;
        const result = runEyeProlog(program, { goal: 'member(X,[a,b])' });
        assertEqual(result.stdout, 'member(a, "ab").\nmember(b, "ab").\n', 'stdout');
        assertEqual(program.findGroup('member', 2)?.module, 'lists', 'autoloaded Program predicate');
        assertEqual(program.autoloadedPredicates.map((entry) => `${entry.indicator}:${entry.library}`).join(','),
          'member/2:lists', 'autoload metadata');
        assertEqual(program.revision, revision + 1, 'Program revision after autoload');
        assertEqual(program.stratifiedNegation, true, 'negation metadata recomputed after autoload');
      },
    },
    {
      name: 'JavaScript run can disable top-level goal autoloading',
      run: () => {
        let error = null;
        try {
          runEyeProlog('', { goal: 'member(X,[a])', autoload: false });
        } catch (caught) {
          error = caught;
        }
        assertIncludes(error?.message ?? '', 'existence_error(procedure)', 'error');
      },
    },
    {
      name: 'autoload can be disabled explicitly in the JavaScript API',
      run: () => {
        const program = Program.parse('answer(X) :- member(X, [a]).\n', { autoload: false });
        assertEqual(program.findGroup('member', 2), null, 'member/2 remains unresolved');
        assertEqual(program.autoloadedPredicates.length, 0, 'no autoloads');
      },
    },
    {
      name: 'program and solver public classes',
      run: () => {
        const program = Program.parse('p(a).\np(b).\n');
        const solver = new Solver(program);
        const goal = parseGoalText('p(X)');
        const answers = [...solver.solve([goal], new Env(), 0)].map((env) => termToString(goal, env, true));
        assertEqual(answers.join('\n'), 'p(a)\np(b)', 'answers');
      },
    },
    {
      name: 'solver has no implicit solution limit',
      run: () => {
        const program = Program.parse('p(a).\n');
        const solver = new Solver(program);
        assertEqual(String(solver.solutionLimit), 'Infinity', 'default solution limit');
        // Crossing the former 10,000,000-answer ceiling must not make an
        // otherwise available answer disappear. This exercises the boundary
        // without making the regression suite enumerate ten million answers.
        solver.solutionsSeen = 10_000_000;
        const goal = parseGoalText('p(X)');
        const answers = [...solver.solve([goal], new Env(), 0)].map((env) => termToString(goal, env, true));
        assertEqual(answers.join('\n'), 'p(a)', 'answer beyond former default ceiling');
      },
    },
    {
      name: 'fresh-variable generation stays bounded under a small host heap',
      run: () => {
        const engineUrl = new URL('../src/index.js', import.meta.url).href;
        const programText = 'p(X) :- repeat, q(X).\nq(_).\n';
        const script = `
          import { Program, Solver, Env, parseGoalText, getEyePrologRegistry } from ${JSON.stringify(engineUrl)};
          const program = Program.parse(${JSON.stringify(programText)});
          const solver = new Solver(program, { registry: getEyePrologRegistry() });
          const goal = parseGoalText('p(X)');
          let count = 0;
          for (const _ of solver.solve([goal], new Env(), 0)) {
            if (++count === 300000) break;
          }
          if (count !== 300000) throw new Error('unexpected answer count: ' + count);
          process.stdout.write(String(count));
        `;
        const result = spawnSync(process.execPath, [
          '--max-old-space-size=32',
          '--input-type=module',
          '--eval',
          script,
        ], { cwd: packageRoot, encoding: 'utf8', timeout: 30000 });
        if (result.error) throw result.error;
        assertEqual(result.status, 0, `bounded-heap child status; stderr=${result.stderr}`);
        assertEqual(result.stdout, '300000', 'fresh-variable answer count');
      },
    },
    {
      name: 'ground Prolog error terms are reused across catches',
      run: () => {
        const error = new PrologError('syntax_error(number)');
        const first = formalErrorTerm(error);
        const second = formalErrorTerm(error);
        assertEqual(first === second, true, 'reused ground error term');
      },
    },
    {
      name: 'caught number syntax errors do not exhaust memory on distinct inputs',
      run: () => {
        const engineUrl = new URL('../src/index.js', import.meta.url).href;
        const programText = `
          :- use_module(library(lists)).
          alphabet(['0','1','2','3','4','5','6','7','8','9','.']).
          trial([A,B,C,D,E,F]) :-
            alphabet(Chars),
            member(A, Chars), member(B, Chars), member(C, Chars),
            member(D, Chars), member(E, Chars), member(F, Chars),
            catch(number_chars(_, [A,B,C,D,E,F]), error(syntax_error(number), _), true).
        `;
        const script = `
          import { Program, Solver, Env, parseGoalText, getEyePrologRegistry } from ${JSON.stringify(engineUrl)};
          const program = Program.parse(${JSON.stringify(programText)});
          const solver = new Solver(program, { registry: getEyePrologRegistry() });
          const goal = parseGoalText('trial(Chars)');
          let count = 0;
          for (const _ of solver.solve([goal], new Env(), 0)) {
            if (++count === 250000) break;
          }
          if (count !== 250000) throw new Error('unexpected answer count: ' + count);
          process.stdout.write(String(count));
        `;
        const result = spawnSync(process.execPath, [
          // Run well past the roughly 126,000-answer failure reported in #28
          // while keeping the host heap deliberately constrained.
          '--max-old-space-size=32',
          '--input-type=module',
          '--eval',
          script,
        ], { cwd: packageRoot, encoding: 'utf8', timeout: 30000 });
        if (result.error) throw result.error;
        assertEqual(result.status, 0, `bounded-heap child status; stderr=${result.stderr}`);
        assertEqual(result.stdout, '250000', 'distinct number syntax attempts');
      },
    },
    {
      name: 'recursive phrase tables stay bounded across distinct inputs (issues #28/#48)',
      run: () => {
        const engineUrl = new URL('../src/index.js', import.meta.url).href;
        const programText = `
          :- use_module(library(prologue)).
          ... --> [].
          ... --> [_], ... .

          vchars("0123456789.").

          ti(Nth:E:Chs, Pot, Start) :-
            length(Chs, _),
            call_nth(chs(Chs), Nth), Nth >= Start,
            Nth mod 10^Pot =:= 0,
            E = cnt.

          chs(Chs) :-
            vchars(VChs),
            maplistch(Chs, VChs),
            catch(number_chars(_, Chs), error(syntax_error(_), _), false),
            \\+ phrase((..., ("//"|"++")), Chs).

          maplistch([], _).
          maplistch([Ch|Chs], VChs) :-
            member(Ch, VChs),
            maplistch(Chs, VChs).
        `;
        const script = `
          import { Program, Solver, Env, parseGoalText, getEyePrologRegistry } from ${JSON.stringify(engineUrl)};
          const program = Program.parse(${JSON.stringify(programText)}, { autoloadGoals: ['ti(R,1,0)'] });
          const listTailGroup = program.findGroup('...', 2, 'user');
          if (listTailGroup?.listTailRecursive !== true) {
            throw new Error('recursive DCG tail-consumption was not recognized');
          }
          const solver = new Solver(program, { registry: getEyePrologRegistry(), maxMemoryBytes: Infinity });
          const goal = parseGoalText('ti(R,1,0)', {
            doubleQuotes: 'chars',
            operatorDefinitions: [...program.operators.values()],
          });
          let count = 0;
          for (const _ of solver.solve([goal], new Env(), 0)) {
            if (++count === 10) break;
          }
          if (count !== 10) throw new Error('unexpected checkpoint count: ' + count);
          const scope = solver.innerTableScopes.get('phrase');
          if (scope == null) throw new Error('missing phrase table scope');
          if (scope.memo.size !== 0) throw new Error('distinct tail-DCG inputs should not retain phrase tables: ' + scope.memo.size);
          process.stdout.write(count + ':' + scope.memo.size);
        `;
        const result = spawnSync(process.execPath, [
          // This covers 100 accepted number candidates, enough to exercise
          // many distinct recursive DCG inputs while keeping this a focused
          // bounded-cache regression rather than a memory stress benchmark.
          '--max-old-space-size=32',
          '--input-type=module',
          '--eval',
          script,
        ], { cwd: packageRoot, encoding: 'utf8', timeout: 30000 });
        if (result.error) throw result.error;
        assertEqual(result.status, 0, `bounded phrase-table child status; stderr=${result.stderr}`);
        const [countText, cacheText] = result.stdout.trim().split(':');
        assertEqual(countText, '10', 'recursive phrase checkpoints');
        assertEqual(cacheText, '0', 'distinct tail-DCG phrase cache');
      },
    },
    {
      name: 'repeated identical phrase invocation reuses a compact table (issue #48)',
      run: () => {
        const program = Program.parse(`
          :- use_module(library(prologue)).
          ... --> [].
          ... --> [_], ... .
        `, { autoloadGoals: ['phrase((...,("ba"|"gh")),"abcdef")'] });
        const solver = new Solver(program, { registry: getEyePrologRegistry(), maxMemoryBytes: Infinity });
        const goal = parseGoalText('phrase((...,("ba"|"gh")),"abcdef")', {
          doubleQuotes: 'chars',
          operatorDefinitions: [...program.operators.values()],
        });
        const runFailure = () => {
          let answers = 0;
          for (const _ of solver.solve([goal], new Env(), 0)) answers++;
          assertEqual(answers, 0, 'failing phrase answer count');
        };
        runFailure();
        assertEqual(solver.stats.table_fixpoint_rounds, 0, 'first distinct tail-DCG invocation stays untabled');
        runFailure();
        const roundsAfterSecond = solver.stats.table_fixpoint_rounds;
        if (roundsAfterSecond <= 0) throw new Error('repeated phrase invocation did not build reusable table');
        const scope = solver.innerTableScopes.get('phrase');
        if (scope == null || scope.memo.size <= 0 || scope.memo.size > 1024) {
          throw new Error('unexpected repeated phrase table size: ' + (scope?.memo.size ?? 'missing'));
        }
        runFailure();
        assertEqual(solver.stats.table_fixpoint_rounds, roundsAfterSecond, 'third identical phrase call reuses completed table');
      },
    },
    {
      name: 'host Map/Set capacity errors become resource_error(memory)',
      run: () => {
        for (const [predicate, message] of [
          ['exhaust_map', 'Map maximum size exceeded'],
          ['exhaust_set', 'Set maximum size exceeded'],
        ]) {
          const registry = new BuiltinRegistry();
          registry.add(predicate, 0, function* () {
            throw new RangeError(message);
          });
          const solver = new Solver(Program.parse(''), { registry });
          const goal = parseGoalText(predicate);
          let caught = null;
          try {
            [...solver.solve([goal], new Env(), 0)];
          } catch (error) {
            caught = error;
          }
          assertEqual(caught?.name, 'PrologError', `${predicate} normalized error type`);
          assertEqual(caught?.formal, 'resource_error(memory)', `${predicate} normalized resource error`);
        }
      },
    },
    {
      name: 'unbounded length/2 reaches a catchable memory resource error (issue #49)',
      run: () => {
        const engineUrl = new URL('../src/index.js', import.meta.url).href;
        const script = `
          import { Program, Solver, Env, deref, variable, parseGoalText, getEyePrologRegistry } from ${JSON.stringify(engineUrl)};
          const program = Program.parse(${JSON.stringify(':- use_module(library(lists)).\n')}, { sourceMetadata: false });
          const solver = new Solver(program, { registry: getEyePrologRegistry() });
          const goal = parseGoalText('catch(length(L,N),error(E,_),true),L=N', {
            operatorDefinitions: [...program.operators.values()],
          });
          let answer = null;
          for (const env of solver.solve([goal], new Env(), 0)) {
            answer = env;
            break;
          }
          if (answer == null) throw new Error('issue #49 query produced no caught answer');
          const formal = deref(variable('E'), answer);
          if (formal?.name !== 'resource_error' || deref(formal.args?.[0], answer)?.name !== 'memory') {
            throw new Error('unexpected caught error: ' + JSON.stringify(formal));
          }
          const left = deref(variable('L'), answer);
          const right = deref(variable('N'), answer);
          if (left.type !== 'var' || right.type !== 'var' || left.name !== right.name) {
            throw new Error('recovery did not leave L=N');
          }
          process.stdout.write('caught');
        `;
        const result = spawnSync(process.execPath, [
          '--max-old-space-size=64',
          '--input-type=module',
          '--eval',
          script,
        ], { cwd: packageRoot, encoding: 'utf8', timeout: 5000 });
        if (result.error) throw result.error;
        assertEqual(result.status, 0, `issue #49 bounded-heap child status; stderr=${result.stderr}`);
        assertEqual(result.stdout, 'caught', 'issue #49 resource error is caught by catch/3');
      },
    },
    {
      name: 'discarded fixed-length lists stay compact under a bounded heap',
      run: () => {
        const engineUrl = new URL('../src/index.js', import.meta.url).href;
        const script = `
          import { Program, Solver, Env, parseGoalText, getEyePrologRegistry } from ${JSON.stringify(engineUrl)};
          const program = Program.parse(${JSON.stringify(':- use_module(library(prologue)).\n')}, { sourceMetadata: false });
          const solver = new Solver(program, { registry: getEyePrologRegistry() });
          const execute = (text) => {
            const goal = parseGoalText(text, { operatorDefinitions: [...program.operators.values()] });
            return [...solver.solve([goal], new Env(), 0)];
          };
          execute('length(L,10000000),fail');
          if (execute('length(L,1),L=[X],X=L').length !== 0) {
            throw new Error('compact list admitted a cyclic binding');
          }
          execute('length(L,1000),fail');
          process.stdout.write('compact');
        `;
        const result = spawnSync(process.execPath, [
          '--max-old-space-size=64',
          '--input-type=module',
          '--eval',
          script,
        ], { cwd: packageRoot, encoding: 'utf8', timeout: 30000 });
        if (result.error) throw result.error;
        assertEqual(result.status, 0, `bounded-heap child status; stderr=${result.stderr}`);
        assertEqual(result.stdout, 'compact', 'discarded list skeleton does not exhaust the heap');
      },
    },
    {
      name: 'deep recursive list guards do not consume the host call stack',
      run: () => {
        const program = Program.parse('l([]).\nl([_|L]) :- l(L).\n', { sourceMetadata: false });
        const left = listFromItems(Array.from({ length: 20000 }, (_, index) => variable(`L${index}`)));
        const right = listFromItems(Array.from({ length: 20000 }, (_, index) => variable(`R${index}`)));
        const solver = new Solver(program, {
          registry: getEyePrologRegistry(),
          maxDepth: 0,
          maxMemoryBytes: Infinity,
        });
        const answers = [...solver.solve([compound('l', [left])], new Env(), 0)];
        assertEqual(answers.length, 0, 'depth bound stops after stack-safe memo classification');
        assertEqual(variantTerms(left, new Env(), right, new Env()), true, 'deep lists are variants');
      },
    },
    {
      name: 'discarded recursive allocations recover after resource_error(memory)',
      run: () => {
        const engineUrl = new URL('../src/index.js', import.meta.url).href;
        const programText = `
          :- use_module(library(prologue)).
          l([]).
          l([E|L]) :- length(E,1000), l(L).
        `;
        const reportedGoal = 'length(_,I),N is 2^I,\\+ \\+ (length(L,N),l(L)),L=[_|_]';
        const script = `
          import { Program, Solver, Env, deref, variable, parseGoalText, getEyePrologRegistry } from ${JSON.stringify(engineUrl)};
          const program = Program.parse(${JSON.stringify(programText)}, { sourceMetadata: false });
          const solver = new Solver(program, { registry: getEyePrologRegistry() });
          const execute = (text) => {
            const goal = parseGoalText(text, { operatorDefinitions: [...program.operators.values()] });
            return [...solver.solve([goal], new Env(), 0)];
          };
          const reported = parseGoalText(${JSON.stringify(reportedGoal)}, {
            operatorDefinitions: [...program.operators.values()],
          });
          let reportedAnswers = 0;
          for (const answer of solver.solve([reported], new Env(), 0)) {
            reportedAnswers++;
            if (reportedAnswers !== 14) continue;
            if (deref(variable('I'), answer).name !== '13' || deref(variable('N'), answer).name !== '8192') {
              throw new Error('reported query did not reach I=13, N=8192');
            }
            break;
          }
          if (reportedAnswers !== 14) throw new Error('reported query produced too few answers');
          let caught = null;
          try { execute('length(L,32768),l(L)'); } catch (error) { caught = error; }
          if (caught?.formal !== 'resource_error(memory)') throw caught ?? new Error('no resource error');
          if (execute('length(L,10),l(L)').length !== 1) throw new Error('recovery query failed');
          process.stdout.write('recovered');
        `;
        const result = spawnSync(process.execPath, [
          '--max-old-space-size=64',
          '--input-type=module',
          '--eval',
          script,
        ], { cwd: packageRoot, encoding: 'utf8', timeout: 30000 });
        if (result.error) throw result.error;
        assertEqual(result.status, 0, `bounded-heap child status; stderr=${result.stderr}`);
        assertEqual(result.stdout, 'recovered', 'discarded recursive terms are collectible after unwinding');
      },
    },
    {
      name: 'anonymous Prologue length checks avoid materializing discarded lists',
      run: () => {
        const engineUrl = new URL('../src/index.js', import.meta.url).href;
        const programText = ':- use_module(library(prologue)).\n';
        const goalText = 'length(_, I), I > 9, N is 2^I, \\+ \\+ length(_, N)';
        const script = `
          import { Program, Solver, Env, parseGoalText, getEyePrologRegistry } from ${JSON.stringify(engineUrl)};
          const program = Program.parse(${JSON.stringify(programText)}, { sourceMetadata: false });
          const solver = new Solver(program, {
            registry: getEyePrologRegistry(),
            solutionLimit: 19,
          });
          const goal = parseGoalText(${JSON.stringify(goalText)}, {
            operatorDefinitions: [...program.operators.values()],
          });
          let answers = 0;
          for (const _ of solver.solve([goal], new Env(), 0)) answers++;
          process.stdout.write(String(answers));
        `;
        const result = spawnSync(process.execPath, [
          '--max-old-space-size=64',
          '--input-type=module',
          '--eval',
          script,
        ], { cwd: packageRoot, encoding: 'utf8', timeout: 30000 });
        if (result.error) throw result.error;
        assertEqual(result.status, 0, `bounded-heap child status; stderr=${result.stderr}`);
        assertEqual(result.stdout, '19', 'answers through I = 28');
      },
    },
    {
      name: 'solver honors solution limits',
      run: () => {
        const program = Program.parse('p(a).\np(b).\np(c).\n');
        const solver = new Solver(program, { solutionLimit: 2 });
        const goal = parseGoalText('p(X)');
        const answers = [...solver.solve([goal], new Env(), 0)].map((env) => termToString(goal, env, true));
        assertEqual(answers.join('\n'), 'p(a)\np(b)', 'answers');
      },
    },
    {
      name: 'custom builtin registry can be embedded',
      run: () => {
        const registry = new BuiltinRegistry();
        registry.add('hello', 1, function* ({ goal, env }) {
          const next = env.clone();
          if (unify(goal.args[0], atom('world'), next)) yield next;
        });
        const program = Program.parse('answer(X) :- hello(X).\n');
        const solver = new Solver(program, { registry });
        const goal = parseGoalText('answer(X)');
        const answers = [...solver.solve([goal], new Env(), 0)].map((env) => termToString(goal, env, true));
        assertEqual(answers.join('\n'), 'answer(world)', 'answers');
      },
    },
    {
      name: 'ISO-only and EyeProlog registries expose separate metadata',
      run: () => {
        const registry = createDefaultRegistry();
        const library = getEyePrologRegistry();
        assertEqual(Boolean(registry.get('is', 2)), true, 'ISO is/2 exists');
        assertEqual(Boolean(registry.get('append', 3)), false, 'append/3 is not ISO core');
        assertEqual(library.eyePrologLibrary, true, 'complete registry marker');
        assertEqual(library.defs.size, 154, 'EyeProlog registry contains ISO definitions, cleanup controls, observability extensions, WFS tnot/1, and generic library adapters');
        assertEqual(Boolean(registry.get('phrase', 2)), true, 'Part 3 phrase/2 exists');
        assertEqual(Boolean(registry.get('phrase', 3)), true, 'Part 3 phrase/3 exists');
        assertEqual(registry.get('statistics', 0), null, 'statistics/0 is absent from the ISO registry');
        assertEqual(registry.get('statistics', 2), null, 'statistics/2 is absent from the ISO registry');
        assertEqual(Boolean(library.get('statistics', 0)), true, 'statistics/0 is an EyeProlog observability extension');
        assertEqual(Boolean(library.get('statistics', 2)), true, 'statistics/2 is an EyeProlog observability extension');
        assertEqual(registry.get('tnot', 1), null, 'tnot/1 is absent from the ISO registry');
        assertEqual(Boolean(library.get('tnot', 1)), true, 'tnot/1 is an EyeProlog WFS extension');
        assertEqual(registry.get('time', 1), null, 'time/1 is absent from the ISO registry');
        assertEqual(Boolean(library.get('time', 1)), true, 'time/1 is an EyeProlog timing extension');
        assertEqual(registry.get('dif', 2), null, 'dif/2 is absent from the strict ISO core registry');
        assertEqual(Boolean(library.get('dif', 2)), true, 'dif/2 is an EyeProlog attributed-variable constraint extension');
        assertEqual(registry.get('call_cleanup', 2), null, 'call_cleanup/2 is absent from the ISO registry');
        assertEqual(Boolean(library.get('call_cleanup', 2)), true, 'call_cleanup/2 is an EyeProlog cleanup control');
        assertEqual(registry.get('setup_call_cleanup', 3), null, 'setup_call_cleanup/3 is absent from the ISO registry');
        assertEqual(Boolean(library.get('setup_call_cleanup', 3)), true, 'setup_call_cleanup/3 is an EyeProlog cleanup control');
        assertEqual(registeredNativeEyePrologLibraryNames().length, 48, 'public native EyeProlog builtin count');
        assertEqual(eyePrologPortableLibraryIndicators.length, 87, 'portable Prolog library count');
        assertEqual(eyePrologInteropLibraryIndicators.length, 29, 'cross-implementation interop profile count');
        assertEqual(eyePrologInteropLibraryModules.join(','), 'lists,iso_ext,lambda,atts', 'common explicit library module profile');
        assertEqual(eyePrologInteropAutoload['member/2'], 'lists', 'member/2 canonical autoload');
        assertEqual(eyePrologInteropAutoload['between/3'], 'prologue', 'between/3 canonical internal autoload');
        assertEqual(eyePrologInteropAutoload['call_nth/2'], 'iso_ext', 'call_nth/2 canonical interop autoload');
        assertEqual(eyePrologInteropAutoload['time/1'], 'iso_ext', 'time/1 canonical interop autoload');
        assertEqual(eyePrologInteropAutoload['.../2'], 'iso_ext', '.../2 canonical interop autoload');
        assertEqual(eyePrologInteropAutoload['set_nth0/4'] ?? null, null, 'EyeProlog-only set_nth0/4 is not autoloadable');
        assertEqual(eyePrologNativeLibraryIndicators.length, 48, 'native host library count');
        assertEqual(eyePrologNativeLibraryIndicators.slice(0, 3).join(','), 'call_nth/2,freeze/2,dif/2', 'control and constraint predicates requiring host support');
        assertEqual(eyePrologLibraryIndicators.length, 135, 'complete EyeProlog library surface');
        assertEqual(registry.get('eyeprolog__call_nth', 2), null, 'private call_nth adapter is absent from ISO registry');
        assertEqual(Boolean(library.get('eyeprolog__call_nth', 2)), true, 'private call_nth adapter is registered for EyeProlog');
        assertEqual(library.get('eyeprolog__call_nth', 2)?.eyePrologLibrary, true, 'private adapter is marked as library support');
        assertEqual(registry.get('eyeprolog__freeze', 2), null, 'private freeze adapter is absent from ISO registry');
        assertEqual(Boolean(library.get('eyeprolog__freeze', 2)), true, 'private freeze adapter is registered for EyeProlog');
        assertEqual(registry.get('eyeprolog__countall', 2), null, 'private countall adapter is absent from ISO registry');
        assertEqual(Boolean(library.get('eyeprolog__countall', 2)), true, 'private countall adapter is registered for EyeProlog');
        assertEqual(Boolean(library.get('eyeprolog__time', 1)), true, 'private time adapter is registered for EyeProlog');
        assertEqual(library.get('eyeprolog__clpz_labeling', 2), null, 'CLP(Z) labeling is implemented in Prolog');
        assertEqual(library.get('eyeprolog__clpz_global_cardinality', 3), null, 'CLP(Z) cardinality is implemented in Prolog');
        assertEqual(registry.get('put_atts', 2), null, 'put_atts/2 is absent from the ISO registry');
        assertEqual(Boolean(library.get('put_atts', 2)), true, 'put_atts/2 is registered for attributed-variable libraries');
        assertEqual(Boolean(library.get('$put_to_attr_list', 3)), true, 'private attribute-list adapter is registered');
        assertEqual(Boolean(library.get('eyeprolog__bb_get', 2)), true, 'private backtrackable blackboard reader is registered');
        assertEqual(Boolean(library.get('eyeprolog__bb_b_put', 2)), true, 'private backtrackable blackboard writer is registered');
        assertEqual(library.get('between', 3), null, 'between/3 remains portable Prolog');
        assertEqual(library.get('smallest_divisor_from', 3), null, 'smallest_divisor_from/3 remains portable Prolog');
        assertEqual(library.get('random', 3), null, 'random/3 remains portable Prolog');
        assertEqual(library.get('local_time', 1), null, 'local_time/1 is not a host builtin');
        assertEqual(library.get('eyeprolog__string_atom', 2), null, 'private string adapter is absent');
        assertEqual(library.get('append', 3), null, 'append/3 moved to portable Prolog');
        assertEqual(library.get('maplist', 3), null, 'maplist/3 moved to portable Prolog');
        assertEqual(library.get('matches', 3), null, 'matches/3 moved to portable Prolog');
        assertEqual(library.get('uuid', 3), null, 'uuid/3 remains portable Prolog');
        for (const [name, arity] of [['not_member', 2], ['head', 2], ['rest', 2], ['min', 3], ['max', 3]]) {
          assertEqual(library.get(name, arity), null, `${name}/${arity} removed from library`);
        }
      },
    },
    {
      name: 'module compatibility libraries load Prolog clauses explicitly',
      run: () => {
        const program = Program.parse(':- use_module(library(lists)).\n:- use_module(library(random)).\nanswer(X) :- append([a], [b], X).');
        const solver = new Solver(program);
        assertEqual(solver.program, program, 'solver keeps original program object');
        assertEqual(program.findGroup('append', 3)?.module, 'lists', 'append/3 is imported from library(lists)');
        assertEqual(fs.existsSync(path.join(packageRoot, 'src', 'lib', 'eyeprolog.pl')), false, 'obsolete umbrella module is absent');
        assertEqual(fs.existsSync(path.join(packageRoot, 'src', 'standard-library.js')), true, 'standard module registry exists');
        assertEqual(fs.existsSync(path.join(packageRoot, 'src', 'lib', 'aggregate.pl')), true, 'aggregate module exists');
        assertEqual(fs.existsSync(path.join(packageRoot, 'src', 'lib', 'clpz.pl')), true, 'CLP(Z) module exists');
        assertEqual(fs.existsSync(path.join(packageRoot, 'src', 'lib', 'iso_ext.pl')), true, 'ISO extension module exists');
        assertEqual(fs.existsSync(path.join(packageRoot, 'src', 'lib', 'lists.pl')), true, 'lists module exists');
        assertEqual(fs.existsSync(path.join(packageRoot, 'src', 'lib', 'prologue.pl')), true, 'Prologue module exists');
        assertEqual(fs.existsSync(path.join(packageRoot, 'src', 'lib', 'strings.pl')), true, 'strings module exists');
        assertEqual(fs.existsSync(path.join(packageRoot, 'src', 'eyeprolog-autoload.js')), false, 'obsolete autoloader is absent');
        assertEqual(fs.existsSync(path.join(packageRoot, 'src', 'library-source.js')), false, 'duplicate source loader is absent');
        assertEqual(fs.existsSync(path.join(packageRoot, 'src', 'portable-library.js')), false, 'obsolete duplicate module remains absent');
        assertEqual(run(program, { goal: 'answer(X)' }).stdout, 'answer("ab").\n', 'imported append execution');
        assertEqual(program.findGroup('random', 3)?.module, 'random', 'random/3 is imported from library(random)');
      },
    },
    {
      name: 'aligned bundled libraries have no overlapping full-module exports',
      run: () => {
        const owners = new Map();
        for (const [moduleName, entry] of standardLibrarySources) {
          // library(prologue) is the documented legacy compatibility umbrella;
          // aligned libraries must remain pairwise collision-free so full
          // use_module/1 imports can be combined safely.
          if (moduleName === 'prologue') continue;
          const parsed = Program.parse(entry.source);
          const definition = parsed.modules.get(moduleName);
          if (!definition) throw new Error(`missing module declaration for ${moduleName}`);
          for (const indicator of definition.exports.keys()) {
            const previous = owners.get(indicator);
            if (previous != null) throw new Error(`duplicate export ${indicator}: ${previous}, ${moduleName}`);
            owners.set(indicator, moduleName);
          }
        }
        assertEqual(owners.get('countall/2'), 'iso_ext', 'countall/2 has one aligned owner');
        assertEqual(owners.get('call_nth/2'), 'iso_ext', 'call_nth/2 has one aligned owner');
      },
    },
    {
      name: 'portable library executes against the ISO-only registry',
      run: () => {
        const program = Program.parse(`:- use_module(library(strings)).
:- use_module(library(uuid)).
:- use_module(library(lists)).
portable_check(A, B, C) :- lowercase('HELLO', A), replace('banana', 'na', 'NA', B), append([x], [y], C).
`);
        const solver = new Solver(program, { registry: createDefaultRegistry() });
        const goal = parseGoalText('portable_check(A, B, C)');
        const answers = [...solver.solve([goal], new Env(), 0)].map((env) => termToString(goal, env, true));
        assertEqual(answers.join('\n'), 'portable_check(hello, baNANA, "xy")', 'ISO-only portable execution');
        assertEqual(Boolean(program.findGroup('uuid', 3)), true, 'uuid/3 is implemented in the portable module');
        assertEqual(program.findGroup('uuid', 1), null, 'obsolete uuid/1 is absent');
        assertEqual(program.findGroup('local_time', 1), null, 'local_time/1 is absent from the library');
      },
    },
    {
      name: 'countall validates Count before executing Goal and counts without a bag',
      run: () => {
        const source = `:- use_module(library(prologue)).
item(a).
item(b).
item(c).
candidate :- item(_).
`;
        let caught = null;
        try {
          run(source, { goal: 'countall(throw(x), -1)' });
        } catch (error) {
          caught = error;
        }
        assertEqual(caught?.formal, 'domain_error(not_less_than_zero)', 'negative Count error priority');
        assertEqual(run(source, { goal: 'countall(candidate, N)' }).stdout, 'countall(candidate, 3).\n', 'solution count');
      },
    },
    {
      name: 'ISO extension module provides portable control and collection relations',
      run: () => {
        const program = Program.parse(`:- use_module(library(iso_ext)).
item(a).
item(b).
answer(Count, Bag, Pairs, Same) :-
  forall(item(X), atom(X)),
  countall(item(_), Count),
  findall(X, item(X), Bag, [tail]),
  findall(N-S, (cfor(1, 2, N), succ(N, S)), Pairs),
  variant(node(A, A), node(B, B)),
  Same = true.
`);
        assertEqual(program.findGroup('forall', 2)?.module, 'iso_ext', 'forall/2 module');
        assertEqual(program.findGroup('findall', 4)?.module, 'iso_ext', 'findall/4 module');
        assertEqual(run(program, { goal: 'answer(Count, Bag, Pairs, Same)' }).stdout,
          'answer(2, [a, b, tail], [1 - 2, 2 - 3], true).\n', 'ISO extension answer');
      },
    },
    {
      name: 'CLP(Z) module keeps finite constraints logical through labeling',
      run: () => {
        const program = Program.parse(`:- use_module(library(clpz)).
answer(X, Y, B) :-
  [X, Y] ins 1..4,
  X + Y #= 5,
  X #< Y,
  all_distinct([X, Y]),
  chain(#<, [X, Y]),
  B in 0..1,
  B #<==> X #= 1,
  labeling([ff, down], [X, Y, B]).
contradiction :- Z in 1..3, Z = 4.
pruned(Domain) :- [X, Y] ins 1..3, all_distinct([X, Y]), X #= 2, fd_dom(Y, Domain).
hall(Domain) :- [X, Y] ins 1..2, Z in 1..3, all_distinct([X, Y, Z]), fd_dom(Z, Domain).
repeated(X) :- X in 1..3, all_distinct([X, X]).
`);
        assertEqual(program.findGroup('labeling', 2)?.module, 'clpz', 'labeling/2 module');
        assertEqual(run(program, { goals: ['answer(X, Y, B)', 'contradiction', 'pruned(Domain)', 'hall(Domain)', 'repeated(X)'] }).stdout,
          'answer(1, 4, 1).\nanswer(2, 3, 0).\npruned(1 \\/ 3).\nhall(3..3).\n', 'CLP(Z) constrained answers');
      },
    },
    {
      name: 'CLP(Z) finite global constraints match the portable example',
      run: () => {
        const filename = path.join(packageRoot, 'examples', 'clpz-global-constraints.pl');
        const source = fs.readFileSync(filename, 'utf8');
        const program = Program.parseSources([{ text: source, filename }]);
        assertEqual(program.findGroup('tuples_in', 2)?.module, 'clpz', 'tuples_in/2 module');
        assertEqual(program.findGroup('global_cardinality', 3)?.module, 'clpz', 'global_cardinality/3 module');
        assertEqual(program.findGroup('circuit', 1)?.module, 'clpz', 'circuit/1 module');
        const expected = fs.readFileSync(path.join(packageRoot, 'examples', 'output', 'clpz-global-constraints.pl'), 'utf8');
        assertEqual(run(program, { goal: 'advanced_clpz(X0, X1)' }).stdout, expected, 'global constraint answers');
      },
    },
    {
      name: 'module compatibility profile isolates predicates and supports selective imports',
      run: () => {
        const directory = path.join(tmp, `modules-${++tmpCounter}`);
        fs.mkdirSync(directory);
        fs.writeFileSync(path.join(directory, 'colors.pl'), [
          ':- module(colors, [tone/1]).',
          'tone(blue).',
          'hidden(module_private).',
          '',
        ].join('\n'));
        const source = [
          ":- use_module('colors.pl', [tone/1]).",
          'hidden(user_local).',
          'answer(Tone, Hidden) :- tone(Tone), hidden(Hidden).',
          'qualified(ok) :- colors:tone(blue).',
          '',
        ].join('\n');
        const program = Program.parseSources([{ text: source, filename: 'main.pl', baseDir: directory }]);
        assertEqual(program.findGroup('tone', 1)?.module, 'colors', 'selective import resolves exported predicate');
        assertEqual(program.findGroup('hidden', 1)?.module, 'user', 'same-named user predicate remains local');
        assertEqual(run(program, { goals: ['answer(Tone, Hidden)', 'qualified(Status)'] }).stdout,
          'answer(blue, user_local).\nqualified(ok).\n', 'module execution');
      },
    },
    {
      name: 'Part 3 nonterminal indicators import through module compatibility profile',
      run: () => {
        const directory = path.join(tmp, `dcg-modules-${++tmpCounter}`);
        fs.mkdirSync(directory);
        fs.writeFileSync(path.join(directory, 'vocabulary.pl'), [
          ':- module(vocabulary, [word//1]).',
          'word(hello) --> [hello].',
          '',
        ].join('\n'));
        const source = [
          ":- use_module('vocabulary.pl', [word//1]).",
          'answer(X) :- phrase(word(X), [hello]).',
          '',
        ].join('\n');
        const program = Program.parseSources([{ text: source, filename: 'main.pl', baseDir: directory }]);
        assertEqual(program.findGroup('word', 3)?.module, 'vocabulary', 'word//1 imports expanded word/3');
        assertEqual(run(program, { goal: 'answer(X)' }).stdout, 'answer(hello).\n', 'imported grammar execution');
      },
    },
    {
      name: 'EyeProlog library preserves relational and arithmetic behavior',
      run: () => {
        const result = run([
          '%% goal: answer(A, B, S, M)',
          'answer(A, B, S, M) :-',
          '  append(A, B, [a, b]),',
          '  sumall(X + 1, member(X, [1, 2]), S),',
          '  (9007199254740992 >= 9007199254740993 -> M = 9007199254740992 ; M = 9007199254740993).',
          '',
        ].join('\n'));
        assertEqual(result.stdout, [
          'answer([], "ab", 5, 9007199254740993).',
          'answer("a", "b", 5, 9007199254740993).',
          'answer("ab", [], 5, 9007199254740993).',
          '',
        ].join('\n'), 'EyeProlog library behavior');
      },
    },
    {
      name: 'EyeProlog library preserves strict modes and ISO arithmetic errors',
      run: () => {
        assertEqual(run("answer(X) :- substring('abc', '1', 1, X).", { goal: 'answer(X)' }).stdout, '', 'substring index type');
        assertEqual(run('answer(N) :- nth1(N, [a, b], _).', { goal: 'answer(N)' }).stdout, 'answer(1).\nanswer(2).\n', 'nth1 relational enumeration');
        let sumError = null;
        try { run('answer(S) :- sum_list([1, foo], S).', { goal: 'answer(S)' }); } catch (error) { sumError = error; }
        assertIncludes(sumError?.message ?? '', 'type_error(evaluable)', 'sum_list arithmetic error');
      },
    },
  ];
}

function whiteBoxCases() {
  return [
    {
      name: 'unification binds variables in Env',
      run: () => {
        const env = new Env();
        assertEqual(unify(variable('X'), atom('socrates'), env), true, 'unify result');
        assertEqual(termToString(variable('X'), env, true), 'socrates', 'binding');
      },
    },
    {
      name: 'variable term order is scoped to one comparison or sorted-list operation',
      run: () => {
        const left = variable('Left');
        const right = variable('Right');
        assertEqual(String(left.order), 'undefined', 'variables carry no persistent order ordinal');
        assertEqual(String(right.order), 'undefined', 'second variable carries no persistent order ordinal');

        // Separate comparisons are permitted to choose their own
        // implementation-dependent order under ISO 7.2.1.
        assertEqual(String(compareTerms(left, right)), '-1', 'first local comparison');
        assertEqual(String(compareTerms(right, left)), '-1', 'second local comparison is independent');

        // A sorted-list operation instead supplies one shared ranking context,
        // so all comparisons made while constructing that list are consistent.
        const ranks = new Map();
        assertEqual(String(compareTerms(left, right, ranks)), '-1', 'shared order first direction');
        assertEqual(String(compareTerms(right, left, ranks)), '1', 'shared order reverse direction');
      },
    },
    {
      name: 'unification rejects direct and indirect cyclic bindings',
      run: () => {
        const direct = new Env();
        assertEqual(
          unify(variable('X'), compound('wrapper', [variable('X')]), direct),
          false,
          'direct cycle',
        );
        assertEqual(direct.has('X'), false, 'failed direct binding is not installed');

        const indirect = new Env();
        indirect.bind('Y', compound('wrapper', [variable('X')]));
        assertEqual(unify(variable('X'), variable('Y'), indirect), false, 'indirect cycle');
        assertEqual(indirect.has('X'), false, 'failed indirect binding is not installed');
      },
    },
    {
      name: 'cloned environments detach on first write',
      run: () => {
        const parent = new Env();
        parent.bind('Shared', atom('before'));
        const left = parent.clone();
        const right = parent.clone();
        left.bind('Left', atom('only_left'));
        right.bind('Right', atom('only_right'));
        parent.bind('Parent', atom('only_parent'));
        assertEqual(left.get('Shared').name, 'before', 'left keeps shared binding');
        assertEqual(left.has('Right'), false, 'left excludes right write');
        assertEqual(left.has('Parent'), false, 'left excludes parent write');
        assertEqual(right.has('Left'), false, 'right excludes left write');
        assertEqual(parent.has('Left'), false, 'parent excludes child write');
      },
    },
    {
      name: 'deep environment chains flatten without losing bindings',
      run: () => {
        const env = new Env();
        for (let i = 0; i < 40; i++) env.bind(`V${i}`, numberTerm(i));
        assertEqual(env.get('V0').name, '0', 'oldest binding');
        assertEqual(env.get('V31').name, '31', 'binding before flatten');
        assertEqual(env.get('V39').name, '39', 'latest binding');
        assertEqual(env.has('missing'), false, 'missing binding');

        const clone = env.clone();
        clone.bind('OnlyClone', atom('yes'));
        assertEqual(clone.get('OnlyClone').name, 'yes', 'clone write');
        assertEqual(env.has('OnlyClone'), false, 'clone remains isolated');
      },
    },
    {
      name: 'copyResolved and termIsGround follow bindings',
      run: () => {
        const env = new Env();
        const term = compound('p', [variable('X'), atom('b')]);
        assertEqual(termIsGround(term, env), false, 'not ground before binding');
        assertEqual(unify(variable('X'), atom('a'), env), true, 'bind X');
        const resolved = copyResolved(term, env);
        assertEqual(termToString(resolved, new Env(), true), 'p(a, b)', 'resolved term');
        assertEqual(termIsGround(resolved), true, 'ground after copy');
      },
    },

    {
      name: 'parser accepts ISO infix subtraction terms',
      run: () => {
        const [clause] = parseProgramText('value(a-b, ok).\n');
        assertEqual(termToString(clause.head.args[0]), "'-'(a, b)", 'a-b term');
      },
    },
    {
      name: 'parser rejects zero-arity compound syntax',
      run: () => {
        let threw = false;
        try { parseProgramText('value(nil(), ok).\n'); } catch (_) { threw = true; }
        assertEqual(threw, true, 'zero-arity compound rejection');
      },
    },
    {
      name: 'parser preserves list syntax readback',
      run: () => {
        const goal = parseGoalText('member(X, [a, b])');
        assertEqual(termToString(goal, new Env(), true), 'member(X, "ab")', 'goal');
      },
    },
    {
      name: 'double-quoted lists honor every ISO double_quotes value',
      run: () => {
        const chars = parseGoalText('p("aλ")').args[0];
        const charItems = properListItems(chars, new Env());
        assertEqual(charItems.map((item) => `${item.type}:${item.name}`).join('|'), 'atom:a|atom:λ', 'chars');

        const codes = parseGoalText('p("aλ")', { doubleQuotes: 'codes' }).args[0];
        const codeItems = properListItems(codes, new Env());
        assertEqual(codeItems.map((item) => `${item.type}:${item.name}`).join('|'), 'number:97|number:955', 'codes');

        const quotedAtom = parseGoalText('p("aλ")', { doubleQuotes: 'atom' }).args[0];
        assertEqual(`${quotedAtom.type}:${quotedAtom.name}`, 'atom:aλ', 'atom');
      },
    },
    {
      name: 'double_quotes directives affect subsequent source text',
      run: () => {
        const clauses = parseProgramText([
          'chars("a").',
          ':- set_prolog_flag(double_quotes, codes).',
          'codes("a").',
          ':- set_prolog_flag(double_quotes, atom).',
          'quoted_atom("a").',
          '',
        ].join('\n'), { sourceMetadata: false });
        const facts = clauses.filter((clause) => clause.head.name !== ':-');
        assertEqual(termToString(facts[0].head), 'chars("a")', 'chars fact');
        assertEqual(termToString(facts[1].head, new Env(), true, { doubleQuotes: 'codes' }), 'codes("a")', 'codes fact');
        assertEqual(termToString(facts[2].head), 'quoted_atom(a)', 'atom fact');
      },
    },
    {
      name: 'double_quotes parser state flows across source files',
      run: () => {
        const program = Program.parseSources([
          ':- set_prolog_flag(double_quotes, codes).',
          'value("A").',
        ], { sourceMetadata: false });
        const value = program.findGroup('value', 1).clauses[0].head.args[0];
        assertEqual(properListItems(value, new Env())[0].name, '65', 'code in second source');
        assertEqual(program.doubleQuotes, 'codes', 'final parser flag');
      },
    },
    {
      name: 'parser double_quotes option flows into solver flags',
      run: () => {
        const result = run('answer(atom) :- atom("text").', {
          goal: 'answer(X)',
          doubleQuotes: 'atom',
        });
        assertEqual(result.stdout, 'answer(atom).\n', 'atom-mode execution');
      },
    },
    {
      name: 'parser accepts ISO-style uppercase variables',
      run: () => {
        const goal = parseGoalText('member(X, [a, b])');
        assertEqual(termToString(goal, new Env(), true), 'member(X, "ab")', 'goal');
      },
    },
    {
      name: 'parser treats bare underscore as anonymous',
      run: () => {
        const clauses = parseProgramText('p(_, _).\n');
        const left = clauses[0].head.args[0].name;
        const right = clauses[0].head.args[1].name;
        assertEqual(left.startsWith('__anon'), true, 'left anonymous');
        assertEqual(right.startsWith('__anon'), true, 'right anonymous');
        assertEqual(left === right, false, 'fresh anonymous variables');
      },
    },
    {
      name: 'parser rejects old question-mark variable spelling',
      run: () => {
        let threw = false;
        try { parseProgramText('p(?x).\n'); } catch (_) { threw = true; }
        assertEqual(threw, true, 'question-mark variable syntax rejected');
      },
    },
    {
      name: 'parser accepts bare underscore anonymous variable spelling',
      run: () => {
        let threw = false;
        try { parseProgramText('p(_).\n'); } catch (_) { threw = true; }
        assertEqual(threw, false, 'bare underscore syntax accepted');
      },
    },
    {
      name: 'parser rejects unquoted dotted atoms to stay ISO-compatible',
      run: () => {
        let threw = false;
        try { parseProgramText('p(web(be.ugent, josd)).\n'); } catch (_) { threw = true; }
        assertEqual(threw, true, 'unquoted dotted atoms must be quoted');
      },
    },
    {
      name: 'parser preserves quoted dotted atoms for web-style terms',
      run: () => {
        const clauses = parseProgramText("p(web('be.ugent', josd), 'org.schema').\n");
        assertEqual(termToString(clauses[0].head, new Env(), true), "p(web('be.ugent', josd), 'org.schema')", 'head');
      },
    },
    {
      name: 'parser accepts quoted angle-bracket atoms',
      run: () => {
        const clauses = parseProgramText("p('<https://example.org/alice>', '<urn:example:bob>').\n");
        assertEqual(termToString(clauses[0].head, new Env(), true), "p('<https://example.org/alice>', '<urn:example:bob>')", 'head');
      },
    },
    {
      name: 'readback leaves absolute IRI atoms as quoted atoms',
      run: () => {
        const clauses = parseProgramText("p('https://example.org/alice').\n");
        assertEqual(termToString(clauses[0].head, new Env(), true), "p('https://example.org/alice')", 'head');
      },
    },
    {
      name: 'angle IRI syntax does not steal graphic atom syntax',
      run: () => {
        const clauses = parseProgramText('p(<=>).\n');
        assertEqual(termToString(clauses[0].head, new Env(), true), 'p(<=>)', 'head');
      },
    },
    {
      name: 'list construction round-trips through properListItems',
      run: () => {
        const list = listFromItems([atom('a'), numberTerm(2), stringTerm('c')]);
        const items = properListItems(list, new Env());
        assertEqual(items.length, 3, 'length');
        assertEqual(termToString(list, new Env(), true), '[a, 2, "c"]', 'list text');
      },
    },
    {
      name: 'variantTerms recognizes alpha-equivalent goals',
      run: () => {
        const left = parseGoalText('edge(X, Y)');
        const right = parseGoalText('edge(A, B)');
        const nonVariant = parseGoalText('edge(A, A)');
        assertEqual(variantTerms(left, new Env(), right, new Env()), true, 'variant');
        assertEqual(variantTerms(left, new Env(), nonVariant, new Env()), false, 'non-variant');
      },
    },
    {
      name: 'flattenConjunction preserves left-to-right order',
      run: () => {
        const goal = parseGoalText('(a, b, c)');
        const parts = flattenConjunction(goal).map((part) => termToString(part, new Env(), true));
        assertEqual(parts.join(' | '), 'a | b | c', 'order');
      },
    },
    {
      name: 'parseProgramText returns clause objects',
      run: () => {
        const clauses = parseProgramText('p(a).\nq(X) :- p(X).\n');
        assertEqual(clauses.length, 2, 'clause count');
        assertEqual(termToString(clauses[1].head, new Env(), true), 'q(X)', 'rule head');
        assertEqual(clauses[1].body.length, 1, 'body length');
      },
    },
    {
      name: 'fast parser bounds rule-marker scans to the current fact line',
      run: () => {
        const lines = ['q(X, Y) :- p(X, Y).'];
        for (let index = 0; index < 2_000; index++) lines.push(`p(a${index}, b${index}).`);
        const source = lines.join('\n');
        const originalIndexOf = String.prototype.indexOf;
        let wholeSourceRuleScans = 0;
        String.prototype.indexOf = function patchedIndexOf(search, ...args) {
          if (search === ':-' && String(this) === source) wholeSourceRuleScans++;
          return originalIndexOf.call(this, search, ...args);
        };
        try {
          const program = Program.parse(source, { sourceMetadata: false });
          assertEqual(program.clauses.length, 2_001, 'clause count');
          assertEqual(wholeSourceRuleScans, 0, 'whole-source rule scans');
        } finally {
          String.prototype.indexOf = originalIndexOf;
        }
      },
    },
    {
      name: 'streaming program builder preserves source order and dynamic declarations',
      run: () => {
        const program = Program.parseSources([
          { text: 'item(a).\n:- dynamic(later/1).\n', filename: 'first.pl' },
          { text: 'item(b).\nlater(c).\n', filename: 'second.pl' },
        ], { sourceMetadata: false });
        assertEqual(program.clauses.length, 4, 'clause count');
        assertEqual(program.clauses.map((clause) => clause.index).join(','), '0,1,2,3', 'source indexes');
        assertEqual(program.findGroup('item', 1).clauses.map((clause) => clause.index).join(','), '0,2', 'group order');
        assertEqual(program.findGroup('later', 1).dynamic, true, 'dynamic declaration');
      },
    },
    {
      name: 'clause candidate selection builds arbitrary-width indexes on demand',
      run: () => {
        const facts = ['row(a0, b0, c0, first).', 'row(a0, X, c0, wildcard).'];
        for (let a = 0; a < 6; a++) {
          for (let b = 0; b < 6; b++) {
            for (let c = 0; c < 6; c++) {
              if (a !== 0 || b !== 0 || c !== 0) facts.push(`row(a${a}, b${b}, c${c}, other).`);
            }
          }
        }
        const program = Program.parse(facts.join('\n'));
        const group = program.findGroup('row', 4);
        assertEqual(group.demandIndexes.size, 0, 'indexes start empty');
        const goal = parseGoalText('row(a0, b0, c0, Result)');
        const candidates = selectClauseCandidates(group, goal, new Env());
        assertEqual(group.argIndexes.length, 4, 'any-argument indexes available');
        assertEqual(group.demandIndexes.has('0'), false, 'single indexes are not rebuilt lazily');
        assertEqual(group.demandIndexes.has('0,1,2'), true, 'three-argument index built');
        assertEqual(candidates.primary.length, 2, 'candidate length');
        assertEqual(candidates.fallback.length, 0, 'one ordered candidate stream');
        assertEqual(termToString(candidates.primary[0].head, new Env(), true), 'row(a0, b0, c0, first)', 'first head');
        assertEqual(termToString(candidates.primary[1].head, new Env(), true), 'row(a0, X, c0, wildcard)', 'wildcard head');

        const variableHeavy = Program.parse(Array.from(
          { length: 12 },
          (_, index) => `open(X${index}, Y${index}, value${index}).`,
        ).join('\n'));
        const openGroup = variableHeavy.findGroup('open', 3);
        selectClauseCandidates(openGroup, parseGoalText('open(a, b, Result)'), new Env());
        assertEqual(openGroup.demandIndexes.size, 0, 'poor wide index discarded');
        assertEqual(openGroup.rejectedDemandIndexes.has('0,1'), true, 'poor call mode remembered');
      },
    },
    {
      name: 'dynamic mutations refresh recursive planning',
      run: () => {
        const program = Program.parse(':- dynamic(loop/1).\n');
        const group = program.findGroup('loop', 1);
        assertEqual(group.recursive, false, 'empty dynamic predicate is not recursive');
        assertEqual(program.revision, 0, 'initial revision');
        program.insertDynamicClause({
          head: compound('loop', [variable('X')]),
          body: [compound('loop', [variable('X')])],
        });
        assertEqual(program.revision, 1, 'mutation revision');
        assertEqual(group.recursive, true, 'recursive flag refreshed');
        assertEqual(group.tabled, true, 'tabling decision refreshed');
      },
    },
    {
      name: 'recursive predicate groups are tabled automatically',
      run: () => {
        const program = Program.parse('edge(a, b).\npath(X, Y) :- edge(X, Y).\npath(X, Z) :- path(X, Y), edge(Y, Z).\n');
        const group = program.findGroup('path', 2);
        assertEqual(Boolean(group), true, 'path/2 group exists');
        assertEqual(group.tabled, true, 'path/2 tabled automatically');
      },
    },
    {
      name: 'directly queried recursive groups are tabled automatically',
      run: () => {
        const program = Program.parse('%% goal: path(X, Y)\nedge(a, b).\npath(X, Y) :- edge(X, Y).\npath(X, Z) :- edge(X, Y), path(Y, Z).\n');
        const group = program.findGroup('path', 2);
        assertEqual(group.tabled, true, 'queried path/2 tabled automatically');
      },
    },
    {
      name: 'cycles through negation retain guarded resolution',
      run: () => {
        const program = Program.parse('p(X) :- \\+ q(X).\nq(X) :- p(X).\n');
        assertEqual(program.findGroup('p', 1).recursive, true, 'p/1 recursive');
        assertEqual(program.findGroup('q', 1).recursive, true, 'q/1 recursive');
        assertEqual(program.findGroup('p', 1).tabled, false, 'p/1 not positively tabled');
        assertEqual(program.findGroup('q', 1).tabled, false, 'q/1 not positively tabled');
      },
    },
    {
      name: 'large finite Datalog uses an indexed least model only for broad calls',
      run: () => {
        const edges = Array.from({ length: 130 }, (_, i) => `edge(n${i}, n${i + 1}).`).join('\n');
        const source = `${edges}\npath(X,Y) :- edge(X,Y).\npath(X,Y) :- edge(X,Z), path(Z,Y).\n`;
        const program = Program.parse(source);
        const group = program.findGroup('path', 2);
        assertEqual(group.datalogLeastModel, true, 'large range-restricted Datalog is eligible');

        const broad = run(program, { goal: 'path(X,Y)' });
        assertEqual(broad.stdout.trim().split('\n').length, 8515, 'semi-naive closure has every chain pair');
        assertEqual(broad.stats.datalog_evaluations, 1, 'broad query builds one least model');

        const ground = run(program, { goal: 'path(n0,n130)' });
        assertEqual(ground.stdout, 'path(n0, n130).\n', 'ground chain still succeeds');
        assertEqual(ground.stats.datalog_evaluations, 0, 'ground query keeps the ordinary indexed chain path');
      },
    },
    {
      name: 'compact finite Datalog planning preserves lazy clause terms',
      run: () => {
        const facts = Array.from({ length: 130 }, (_, i) => `compact_edge(n${i}, n${i + 1}).`).join('\n');
        const source = `${facts}\ncompact_edge(X,Y) :- compact_edge(X,Y).\n`;
        const program = Program.parseSources([{ text: source, filename: 'compact-datalog.pl' }], {
          sourceMetadata: false,
        });
        const group = program.findGroup('compact_edge', 2);
        assertEqual(group.datalogLeastModel, true, 'compact recursive Datalog remains eligible');
        assertEqual(
          group.clauses.filter((clause) => clause._head != null || clause._body != null).length,
          0,
          'planning keeps compact clause terms lazy',
        );
      },
    },
    {
      name: 'findall length counting preserves multiplicity and observable bags',
      run: () => {
        const source = `
p(a).
p(b).
q(X) :- p(X).
q(X) :- p(X).
bench(N) :- findall(X, q(X), Bag), length(Bag, N).
collect(Bag,N) :- findall(X, q(X), Bag), length(Bag, N).
`;
        assertEqual(run(source, { goal: 'bench(N)' }).stdout, 'bench(4).\n', 'dead bag counts all four proof solutions');
        assertEqual(run(source, { goal: 'collect(Bag,N)' }).stdout, 'collect("abab", 4).\n', 'bag exposed through the rule head is materialized');
      },
    },
    {
      name: 'ground negation probes a complete positive Datalog model',
      run: () => {
        const edges = Array.from({ length: 130 }, (_, i) => `edge(n${i}, n${i + 1}).`).join('\n');
        const source = `${edges}
path(X,Y) :- edge(X,Y).
path(X,Y) :- edge(X,Z), path(Z,Y).
blocked(X,Y) :- path(X,Y).
candidate(n0,n130).
candidate(n130,n0).
keep(X,Y) :- candidate(X,Y), \\+ blocked(X,Y).
`;
        const result = run(source, { goal: 'keep(X,Y)' });
        assertEqual(result.stdout, 'keep(n130, n0).\n', 'negation sees the complete transitive closure');
        assertEqual(result.stats.datalog_evaluations, 1, 'ground truth probe reuses one complete least model');
      },
    },
    {
      name: 'tnot enables finite Datalog well-founded semantics without changing ISO negation',
      run: () => {
        const program = Program.parse(`
move(1, 2).
move(2, 3).
move(3, 4).
move(4, 1).
win(X) :- move(X, Y), tnot(win(Y)).
`);
        assertEqual(program.findGroup('win', 1).wfsDatalog, true, 'win/1 uses finite WFS evaluation');
        assertEqual(program.findGroup('win', 1).tabled, false, 'win/1 is not positive least-model tabled');
        const result = run(program, { goal: 'win(X)' });
        assertEqual(result.stdout.trim().split('\n').length, 4, 'negative cycle yields four conditional WFS answers');
        assertEqual(result.stats.wfs_fixpoint_rounds, 2, 'alternating fixed point converges in two rounds');
        assertEqual(result.stats.wfs_undefined_answers, 4, 'cycle answers are undefined rather than unconditional truths');

        const nafProgram = Program.parse('p(X) :- \\+ q(X).\nq(X) :- p(X).\n');
        assertEqual(nafProgram.findGroup('p', 1).wfsDatalog, false, '\\+/1 remains ordinary negation as failure');
      },
    },
    {
      name: 'finite WFS distinguishes true false and undefined for ground tnot calls',
      run: () => {
        const source = `
move(a, b).
move(c, d).
move(d, c).
win(X) :- move(X, Y), tnot(win(Y)).
true_case :- win(a).
false_case :- tnot(win(a)).
undefined_case :- tnot(win(c)).
`;
        assertEqual(run(source, { goal: 'true_case' }).stdout, 'true_case.\n', 'win(a) is true because b is false');
        assertEqual(run(source, { goal: 'false_case' }).stdout, '', 'tnot(win(a)) fails for a true atom');
        assertEqual(run(source, { goal: 'undefined_case' }).stdout, 'undefined_case.\n', 'tnot of an undefined WFS atom is a conditional success');
      },
    },
    {
      name: 'cyclic tabling reaches a complete fixed point',
      run: () => {
        const result = run(Program.parse(`
edge(a, b).
edge(b, c).
edge(c, d).
edge(d, a).
path(X, Y) :- edge(X, Y).
path(X, Z) :- edge(X, Y), path(Y, Z).
`), { goal: 'path(X0, X1)' });
        const answers = result.stdout.trim().split('\n');
        assertEqual(answers.length, 16, 'four-node cycle transitive closure size');
        for (const node of ['a', 'b', 'c', 'd']) {
          assertIncludes(result.stdout, `path(${node}, ${node}).\n`, `${node} reaches itself`);
        }
        assertEqual(result.stats.table_fixpoint_rounds > 1, true, 'cyclic table required multiple rounds');
      },
    },
    {
      name: 'challenging examples infer dynamic-programming predicates automatically',
      run: () => {
        const checks = [
          ['binomial-vandermonde.pl', 'choose_step', 5, true],
          ['catalan-convolution.pl', 'catalan', 2, true],
          ['chart-parser.pl', 'span', 4, true],
          ['continued-fraction-sqrt2.pl', 'conv', 3, true],
          ['critical-path-schedule.pl', 'earliest_start', 2, true],
          ['critical-path-schedule.pl', 'finish_time', 2, true],
          ['integer-partitions.pl', 'partitions', 3, true],
          ['matrix-chain-order.pl', 'cost', 3, true],
          ['modular-exponentiation.pl', 'pow_mod', 4, true],
          ['pell-equation.pl', 'pell', 3, true],
          ['stirling-bell-numbers.pl', 'stirling2', 3, false],
          ['totient-summatory.pl', 'gcd', 3, true],
          ['totient-summatory.pl', 'totient', 2, false],
          ['weighted-interval-scheduling.pl', 'best_from', 2, true],
        ];
        for (const [filename, name, arity, recursive] of checks) {
          const text = fs.readFileSync(path.join(packageRoot, 'examples', filename), 'utf8');
          const program = Program.parseSources([{ text, filename }]);
          const group = program.findGroup(name, arity);
          assertEqual(Boolean(group), true, `${filename} ${name}/${arity} group exists`);
          assertEqual(group.tabled, recursive, `${filename} ${name}/${arity} automatic table decision`);
          assertEqual(group.recursive, recursive, `${filename} ${name}/${arity} recursive`);
        }
      },
    },
    {
      name: 'recursive search pattern keeps scan and search predicates tabled',
      run: () => {
        const text = `
          queens([], Qs, Qs).
          queens(Us, Ps, Qs) :-
            select(Q, Us, Us1),
            \+ attack(Q, 1, Ps),
            queens(Us1, [Q|Ps], Qs).

          attack(X, N, [Y|_]) :- X is Y + N.
          attack(X, N, [Y|_]) :- X is Y - N.
          attack(X, N, [_|Ys]) :-
            N1 is N + 1,
            attack(X, N1, Ys).
        `;
        const program = Program.parseSources([{ text, filename: 'recursive-search.pl' }]);
        const attack = program.findGroup('attack', 3);
        assertEqual(Boolean(attack), true, 'attack/3 group exists');
        assertEqual(attack.tabled, true, 'attack/3 tabled');
        assertEqual(attack.recursive, true, 'attack/3 recursive');
        assertEqual(attack.tableInputPositions.join(','), '2', 'diagonal scan uses the placed rows as input');
        const queens = program.findGroup('queens', 3);
        assertEqual(Boolean(queens), true, 'queens/3 group exists');
        assertEqual(queens.tabled, true, 'queens/3 tabled');
        assertEqual(queens.recursive, true, 'queens/3 recursive');
      },
    },
    {
      name: 'collatz example keeps recursive trajectory predicate tabled',
      run: () => {
        const text = fs.readFileSync(path.join(packageRoot, 'examples', 'collatz-1000.pl'), 'utf8');
        const program = Program.parseSources([{ text, filename: 'collatz-1000.pl' }]);
        const group = program.findGroup('collatz', 2);
        assertEqual(Boolean(group), true, 'collatz/2 group exists');
        assertEqual(group.tabled, true, 'collatz/2 tabled');
        assertEqual(group.recursive, true, 'collatz/2 recursive');
        assertEqual(group.tableInputPositions.join(','), '0', 'collatz uses its numeric seed as input');
      },
    },
    {
      name: 'collatz example remains stack-safe for browser-sized stacks',
      run: () => {
        // Use a deliberately tiny stack to catch browser-worker recursion regressions.
        const source = fs.readFileSync(path.join(packageRoot, 'examples', 'collatz-1000.pl'), 'utf8');
        const goalArgs = goalsFromSource(source).flatMap((goal) => ['--goal', goal]);
        const result = spawnSync(process.execPath, ['--stack-size=100', bin, ...goalArgs, 'examples/collatz-1000.pl'], {
          cwd: packageRoot,
          encoding: 'utf8',
        });
        assertEqual(result.status, 0, `exit status${result.stderr ? `\nstderr: ${result.stderr}` : ''}`);
        assertEqual(result.stderr, '', 'stderr');
        assertIncludes(result.stdout, 'collatzTrajectory(1000, [1000, 500, 250, 125', 'stdout');
        assertIncludes(result.stdout, 'collatzTrajectory(1, [1]).\n', 'stdout');
      },
    },
  ];
}

function runSection(reporter, name, cases) {
  reporter.section(name);
  for (const testCase of cases) reporter.test(testCase.name, testCase.run);
  reporter.sectionTotal(sectionLabel(name));
}

function sectionLabel(name) {
  if (name === 'Documentation sync') return 'documentation sync';
  if (name === 'API') return 'API';
  if (name === 'White-box') return 'white-box';
  return name.toLowerCase();
}

function bookReferenceDocumentationIssues() {
  const book = fs.readFileSync(path.join(packageRoot, 'the-art-of-eyeprolog.md'), 'utf8');
  const guide = fs.readFileSync(path.join(testRoot, 'conformance', 'README.md'), 'utf8');
  const issues = [];

  if (!book.includes('This book is also the reference for the EyeProlog implementation.')) {
    issues.push('book introduction does not identify itself as the reference');
  }
  if (!book.includes('This book is the single reference for the EyeProlog implementation.')) {
    issues.push('book Chapter 42 does not state the single-reference policy');
  }
  for (const standard of [
    'ISO/IEC 13211-1:1995',
    'Technical Corrigendum 1:2007',
    'Technical Corrigendum 2:2012',
    'Technical Corrigendum 3:2017',
  ]) {
    if (!book.includes(standard)) issues.push(`book does not identify standards baseline: ${standard}`);
  }
  if (!book.includes('EyeProlog performs it consistently for ordinary\nunification as well as `unify_with_occurs_check/2`.')) {
    issues.push('book glossary does not match finite-tree unification');
  }
  if (book.includes('EyeProlog does not perform it.')) {
    issues.push('book contradicts implementation occurs-check behavior');
  }
  for (const heading of ['## 38. Language and ISO profile', '## 39. Built-in predicates by programming role', '## 40. Running EyeProlog: command line and corpus']) {
    if (!book.includes(heading)) issues.push(`book is missing ${heading}`);
  }
  if (!guide.includes('[*The Art of EyeProlog*](../../the-art-of-eyeprolog.md) is the reference')) {
    issues.push('test guide does not identify the book as the reference');
  }
  if (!guide.includes('not a separate\nlanguage specification')) {
    issues.push('test guide presents the suite as a separate specification');
  }

  return issues;
}

function runWhy({ program, goalText, expected }) {
  program = withStandardModules(program);
  const programFile = path.join(tmp, `${++tmpCounter}.pl`);
  fs.writeFileSync(programFile, program);
  const goal = parseGoalText(goalText);
  const parsed = Program.parseSources([{ text: program, filename: path.basename(programFile) }], { sourceMetadata: true });
  const result = runEyeProlog(parsed, { proof: true, goal });
  const expectedText = expected.replaceAll('__FILE__', path.basename(programFile));
  assertEqual(result.stdout, expectedText, 'stdout');

  Program.parse(result.stdout);
  assertIncludes(result.stdout, '  proof(\n', 'stdout');
  assertIncludes(result.stdout, ' by(rule("', 'stdout');
  assertIncludes(result.stdout, ', clause(', 'stdout');
  assertNotIncludes(result.stdout, 'source(head(', 'stdout');
  assertIncludes(result.stdout, '\n).\n\n', 'stdout');
}

function runWhyLoose({ program, goalText }) {
  program = withStandardModules(program);
  const programFile = path.join(tmp, `${++tmpCounter}.pl`);
  fs.writeFileSync(programFile, program);
  const goal = parseGoalText(goalText);
  const parsed = Program.parseSources([{ text: program, filename: path.basename(programFile) }], { sourceMetadata: true });
  const result = runEyeProlog(parsed, { proof: true, goal });
  Program.parse(result.stdout);
  assertIncludes(result.stdout, '\n).\n\n', 'stdout');
  return result;
}

function listExampleNames() {
  return fs.readdirSync(path.join(packageRoot, 'examples'))
    .filter((name) => name.endsWith('.pl'))
    .map((name) => name.slice(0, -3))
    .sort();
}

function listGoldenExampleNames() {
  return fs.readdirSync(path.join(packageRoot, 'examples', 'output'))
    .filter((name) => name.endsWith('.pl'))
    .map((name) => name.slice(0, -3))
    .sort();
}

function exampleCorpusSyncIssues() {
  const examples = listExampleNames();
  const issues = arrayDiffMessages(listGoldenExampleNames(), examples, 'examples/output');
  const checks = [
    {
      file: path.join(packageRoot, 'the-art-of-eyeprolog.md'),
      pattern: /top-level directory contains \*\*(\d+) self-contained runnable programs\*\*/,
    },
  ];
  for (const check of checks) {
    const relative = path.relative(packageRoot, check.file);
    const match = fs.readFileSync(check.file, 'utf8').match(check.pattern);
    if (match == null) {
      issues.push(`${relative}: runnable example count not found`);
    } else if (Number(match[1]) !== examples.length) {
      issues.push(`${relative}: runnable example count ${match[1]} != ${examples.length}`);
    }
  }
  return issues.sort();
}


function proofCorpusSyncIssues() {
  const proofDir = path.join(packageRoot, 'examples', 'proof');
  const goldens = fs.readdirSync(proofDir)
    .filter((name) => name.endsWith('.pl'))
    .sort();
  const configured = [...proofExamples].sort();
  const issues = arrayDiffMessages(configured, goldens, 'proof example runner');
  for (const name of goldens) {
    if (!fs.existsSync(path.join(packageRoot, 'examples', name))) {
      issues.push(`examples/proof/${name}: source example is missing`);
    }
  }
  const checks = [
    {
      file: path.join(packageRoot, 'the-art-of-eyeprolog.md'),
      pattern: /\*\*(\d+) selected programs\*\* have a checked/,
    },
  ];
  for (const check of checks) {
    const relative = path.relative(packageRoot, check.file);
    const match = fs.readFileSync(check.file, 'utf8').match(check.pattern);
    if (match == null) {
      issues.push(`${relative}: proof example count not found`);
    } else if (Number(match[1]) !== goldens.length) {
      issues.push(`${relative}: proof example count ${match[1]} != ${goldens.length}`);
    }
  }
  return issues.sort();
}

function bookExampleCatalogIssues() {
  const book = fs.readFileSync(path.join(packageRoot, 'the-art-of-eyeprolog.md'), 'utf8');
  const section = between(book, '### Further examples', '## 42. Standards, limits, and implementation boundaries');
  const names = [...section.matchAll(/github\.com\/eyereasoner\/eyeprolog\/blob\/main\/examples\/([A-Za-z0-9_-]+)\.pl/g)]
    .map((match) => match[1]);
  const issues = [];
  if (names.length === 0) issues.push('no source example links found');
  for (const name of names) {
    if (!fs.existsSync(path.join(packageRoot, "examples", name + ".pl"))) issues.push("missing examples/" + name + ".pl");
    if (!fs.existsSync(path.join(packageRoot, "examples", "output", name + ".pl"))) issues.push("missing examples/output/" + name + ".pl");
  }
  return [...new Set(issues)].sort();
}

function playgroundExampleIssues() {
  const issues = [];
  const expected = listExampleNames();
  const html = fs.readFileSync(path.join(packageRoot, 'playground.html'), 'utf8');
  const match = html.match(/const EXAMPLES = (\[[\s\S]*?\]);/);
  if (match == null) return ['playground EXAMPLES array not found'];
  const examples = JSON.parse(match[1]).sort();
  issues.push(...arrayDiffMessages(examples, expected, 'playground EXAMPLES'));
  if (!html.includes('new URL(`./examples/${name}.pl`, location.href)')) {
    issues.push('playground must load selected examples from relative ./examples/*.pl URLs');
  }
  if (!html.includes("fetch(exampleUrl, { cache: 'no-store' })")) {
    issues.push('playground must fetch selected example source from its relative URL');
  }
  return issues.sort();
}

function playgroundStaticIssues() {
  const issues = [];
  const playgroundPath = path.join(packageRoot, 'playground.html');
  const html = fs.readFileSync(playgroundPath, 'utf8');
  const readme = fs.readFileSync(path.join(packageRoot, 'README.md'), 'utf8');
  if (!pkg.files?.includes('playground.html')) issues.push('package files must include playground.html');
  if (!readme.includes('[Playground](https://eyereasoner.github.io/eyeprolog/playground)')) issues.push('README must link to the GitHub Pages playground URL');
  if (!html.includes('<meta name="viewport" content="width=device-width, initial-scale=1">')) issues.push('missing mobile viewport meta');
  if (!html.includes('main {') || !html.includes('display: block;')) {
    issues.push('playground must use a simple vertical layout');
  }
  if (!html.includes('@media (max-width: 560px)') || !html.includes('button,') || !html.includes('width: 100%')) {
    issues.push('playground must make controls usable at phone widths');
  }
  if (!html.includes('<summary id="advanced-heading">⚙ Advanced configuration</summary>')) {
    issues.push('playground must keep URL/proof controls inside advanced configuration');
  }
  if (!html.includes('id="load-background"') || !html.includes('backgroundSource') || !html.includes('combinedSource()')) {
    issues.push('playground must support loading URL content as background knowledge');
  }
  if (!html.includes('HIGHLIGHT_LIMIT') || !html.includes('text.length > HIGHLIGHT_LIMIT')) {
    issues.push('playground must avoid full syntax coloring for very large examples');
  }
  if (!html.includes('<script type="module">')) issues.push('playground script must be an ES module');
  if (!html.includes("new URL('./src/playground-worker.js?playground=")) issues.push('playground must cache-bust its dedicated module worker');
  if (!html.includes("new Worker(workerUrl, { type: 'module' })")) issues.push('playground must launch the dedicated module worker');
  const workerText = fs.readFileSync(path.join(packageRoot, 'src', 'playground-worker.js'), 'utf8');
if (!workerText.includes("from './index.js?playground=") ||
      !workerText.includes('createEyePrologRegistry') ||
      !workerText.includes('executePlaygroundRequest')) {
    issues.push('playground worker must install the EyeProlog library registry');
  }
  if (fs.existsSync(path.join(packageRoot, 'src', 'portable-library.js'))) {
    issues.push('obsolete portable-library.js must be absent');
  }
  for (const filename of ['src/playground-worker.js', 'src/index.js', 'src/program.js', 'src/io.js']) {
    const sourceText = fs.readFileSync(path.join(packageRoot, filename), 'utf8');
    if (/^\s*import\s+[^('\"]*['\"]node:/m.test(sourceText)) {
      issues.push(`${filename} must not statically import Node built-ins in the browser graph`);
    }
  }
  const platformText = fs.readFileSync(path.join(packageRoot, 'src', 'platform.js'), 'utf8');
  if (!platformText.includes("await import('node:fs')") || !platformText.includes("await import('node:path')")) {
    issues.push('browser platform bridge must guard Node built-ins behind dynamic imports');
  }
  if (!html.includes('activeWorker.onmessageerror') || !html.includes('Serve the checkout over HTTP(S)')) {
    issues.push('playground must report actionable worker startup and message errors');
  }
  if (!html.includes('class="editor"') || !html.includes('id="highlight"') || !html.includes('id="source"')) {
    issues.push('playground must include layered syntax-colored editor');
  }
  if (!html.includes('--editor-bg: #ffffff') || !html.includes('background: var(--editor-bg)')) {
    issues.push('playground editor must use a light editor background');
  }
  if (!html.includes('id="error-line-marker"') || !html.includes('extractParseErrorLine') || !html.includes('markSyntaxErrorLine') || !html.includes('--editor-error-line')) {
    issues.push('playground must highlight syntax-error lines in the editor');
  }
  if (!html.includes('id="line-numbers"') || !html.includes('updateLineNumbers') || !html.includes('lineNumbersInner.style.transform') || !html.includes('--line-number-bg')) {
    issues.push('playground editor must include synced line numbers');
  }
  if (!html.includes('MAX_SHARE_URL_LENGTH') || !html.includes('buildReferenceShareLink') || !html.includes("params.set('example'") || !html.includes("params.set('url'")) {
    issues.push('playground share links must avoid embedding large example or URL-loaded sources');
  }
  if (!html.includes('id="create-gist"') || !html.includes('createGistShare') || !html.includes('GIST_STATE_FILENAME') || !html.includes("fetch('https://api.github.com/gists'")) {
    issues.push('playground must support Gist-backed sharing for large programs');
  }
  if (!html.includes('await createGistShare({') || html.includes('Use “Create Gist share” instead')) {
    issues.push('playground Copy share link must automatically fall back to Gist sharing for large programs');
  }
  if (!html.includes("params.has('state-url')") || !html.includes('#state-url=')) {
    issues.push('playground must restore state from raw Gist state URLs');
  }
  if (!html.includes('id="example-search"') || !html.includes('id="examples"')) issues.push('playground must include searchable examples');
  const scriptMatch = html.match(new RegExp('<script type="module">\\n([\\s\\S]*?)\\n  <\\/script>'));
  if (scriptMatch == null) {
    issues.push('module script not found');
  } else {
    const scriptFile = path.join(tmp, 'playground-script.mjs');
    fs.writeFileSync(scriptFile, scriptMatch[1]);
    const result = spawnSync(process.execPath, ['--check', scriptFile], { encoding: 'utf8' });
    if (result.status !== 0) issues.push(`playground module syntax check failed: ${result.stderr.trim()}`);
  }
  return issues.sort();
}

function registeredBuiltinNames() {
  return [...createDefaultRegistry().defs.keys()].sort();
}

function registeredEyePrologLibraryNames() {
  return [...eyePrologLibraryIndicators].sort();
}

function registeredNativeEyePrologLibraryNames() {
  return [...eyePrologNativeLibraryIndicators].sort();
}

function registeredBuiltinSummary() {
  const names = registeredBuiltinNames();
  return {
    entries: names.length,
    names: new Set(names.map((name) => name.split('/')[0])).size,
  };
}

function bookBuiltinNames() {
  const book = fs.readFileSync(path.join(packageRoot, 'the-art-of-eyeprolog.md'), 'utf8');
  return documentedBuiltinNames(between(book, '## 39. Built-in predicates by programming role', '### The EyeProlog library'), 2);
}

function bookEyePrologLibraryNames() {
  const book = fs.readFileSync(path.join(packageRoot, 'the-art-of-eyeprolog.md'), 'utf8');
  return documentedBuiltinNames(between(book, '<!-- eyeprolog-library-catalog:start -->', '<!-- eyeprolog-library-catalog:end -->'), 2);
}

function bookBuiltinSummary() {
  const book = fs.readFileSync(path.join(packageRoot, 'the-art-of-eyeprolog.md'), 'utf8');
  const match = book.match(/(?:registers|contains) (\d+) name\/arity entries across (\d+) names/);
  if (match == null) throw new Error('book builtin summary not found');
  return { entries: Number(match[1]), names: Number(match[2]) };
}

function documentedBuiltinNames(section, catalogColumn) {
  const names = [];
  for (const line of section.split('\n')) {
    if (!line.trim().startsWith('|') || !line.includes('`')) continue;
    const catalogCell = line.split('|')[catalogColumn] ?? '';
    for (const match of catalogCell.matchAll(/`([A-Za-z_][A-Za-z0-9_]*)\(([^`)]*)\)`/g)) {
      const arity = match[2].trim() === '' ? 0 : match[2].split(',').length;
      names.push(`${match[1]}/${arity}`);
    }
    for (const match of catalogCell.matchAll(/`([^`\s]+)\/(\d+)`/g)) {
      names.push(`${match[1]}/${match[2]}`);
    }
  }
  return [...new Set(names)].sort();
}

function runtimeExportNames() {
  return Object.keys(publicApi).sort();
}

function runtimeDefaultExportNames() {
  return Object.keys(publicDefaultApi).sort();
}

function declaredValueExportNames() {
  const dts = fs.readFileSync(path.join(packageRoot, 'index.d.ts'), 'utf8');
  return [...dts.matchAll(/^export\s+(?:declare\s+)?(?:class|function|const)\s+([A-Za-z_][A-Za-z0-9_]*)/gm)]
    .map((match) => match[1])
    .filter((name, index, names) => names.indexOf(name) === index)
    .sort();
}

function declaredDefaultExportNames() {
  const dts = fs.readFileSync(path.join(packageRoot, 'index.d.ts'), 'utf8');
  const declaration = dts.match(/declare const eyeprolog: \{([\s\S]*?)\n\};/);
  if (declaration == null) throw new Error('default export declaration not found');
  return [...declaration[1].matchAll(/^\s+([A-Za-z_][A-Za-z0-9_]*): typeof /gm)]
    .map((match) => match[1])
    .sort();
}

function missingDocumentedPackageScripts() {
  const docs = documentationFiles();
  const missing = [];
  const nativeCommands = new Set(['exec', 'install', 'link']);
  for (const file of docs) {
    const text = fs.readFileSync(file, 'utf8');
    for (const line of text.split('\n')) {
      const trimmed = line.trim();
      const commandTexts = [];
      if (trimmed.startsWith('npm ')) commandTexts.push(trimmed);
      for (const match of line.matchAll(/`([^`]*\bnpm\s+[^`]*)`/g)) commandTexts.push(match[1].trim());
      for (const commandText of commandTexts) {
        const match = commandText.match(/^npm\s+(?:run\s+)?([A-Za-z0-9:_-]+)/);
        if (match == null) continue;
        const command = match[1];
        if (nativeCommands.has(command)) continue;
        const script = command === 'test' ? 'test' : command;
        if (!pkg.scripts?.[script]) missing.push(`${path.relative(packageRoot, file)}: npm ${command === 'test' ? 'test' : `run ${script}`}`);
      }
    }
  }
  return [...new Set(missing)].sort();
}

function misleadingDependencyInstallDocs() {
  const misleading = [];
  for (const file of documentationFiles()) {
    const text = fs.readFileSync(file, 'utf8');
    if (text.includes('Install dependencies')) misleading.push(`${path.relative(packageRoot, file)}: Install dependencies`);
    if (text.includes('npm install\n```') || text.includes('npm install\r\n```')) {
      misleading.push(`${path.relative(packageRoot, file)}: bare npm install setup block`);
    }
  }
  return [...new Set(misleading)].sort();
}

function documentationSourceStyleIssues() {
  const issues = [];
  const file = path.join(packageRoot, 'the-art-of-eyeprolog.md');
  const text = fs.readFileSync(file, 'utf8');
  if (text.includes('```prolog')) {
    issues.push('the-art-of-eyeprolog.md: use eyeprolog code fences instead of prolog fences');
  }
  if (/\bv\d+\.\d+(?:\.\d+)?\b/i.test(text)) {
    issues.push('the-art-of-eyeprolog.md: describe the current system instead of release chronology');
  }
  for (const block of text.matchAll(/^```eyeprolog\s*\n([\s\S]*?)^```\s*$/gm)) {
    if (/^\s*(?:eyeprolog|node|npm)\b/m.test(block[1])) {
      issues.push('the-art-of-eyeprolog.md: keep host commands outside eyeprolog code fences');
    }
  }
  return issues;
}

function findBrokenDocLinks() {
  const broken = [];
  const anchorsByFile = new Map();
  for (const file of documentationFiles()) {
    const text = fs.readFileSync(file, 'utf8');
    for (const target of markdownLinkTargets(text)) {
      if (/^(?:https?:|mailto:)/i.test(target)) continue;
      const [targetPathRaw, fragmentRaw] = target.split('#');
      const targetPath = targetPathRaw === '' ? file : path.resolve(path.dirname(file), decodeURI(targetPathRaw));
      const display = `${path.relative(packageRoot, file)} -> ${target}`;
      if (!fs.existsSync(targetPath)) {
        broken.push(`${display} (missing target)`);
        continue;
      }
      if (fragmentRaw != null && fragmentRaw !== '') {
        const anchors = anchorsByFile.get(targetPath) ?? markdownAnchors(targetPath);
        anchorsByFile.set(targetPath, anchors);
        if (!anchors.has(fragmentRaw)) broken.push(`${display} (missing heading #${fragmentRaw})`);
      }
    }
  }
  return broken.sort();
}

function documentationFiles() {
  return listMarkdownFiles(packageRoot);
}

function listMarkdownFiles(directory) {
  return fs.readdirSync(directory, { withFileTypes: true }).flatMap((entry) => {
    if (entry.name === 'node_modules' || entry.name === '.git') return [];
    const target = path.join(directory, entry.name);
    if (entry.isDirectory()) return listMarkdownFiles(target);
    return entry.name.endsWith('.md') ? [target] : [];
  }).sort();
}

function documentedConformanceMetricIssues() {
  const report = buildConformanceReport();
  const iso = report.rows.find((row) => row.category === 'iso')?.total;
  const total = report.total.total;
  const checks = [
    {
      file: path.join(packageRoot, 'the-art-of-eyeprolog.md'),
      pattern: /contains (\d+) cases, including (\d+) focused ISO\s+cases/,
      expected: [total, iso],
      labels: ['total', 'ISO'],
    },
    {
      file: path.join(packageRoot, 'test', 'conformance', 'README.md'),
      pattern: /corpus has (\d+) cases in `iso\/` and (\d+) file-based conformance cases/,
      expected: [iso, total],
      labels: ['ISO', 'total'],
    },
  ];
  const issues = [];
  for (const check of checks) {
    const relative = path.relative(packageRoot, check.file);
    const match = fs.readFileSync(check.file, 'utf8').match(check.pattern);
    if (match == null) {
      issues.push(`${relative}: conformance totals not found`);
      continue;
    }
    for (let i = 0; i < check.expected.length; i++) {
      const actual = Number(match[i + 1]);
      if (actual !== check.expected[i]) {
        issues.push(`${relative}: ${check.labels[i]} count ${actual} != ${check.expected[i]}`);
      }
    }
  }
  return issues.sort();
}

function markdownLinkTargets(text) {
  const markdown = [...text.matchAll(/!?\[[^\]\n]*\]\(([^)\s]+)(?:\s+"[^"]*")?\)/g)]
    .map((match) => match[1]);
  const html = [...text.matchAll(/\b(?:src|href)="([^"]+)"/g)]
    .map((match) => match[1]);
  return [...markdown, ...html];
}

function bookIntroOutputIssues() {
  const book = fs.readFileSync(path.join(packageRoot, 'the-art-of-eyeprolog.md'), 'utf8');
  const match = book.match(/The (?:first|EyeProlog) command should print:\s*```text\n([\s\S]*?)```/);
  if (match == null) return ['the-art-of-eyeprolog.md: introductory output block not found'];
  const documented = `${match[1].trimEnd()}\n`;
  const expected = fs.readFileSync(path.join(packageRoot, 'examples', 'output', 'socrates.pl'), 'utf8');
  return documented === expected
    ? []
    : ['the-art-of-eyeprolog.md: introductory Socrates output differs from examples/output/socrates.pl'];
}

function documentedPublicApiImportIssues() {
  const exported = new Set(runtimeExportNames());
  const issues = [];
  for (const file of documentationFiles()) {
    const text = fs.readFileSync(file, 'utf8');
    for (const block of text.matchAll(/^```js\s*\n([\s\S]*?)^```\s*$/gm)) {
      for (const imported of block[1].matchAll(/import\s*\{([\s\S]*?)\}\s*from\s*['"]eyeprolog['"]/g)) {
        for (const item of imported[1].split(',')) {
          const name = item.trim().split(/\s+as\s+/)[0];
          if (name && !exported.has(name)) {
            issues.push(`${path.relative(packageRoot, file)}: imports undocumented public name ${name}`);
          }
        }
      }
    }
  }
  return issues.sort();
}

function markdownAnchors(file) {
  if (!file.endsWith('.md')) return new Set();
  const text = fs.readFileSync(file, 'utf8');
  const anchors = new Set();
  const counts = new Map();
  for (const match of text.matchAll(/^#{1,6}\s+(.+)$/gm)) {
    const base = githubSlug(match[1]);
    const count = counts.get(base) ?? 0;
    counts.set(base, count + 1);
    anchors.add(count === 0 ? base : `${base}-${count}`);
  }
  return anchors;
}

function githubSlug(heading) {
  return heading
    .replace(/`([^`]*)`/g, '$1')
    .replace(/<[^>]+>/g, '')
    .trim()
    .toLowerCase()
    .replace(/[^\p{Letter}\p{Number}\s-]/gu, '')
    .trim()
    .replace(/\s+/g, '-');
}

function between(text, startMarker, endMarker) {
  const start = text.indexOf(startMarker);
  if (start === -1) throw new Error(`${startMarker} not found`);
  const contentStart = start + startMarker.length;
  const end = text.indexOf(endMarker, contentStart);
  if (end === -1) throw new Error(`${endMarker} not found`);
  return text.slice(contentStart, end);
}

function shellQuote(value) {
  return `'${String(value).replaceAll("'", "'\"'\"'")}'`;
}

let utilLinuxScriptAvailable = null;

function hasUtilLinuxScript() {
  if (process.platform === 'win32') return false;
  if (utilLinuxScriptAvailable == null) {
    const available = spawnSync('sh', ['-c',
      'command -v script >/dev/null 2>&1 && script --version 2>/dev/null | grep -qi util-linux']);
    utilLinuxScriptAvailable = available.status === 0;
  }
  return utilLinuxScriptAvailable;
}

function runScriptedRepl(steps, { timeout = 5000 } = {}) {
  const command = `${shellQuote(process.execPath)} ${shellQuote(bin)}`;
  const payload = Buffer.from(JSON.stringify({
    command,
    cwd: packageRoot,
    steps,
    timeout,
  })).toString('base64');
  const helper = String.raw`
const { spawn } = require('node:child_process');
const config = JSON.parse(Buffer.from(process.env.EYEPROLOG_REPL_SCRIPT, 'base64').toString('utf8'));
const child = spawn('script', ['-qefc', config.command, '/dev/null'], {
  cwd: config.cwd,
  stdio: ['pipe', 'pipe', 'pipe'],
});
let stdout = '';
let stderr = '';
let cursor = 0;
let step = 0;
let finished = false;

function advance() {
  while (step < config.steps.length) {
    const current = config.steps[step];
    const index = stdout.indexOf(current.waitFor, cursor);
    if (index === -1) return;
    cursor = index + current.waitFor.length;
    child.stdin.write(current.send);
    step++;
  }
}

child.stdout.on('data', (chunk) => {
  stdout += chunk;
  advance();
});
child.stderr.on('data', (chunk) => {
  stderr += chunk;
});

const timer = setTimeout(() => {
  if (finished) return;
  finished = true;
  child.kill('SIGKILL');
  process.stdout.write(JSON.stringify({ status: null, stdout, stderr, timedOut: true, step }));
}, config.timeout);

child.on('close', (status, signal) => {
  if (finished) return;
  finished = true;
  clearTimeout(timer);
  process.stdout.write(JSON.stringify({ status, signal, stdout, stderr, timedOut: false, step }));
});
`;
  const helperResult = spawnSync(process.execPath, ['-e', helper], {
    cwd: packageRoot,
    encoding: 'utf8',
    env: { ...process.env, EYEPROLOG_REPL_SCRIPT: payload },
    timeout: timeout + 1000,
  });
  if (helperResult.error) return helperResult;
  if (helperResult.status !== 0) return helperResult;
  let result;
  try {
    result = JSON.parse(helperResult.stdout);
  } catch (error) {
    return {
      ...helperResult,
      error: new Error(`interactive REPL helper returned invalid JSON: ${error.message}`),
    };
  }
  return {
    status: result.status,
    stdout: result.stdout,
    stderr: `${result.stderr ?? ''}${helperResult.stderr ?? ''}`,
    error: result.timedOut
      ? Object.assign(new Error(`interactive REPL timed out after step ${result.step}`), { code: 'ETIMEDOUT' })
      : undefined,
  };
}

function runCli(args, options = {}) {
  return spawnSync(process.execPath, [bin, ...args], {
    cwd: packageRoot,
    encoding: 'utf8',
    env: options.env ? { ...process.env, ...options.env } : process.env,
    input: options.input ?? undefined,
    timeout: options.timeout ?? undefined,
  });
}

function arrayDiffMessages(actual, expected, label) {
  const messages = [];
  const actualSet = new Set(actual);
  const expectedSet = new Set(expected);
  for (const item of expected) if (!actualSet.has(item)) messages.push(`${label} missing ${item}`);
  for (const item of actual) if (!expectedSet.has(item)) messages.push(`${label} has unexpected ${item}`);
  if (new Set(actual).size !== actual.length) messages.push(`${label} has duplicate entries`);
  return messages;
}

function assertArrayEqual(actual, expected, label) {
  const actualText = actual.join('\n');
  const expectedText = expected.join('\n');
  if (actualText !== expectedText) {
    const onlyActual = actual.filter((item) => !expected.includes(item));
    const onlyExpected = expected.filter((item) => !actual.includes(item));
    throw new Error(`${label} mismatch\nonly actual: ${format(onlyActual)}\nonly expected: ${format(onlyExpected)}`);
  }
}

function format(value) {
  return typeof value === 'string' ? JSON.stringify(value) : String(value);
}

if (isMainModule(import.meta.url)) {
  await runStandalone((reporter) => runRegression(reporter, process.argv[2] ?? null));
}
