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
import { TestReporter, isMainModule, runStandalone } from './test-style.mjs';

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

  reporter.test('unbounded integer profile does not expose max_integer or min_integer values', () => {
    const program = Program.parse('', { isoStrict: true });
    const solver = new Solver(program, { isoStrict: true });
    const answers = (text) => [...solver.solve([parseGoalText(text, { isoStrict: true })], new Env(), 0)].length;
    equal(answers('current_prolog_flag(bounded,false)'), 1, 'bounded=false');
    equal(answers('current_prolog_flag(max_integer,_)'), 0, 'max_integer unavailable');
    equal(answers('current_prolog_flag(min_integer,_)'), 0, 'min_integer unavailable');
  });


  reporter.test('covers the Part 1 flag defaults, value domains, and changeability', () => {
    const program = Program.parse('', { isoStrict: true });
    const solver = new Solver(program, { isoStrict: true });
    const answers = (text) => [...solver.solve([parseGoalText(text, { isoStrict: true })], new Env(), 0)].length;
    for (const goalText of [
      'current_prolog_flag(bounded,false)',
      'current_prolog_flag(integer_rounding_function,toward_zero)',
      'current_prolog_flag(char_conversion,on)',
      'current_prolog_flag(debug,off)',
      'current_prolog_flag(max_arity,unbounded)',
      'current_prolog_flag(unknown,error)',
      'current_prolog_flag(double_quotes,chars)',
    ]) equal(answers(goalText), 1, goalText);

    for (const goalText of [
      'set_prolog_flag(char_conversion,off)',
      'set_prolog_flag(debug,on)',
      'set_prolog_flag(unknown,fail)',
      'set_prolog_flag(double_quotes,codes)',
    ]) run('', { isoStrict: true, goal: goalText });

    equal(capture(() => run('', { isoStrict: true, goal: 'set_prolog_flag(bounded,true)' })).formal,
      'permission_error(modify, flag)', 'bounded valid-but-fixed value');
    equal(capture(() => run('', { isoStrict: true, goal: 'set_prolog_flag(integer_rounding_function,down)' })).formal,
      'permission_error(modify, flag)', 'rounding valid-but-fixed value');
    equal(capture(() => run('', { isoStrict: true, goal: 'set_prolog_flag(max_arity,unbounded)' })).formal,
      'permission_error(modify, flag)', 'max_arity fixed value');
    equal(capture(() => run('', { isoStrict: true, goal: 'set_prolog_flag(max_integer,unbounded)' })).formal,
      'domain_error(flag_value)', 'max_integer has no value when unbounded');
    equal(capture(() => run('', { isoStrict: true, goal: 'set_prolog_flag(unknown,maybe)' })).formal,
      'domain_error(flag_value)', 'unknown value domain');
    equal(capture(() => run('', { isoStrict: true, goal: 'set_prolog_flag(not_a_flag,on)' })).formal,
      'domain_error(prolog_flag)', 'unsupported flag');
  });

  reporter.test('preparation-time char_conversion affects later unquoted source only', () => {
    const program = Program.parse(
      ":- char_conversion(x,y).\np(x).\nquoted('x').\n:- set_prolog_flag(char_conversion,off).\nraw(x).\n",
      { isoStrict: true },
    );
    equal(Boolean(program.findGroup('p', 1)?.clauses.some((clause) => clause.head.args[0]?.name === 'y')), true, 'converted p/1');
    equal(Boolean(program.findGroup('quoted', 1)?.clauses.some((clause) => clause.head.args[0]?.name === 'x')), true, 'quoted atom unchanged');
    equal(Boolean(program.findGroup('raw', 1)?.clauses.some((clause) => clause.head.args[0]?.name === 'x')), true, 'conversion disabled');
  });


  reporter.test('uses a documented 7-bit ASCII processor character set and collation', () => {
    const program = Program.parse('', { isoStrict: true });
    const solver = new Solver(program, { isoStrict: true });
    const answers = (text) => [...solver.solve([parseGoalText(text, { isoStrict: true })], new Env(), 0)].length;
    equal(answers("char_code('\\0\\',0)"), 1, 'NUL collating integer');
    equal(answers("char_code('A',65)"), 1, 'A collating integer');
    equal(answers("char_code('\\177\\',127)"), 1, 'DEL collating integer');
    equal(answers("'\\0\\' @< 'A'"), 1, 'control before capital');
    equal(answers("'A' @< 'a'"), 1, 'capital before small letter');
  });


  reporter.test('follows the Part 1 standard term-type and atom ordering', () => {
    const program = Program.parse('', { isoStrict: true });
    const solver = new Solver(program, { isoStrict: true });
    const answers = (text) => [...solver.solve([parseGoalText(text, { isoStrict: true })], new Env(), 0)].length;
    equal(answers("X @< 1.0"), 1, 'variable before float');
    equal(answers("1.0 @< 1"), 1, 'float before integer');
    equal(answers("1 @< a"), 1, 'integer before atom');
    equal(answers("a @< f(a)"), 1, 'atom before compound');
    equal(answers("'' @< 'A'"), 1, 'null atom first');
    equal(answers("'A' @< 'B'"), 1, 'atom collation');
  });

  reporter.test('rejects characters outside the strict processor character set', () => {
    const sourceError = capture(() => Program.parse("p('é').\n", { isoStrict: true }));
    equal(sourceError.formal, 'representation_error(character)', 'source representation error');

    const readError = capture(() => run('', {
      isoStrict: true,
      goal: 'read(X)',
      ioOptions: { input: "'é'." },
    }));
    equal(readError.formal, 'representation_error(character)', 'read representation error');
  });

  reporter.test('restricts strict character codes to the processor character set', () => {
    const charCodeError = capture(() => run('', { isoStrict: true, goal: 'char_code(_,128)' }));
    equal(charCodeError.formal, 'representation_error(character_code)', 'char_code/2');
    const atomCodesError = capture(() => run('', { isoStrict: true, goal: 'atom_codes(_, [128])' }));
    equal(atomCodesError.formal, 'representation_error(character_code)', 'atom_codes/2');
    const putCodeError = capture(() => run('', { isoStrict: true, goal: 'put_code(128)' }));
    equal(putCodeError.formal, 'representation_error(character_code)', 'put_code/1');
  });

  reporter.test('keeps broader Unicode character handling as a normal-mode extension', () => {
    const result = run('', { goal: "char_code('é',233)" });
    equal(result.stdout, "char_code('é', 233).\n", 'normal Unicode char_code/2');
  });

  reporter.test('keeps the strict write-option surface to Part 1 plus Corrigendum 3', () => {
    const strictError = capture(() => run('', {
      isoStrict: true,
      goal: 'write_term(a,[double_quotes(true)])',
    }));
    equal(strictError.formal, 'domain_error(write_option)', 'strict extension rejection');

    const normal = run('', { goal: 'write_term("ab",[double_quotes(true)])' });
    includes(normal.stdout, '"ab"', 'normal-profile extension remains available');
  });

  reporter.test('follows the ISO 8.14.1.3 read_term/3 error order', () => {
    equal(capture(() => run('', { isoStrict: true, goal: 'read_term(f(a),_,[X])' })).formal,
      'instantiation_error', 'partial/variable option before stream domain');
    equal(capture(() => run('', { isoStrict: true, goal: 'read_term(f(a),_,foo)' })).formal,
      'domain_error(stream_or_alias)', 'stream domain before non-list options');
    equal(capture(() => run('', { isoStrict: true, goal: 'read_term(user_output,_,foo)' })).formal,
      'type_error(list)', 'non-list options before stream permission');
    equal(capture(() => run('', { isoStrict: true, goal: 'read_term(user_output,_,[bogus])' })).formal,
      'domain_error(read_option)', 'invalid option before stream permission');
    equal(capture(() => run('', { isoStrict: true, goal: "read_term('$stream'(999),_,[bogus])" })).formal,
      'domain_error(read_option)', 'invalid option before stream existence');

    const program = Program.parse('', { isoStrict: true });
    const solver = new Solver(program, { isoStrict: true, ioOptions: { input: 'a.' } });
    const error = capture(() => [...solver.solve([
      parseGoalText('read_term(user_input,_,[bogus])', { isoStrict: true }),
    ], new Env(), 0)]);
    equal(error.formal, 'domain_error(read_option)', 'invalid read option');
    equal(solver.io.resolve('user_input').position, 0, 'invalid options are rejected before input');
  });

  reporter.test('follows the ISO 8.14.2.3 write_term/3 error order', () => {
    equal(capture(() => run('', { isoStrict: true, goal: 'write_term(f(a),a,[X])' })).formal,
      'instantiation_error', 'partial/variable option before stream domain');
    equal(capture(() => run('', { isoStrict: true, goal: 'write_term(f(a),a,foo)' })).formal,
      'type_error(list)', 'non-list options before stream domain');
    equal(capture(() => run('', { isoStrict: true, goal: 'write_term(f(a),a,[bogus])' })).formal,
      'domain_error(stream_or_alias)', 'stream domain before invalid option');
    equal(capture(() => run('', { isoStrict: true, goal: "write_term('$stream'(999),a,[bogus])" })).formal,
      'domain_error(write_option)', 'invalid option before stream existence');
    equal(capture(() => run('', { isoStrict: true, goal: 'write_term(user_input,a,[bogus])' })).formal,
      'domain_error(write_option)', 'invalid option before stream permission');
  });

  reporter.test('follows the ISO 8.14.3.3 op/3 error order', () => {
    equal(capture(() => run('', { isoStrict: true, goal: 'op(a,X,0)' })).formal,
      'instantiation_error', 'specifier variable before priority type');
    equal(capture(() => run('', { isoStrict: true, goal: 'op(a,xfy,[X])' })).formal,
      'instantiation_error', 'operator variable element before priority type');
    equal(capture(() => run('', { isoStrict: true, goal: 'op(a,1,0)' })).formal,
      'type_error(integer)', 'priority type before specifier type');
    equal(capture(() => run('', { isoStrict: true, goal: 'op(1,1,0)' })).formal,
      'type_error(atom)', 'specifier type before operator-list type');
    equal(capture(() => run('', { isoStrict: true, goal: 'op(1300,xfy,[1])' })).formal,
      'type_error(atom)', 'operator element type before priority domain');
    equal(capture(() => run('', { isoStrict: true, goal: 'op(1300,foo,a)' })).formal,
      'domain_error(operator_priority)', 'priority domain before specifier domain');
    equal(capture(() => run('', { isoStrict: true, goal: 'op(100,foo,a)' })).formal,
      'domain_error(operator_specifier)', 'specifier domain');
  });

  reporter.test('uses ISO 8.14.4.3 domain errors for current_op/3 filters', () => {
    equal(capture(() => run('', { isoStrict: true, goal: 'current_op(a,_,_)' })).formal,
      'domain_error(operator_priority)', 'priority domain');
    equal(capture(() => run('', { isoStrict: true, goal: 'current_op(1,1,_)' })).formal,
      'domain_error(operator_specifier)', 'specifier domain');
    equal(capture(() => run('', { isoStrict: true, goal: 'current_op(1,fx,1)' })).formal,
      'type_error(atom)', 'operator type');
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
  await runStandalone(runIsoStrict);
}
