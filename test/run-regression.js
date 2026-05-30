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
import {
  run,
  Program,
  makeProgram,
  Solver,
  Env,
  BuiltinRegistry,
  createDefaultRegistry,
  atom,
  compound,
  listFromItems,
  numberTerm,
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
  parseQueryGoal,
} from '../src/index.js';
import { selectClauseCandidates } from '../src/program.js';
import { TestReporter, isMainModule } from './test-style.js';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const bin = path.join(root, 'bin', 'see');
const pkg = JSON.parse(fs.readFileSync(path.join(root, 'package.json'), 'utf8'));
let tmp = null;
let tmpCounter = 0;

export function runRegression(reporter = new TestReporter()) {
  tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'see-regression.'));
  tmpCounter = 0;

  try {
    runSection(reporter, 'Regression', regressionCases());
    runSection(reporter, 'API', apiCases());
    runSection(reporter, 'White-box', whiteBoxCases());
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
    tmp = null;
  }
}

function regressionCases() {
  return [
    {
      name: 'why rule fact proof facts',
      run: () => runWhy({
        program: 'type(socrates, man).\ntype(X, mortal) :- type(X, man).\n',
        query: 'type(socrates, mortal)',
        expected: `type(socrates, mortal).
why(
  type(socrates, mortal),
  proof(
    id(p1), goal(type(socrates, mortal)), method(rule(2)),
    source(head(type(v("X"), mortal)), body([type(v("X"), man)])),
    bindings([binding("X", socrates)]),
    uses([
      proof(
        id(p2), goal(type(socrates, man)), method(fact(1)),
        source(head(type(socrates, man)), body([])),
        bindings([]),
        uses([])
      )
    ])
  )
).

`,
      }),
    },
    {
      name: 'why numeric builtin proof facts',
      run: () => runWhy({
        program: 'p(X) :- between(4, 1000, X).\n',
        query: 'p(536)',
        expected: `p(536).
why(
  p(536),
  proof(
    id(p1), goal(p(536)), method(rule(1)),
    source(head(p(v("X"))), body([between(4, 1000, v("X"))])),
    bindings([binding("X", 536)]),
    uses([
      proof(
        id(p2), goal(between(4, 1000, 536)), method(builtin(between, 3)),
        source(head(between(4, 1000, 536)), body([])),
        bindings([]),
        uses([])
      )
    ])
  )
).

`,
      }),
    },
    {
      name: 'why list builtin proof facts',
      run: () => runWhy({
        program: 'p(X) :- member(X, [a, b]).\n',
        query: 'p(a)',
        expected: `p(a).
why(
  p(a),
  proof(
    id(p1), goal(p(a)), method(rule(1)),
    source(head(p(v("X"))), body([member(v("X"), [a, b])])),
    bindings([binding("X", a)]),
    uses([
      proof(
        id(p2), goal(member(a, [a, b])), method(builtin(member, 2)),
        source(head(member(a, [a, b])), body([])),
        bindings([]),
        uses([])
      )
    ])
  )
).

`,
      }),
    },
    {
      name: 'help with no arguments',
      run: () => {
        const result = runCli([]);
        assertEqual(result.status, 0, 'exit status');
        assertIncludes(result.stdout, 'Usage:\n  see [options] [file-or-url.pl|- ...]', 'stdout');
        assertIncludes(result.stdout, '--query GOAL', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'version comes from package.json',
      run: () => {
        const result = runCli(['--version']);
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, `see ${pkg.version}\n`, 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'stdin input is accepted',
      run: () => {
        const result = runCli(['--query', 'p(X)', '-'], { input: 'p(a).\np(b).\n' });
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'p(a).\np(b).\n', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'double dash permits option-shaped file names',
      run: () => {
        const file = path.join(tmp, '-h');
        fs.writeFileSync(file, 'p(a, b).\nq(X, Y) :- p(X, Y).\n');
        const result = runCli(['--', file]);
        assertEqual(result.status, 0, 'exit status');
        assertEqual(result.stdout, 'q(a, b).\n', 'stdout');
        assertEqual(result.stderr, '', 'stderr');
      },
    },
    {
      name: 'missing query argument fails clearly',
      run: () => {
        const result = runCli(['--query']);
        assertEqual(result.status, 1, 'exit status');
        assertIncludes(result.stderr, 'see: --query requires an argument', 'stderr');
      },
    },
  ];
}

function apiCases() {
  return [
    {
      name: 'run query through public API',
      run: () => {
        const result = run('parent(pat, jan).\nancestor(X, Y) :- parent(X, Y).\n', { query: 'ancestor(pat, Y)' });
        assertEqual(result.stdout, 'ancestor(pat, jan).\n', 'stdout');
      },
    },
    {
      name: 'run materialization through public API',
      run: () => {
        const result = run('p(a, b).\nq(X, Y) :- p(X, Y).\n');
        assertEqual(result.stdout, 'q(a, b).\n', 'stdout');
      },
    },
    {
      name: 'run accepts Program instances',
      run: () => {
        const program = Program.parse('p(a).\np(b).\n');
        const result = run(program, { query: 'p(X)' });
        assertEqual(result.stdout, 'p(a).\np(b).\n', 'stdout');
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
      name: 'program and solver public classes',
      run: () => {
        const program = Program.parse('p(a).\np(b).\n');
        const solver = new Solver(program);
        const goal = parseQueryGoal('p(X)');
        const answers = [...solver.solve([goal], new Env(), 0)].map((env) => termToString(goal, env, true));
        assertEqual(answers.join('\n'), 'p(a)\np(b)', 'answers');
      },
    },
    {
      name: 'solver honors solution limits',
      run: () => {
        const program = Program.parse('p(a).\np(b).\np(c).\n');
        const solver = new Solver(program, { solutionLimit: 2 });
        const goal = parseQueryGoal('p(X)');
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
        const goal = parseQueryGoal('answer(X)');
        const answers = [...solver.solve([goal], new Env(), 0)].map((env) => termToString(goal, env, true));
        assertEqual(answers.join('\n'), 'answer(world)', 'answers');
      },
    },
    {
      name: 'default builtin registry exposes expected metadata',
      run: () => {
        const registry = createDefaultRegistry();
        const between = registry.get('between', 3);
        const append = registry.get('append', 3);
        assertEqual(Boolean(between), true, 'between/3 exists');
        assertEqual(Boolean(append), true, 'append/3 exists');
        assertEqual(between.name, 'between', 'between name');
        assertEqual(append.arity, 3, 'append arity');
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
      name: 'parser preserves list syntax readback',
      run: () => {
        const goal = parseQueryGoal('member(X, [a, b])');
        assertEqual(termToString(goal, new Env(), true), 'member(X, [a, b])', 'goal');
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
        const left = parseQueryGoal('edge(X, Y)');
        const right = parseQueryGoal('edge(A, B)');
        const nonVariant = parseQueryGoal('edge(A, A)');
        assertEqual(variantTerms(left, new Env(), right, new Env()), true, 'variant');
        assertEqual(variantTerms(left, new Env(), nonVariant, new Env()), false, 'non-variant');
      },
    },
    {
      name: 'flattenConjunction preserves left-to-right order',
      run: () => {
        const goal = parseQueryGoal('(a, b, c)');
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
      name: 'clause candidate selection uses scalar indexes with fallback',
      run: () => {
        const program = Program.parse('edge(a, b).\nedge(c, d).\nedge(X, z).\n');
        const group = program.findGroup('edge', 2);
        const goal = parseQueryGoal('edge(a, Y)');
        const candidates = selectClauseCandidates(group, goal, new Env());
        assertEqual(candidates.primary.length, 1, 'primary bucket length');
        assertEqual(candidates.fallback.length, 1, 'fallback length');
        assertEqual(termToString(candidates.primary[0].head, new Env(), true), 'edge(a, b)', 'primary head');
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
  if (name === 'API') return 'API';
  if (name === 'White-box') return 'white-box';
  return name.toLowerCase();
}

function runWhy({ program, query, expected }) {
  const programFile = path.join(tmp, `${++tmpCounter}.pl`);
  fs.writeFileSync(programFile, program);
  const result = runCli(['--why', '--query', query, programFile]);
  assertEqual(result.status, 0, 'exit status');
  assertEqual(result.stderr, '', 'stderr');
  assertEqual(result.stdout, expected, 'stdout');

  Program.parse(result.stdout);
  assertIncludes(result.stdout, '  proof(\n', 'stdout');
  assertIncludes(result.stdout, '    source(head(', 'stdout');
  assertIncludes(result.stdout, '\n).\n\n', 'stdout');
}

function runCli(args, options = {}) {
  return spawnSync(process.execPath, [bin, ...args], {
    cwd: root,
    encoding: 'utf8',
    input: options.input ?? undefined,
  });
}

function assertEqual(actual, expected, label) {
  if (actual !== expected) throw new Error(`${label} mismatch\nexpected: ${format(expected)}\nactual:   ${format(actual)}`);
}

function assertIncludes(actual, expected, label) {
  if (!actual.includes(expected)) throw new Error(`${label} did not include ${format(expected)}\nactual: ${format(actual)}`);
}

function format(value) {
  return typeof value === 'string' ? JSON.stringify(value) : String(value);
}

if (isMainModule(import.meta.url)) {
  const reporter = new TestReporter();
  try {
    runRegression(reporter);
    reporter.totalLine();
  } catch (_) {
    process.exit(1);
  }
}
