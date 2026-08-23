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
  parseProgramText,
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
      'permission_error(modify, flag)', 'max_arity valid-but-fixed value');
    equal(capture(() => run('', { isoStrict: true, goal: 'set_prolog_flag(max_integer,unbounded)' })).formal,
      'domain_error(flag_value)', 'max_integer has no value when unbounded');
    equal(capture(() => run('', { isoStrict: true, goal: 'set_prolog_flag(unknown,maybe)' })).formal,
      'domain_error(flag_value)', 'unknown value domain');
    equal(capture(() => run('', { isoStrict: true, goal: 'set_prolog_flag(not_a_flag,on)' })).formal,
      'domain_error(prolog_flag)', 'unsupported flag');
  });

  reporter.test('keeps max_arity unbounded for compound terms', () => {
    const program = Program.parse('', { isoStrict: true });
    const solver = new Solver(program, { isoStrict: true });
    const answers = (text) => [...solver.solve([parseGoalText(text, { isoStrict: true })], new Env(), 0)].length;
    equal(answers('current_prolog_flag(max_arity,unbounded)'), 1, 'unbounded flag value');
    equal(answers('functor(T,foo,65536),arg(65536,T,z)'), 1, 'functor beyond former 65535 ceiling');

    const source = `wide(${Array.from({ length: 65536 }, () => 'a').join(',')}).`;
    const clauses = parseProgramText(source, { isoStrict: true, sourceMetadata: true });
    equal(clauses[0]?.head?.arity, 65536, 'source term beyond former 65535 ceiling');

    // A very large predicate indicator that names no procedure must not be
    // rounded through JavaScript Number or misreported as max_arity.
    equal(run('', { isoStrict: true, goal: 'abolish(foo/9007199254740993)' }).stats.completed_goal_lists,
      1, 'large nonexistent predicate indicator');
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

  reporter.test('follows Corrigendum 3 variable metadata traversal and write naming', () => {
    const readMetadata = run('', {
      isoStrict: true,
      goal: "read_term(f(B,A,B,C,D,E),[variables([B,A,C,D,E]),variable_names(['B'=B,'A'=A,'C'=C,'_D'=D]),singletons(['A'=A,'C'=C,'_D'=D])])",
      ioOptions: { input: 'f(B,A,B,C,_D,_).' },
    });
    equal(readMetadata.stats.completed_goal_lists, 1, 'read metadata order');

    const named = run('', {
      isoStrict: true,
      goal: "write_term(f(X,Y,X),[quoted(true),variable_names([z=X,a=X,y=Y])])",
    });
    includes(named.stdout, 'f(z,y,z)', 'leftmost variable name wins');

    const ignoredNonVariable = run('', {
      isoStrict: true,
      goal: "write_term(X,[variable_names([ignored=42,x=X])])",
    });
    includes(ignoredNonVariable.stdout, 'x', 'non-variable right side is permitted and ignored');
  });

  reporter.test('reports the complete alias option in open/4 alias collisions', () => {
    const error = capture(() => run('', {
      isoStrict: true,
      goal: 'open(dummy,write,_,[alias(user_input)])',
    }));
    equal(error.formal, 'permission_error(open, source_sink)', 'formal error');
    includes(error.message, 'alias(user_input)', 'alias option culprit');
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

  reporter.test('follows remaining Part 1 built-in error precedence', () => {
    const cases = [
      ['arg(a,X,_)', 'instantiation_error', 'arg/3 second-argument instantiation before index type'],
      ['atom_concat(1,X,Y)', 'instantiation_error', 'atom_concat/3 second/whole under-instantiation before first type'],
      ['atom_concat(X,1,Y)', 'instantiation_error', 'atom_concat/3 first/whole under-instantiation before second type'],
      ['sub_atom(a,-1,bad,_,_)', 'type_error(integer)', 'sub_atom/5 integer type before non-negative domain'],
      ['number_chars(N,[1|T])', 'instantiation_error', 'number_chars/2 partial list before element type'],
      ['number_chars(N,[X,1])', 'instantiation_error', 'number_chars/2 variable element before later element type'],
      ['number_codes(N,[foo|T])', 'instantiation_error', 'number_codes/2 partial list before element type'],
      ['number_codes(N,[X,foo])', 'instantiation_error', 'number_codes/2 variable element before later element type'],
      ['atom_chars(A,[X|foo])', 'type_error(list)', 'atom_chars/2 improper list before prefix variable'],
      ['atom_codes(A,[X|foo])', 'type_error(list)', 'atom_codes/2 improper list before prefix variable'],
      ['char_conversion(foo,X)', 'instantiation_error', 'char_conversion/2 output instantiation before input representation'],
    ];
    for (const [goal, formal, label] of cases) {
      equal(capture(() => run('', { isoStrict: true, goal })).formal, formal, label);
    }
  });

  reporter.test('follows Part 1 arithmetic type and exceptional errors', () => {
    const cases = [
      ["X is '+'(foo,77)", 'type_error(number)', 'simple arithmetic atomic operand'],
      ['X is mod(foo,77)', 'type_error(number)', 'integer arithmetic non-number operand'],
      ['X is mod(7.5,2)', 'type_error(integer)', 'integer arithmetic numeric type'],
      ['X is truncate(foo)', 'type_error(number)', 'rounding non-number operand'],
      ['X is sin(foo)', 'type_error(number)', 'transcendental non-number operand'],
      ['X is foo+Y', 'instantiation_error', 'direct variable before another operand error'],
      ['X is floor(7)', 'type_error(float)', 'floor integer operand'],
      ['X is truncate(7)', 'type_error(float)', 'truncate integer operand'],
      ['X is round(7)', 'type_error(float)', 'round integer operand'],
      ['X is ceiling(7)', 'type_error(float)', 'ceiling integer operand'],
      ['X is 0 ** -1', 'evaluation_error(undefined)', 'power zero negative exponent'],
      ['X is 0.0 ^ -1', 'evaluation_error(undefined)', 'Corrigendum 2 power zero negative exponent'],
    ];
    for (const [goal, formal, label] of cases) {
      equal(capture(() => run('', { isoStrict: true, goal })).formal, formal, label);
    }
  });

  reporter.test('uses the Part 1 mixed arithmetic comparison operations', () => {
    // 8.7 converts the integer operand to float in mixed comparisons.
    equal(run('', { isoStrict: true, goal: '18014398509481985 =:= 18014398509481984.0' }).stats.completed_goal_lists,
      1, 'mixed equality after float conversion');
    equal(run('', { isoStrict: true, goal: '\\+ (18014398509481985 > 18014398509481984.0)' }).stats.completed_goal_lists,
      1, 'mixed ordering after float conversion');
    const huge = `1${'0'.repeat(400)}`;
    equal(capture(() => run('', { isoStrict: true, goal: `${huge} > 1.0` })).formal,
      'evaluation_error(float_overflow)', 'mixed integer-to-float overflow');

    // The normal profile retains EyeProlog's exact cross-type extension.
    equal(run('', { goal: '9007199254740993 > 9007199254740992.0' }).stats.completed_goal_lists,
      1, 'normal exact mixed ordering extension');
  });

  reporter.test('follows ISO term-construction error types and precedence', () => {
    equal(capture(() => run('', { isoStrict: true, goal: 'functor(_,foo(a),1)' })).formal,
      'type_error(atomic)', 'functor compound name');
    equal(capture(() => run('', { isoStrict: true, goal: 'functor(_,foo(a),bad)' })).formal,
      'type_error(atomic)', 'functor name error before arity type');
    equal(capture(() => run('', { isoStrict: true, goal: "'=..'(foo,bar)" })).formal,
      'type_error(list)', '=../2 fixed non-list');
  });

  reporter.test('keeps Corrigendum 2 call/N compatible with unbounded max_arity', () => {
    // Corrigendum 2 prescribes representation_error(max_arity) only when the
    // resulting closure exceeds a finite max_arity. With the selected
    // `unbounded` value that conditional branch does not apply.
    equal(run('', { isoStrict: true, goal: "call(=(x),x)" }).stdout,
      'call(=(x), x).\n', 'call/2 closure expansion');
  });

  reporter.test('reports the complete List culprit for Corrigendum 2 atomic conversions', () => {
    for (const goal of ['atom_chars(A,[a|foo])', 'atom_codes(A,[97|foo])']) {
      const error = capture(() => run('', { isoStrict: true, goal }));
      equal(error.formal, 'type_error(list)', `${goal} formal`);
      includes(error.message, '[', `${goal} complete list culprit`);
      if (error.message.endsWith(', foo)')) throw new Error(`${goal}: reported only the improper tail`);
    }
  });

  reporter.test('follows ISO clause/2 private-procedure error precedence', () => {
    equal(capture(() => run('p.\n', { isoStrict: true, goal: 'clause(atom(_),4)' })).formal,
      'permission_error(access, private_procedure)', 'private procedure before body callability');
  });

  reporter.test('validates all-solutions goals before their output lists', () => {
    for (const predicate of ['findall', 'bagof', 'setof']) {
      equal(capture(() => run('', { isoStrict: true, goal: `${predicate}(X,Y,foo)` })).formal,
        'instantiation_error', `${predicate}/3 variable goal`);
      equal(capture(() => run('', { isoStrict: true, goal: `${predicate}(X,4,foo)` })).formal,
        'type_error(callable)', `${predicate}/3 non-callable goal`);
    }
  });

  reporter.test('uses the Part 1 predefined operator table', () => {
    const program = Program.parse('', { isoStrict: true });
    equal(program.operators.has('fx\u0000?-'), true, 'fx ?-');
    equal(program.operators.has('xfx\u0000?-'), false, 'xfx ?-');
  });

  reporter.test('pins applicable post-Corrigendum STC clarifications', () => {
    equal(run('', { isoStrict: true, goal: 'integer(- /**/ 1)' }).stats.completed_goal_lists,
      1, 'layout between minus and integer token');

    const shared = run(
      ':- dynamic(a/1).\na(X) :- b(X).\n',
      { isoStrict: true, goal: 'clause(a(A),b(B)),A==B,A=ok' },
    );
    equal(shared.stats.completed_goal_lists, 1, 'clause/2 preserves head/body variable identity');

    equal(capture(() => run('', { isoStrict: true, goal: 'char_code(_,c)' })).formal,
      'type_error(integer)', 'char_code/2 non-integer code');
    equal(capture(() => run('', { isoStrict: true, goal: 'set_prolog_flag(unknown,_)' })).formal,
      'instantiation_error', 'set_prolog_flag/2 variable value');
    equal(run('', {
      isoStrict: true,
      goal: 'read(T),T=end_of_file',
      ioOptions: { input: '' },
    }).stats.completed_goal_lists, 1, 'read/1 end_of_file');
    includes(run('', {
      isoStrict: true,
      goal: 'bagof(X,(X=2;X=1),S),S=[2,1],X=ok',
    }).stdout, '[2, 1]', 'bagof/3 preserves answer order');

    Program.parse(':- op(500,xfx,foo).\na foo b.\n', { isoStrict: true });
    const beforeDefinition = capture(() => Program.parse('a foo b.\n:- op(500,xfx,foo).\n', { isoStrict: true }));
    includes(beforeDefinition.message, 'expected .', 'op/3 directive applies only to following text');
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

  reporter.test('protects conjunction as an ISO static/private control construct at runtime', () => {
    for (const goal of [
      "asserta(','(a,b))",
      "assertz(','(a,b))",
      "retract(','(a,b))",
      "retractall(','(a,b))",
      "abolish('/'(',',2))",
    ]) {
      equal(capture(() => run('', { isoStrict: true, goal })).formal,
        'permission_error(modify, static_procedure)', goal);
    }
    equal(capture(() => run('', { isoStrict: true, goal: "clause(','(a,b),_)" })).formal,
      'permission_error(access, private_procedure)', 'clause/2 conjunction access');
  });

  reporter.test('protects directive and rule functors from database modification per STC 56', () => {
    const protectedGoals = [
      "asserta(((':-'(a,b)):-true))",
      "asserta(((':-'(b)):-true))",
      "assertz(((':-'(a,b)):-true))",
      "retract((':-'(a,b):-true))",
      "retractall((':-'(a,b):-true))",
      "abolish('/'(':-',2))",
      "abolish('/'(':-',1))",
    ];
    for (const goal of protectedGoals) {
      equal(capture(() => run('', { isoStrict: true, goal })).formal,
        'permission_error(modify, static_procedure)', goal);
    }
    equal(capture(() => run('', { isoStrict: true, goal: "clause(':-'(a,b),_)" })).formal,
      'permission_error(access, private_procedure)', 'clause/2 (:-)/2 access');
    equal(capture(() => run('', { isoStrict: true, goal: "clause(':-'(b),_)" })).formal,
      'permission_error(access, private_procedure)', 'clause/2 (:-)/1 access');
    equal(capture(() => run('', { isoStrict: true, goal: "call(':-'(a,b))" })).formal,
      'existence_error(procedure)', 'STC 56 keeps calls distinct from modification');
    equal(capture(() => Program.parse(":- dynamic('/'(':-',2)).\n", { isoStrict: true })).formal,
      'permission_error(modify, static_procedure)', 'preparation-time (:-)/2 declaration protection');
  });

  reporter.test('reports finite host exhaustion without imposing ISO representation bounds', () => {
    equal(capture(() => run('', { isoStrict: true, goal: 'functor(T,f,4294967296)' })).formal,
      'resource_error(memory)', 'unbounded max_arity host array exhaustion');
    equal(capture(() => run('', { isoStrict: true, goal: 'X is 1 << 4294967296' })).formal,
      'resource_error(memory)', 'unbounded integer shift host exhaustion');
    equal(capture(() => run('', { isoStrict: true, goal: 'X is 2 ^ 4294967296' })).formal,
      'resource_error(memory)', 'unbounded integer power host exhaustion');
    equal(run('', { isoStrict: true, goal: 'current_prolog_flag(max_arity,unbounded)' }).stats.completed_goal_lists,
      1, 'resource handling does not reintroduce a finite max_arity');
  });

  reporter.test('covers ISO database predicate errors and empty-procedure lifetime', () => {
    const errors = [
      ['current_predicate(4)', '', 'type_error(predicate_indicator)'],
      ['asserta(_)', '', 'instantiation_error'],
      ['asserta(4)', '', 'type_error(callable)'],
      ['asserta((atom(_):-true))', '', 'permission_error(modify, static_procedure)'],
      ['assertz(_)', '', 'instantiation_error'],
      ['assertz(4)', '', 'type_error(callable)'],
      ['retract(_)', '', 'instantiation_error'],
      ['retract(4)', '', 'type_error(callable)'],
      ['retract(atom(_))', '', 'permission_error(modify, static_procedure)'],
      ['retractall(_)', '', 'instantiation_error'],
      ['retractall(3)', '', 'type_error(callable)'],
      ['retractall(retractall(_))', '', 'permission_error(modify, static_procedure)'],
      ['abolish(foo/_)', '', 'instantiation_error'],
      ['abolish(foo)', '', 'type_error(predicate_indicator)'],
      ['abolish(foo/a)', '', 'type_error(integer)'],
      ['abolish(4/1)', '', 'type_error(atom)'],
      ['abolish(foo/(-1))', '', 'domain_error(not_less_than_zero)'],
      ['abolish(atom/1)', '', 'permission_error(modify, static_procedure)'],
    ];
    for (const [goal, source, formal] of errors) {
      equal(capture(() => run(source, { isoStrict: true, goal })).formal, formal, goal);
    }

    const retained = run(':- dynamic(p/1).\np(a).\n', {
      isoStrict: true,
      goal: 'retractall(p(_)), current_predicate(p/1), \\+ clause(p(_),_)',
    });
    equal(retained.stats.completed_goal_lists, 1, 'retractall keeps the dynamic procedure');

    const empty = run(':- dynamic(empty/1).\n', { isoStrict: true, goal: 'current_predicate(empty/1)' });
    equal(empty.stats.completed_goal_lists, 1, 'declared empty procedure exists');

    const abolished = run(':- dynamic(q/1).\nq(a).\n', {
      isoStrict: true,
      goal: 'abolish(q/1), \\+ current_predicate(q/1)',
    });
    equal(abolished.stats.completed_goal_lists, 1, 'abolish removes the procedure');
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
