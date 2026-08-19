#!/usr/bin/env node
// Release gate for the ISO/IEC 13211-1 strict-core execution profile.
// This is intentionally separate from the broader `iso/` corpus because that
// corpus also exercises Part 2 modules and Part 3 grammar rules.
import {
  Program,
  Solver,
  Env,
  createStrictIsoRegistry,
  parseGoalText,
  run,
} from '../src/index.js';
import { TestReporter, isMainModule } from './test-style.mjs';

export function runIsoStrict(reporter = new TestReporter()) {
  reporter.section('Strict ISO core');

  reporter.test('executes ordinary Part 1 clauses', () => {
    const result = run('p(X) :- X = 1.\n', { isoStrict: true, goal: 'p(1)' });
    equal(result.stdout, 'p(1).\n', 'stdout');
  });

  reporter.test('keeps Corrigendum 2 core predicates and excludes Part 3 phrase', () => {
    const registry = createStrictIsoRegistry();
    equal(Boolean(registry.get('subsumes_term', 2)), true, 'subsumes_term/2');
    equal(Boolean(registry.get('term_variables', 2)), true, 'term_variables/2');
    equal(Boolean(registry.get('call', 2)), true, 'call/2');
    equal(Boolean(registry.get('false', 0)), true, 'false/0');
    equal(Boolean(registry.get('phrase', 2)), false, 'phrase/2');
    equal(Boolean(registry.get('phrase', 3)), false, 'phrase/3');
  });

  reporter.test('exposes only ISO core Prolog flags', () => {
    const solver = new Solver(Program.parse('', { isoStrict: true }), { isoStrict: true });
    equal(solver.prologFlags.has('occurs_check'), false, 'occurs_check');
    equal(solver.prologFlags.get('unknown')?.value?.name, 'error', 'unknown default');
  });

  reporter.test('uses the Part 1 predefined operator table', () => {
    const program = Program.parse('', { isoStrict: true });
    equal(program.operators.has('fx\u0000?-'), true, 'fx ?-');
    equal(program.operators.has('xfx\u0000?-'), false, 'xfx ?-');
  });

  reporter.test('rejects EyeProlog module directives', () => {
    const error = capture(() => Program.parse(':- use_module(library(lists)).\n', { isoStrict: true }));
    includes(error.message, 'implementation-specific directive use_module/1', 'message');
  });

  reporter.test('does not expand Part 3 grammar rules', () => {
    const program = Program.parse('sentence --> [a].\n', { isoStrict: true });
    equal(Boolean(program.findGroup('-->', 2)), true, '-->/2');
    equal(Boolean(program.findGroup('sentence', 2)), false, 'sentence/2');
  });

  reporter.test('rejects clauses for standardized built-ins', () => {
    const error = capture(() => Program.parse('true.\n', { isoStrict: true }));
    equal(error.formal, 'permission_error(modify, static_procedure)', 'formal error');
  });

  reporter.test('keeps static procedures private to clause/2', () => {
    const program = Program.parse('p.\n', { isoStrict: true });
    const solver = new Solver(program, { isoStrict: true });
    const error = capture(() => [...solver.solve([
      parseGoalText('clause(p,B)', { isoStrict: true }),
    ], new Env(), 0)]);
    equal(error.formal, 'permission_error(access, private_procedure)', 'formal error');
  });

  reporter.test('keeps dynamic procedures public to clause/2', () => {
    const program = Program.parse(':- dynamic(p/0).\np.\n', { isoStrict: true });
    const solver = new Solver(program, { isoStrict: true });
    const answers = [...solver.solve([
      parseGoalText('clause(p,B)', { isoStrict: true }),
    ], new Env(), 0)];
    equal(answers.length, 1, 'answer count');
  });

  reporter.test('disables automatic tabling and recursion guards', () => {
    const group = Program.parse('p :- p.\n', { isoStrict: true }).findGroup('p', 0);
    equal(group?.recursive, false, 'recursive planner');
    equal(group?.tabled, false, 'tabled planner');
  });

  reporter.sectionTotal('strict ISO core');
}

function capture(fn) {
  try {
    fn();
  } catch (error) {
    return error;
  }
  throw new Error('expected an error');
}

function equal(actual, expected, label) {
  if (actual !== expected) throw new Error(`${label}: expected ${String(expected)}, got ${String(actual)}`);
}

function includes(actual, expected, label) {
  if (!String(actual).includes(expected)) throw new Error(`${label}: ${String(actual)} did not include ${expected}`);
}

if (isMainModule(import.meta.url)) {
  const reporter = new TestReporter();
  try {
    runIsoStrict(reporter);
    reporter.totalLine();
  } catch (_) {
    process.exit(1);
  }
}
