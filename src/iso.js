// ISO/IEC 13211-1:1995 core built-ins, including Technical Corrigenda 1-3.
import {
  ATOM, COMPOUND, NUMBER, STRING, VAR, Env,
  atom, compareTerms, compound, copyResolved, deref, emptyList,
  isDecimalInteger, listFromItems, numberTerm, numberTextFromDouble,
  properListItems, termIsGround, termToString, unify, variable, variantTerms,
} from './term.js';
import { sameNumberValue } from './number-value.js';
import {
  NumberRepresentationError, createParserOperatorState, floatRepresentationErrorFormal,
  parseGoalText, parseNumberTokenText, parseTermText,
} from './parser.js';
import { formatTermForWrite } from './write.js';
import { emptyTerminalSequence, expandDcgBody, isListOrPartialList, validateDcgEmbeddedGoals } from './dcg.js';
import {
  characterCodeConstantEnd, continuesGraphicToken, isTerminatingFullStop, quotedEscapeEnd,
} from './syntax-scan.js';

let isoFresh = 0;

export { PrologError, HaltSignal } from './errors.js';
import { PrologError, HaltSignal } from './errors.js';

class ThrownTerm extends Error {
  constructor(term) {
    super(`uncaught exception: ${termToString(term)}`);
    this.name = 'ThrownTerm';
    this.term = term;
  }
}

const succeed = function* ({ env }) { yield env; };
const fail = function* () {};

export const isoBuiltins = {
  register(registry) {
    registry.add('true', 0, succeed, { deterministic: true });
    registry.add('fail', 0, fail, { deterministic: true });
    registry.add('false', 0, fail, { deterministic: true });
    registry.add('!', 0, succeed, { deterministic: true });

    registry.add('=', 2, unification, { deterministic: true });
    registry.add('unify_with_occurs_check', 2, unificationWithOccursCheck, { deterministic: true });
    registry.add('\\=', 2, nonUnification, { deterministic: true });
    registry.add('subsumes_term', 2, subsumesTermBuiltin, { deterministic: true });
    registry.add('==', 2, identity, { deterministic: true });
    registry.add('\\==', 2, nonIdentity, { deterministic: true });

    for (const [name, test] of Object.entries(typeTests)) {
      registry.add(name, 1, test, { deterministic: true });
    }
    registry.add('compare', 3, compareBuiltin, { deterministic: true });
    registry.add('@<', 2, orderBuiltin((n) => n < 0), { deterministic: true });
    registry.add('@=<', 2, orderBuiltin((n) => n <= 0), { deterministic: true });
    registry.add('@>', 2, orderBuiltin((n) => n > 0), { deterministic: true });
    registry.add('@>=', 2, orderBuiltin((n) => n >= 0), { deterministic: true });
    registry.add('sort', 2, sortBuiltin, { deterministic: true });
    registry.add('keysort', 2, keysortBuiltin, { deterministic: true });

    registry.add('functor', 3, functorBuiltin, { deterministic: true });
    registry.add('arg', 3, argBuiltin, { deterministic: true });
    registry.add('=..', 2, univBuiltin, { deterministic: true });
    registry.add('copy_term', 2, copyTermBuiltin, { deterministic: true });
    registry.add('term_variables', 2, termVariablesBuiltin, { deterministic: true });
    registry.add('findall', 3, findallBuiltin);
    registry.add('bagof', 3, bagofBuiltin);
    registry.add('setof', 3, setofBuiltin);
    registry.add('clause', 2, clauseBuiltin, {
      shouldUse: ({ solver }) => solver.program.findGroup('clause', 2) == null,
    });
    registry.add('asserta', 1, assertBuiltin(true), { deterministic: true });
    registry.add('assertz', 1, assertBuiltin(false), { deterministic: true });
    registry.add('retract', 1, retractBuiltin);
    registry.add('retractall', 1, retractAllBuiltin, { deterministic: true });
    registry.add('abolish', 1, abolishBuiltin, { deterministic: true });
    registry.add('current_predicate', 1, currentPredicateBuiltin);
    registry.add('current_prolog_flag', 2, currentPrologFlagBuiltin);
    registry.add('set_prolog_flag', 2, setPrologFlagBuiltin, { deterministic: true });
    registry.add('op', 3, opBuiltin, {
      deterministic: true,
      shouldUse: ({ solver }) => solver.program.findGroup('op', 3) == null,
    });
    registry.add('current_op', 3, currentOpBuiltin);
    registry.add('char_conversion', 2, charConversionBuiltin, { deterministic: true });
    registry.add('current_char_conversion', 2, currentCharConversionBuiltin);
    registry.add('halt', 0, haltBuiltin, { deterministic: true });
    registry.add('halt', 1, haltBuiltin, { deterministic: true });

    registry.add('open', 3, openBuiltin, { deterministic: true });
    registry.add('open', 4, openBuiltin, { deterministic: true });
    registry.add('close', 1, closeBuiltin, { deterministic: true });
    registry.add('close', 2, closeBuiltin, { deterministic: true });
    registry.add('current_input', 1, currentInputBuiltin, { deterministic: true });
    registry.add('current_output', 1, currentOutputBuiltin, { deterministic: true });
    registry.add('set_input', 1, setCurrentStreamBuiltin('read'), { deterministic: true });
    registry.add('set_output', 1, setCurrentStreamBuiltin('write'), { deterministic: true });
    registry.add('flush_output', 0, succeed, { deterministic: true });
    registry.add('flush_output', 1, flushOutputBuiltin, { deterministic: true });
    registry.add('stream_property', 2, streamPropertyBuiltin);
    registry.add('set_stream_position', 2, setStreamPositionBuiltin, { deterministic: true });
    registry.add('at_end_of_stream', 0, atEndBuiltin, { deterministic: true });
    registry.add('at_end_of_stream', 1, atEndBuiltin, { deterministic: true });
    for (const name of ['get_char', 'peek_char', 'get_code', 'peek_code', 'get_byte', 'peek_byte']) {
      registry.add(name, 1, inputUnitBuiltin(name), { deterministic: true });
      registry.add(name, 2, inputUnitBuiltin(name), { deterministic: true });
    }
    for (const name of ['put_char', 'put_code', 'put_byte']) {
      registry.add(name, 1, outputUnitBuiltin(name), { deterministic: true });
      registry.add(name, 2, outputUnitBuiltin(name), { deterministic: true });
    }
    registry.add('nl', 0, nlBuiltin, { deterministic: true });
    registry.add('nl', 1, nlBuiltin, { deterministic: true });
    registry.add('read', 1, readBuiltin, { deterministic: true });
    registry.add('read', 2, readBuiltin, { deterministic: true });
    registry.add('read_term', 2, readTermBuiltin, { deterministic: true });
    registry.add('read_term', 3, readTermBuiltin, { deterministic: true });
    for (const [name, mode] of [
      ['write', 'write'],
      ['writeq', 'writeq'],
      ['write_canonical', 'canonical'],
    ]) {
      registry.add(name, 1, writeBuiltin(mode), { deterministic: true });
      registry.add(name, 2, writeBuiltin(mode), { deterministic: true });
    }
    registry.add('write_term', 2, writeTermBuiltin, { deterministic: true });
    registry.add('write_term', 3, writeTermBuiltin, { deterministic: true });

    registry.add('atom_length', 2, atomLengthBuiltin, { deterministic: true });
    registry.add('atom_concat', 3, atomConcatBuiltin);
    registry.add('sub_atom', 5, subAtomBuiltin);
    registry.add('atom_chars', 2, atomCharsBuiltin, { deterministic: true });
    registry.add('atom_codes', 2, atomCodesBuiltin, { deterministic: true });
    registry.add('char_code', 2, charCodeBuiltin, { deterministic: true });
    registry.add('number_chars', 2, numberCharsBuiltin, { deterministic: true });
    registry.add('number_codes', 2, numberCodesBuiltin, { deterministic: true });

    registry.add('call', 1, callBuiltin);
    for (let arity = 2; arity <= 8; arity++) registry.add('call', arity, callClosureBuiltin);
    registry.add('catch', 3, catchBuiltin);
    registry.add('throw', 1, throwBuiltin, { deterministic: true });
    registry.add('\\+', 1, negationBuiltin, { deterministic: true });
    registry.add('once', 1, onceBuiltin, { deterministic: true });
    registry.add('repeat', 0, repeatBuiltin);
    registry.add(';', 2, disjunctionBuiltin);
    registry.add('->', 2, ifThenBuiltin);
    registry.add('phrase', 2, phraseBuiltin);
    registry.add('phrase', 3, phraseBuiltin);

    registry.add('is', 2, isBuiltin, { deterministic: true });
    registry.add('=:=', 2, arithmeticComparison((n) => n === 0), { deterministic: true });
    registry.add('=\\=', 2, arithmeticComparison((n) => n !== 0), { deterministic: true });
    registry.add('<', 2, arithmeticComparison((n) => n < 0), { deterministic: true });
    registry.add('=<', 2, arithmeticComparison((n) => n <= 0), { deterministic: true });
    registry.add('>', 2, arithmeticComparison((n) => n > 0), { deterministic: true });
    registry.add('>=', 2, arithmeticComparison((n) => n >= 0), { deterministic: true });
  }
};

// These Prologue library predicates have control behavior that cannot be
// expressed portably as ordinary Prolog clauses. Keep their public wrappers in
// library(prologue) and expose only private adapters to the host registry.
export const eyePrologLibraryBuiltins = {
  register(registry) {
    registry.add('eyeprolog__call_nth', 2, callNthBuiltin, { eyePrologLibrary: true });
    registry.add('eyeprolog__countall', 2, countAllBuiltin, { eyePrologLibrary: true });
    registry.add('eyeprolog__freeze', 2, freezeBuiltin, { eyePrologLibrary: true });
    registry.add('time', 1, timeBuiltin, { eyePrologLibrary: true });
    registry.add('eyeprolog__time', 1, timeBuiltin, { eyePrologLibrary: true });
  },
};

function* unification({ goal, env }) {
  const next = env.clone();
  const knownNonoccurringVariables = goal._knownNonoccurringVariables ?? null;
  if (unify(goal.args[0], goal.args[1], next, { knownNonoccurringVariables })) yield next;
}
function* unificationWithOccursCheck({ goal, env }) {
  const next = env.clone();
  // ISO unify_with_occurs_check/2 always performs finite-tree unification.
  // The implementation-specific occurs_check=error mode applies to normal
  // unification, but must not turn this ISO predicate's ordinary failure into
  // an exception.
  if (unify(goal.args[0], goal.args[1], next, { occursCheck: 'fail' })) yield next;
}
function* nonUnification({ goal, env }) {
  if (!unify(goal.args[0], goal.args[1], env.clone())) yield env;
}

function termVariableNames(term, env, names = new Set(), seen = new Set()) {
  term = deref(term, env);
  if (term.type === VAR) {
    names.add(term.name);
  } else if (term.type === COMPOUND && !seen.has(term)) {
    seen.add(term);
    for (const arg of term.args) termVariableNames(arg, env, names, seen);
  }
  return names;
}

function subsumesTerm(general, specific, env) {
  general = copyResolved(general, env);
  specific = copyResolved(specific, env);
  const protectedVariables = termVariableNames(specific, new Env());
  const substitutions = new Map();
  const pending = [[general, specific]];
  while (pending.length) {
    let [left, right] = pending.pop();
    if (left.type === VAR && substitutions.has(left.name)) left = substitutions.get(left.name);
    if (left.type === VAR) {
      // A variable shared with Specific may not be changed by the one-sided
      // substitution required by subsumes_term/2.
      if (protectedVariables.has(left.name)) {
        if (right.type !== VAR || right.name !== left.name) return false;
      } else {
        substitutions.set(left.name, right);
      }
      continue;
    }
    if (left.type !== right.type || left.arity !== right.arity) return false;
    if (left.type === NUMBER ? !sameNumberValue(left.name, right.name) : left.name !== right.name) return false;
    for (let i = left.arity - 1; i >= 0; i--) pending.push([left.args[i], right.args[i]]);
  }
  return true;
}

function* subsumesTermBuiltin({ goal, env }) {
  if (subsumesTerm(goal.args[0], goal.args[1], env)) yield env;
}
function* identity({ goal, env }) {
  if (identical(goal.args[0], goal.args[1], env)) yield env;
}
function* nonIdentity({ goal, env }) {
  if (!identical(goal.args[0], goal.args[1], env)) yield env;
}

function identical(left, right, env) {
  left = deref(left, env);
  right = deref(right, env);
  if (left.type !== right.type || left.arity !== right.arity) return false;
  if (left.type === NUMBER ? !sameNumberValue(left.name, right.name) : left.name !== right.name) return false;
  if (left.type === VAR) return left.name === right.name;
  for (let i = 0; i < left.arity; i++) if (!identical(left.args[i], right.args[i], env)) return false;
  return true;
}

const unaryTest = (predicate) => function* ({ goal, env }) {
  if (predicate(deref(goal.args[0], env), env)) yield env;
};
const typeTests = {
  var: unaryTest((t) => t.type === VAR),
  nonvar: unaryTest((t) => t.type !== VAR),
  atom: unaryTest((t) => t.type === ATOM),
  integer: unaryTest((t) => t.type === NUMBER && isDecimalInteger(t.name)),
  float: unaryTest((t) => t.type === NUMBER && !isDecimalInteger(t.name)),
  number: unaryTest((t) => t.type === NUMBER),
  atomic: unaryTest((t) => t.type === ATOM || t.type === NUMBER || t.type === STRING),
  compound: unaryTest((t) => t.type === COMPOUND),
  callable: unaryTest((t) => t.type === ATOM || t.type === COMPOUND),
  ground: unaryTest((t, env) => termIsGround(t, env)),
  acyclic_term: unaryTest((t, env) => termIsAcyclic(t, env)),
};

function termIsAcyclic(term, env) {
  const active = new Set();
  const complete = new Set();
  const stack = [[term, false]];
  while (stack.length) {
    const [candidate, leaving] = stack.pop();
    const resolved = deref(candidate, env);
    if (resolved.type !== COMPOUND) continue;
    if (leaving) {
      active.delete(resolved);
      complete.add(resolved);
      continue;
    }
    if (active.has(resolved)) return false;
    if (complete.has(resolved)) continue;
    active.add(resolved);
    stack.push([resolved, true]);
    for (let i = resolved.arity - 1; i >= 0; i--) stack.push([resolved.args[i], false]);
  }
  return true;
}

function resolvedOrder(left, right, env, variableRanks = null) {
  return compareTerms(copyResolved(left, env), copyResolved(right, env), variableRanks);
}
function* compareBuiltin({ goal, env }) {
  const order = deref(goal.args[0], env);
  if (order.type !== VAR) {
    if (order.type !== ATOM) throw new PrologError('type_error(atom)', order);
    if (!['<', '=', '>'].includes(order.name)) throw new PrologError('domain_error(order)', order);
  }
  const cmp = resolvedOrder(goal.args[1], goal.args[2], env);
  const next = env.clone();
  if (unify(goal.args[0], atom(cmp < 0 ? '<' : cmp > 0 ? '>' : '='), next)) yield next;
}
function orderBuiltin(test) {
  return function* ({ goal, env }) {
    if (test(resolvedOrder(goal.args[0], goal.args[1], env))) yield env;
  };
}

function listKind(term, env) {
  let cursor = deref(term, env);
  const seen = new Set();
  while (cursor.type === COMPOUND && cursor.name === '.' && cursor.arity === 2) {
    if (seen.has(cursor)) return 'nonlist';
    seen.add(cursor);
    cursor = deref(cursor.args[1], env);
  }
  if (cursor.type === VAR) return 'partial';
  return cursor.type === ATOM && cursor.name === '[]' ? 'list' : 'nonlist';
}

function requireProperList(term, env) {
  const value = deref(term, env);
  const kind = listKind(value, env);
  if (kind === 'partial') throw new PrologError('instantiation_error');
  if (kind !== 'list') throw new PrologError('type_error(list)', value);
  return properListItems(value, env);
}

function validateListOutput(term, env) {
  const value = deref(term, env);
  if (listKind(value, env) === 'nonlist') throw new PrologError('type_error(list)', value);
}

function* sortBuiltin({ goal, env }) {
  const items = requireProperList(goal.args[0], env);
  validateListOutput(goal.args[1], env);
  const variableRanks = new Map();
  const sorted = [...items].sort((a, b) => resolvedOrder(a, b, env, variableRanks));
  const unique = [];
  for (const item of sorted) {
    if (unique.length === 0 || resolvedOrder(unique[unique.length - 1], item, env, variableRanks) !== 0) unique.push(item);
  }
  const next = env.clone();
  if (unify(goal.args[1], listFromItems(unique), next)) yield next;
}

function* keysortBuiltin({ goal, env }) {
  const items = requireProperList(goal.args[0], env);
  validateListOutput(goal.args[1], env);
  for (const item of items) {
    const resolved = deref(item, env);
    if (resolved.type !== COMPOUND || resolved.name !== '-' || resolved.arity !== 2) {
      throw new PrologError('type_error(pair)', resolved);
    }
  }
  // Modern ECMAScript specifies a stable Array#sort, as required by keysort/2.
  // Keep one implementation-dependent variable order for this whole sorting
  // operation, as required by ISO 7.2.1.
  const variableRanks = new Map();
  const sorted = [...items].sort((a, b) =>
    resolvedOrder(deref(a, env).args[0], deref(b, env).args[0], env, variableRanks));
  const next = env.clone();
  if (unify(goal.args[1], listFromItems(sorted), next)) yield next;
}

function requireInteger(term, env) {
  const value = deref(term, env);
  if (value.type === VAR) throw new PrologError('instantiation_error');
  if (value.type !== NUMBER || !isDecimalInteger(value.name)) throw new PrologError('type_error(integer)', value);
  return BigInt(value.name);
}
function requireAtom(term, env) {
  const value = deref(term, env);
  if (value.type === VAR) throw new PrologError('instantiation_error');
  if (value.type !== ATOM) throw new PrologError('type_error(atom)', value);
  return value;
}

function* functorBuiltin({ goal, env }) {
  const term = deref(goal.args[0], env);
  const next = env.clone();
  if (term.type !== VAR) {
    const name = term.type === COMPOUND ? atom(term.name) : term;
    if (unify(goal.args[1], name, next) && unify(goal.args[2], numberTerm(term.arity), next)) yield next;
    return;
  }
  const name = deref(goal.args[1], env);
  const arity = requireInteger(goal.args[2], env);
  if (arity < 0n) throw new PrologError('domain_error(not_less_than_zero)', deref(goal.args[2], env));
  if (arity > BigInt(Number.MAX_SAFE_INTEGER)) throw new PrologError('representation_error(max_arity)');
  if (arity === 0n) {
    if (name.type === VAR) throw new PrologError('instantiation_error');
    if (name.type === COMPOUND) throw new PrologError('type_error(atomic)', name);
    if (unify(goal.args[0], name, next)) yield next;
    return;
  }
  if (name.type === VAR) throw new PrologError('instantiation_error');
  if (name.type !== ATOM) throw new PrologError('type_error(atom)', name);
  const id = ++isoFresh;
  if (unify(goal.args[0], compound(name.name, Array.from({ length: Number(arity) }, (_, i) => variable(`__functor${id}_${i}`))), next)) yield next;
}

function* argBuiltin({ goal, env }) {
  const index = requireInteger(goal.args[0], env);
  const term = deref(goal.args[1], env);
  if (term.type === VAR) throw new PrologError('instantiation_error');
  if (term.type !== COMPOUND) throw new PrologError('type_error(compound)', term);
  if (index < 0n) throw new PrologError('domain_error(not_less_than_zero)', deref(goal.args[0], env));
  if (index === 0n || index > BigInt(term.arity)) return;
  const next = env.clone();
  if (unify(goal.args[2], term.args[Number(index) - 1], next)) yield next;
}

function* univBuiltin({ goal, env }) {
  const term = deref(goal.args[0], env);
  const next = env.clone();
  if (term.type !== VAR) {
    const items = term.type === COMPOUND ? [atom(term.name), ...term.args] : [term];
    if (unify(goal.args[1], listFromItems(items), next)) yield next;
    return;
  }
  const items = properListItems(goal.args[1], env);
  if (items == null) {
    if (isPartialList(goal.args[1], env)) throw new PrologError('instantiation_error');
    throw new PrologError('type_error(list)', deref(goal.args[1], env));
  }
  if (items.length === 0) throw new PrologError('domain_error(non_empty_list)', emptyList());
  if (items.length === 1) {
    const scalar = deref(items[0], env);
    if (scalar.type === VAR) throw new PrologError('instantiation_error');
    if (scalar.type === COMPOUND) throw new PrologError('type_error(atomic)', scalar);
    if (unify(goal.args[0], scalar, next)) yield next;
    return;
  }
  const name = requireAtom(items[0], env);
  if (unify(goal.args[0], compound(name.name, items.slice(1)), next)) yield next;
}

function isPartialList(list, env) {
  let cursor = deref(list, env);
  while (cursor.type === COMPOUND && cursor.name === '.' && cursor.arity === 2) {
    cursor = deref(cursor.args[1], env);
  }
  return cursor.type === VAR;
}

function freshCopy(term, env, variables = new Map(), id = ++isoFresh) {
  term = deref(term, env);
  if (term.type === VAR) {
    if (!variables.has(term.name)) variables.set(term.name, variable(`__copy${id}_${variables.size}`));
    return variables.get(term.name);
  }
  if (term.type !== COMPOUND) return term;
  return compound(term.name, term.args.map((arg) => freshCopy(arg, env, variables, id)));
}
function* copyTermBuiltin({ goal, env }) {
  const next = env.clone();
  if (unify(goal.args[1], freshCopy(goal.args[0], env), next)) yield next;
}
function* termVariablesBuiltin({ goal, env }) {
  let list = deref(goal.args[1], env);
  while (list.type === COMPOUND && list.name === '.' && list.arity === 2) {
    list = deref(list.args[1], env);
  }
  if (list.type !== VAR && !(list.type === ATOM && list.name === '[]')) {
    throw new PrologError('type_error(list)', deref(goal.args[1], env));
  }
  const found = [];
  const seen = new Set();
  const visit = (term) => {
    term = deref(term, env);
    if (term.type === VAR) {
      if (!seen.has(term.name)) { seen.add(term.name); found.push(term); }
    } else for (const arg of term.args) visit(arg);
  };
  visit(goal.args[0]);
  const next = env.clone();
  if (unify(goal.args[1], listFromItems(found), next)) yield next;
}

function validPredicateIndicator(term) {
  return term.type === COMPOUND && term.name === '/' && term.arity === 2 &&
    (term.args[0].type === VAR || term.args[0].type === ATOM) &&
    (term.args[1].type === VAR ||
      (term.args[1].type === NUMBER && isDecimalInteger(term.args[1].name) && BigInt(term.args[1].name) >= 0n));
}

function* currentPredicateBuiltin({ solver, goal, env }) {
  const indicator = copyResolved(goal.args[0], env);
  if (indicator.type !== VAR && !validPredicateIndicator(indicator)) {
    throw new PrologError('type_error(predicate_indicator)', indicator);
  }
  for (const group of solver.program.groups.values()) {
    const next = env.clone();
    const candidate = compound('/', [atom(group.name), numberTerm(group.arity)]);
    if (unify(goal.args[0], candidate, next)) yield next;
  }
}

function callableOrVariable(term, env) {
  const value = deref(term, env);
  if (value.type === VAR || value.type === ATOM || value.type === COMPOUND) return value;
  throw new PrologError('type_error(callable)', value);
}

function clauseBodyTerm(body) {
  if (body.length === 0) return atom('true');
  let result = body[body.length - 1];
  for (let i = body.length - 2; i >= 0; i--) result = compound(',', [body[i], result]);
  return result;
}

function* clauseBuiltin({ solver, goal, env }) {
  const head = deref(goal.args[0], env);
  if (head.type === VAR) throw new PrologError('instantiation_error');
  if (head.type !== ATOM && head.type !== COMPOUND) throw new PrologError('type_error(callable)', head);
  callableOrVariable(goal.args[1], env);
  const indicator = compound('/', [atom(head.name), numberTerm(head.arity)]);
  if (solver.registry.get(head.name, head.arity) || isGrammarRuleProcedure(solver, head)) {
    throw new PrologError('permission_error(access, private_procedure)', indicator);
  }
  const group = solver.program.findGroup(head.name, head.arity, head.module ?? goal.module ?? 'user');
  if (!group) return;
  // ISO 7.5.3 makes dynamic procedures public and static user-defined
  // procedures private by default.  EyeProlog's normal profile keeps static
  // clauses inspectable for proof tooling; strict core mode restores the ISO
  // access rule used by clause/2.
  if (solver.isoStrict && !group.dynamic) {
    throw new PrologError('permission_error(access, private_procedure)', indicator);
  }
  for (const clause of group.clauses) {
    const pair = compound('$clause', [clause.head, clauseBodyTerm(clause.body)]);
    const copied = freshCopy(pair, new Env());
    const next = env.clone();
    if (unify(goal.args[0], copied.args[0], next) && unify(goal.args[1], copied.args[1], next)) yield next;
  }
}

function clauseParts(term, env) {
  const value = deref(term, env);
  if (value.type === COMPOUND && value.name === ':-' && value.arity === 2) {
    return { head: deref(value.args[0], env), body: deref(value.args[1], env), rule: true };
  }
  return { head: value, body: atom('true'), rule: false };
}

function requireClauseHead(head) {
  if (head.type === VAR) throw new PrologError('instantiation_error');
  if (head.type !== ATOM && head.type !== COMPOUND) throw new PrologError('type_error(callable)', head);
}

function convertAssertedBody(term) {
  if (term.type === VAR) return compound('call', [term]);
  if (term.type === COMPOUND && term.name === ',' && term.arity === 2) {
    return compound(',', [convertAssertedBody(term.args[0]), convertAssertedBody(term.args[1])]);
  }
  if (term.type !== ATOM && term.type !== COMPOUND) throw new PrologError('type_error(callable)', term);
  return term;
}

function procedureIndicator(head) {
  return compound('/', [atom(head.name), numberTerm(head.arity)]);
}

function isGrammarRuleProcedure(solver, head) {
  return !solver.isoStrict && head.name === '-->' && head.arity === 2;
}

function assertModifiable(solver, head, module = 'user') {
  const group = solver.program.findGroup(head.name, head.arity, head.module ?? module);
  if (solver.registry.get(head.name, head.arity) || isGrammarRuleProcedure(solver, head) || (group && !group.dynamic)) {
    throw new PrologError('permission_error(modify, static_procedure)', procedureIndicator(head));
  }
}

function assertBuiltin(atStart) {
  return function* ({ solver, goal, env }) {
    const parts = clauseParts(goal.args[0], env);
    requireClauseHead(parts.head);
    const body = convertAssertedBody(parts.body);
    assertModifiable(solver, parts.head, goal.module ?? 'user');
    const copied = freshCopy(compound('$clause', [parts.head, body]), env);
    solver.program.insertDynamicClause({
      head: copied.args[0],
      module: copied.args[0].module ?? goal.module ?? 'user',
      body: copied.args[1].type === ATOM && copied.args[1].name === 'true'
        ? []
        : [copied.args[1]],
    }, atStart);
    yield env;
  };
}

function* retractBuiltin({ solver, goal, env }) {
  const parts = clauseParts(goal.args[0], env);
  requireClauseHead(parts.head);
  const group = solver.program.findGroup(parts.head.name, parts.head.arity, parts.head.module ?? goal.module ?? 'user');
  if (solver.registry.get(parts.head.name, parts.head.arity) || isGrammarRuleProcedure(solver, parts.head) || (group && !group.dynamic)) {
    throw new PrologError('permission_error(modify, static_procedure)', procedureIndicator(parts.head));
  }
  if (!group) return;
  // ISO logical update view: this call keeps the clauses that were visible
  // when it began. A later retract/1 may erase one of those clauses from the
  // live procedure, but must not invalidate this call's pending alternatives.
  const candidates = [...group.clauses];
  for (const clause of candidates) {
    const copied = freshCopy(compound('$clause', [clause.head, clauseBodyTerm(clause.body)]), new Env());
    const next = env.clone();
    if (!unify(parts.head, copied.args[0], next)) continue;
    if (parts.rule && !unify(parts.body, copied.args[1], next)) continue;
    if (!parts.rule && !(copied.args[1].type === ATOM && copied.args[1].name === 'true')) continue;
    solver.program.removeDynamicClause(group, clause);
    yield next;
  }
}

function* retractAllBuiltin({ solver, goal, env }) {
  const head = deref(goal.args[0], env);
  requireClauseHead(head);
  const group = solver.program.findGroup(head.name, head.arity, head.module ?? goal.module ?? 'user');
  if (solver.registry.get(head.name, head.arity) || isGrammarRuleProcedure(solver, head) || (group && !group.dynamic)) {
    throw new PrologError('permission_error(modify, static_procedure)', procedureIndicator(head));
  }
  if (group) {
    for (const clause of [...group.clauses]) {
      if (unify(head, freshCopy(clause.head, new Env()), env.clone())) {
        solver.program.removeDynamicClause(group, clause);
      }
    }
  }
  yield env;
}

function predicateIndicatorParts(term, env) {
  const indicator = deref(term, env);
  if (indicator.type === VAR) throw new PrologError('instantiation_error');
  if (indicator.type !== COMPOUND || indicator.name !== '/' || indicator.arity !== 2) {
    throw new PrologError('type_error(predicate_indicator)', indicator);
  }
  const name = deref(indicator.args[0], env);
  const arity = deref(indicator.args[1], env);
  if (name.type === VAR || arity.type === VAR) throw new PrologError('instantiation_error');
  if (arity.type !== NUMBER || !isDecimalInteger(arity.name)) throw new PrologError('type_error(integer)', arity);
  if (name.type !== ATOM) throw new PrologError('type_error(atom)', name);
  const integer = BigInt(arity.name);
  if (integer < 0n) throw new PrologError('domain_error(not_less_than_zero)', arity);
  if (integer > BigInt(Number.MAX_SAFE_INTEGER)) throw new PrologError('representation_error(max_arity)');
  return { name: name.name, arity: Number(integer), indicator };
}

function* abolishBuiltin({ solver, goal, env }) {
  const target = predicateIndicatorParts(goal.args[0], env);
  const module = goal.module ?? 'user';
  const group = solver.program.findGroup(target.name, target.arity, module);
  if (solver.registry.get(target.name, target.arity) || isGrammarRuleProcedure(solver, target) || (group && !group.dynamic)) {
    throw new PrologError('permission_error(modify, static_procedure)', target.indicator);
  }
  solver.program.abolishDynamicGroup(target.name, target.arity, module);
  yield env;
}

function* currentPrologFlagBuiltin({ solver, goal, env }) {
  const flag = deref(goal.args[0], env);
  if (flag.type !== VAR && flag.type !== ATOM) throw new PrologError('type_error(atom)', flag);
  if (flag.type === ATOM && !solver.prologFlags.has(flag.name)) {
    throw new PrologError('domain_error(prolog_flag)', flag);
  }
  for (const [name, definition] of solver.prologFlags) {
    const next = env.clone();
    if (unify(goal.args[0], atom(name), next) && unify(goal.args[1], definition.value, next)) yield next;
  }
}

function* setPrologFlagBuiltin({ solver, goal, env }) {
  const flag = deref(goal.args[0], env);
  const value = deref(goal.args[1], env);
  if (flag.type === VAR || value.type === VAR) throw new PrologError('instantiation_error');
  if (flag.type !== ATOM) throw new PrologError('type_error(atom)', flag);
  const definition = solver.prologFlags.get(flag.name);
  if (!definition) throw new PrologError('domain_error(prolog_flag)', flag);
  if (value.type !== ATOM || !definition.allowed.includes(value.name)) {
    throw new PrologError('domain_error(flag_value)', compound('+', [flag, value]));
  }
  if (!definition.changeable) throw new PrologError('permission_error(modify, flag)', flag);
  definition.value = atom(value.name);
  yield env;
}

const operatorSpecifiers = new Set(['fx', 'fy', 'xf', 'yf', 'xfx', 'xfy', 'yfx']);

function operatorPriority(term, env) {
  const value = deref(term, env);
  if (value.type === VAR) throw new PrologError('instantiation_error');
  if (value.type !== NUMBER || !isDecimalInteger(value.name)) throw new PrologError('type_error(integer)', value);
  const priority = BigInt(value.name);
  if (priority < 0n || priority > 1200n) throw new PrologError('domain_error(operator_priority)', value);
  return Number(priority);
}

function operatorSpecifier(term, env) {
  const value = deref(term, env);
  if (value.type === VAR) throw new PrologError('instantiation_error');
  if (value.type !== ATOM) throw new PrologError('type_error(atom)', value);
  if (!operatorSpecifiers.has(value.name)) throw new PrologError('domain_error(operator_specifier)', value);
  return value.name;
}

function operatorNames(term, env) {
  const value = deref(term, env);
  if (value.type === VAR) throw new PrologError('instantiation_error');
  if (value.type === ATOM) return [value];
  const items = properListItems(value, env);
  if (items == null) {
    if (isPartialList(value, env)) throw new PrologError('instantiation_error');
    throw new PrologError('type_error(list)', value);
  }
  for (const item of items) {
    const resolved = deref(item, env);
    if (resolved.type === VAR) throw new PrologError('instantiation_error');
    if (resolved.type !== ATOM) throw new PrologError('type_error(atom)', resolved);
  }
  return items.map((item) => deref(item, env));
}

function* opBuiltin({ solver, goal, env }) {
  const priority = operatorPriority(goal.args[0], env);
  const specifier = operatorSpecifier(goal.args[1], env);
  for (const name of operatorNames(goal.args[2], env)) {
    if (name.name === ',') {
      throw new PrologError('permission_error(modify, operator)', name);
    }
    if (name.name === '[]' || name.name === '{}') {
      throw new PrologError('permission_error(create, operator)', name);
    }
    if (name.name === '|' && priority !== 0 &&
        (!(specifier === 'xfx' || specifier === 'xfy' || specifier === 'yfx') || priority < 1001)) {
      throw new PrologError('permission_error(create, operator)', name);
    }
    const infix = specifier === 'xfx' || specifier === 'xfy' || specifier === 'yfx';
    const postfix = specifier === 'xf' || specifier === 'yf';
    if (priority !== 0 && [...solver.program.operators.values()].some((definition) =>
      definition.name === name.name &&
      ((infix && (definition.specifier === 'xf' || definition.specifier === 'yf')) ||
       (postfix && (definition.specifier === 'xfx' || definition.specifier === 'xfy' || definition.specifier === 'yfx'))))) {
      throw new PrologError('permission_error(create, operator)', name);
    }
    solver.program.defineOperator(priority, specifier, name.name);
  }
  yield env;
}

function* currentOpBuiltin({ solver, goal, env }) {
  const priority = deref(goal.args[0], env);
  const specifier = deref(goal.args[1], env);
  const name = deref(goal.args[2], env);
  if (priority.type !== VAR) {
    if (priority.type !== NUMBER || !isDecimalInteger(priority.name)) {
      throw new PrologError('type_error(integer)', priority);
    }
    if (BigInt(priority.name) < 0n || BigInt(priority.name) > 1200n) {
      throw new PrologError('domain_error(operator_priority)', priority);
    }
  }
  if (specifier.type !== VAR) {
    if (specifier.type !== ATOM) throw new PrologError('type_error(atom)', specifier);
    if (!operatorSpecifiers.has(specifier.name)) {
      throw new PrologError('domain_error(operator_specifier)', specifier);
    }
  }
  if (name.type !== VAR && name.type !== ATOM) throw new PrologError('type_error(atom)', name);
  for (const definition of solver.program.operators.values()) {
    const next = env.clone();
    if (unify(goal.args[0], numberTerm(definition.priority), next) &&
        unify(goal.args[1], atom(definition.specifier), next) &&
        unify(goal.args[2], atom(definition.name), next)) yield next;
  }
}

function conversionCharacter(term, env, current = false) {
  const value = deref(term, env);
  if (value.type === VAR) {
    if (current) return value;
    throw new PrologError('instantiation_error');
  }
  if (!oneChar(value)) {
    if (current) throw new PrologError('type_error(character)', value);
    throw new PrologError('representation_error(character)');
  }
  return value;
}
function* charConversionBuiltin({ solver, goal, env }) {
  const input = conversionCharacter(goal.args[0], env);
  const output = conversionCharacter(goal.args[1], env);
  if (input.name === output.name) solver.charConversions.delete(input.name);
  else solver.charConversions.set(input.name, output.name);
  yield env;
}
function* currentCharConversionBuiltin({ solver, goal, env }) {
  const input = conversionCharacter(goal.args[0], env, true);
  const output = conversionCharacter(goal.args[1], env, true);
  for (const [from, to] of [...solver.charConversions]) {
    const next = env.clone();
    if (unify(input, atom(from), next) && unify(output, atom(to), next)) yield next;
  }
}
function* haltBuiltin({ goal, env }) {
  const code = goal.arity === 0 ? 0n : requireInteger(goal.args[0], env);
  throw new HaltSignal(Number(code));
}

function streamHandle(id) {
  return compound('$stream', [numberTerm(id)]);
}

function streamReference(term, env) {
  const value = deref(term, env);
  if (value.type === VAR) throw new PrologError('instantiation_error');
  if (value.type === ATOM) return value.name;
  if (value.type === COMPOUND && value.name === '$stream' && value.arity === 1 &&
      value.args[0].type === NUMBER && isDecimalInteger(value.args[0].name)) {
    return Number(value.args[0].name);
  }
  throw new PrologError('domain_error(stream_or_alias)', value);
}

function requireStream(solver, term, env, mode = null) {
  const culprit = deref(term, env);
  const stream = solver.io.resolve(streamReference(term, env));
  if (!stream) throw new PrologError('existence_error(stream)', culprit);
  if (mode && stream.mode !== mode && !(mode === 'write' && stream.mode === 'append')) {
    throw new PrologError(`permission_error(${mode === 'read' ? 'input' : 'output'}, stream)`, culprit);
  }
  return stream;
}

function optionList(term, env) {
  const value = deref(term, env);
  if (value.type === VAR) throw new PrologError('instantiation_error');
  const items = properListItems(value, env);
  if (items == null) {
    if (isPartialList(value, env)) throw new PrologError('instantiation_error');
    throw new PrologError('type_error(list)', value);
  }
  return items.map((item) => deref(item, env));
}

function optionAtom(option, name) {
  if (option.type !== COMPOUND || option.name !== name || option.arity !== 1) return null;
  return option.args[0];
}

function openOptions(term, env) {
  const result = {};
  for (const option of optionList(term, env)) {
    if (option.type === VAR) throw new PrologError('instantiation_error');
    let value;
    if ((value = optionAtom(option, 'type'))) {
      value = deref(value, env);
      if (value.type === VAR) throw new PrologError('instantiation_error');
      if (value.type !== ATOM) throw new PrologError('type_error(atom)', value);
      if (!['text', 'binary'].includes(value.name)) throw new PrologError('domain_error(stream_option)', option);
      result.type = value.name;
    } else if ((value = optionAtom(option, 'alias'))) {
      value = deref(value, env);
      if (value.type === VAR) throw new PrologError('instantiation_error');
      if (value.type !== ATOM) throw new PrologError('type_error(atom)', value);
      result.alias = value.name;
    } else if ((value = optionAtom(option, 'reposition'))) {
      value = deref(value, env);
      if (value.type === VAR) throw new PrologError('instantiation_error');
      if (value.type !== ATOM || !['true', 'false'].includes(value.name)) throw new PrologError('domain_error(stream_option)', option);
      result.reposition = value.name === 'true';
    } else if ((value = optionAtom(option, 'eof_action'))) {
      value = deref(value, env);
      if (value.type === VAR) throw new PrologError('instantiation_error');
      if (value.type !== ATOM || !['error', 'eof_code', 'reset'].includes(value.name)) throw new PrologError('domain_error(stream_option)', option);
      result.eof_action = value.name;
    } else {
      throw new PrologError('domain_error(stream_option)', option);
    }
  }
  return result;
}

function* openBuiltin({ solver, goal, env }) {
  const path = requireAtom(goal.args[0], env);
  const mode = requireAtom(goal.args[1], env);
  if (!['read', 'write', 'append'].includes(mode.name)) throw new PrologError('domain_error(io_mode)', mode);
  const streamTarget = deref(goal.args[2], env);
  if (streamTarget.type !== VAR) throw new PrologError('uninstantiation_error', streamTarget);
  const options = goal.arity === 3 ? {} : openOptions(goal.args[3], env);
  if (options.alias && solver.io.resolve(options.alias)) throw new PrologError('permission_error(open, source_sink)', atom(options.alias));
  let stream;
  try {
    stream = solver.io.open(path.name, mode.name, options);
  } catch (_) {
    throw new PrologError('existence_error(source_sink)', path);
  }
  const next = env.clone();
  if (unify(goal.args[2], streamHandle(stream.id), next)) yield next;
  else solver.io.close(stream);
}

function* closeBuiltin({ solver, goal, env }) {
  if (goal.arity === 2) {
    for (const option of optionList(goal.args[1], env)) {
      if (option.type === VAR) throw new PrologError('instantiation_error');
      const force = optionAtom(option, 'force');
      const value = force && deref(force, env);
      if (value?.type === VAR) throw new PrologError('instantiation_error');
      if (!value || value.type !== ATOM || !['true', 'false'].includes(value.name)) {
        throw new PrologError('domain_error(close_option)', option);
      }
    }
  }
  const stream = requireStream(solver, goal.args[0], env);
  if (!stream.standard) {
    if (solver.io.currentInput === stream.id) solver.io.currentInput = 0;
    if (solver.io.currentOutput === stream.id) solver.io.currentOutput = 1;
    solver.io.close(stream);
  }
  yield env;
}

function* currentInputBuiltin({ solver, goal, env }) {
  const value = deref(goal.args[0], env);
  if (value.type !== VAR) {
    const stream = solver.io.resolve(streamReference(goal.args[0], env));
    if (!stream) throw new PrologError('domain_error(stream)', value);
    if (stream.id === solver.io.currentInput) yield env;
    return;
  }
  const next = env.clone();
  if (unify(goal.args[0], streamHandle(solver.io.currentInput), next)) yield next;
}
function* currentOutputBuiltin({ solver, goal, env }) {
  const value = deref(goal.args[0], env);
  if (value.type !== VAR) {
    const stream = solver.io.resolve(streamReference(goal.args[0], env));
    if (!stream) throw new PrologError('domain_error(stream)', value);
    if (stream.id === solver.io.currentOutput) yield env;
    return;
  }
  const next = env.clone();
  if (unify(goal.args[0], streamHandle(solver.io.currentOutput), next)) yield next;
}
function setCurrentStreamBuiltin(mode) {
  return function* ({ solver, goal, env }) {
    const stream = requireStream(solver, goal.args[0], env, mode);
    if (mode === 'read') solver.io.currentInput = stream.id;
    else solver.io.currentOutput = stream.id;
    yield env;
  };
}
function* flushOutputBuiltin({ solver, goal, env }) {
  requireStream(solver, goal.args[0], env, 'write');
  yield env;
}

function streamProperties(stream) {
  const properties = [
    compound('mode', [atom(stream.mode)]),
    compound('type', [atom(stream.type)]),
    compound('reposition', [atom(stream.reposition ? 'true' : 'false')]),
    compound('eof_action', [atom(stream.eofAction)]),
    compound('position', [numberTerm(stream.position)]),
  ];
  properties.push(atom(stream.mode === 'read' ? 'input' : 'output'));
  properties.push(compound('end_of_stream', [
    atom(stream.pastEnd ? 'past' : stream.position >= stream.content.length ? 'at' : 'not'),
  ]));
  if (stream.alias) properties.push(compound('alias', [atom(stream.alias)]));
  if (stream.path) properties.push(compound('file_name', [atom(stream.path)]));
  return properties;
}
function* setStreamPositionBuiltin({ solver, goal, env }) {
  const stream = requireStream(solver, goal.args[0], env);
  if (!stream.reposition) throw new PrologError('permission_error(reposition, stream)', deref(goal.args[0], env));
  let position = deref(goal.args[1], env);
  if (position.type === COMPOUND && position.name === 'position' && position.arity === 1) {
    position = deref(position.args[0], env);
  }
  if (position.type === VAR) throw new PrologError('instantiation_error');
  if (position.type !== NUMBER || !isDecimalInteger(position.name)) throw new PrologError('domain_error(stream_position)', position);
  const offset = BigInt(position.name);
  if (offset < 0n || offset > BigInt(stream.content.length)) throw new PrologError('domain_error(stream_position)', position);
  stream.position = Number(offset);
  stream.pastEnd = false;
  yield env;
}
function* streamPropertyBuiltin({ solver, goal, env }) {
  const reference = deref(goal.args[0], env);
  const streams = reference.type === VAR ? [...solver.io.streams.values()] : [requireStream(solver, goal.args[0], env)];
  for (const stream of streams) {
    for (const property of streamProperties(stream)) {
      const next = env.clone();
      if (unify(goal.args[0], streamHandle(stream.id), next) && unify(goal.args[1], property, next)) yield next;
    }
  }
}

function inputStreamFor(solver, goal, env) {
  return goal.arity === 1 ? solver.io.resolve(solver.io.currentInput) : requireStream(solver, goal.args[0], env, 'read');
}
function outputStreamFor(solver, goal, env) {
  return goal.arity === 1 ? solver.io.resolve(solver.io.currentOutput) : requireStream(solver, goal.args[0], env, 'write');
}
function* atEndBuiltin({ solver, goal, env }) {
  const stream = goal.arity === 0 ? solver.io.resolve(solver.io.currentInput) : requireStream(solver, goal.args[0], env, 'read');
  if (stream.position >= stream.content.length) yield env;
}
function inputUnitBuiltin(name) {
  return function* ({ solver, goal, env }) {
    const stream = inputStreamFor(solver, goal, env);
    const binary = name.endsWith('byte');
    if (binary !== (stream.type === 'binary')) throw new PrologError('permission_error(input, stream)', streamHandle(stream.id));
    if (stream.pastEnd && stream.eofAction === 'error') {
      throw new PrologError('permission_error(input, past_end_of_stream)', streamHandle(stream.id));
    }
    if (stream.pastEnd && stream.eofAction === 'reset') {
      // A terminal EOF (Ctrl-D) is local to one input operation. The next
      // operation should wait for fresh terminal input rather than rewinding
      // and replaying the already-consumed interactive buffer.
      if (typeof stream.interactiveReadUnit !== 'function') stream.position = 0;
      stream.pastEnd = false;
    }
    const peek = name.startsWith('peek');
    if (stream.position >= stream.content.length &&
        typeof stream.interactiveReadUnit === 'function') {
      const text = stream.interactiveReadUnit();
      if (text != null) {
        stream.content += String(text);
        stream.pastEnd = false;
      }
    }
    let unit;
    try {
      unit = solver.io.readUnit(stream, peek);
    } catch (error) {
      if (error?.name === 'InvalidCharacterEncodingError') {
        throw new PrologError('representation_error(character)');
      }
      throw error;
    }
    if (unit == null && !peek) stream.pastEnd = true;
    const result = unit == null ? (binary ? numberTerm(-1) : name.endsWith('code') ? numberTerm(-1) : atom('end_of_file'))
      : binary ? numberTerm(unit) : name.endsWith('code') ? numberTerm(unit.codePointAt(0)) : atom(unit);
    const target = goal.args[goal.arity - 1];
    const next = env.clone();
    if (unify(target, result, next)) yield next;
  };
}
function outputUnitBuiltin(name) {
  return function* ({ solver, goal, env }) {
    const stream = outputStreamFor(solver, goal, env);
    const value = deref(goal.args[goal.arity - 1], env);
    if (value.type === VAR) throw new PrologError('instantiation_error');
    if (name === 'put_char') {
      if (stream.type !== 'text') throw new PrologError('permission_error(output, binary_stream)', streamHandle(stream.id));
      if (!oneChar(value)) throw new PrologError('type_error(character)', value);
      solver.io.writeUnit(stream, value.name);
    } else {
      if ((name === 'put_byte') !== (stream.type === 'binary')) {
        throw new PrologError('permission_error(output, stream)', streamHandle(stream.id));
      }
      if (value.type !== NUMBER || !isDecimalInteger(value.name)) throw new PrologError('type_error(integer)', value);
      const code = BigInt(value.name);
      const max = name === 'put_byte' ? 255n : 0x10ffffn;
      if (code < 0n || code > max) throw new PrologError(name === 'put_byte' ? 'type_error(byte)' : 'representation_error(character_code)');
      solver.io.writeUnit(stream, name === 'put_byte' ? Number(code) : String.fromCodePoint(Number(code)));
    }
    yield env;
  };
}
function* nlBuiltin({ solver, goal, env }) {
  const stream = goal.arity === 0
    ? solver.io.resolve(solver.io.currentOutput)
    : requireStream(solver, goal.args[0], env, 'write');
  if (stream.type !== 'text') throw new PrologError('permission_error(output, binary_stream)', streamHandle(stream.id));
  solver.io.writeUnit(stream, '\n');
  yield env;
}

function activeCharConverter(solver) {
  if (solver.prologFlags.get('char_conversion')?.value?.name !== 'on' || solver.charConversions.size === 0) {
    return null;
  }
  return (character) => solver.charConversions.get(character) ?? character;
}

function* termTextCandidates(stream, solver) {
  const source = String(stream.content);
  const convert = activeCharConverter(solver);
  let quote = null, lineComment = false, blockComment = false;
  for (let i = stream.position; i < source.length; i++) {
    const ch = source[i], next = source[i + 1];
    if (lineComment) { if (ch === '\n') lineComment = false; continue; }
    if (blockComment) { if (ch === '*' && next === '/') { blockComment = false; i++; } continue; }
    if (quote) {
      if (ch === '\\') i = quotedEscapeEnd(source, i);
      else if (ch !== ' ' && /^[\u0009-\u000d]$/.test(ch)) {
        // Literal layout characters are not quoted characters (6.4.2.1).
        // Surface the lexical error immediately even when there is no later
        // full stop; otherwise read/1 would misreport malformed input as EOF.
        yield { text: source.slice(stream.position, i + 1), end: i + 1, lexicalError: true };
        return;
      }
      else if (ch === quote && next === quote) i++;
      else if (ch === quote) quote = null;
      continue;
    }
    const characterCodeEnd = characterCodeConstantEnd(source, i);
    if (characterCodeEnd != null) { i = characterCodeEnd; continue; }
    if (ch === '%') { lineComment = true; continue; }
    // Comment openers are recognized between tokens. Within a maximal
    // graphic token, as in `//*`, the slash and star remain atom characters.
    if (ch === '/' && next === '*' && !continuesGraphicToken(source, i)) {
      blockComment = true;
      i++;
      continue;
    }
    if (ch === "'" || ch === '"') { quote = ch; continue; }
    if (isTerminatingFullStop(source, i, convert)) {
      yield { text: source.slice(stream.position, i + 1), end: i + 1 };
    }
  }
}
function hasNonLayoutRemainder(source, start) {
  return lastNonLayoutIndex(source, start) >= start;
}
function lastNonLayoutIndex(source, start = 0) {
  const ignored = /[\u0009-\u000d\u0020]+|%[^\n]*(?:\n|$)|\/\*[\s\S]*?\*\//g;
  ignored.lastIndex = start;
  let cursor = start;
  let last = -1;
  for (let match = ignored.exec(source); match != null; match = ignored.exec(source)) {
    if (match.index > cursor) last = match.index - 1;
    cursor = match.index + match[0].length;
  }
  if (cursor < source.length) last = source.length - 1;
  return last;
}
function convertedTermText(text, solver) {
  if (solver.prologFlags.get('char_conversion')?.value?.name !== 'on' || solver.charConversions.size === 0) return text;
  let result = '', quote = null;
  for (let i = 0; i < text.length; i++) {
    const ch = text[i], next = text[i + 1];
    if (quote) {
      result += ch;
      if (ch === '\\') {
        const end = quotedEscapeEnd(text, i);
        if (end > i) result += text.slice(i + 1, end + 1);
        i = end;
      } else if (ch === quote && next === quote) {
        result += next;
        i++;
      } else if (ch === quote) {
        quote = null;
      }
    } else if (ch === "'" || ch === '"') {
      quote = ch;
      result += ch;
    } else {
      result += solver.charConversions.get(ch) ?? ch;
    }
  }
  return result;
}

function scopeReadTerm(term) {
  // A term read from a stream has its own variable set (ISO 7.10.3).  Parser
  // variable names cannot be used as environment identities here: a caller
  // such as read(X) and an input term X=a would otherwise share the same `X`
  // and incorrectly attempt the cyclic unification X=(X=a).  Use an internal
  // name containing NUL, which cannot occur in Prolog source, while retaining
  // the spelling and occurrence count required by read_term/3 metadata.
  const scope = ++isoFresh;
  const bySourceName = new Map();
  const variables = [];

  const copy = (item) => {
    if (item.type === VAR) {
      let record = bySourceName.get(item.name);
      if (record == null) {
        const scoped = variable(`\u0000read:${scope}:${variables.length}`);
        scoped.displayName = item.name;
        record = {
          sourceName: item.name,
          term: scoped,
          count: 0,
          anonymous: item.name.startsWith('__anon'),
        };
        bySourceName.set(item.name, record);
        variables.push(record);
      }
      record.count++;
      return record.term;
    }
    if (item.type !== COMPOUND) return item;
    return compound(item.name, item.args.map(copy));
  };

  return { term: copy(term), variables };
}

function parseReadTermText(text, solver) {
  const converted = convertedTermText(text, solver);
  const operatorState = createParserOperatorState(solver.program.operators.values(), false);
  return parseTermText(converted, {
    operatorState,
    isoStrict: solver.isoStrict,
    doubleQuotes: solver.prologFlags.get('double_quotes')?.value?.name ?? 'chars',
    // The stream scanner supplies one candidate ending at this full stop.
    // Earlier ambiguous dots must remain available to maximal graphic tokens.
    readTermEnd: converted.length - 1,
  });
}

export function isCompleteReadTermText(text, solver) {
  try {
    parseReadTermText(text, solver);
    return true;
  } catch (_) {
    return false;
  }
}

function readTermFromStream(stream, solver) {
  let requestedInteractiveTerm = false;
  while (true) {
    let sawCandidate = false;
    for (const candidate of termTextCandidates(stream, solver)) {
      sawCandidate = true;
      if (candidate.lexicalError) {
        stream.position = candidate.end;
        throw new PrologError('syntax_error(read_term)');
      }
      try {
        const term = parseReadTermText(candidate.text, solver);
        stream.position = candidate.end;
        return scopeReadTerm(term);
      } catch (error) {
        if (error instanceof NumberRepresentationError) throw new PrologError(error.formal);
        // A dot inside a graphic operator, such as =.., is only a possible
        // terminator. Keep scanning until a complete term parses.
      }
    }

    // The interactive top level may attach a synchronous reader to the
    // standard user_input stream. Ask it for one complete read-term only when
    // this read operation actually reaches the end of buffered input. This is
    // deliberately a stream hook, not goal-shape recognition, so conjunctions
    // and reads reached through user predicates behave the same as read/1.
    if (!sawCandidate && !requestedInteractiveTerm &&
        typeof stream.interactiveReadTerm === 'function') {
      requestedInteractiveTerm = true;
      const text = stream.interactiveReadTerm();
      if (text != null) {
        stream.content += String(text);
        stream.pastEnd = false;
        continue;
      }
    }

    const source = String(stream.content);
    const remainderStart = stream.position;
    stream.position = source.length;
    if (!sawCandidate) {
      if (hasNonLayoutRemainder(source, remainderStart)) throw new PrologError('syntax_error(read_term)');
      return { term: atom('end_of_file'), variables: [] };
    }
    throw new PrologError('syntax_error(read_term)');
  }
}

function* readBuiltin({ solver, goal, env }) {
  const stream = inputStreamFor(solver, goal, env);
  if (stream.type !== 'text') throw new PrologError('permission_error(input, binary_stream)', streamHandle(stream.id));
  const next = env.clone();
  const { term } = readTermFromStream(stream, solver);
  if (unify(goal.args[goal.arity - 1], term, next)) yield next;
}
function* readTermBuiltin({ solver, goal, env }) {
  const stream = goal.arity === 2 ? solver.io.resolve(solver.io.currentInput) : requireStream(solver, goal.args[0], env, 'read');
  if (stream.type !== 'text') throw new PrologError('permission_error(input, binary_stream)', streamHandle(stream.id));
  const options = optionList(goal.args[goal.arity - 1], env);
  const target = goal.args[goal.arity - 2];
  const { term, variables } = readTermFromStream(stream, solver);
  const next = env.clone();
  if (!unify(target, term, next)) return;
  for (const option of options) {
    if (option.type === VAR) throw new PrologError('instantiation_error');
    if (option.type !== COMPOUND || option.arity !== 1) throw new PrologError('domain_error(read_option)', option);
    let value;
    if (option.name === 'variables') {
      value = listFromItems(variables.map((item) => item.term));
    } else if (option.name === 'variable_names') {
      value = listFromItems(variables
        .filter((item) => !item.anonymous)
        .map((item) => compound('=', [atom(item.sourceName), item.term])));
    } else if (option.name === 'singletons') {
      value = listFromItems(variables
        .filter((item) => !item.anonymous && item.count === 1)
        .map((item) => compound('=', [atom(item.sourceName), item.term])));
    } else {
      throw new PrologError('domain_error(read_option)', option);
    }
    if (!unify(option.args[0], value, next)) return;
  }
  yield next;
}
function defaultTermWriteOptions(mode) {
  if (mode === 'writeq') return { quoted: true, ignoreOps: false, numbervars: true, variableNames: new Map(), compact: true, operatorAtomsAsArgs: true, doubleQuotes: null };
  if (mode === 'canonical') return { quoted: true, ignoreOps: true, numbervars: false, variableNames: new Map(), compact: true, operatorAtomsAsArgs: true, doubleQuotes: null };
  if (mode === 'write_term') return { quoted: false, ignoreOps: false, numbervars: false, variableNames: new Map(), compact: true, operatorAtomsAsArgs: true, doubleQuotes: null };
  return { quoted: false, ignoreOps: false, numbervars: true, variableNames: new Map(), compact: true, operatorAtomsAsArgs: true, doubleQuotes: null };
}

function writeOptionBoolean(value, env, option) {
  value = deref(value, env);
  if (value.type === VAR) throw new PrologError('instantiation_error');
  if (value.type !== ATOM || !['true', 'false'].includes(value.name)) {
    throw new PrologError('domain_error(write_option)', option);
  }
  return value.name === 'true';
}

function writeVariableNames(value, env, option) {
  value = deref(value, env);
  if (value.type === VAR) throw new PrologError('instantiation_error');
  const items = properListItems(value, env);
  if (items == null) {
    if (isPartialList(value, env)) throw new PrologError('instantiation_error');
    throw new PrologError('domain_error(write_option)', option);
  }
  const names = new Map();
  for (const item of items) {
    const pair = deref(item, env);
    if (pair.type !== COMPOUND || pair.name !== '=' || pair.arity !== 2) {
      throw new PrologError('domain_error(write_option)', option);
    }
    const name = deref(pair.args[0], env);
    const target = deref(pair.args[1], env);
    if (name.type === VAR) throw new PrologError('instantiation_error');
    if (name.type !== ATOM) {
      throw new PrologError('domain_error(write_option)', option);
    }
    // Corrigendum 3 permits any term on the right. Only variables can name a
    // variable being written; retain the leftmost applicable entry.
    if (target.type === VAR && !names.has(target.name)) names.set(target.name, name.name);
  }
  return names;
}

function termWriteOptions(term, env, mode = 'write_term') {
  const result = defaultTermWriteOptions(mode);
  for (const option of optionList(term, env)) {
    if (option.type === VAR) throw new PrologError('instantiation_error');
    if (option.type !== COMPOUND || option.arity !== 1) {
      throw new PrologError('domain_error(write_option)', option);
    }
    if (option.name === 'quoted') result.quoted = writeOptionBoolean(option.args[0], env, option);
    else if (option.name === 'ignore_ops') result.ignoreOps = writeOptionBoolean(option.args[0], env, option);
    else if (option.name === 'numbervars') result.numbervars = writeOptionBoolean(option.args[0], env, option);
    else if (option.name === 'double_quotes') result.doubleQuotes = writeOptionBoolean(option.args[0], env, option);
    else if (option.name === 'variable_names') result.variableNames = writeVariableNames(option.args[0], env, option);
    else throw new PrologError('domain_error(write_option)', option);
  }
  return result;
}

function writeBuiltin(mode) {
  return function* ({ solver, goal, env }) {
    const stream = outputStreamFor(solver, goal, env);
    if (stream.type !== 'text') throw new PrologError('permission_error(output, binary_stream)', streamHandle(stream.id));
    const options = defaultTermWriteOptions(mode);
    solver.io.writeUnit(stream, formatTermForWrite(goal.args[goal.arity - 1], env, {
      ...options,
      generateVariableNames: true,
      variableNameState: solver.writeVariableState,
      operators: solver.program.operators.values(),
    }));
    yield env;
  };
}
function* writeTermBuiltin({ solver, goal, env }) {
  const stream = goal.arity === 2 ? solver.io.resolve(solver.io.currentOutput) : requireStream(solver, goal.args[0], env, 'write');
  if (stream.type !== 'text') throw new PrologError('permission_error(output, binary_stream)', streamHandle(stream.id));
  const options = termWriteOptions(goal.args[goal.arity - 1], env);
  if (options.doubleQuotes === true) {
    options.doubleQuotes = solver.prologFlags.get('double_quotes')?.value?.name ?? 'chars';
  } else {
    options.doubleQuotes = null;
  }
  solver.io.writeUnit(stream, formatTermForWrite(goal.args[goal.arity - 2], env, {
    ...options,
    generateVariableNames: true,
    variableNameState: solver.writeVariableState,
    operators: solver.program.operators.values(),
  }));
  yield env;
}

function resolvedOrVariable(term, env, expected) {
  const value = deref(term, env);
  if (value.type !== VAR && value.type !== expected) {
    throw new PrologError(`type_error(${expected === ATOM ? 'atom' : 'number'})`, value);
  }
  return value;
}

function characters(text) {
  return Array.from(text);
}

function* atomLengthBuiltin({ goal, env }) {
  const value = deref(goal.args[0], env);
  if (value.type === VAR) throw new PrologError('instantiation_error');
  if (value.type !== ATOM) throw new PrologError('type_error(atom)', value);
  const length = deref(goal.args[1], env);
  if (length.type !== VAR && (length.type !== NUMBER || !isDecimalInteger(length.name))) {
    throw new PrologError('type_error(integer)', length);
  }
  if (length.type === NUMBER && BigInt(length.name) < 0n) {
    throw new PrologError('domain_error(not_less_than_zero)', length);
  }
  const next = env.clone();
  if (unify(goal.args[1], numberTerm(characters(value.name).length), next)) yield next;
}

function* atomConcatBuiltin({ goal, env }) {
  const first = resolvedOrVariable(goal.args[0], env, ATOM);
  const second = resolvedOrVariable(goal.args[1], env, ATOM);
  const whole = resolvedOrVariable(goal.args[2], env, ATOM);
  if (first.type === VAR && whole.type === VAR) throw new PrologError('instantiation_error');
  if (second.type === VAR && whole.type === VAR) throw new PrologError('instantiation_error');

  const candidates = [];
  if (whole.type === ATOM && first.type === VAR && second.type === VAR) {
    const chars = characters(whole.name);
    for (let i = 0; i <= chars.length; i++) candidates.push([chars.slice(0, i).join(''), chars.slice(i).join(''), whole.name]);
  } else if (first.type === ATOM && second.type === ATOM) {
    candidates.push([first.name, second.name, first.name + second.name]);
  } else if (first.type === ATOM && whole.type === ATOM && whole.name.startsWith(first.name)) {
    candidates.push([first.name, whole.name.slice(first.name.length), whole.name]);
  } else if (second.type === ATOM && whole.type === ATOM && whole.name.endsWith(second.name)) {
    candidates.push([whole.name.slice(0, whole.name.length - second.name.length), second.name, whole.name]);
  }
  for (const [a, b, c] of candidates) {
    const next = env.clone();
    if (unify(goal.args[0], atom(a), next) && unify(goal.args[1], atom(b), next) &&
        unify(goal.args[2], atom(c), next)) yield next;
  }
}

function optionalNonNegativeInteger(term, env) {
  const value = deref(term, env);
  if (value.type === VAR) return null;
  if (value.type !== NUMBER || !isDecimalInteger(value.name)) throw new PrologError('type_error(integer)', value);
  const integer = BigInt(value.name);
  if (integer < 0n) throw new PrologError('domain_error(not_less_than_zero)', value);
  return integer;
}

function* subAtomBuiltin({ goal, env }) {
  const source = deref(goal.args[0], env);
  if (source.type === VAR) throw new PrologError('instantiation_error');
  if (source.type !== ATOM) throw new PrologError('type_error(atom)', source);
  const sub = resolvedOrVariable(goal.args[4], env, ATOM);
  const before = optionalNonNegativeInteger(goal.args[1], env);
  const length = optionalNonNegativeInteger(goal.args[2], env);
  const after = optionalNonNegativeInteger(goal.args[3], env);
  const chars = characters(source.name);
  for (let start = 0; start <= chars.length; start++) {
    if (before != null && before !== BigInt(start)) continue;
    for (let size = 0; size <= chars.length - start; size++) {
      const remaining = chars.length - start - size;
      if (length != null && length !== BigInt(size)) continue;
      if (after != null && after !== BigInt(remaining)) continue;
      const text = chars.slice(start, start + size).join('');
      if (sub.type === ATOM && sub.name !== text) continue;
      const next = env.clone();
      if (unify(goal.args[1], numberTerm(start), next) &&
          unify(goal.args[2], numberTerm(size), next) &&
          unify(goal.args[3], numberTerm(remaining), next) &&
          unify(goal.args[4], atom(text), next)) yield next;
    }
  }
}

function listElements(term, env) {
  const items = [];
  let cursor = deref(term, env);
  while (cursor.type === COMPOUND && cursor.name === '.' && cursor.arity === 2) {
    items.push(deref(cursor.args[0], env));
    cursor = deref(cursor.args[1], env);
  }
  return { items, tail: cursor };
}

function oneChar(value) {
  return value.type === ATOM && characters(value.name).length === 1;
}

function validCharacterCode(value) {
  if (value.type !== NUMBER || !isDecimalInteger(value.name)) return false;
  const code = BigInt(value.name);
  return code >= 0n && code <= 0x10ffffn && !(code >= 0xd800n && code <= 0xdfffn);
}

function listToAtomInput(list, env, kind) {
  const { items, tail } = listElements(list, env);
  if (tail.type === VAR || items.some((item) => item.type === VAR)) throw new PrologError('instantiation_error');
  if (tail.type !== ATOM || tail.name !== '[]') throw new PrologError('type_error(list)', tail);
  if (kind === 'chars') {
    const invalid = items.find((item) => !oneChar(item));
    if (invalid) throw new PrologError('type_error(character)', invalid);
    return items.map((item) => item.name).join('');
  }
  const nonInteger = items.find((item) => item.type !== NUMBER || !isDecimalInteger(item.name));
  if (nonInteger) throw new PrologError('type_error(integer)', nonInteger);
  const invalid = items.find((item) => !validCharacterCode(item));
  if (invalid) throw new PrologError('representation_error(character_code)');
  return items.map((item) => String.fromCodePoint(Number(item.name))).join('');
}

function atomListBuiltin(kind) {
  return function* ({ goal, env }) {
    const value = deref(goal.args[0], env);
    if (value.type !== VAR && value.type !== ATOM) throw new PrologError('type_error(atom)', value);
    const list = deref(goal.args[1], env);
    if (value.type === VAR && list.type === VAR) throw new PrologError('instantiation_error');
    const next = env.clone();
    if (value.type === ATOM) {
      const { items: supplied, tail } = listElements(list, env);
      if (tail.type !== VAR && !(tail.type === ATOM && tail.name === '[]')) {
        throw new PrologError('type_error(list)', list);
      }
      const invalid = supplied.find((item) => item.type !== VAR &&
        (kind === 'chars' ? !oneChar(item) :
          item.type !== NUMBER || !isDecimalInteger(item.name) || !validCharacterCode(item)));
      if (invalid) {
        if (kind === 'chars') throw new PrologError('type_error(character)', invalid);
        if (invalid.type !== NUMBER || !isDecimalInteger(invalid.name)) {
          throw new PrologError('type_error(integer)', invalid);
        }
        throw new PrologError('representation_error(character_code)');
      }
      const items = characters(value.name).map((ch) =>
        kind === 'chars' ? atom(ch) : numberTerm(ch.codePointAt(0)));
      if (unify(goal.args[1], listFromItems(items), next)) yield next;
      return;
    }
    if (unify(goal.args[0], atom(listToAtomInput(list, env, kind)), next)) yield next;
  };
}
const atomCharsBuiltin = atomListBuiltin('chars');
const atomCodesBuiltin = atomListBuiltin('codes');

function* charCodeBuiltin({ goal, env }) {
  const char = deref(goal.args[0], env);
  const code = deref(goal.args[1], env);
  if (char.type === VAR && code.type === VAR) throw new PrologError('instantiation_error');
  if (char.type !== VAR && !oneChar(char)) throw new PrologError('type_error(character)', char);
  if (code.type !== VAR && (code.type !== NUMBER || !isDecimalInteger(code.name))) {
    throw new PrologError('type_error(integer)', code);
  }
  if (code.type !== VAR && !validCharacterCode(code)) throw new PrologError('representation_error(character_code)');
  const next = env.clone();
  if (char.type === ATOM) {
    if (unify(goal.args[1], numberTerm(char.name.codePointAt(0)), next)) yield next;
  } else if (unify(goal.args[0], atom(String.fromCodePoint(Number(code.name))), next)) yield next;
}

function skipNumberLayout(text, start) {
  let position = start;
  while (true) {
    while (position < text.length && /[\u0009-\u000d\u0020]/.test(text[position])) {
      position++;
    }
    if (text[position] === '%') {
      const newline = text.indexOf('\n', position + 1);
      if (newline < 0) return text.length;
      position = newline + 1;
      continue;
    }
    if (text.startsWith('/*', position)) {
      const end = text.indexOf('*/', position + 2);
      if (end < 0) return text.length;
      position = end + 2;
      continue;
    }
    return position;
  }
}

function quotedNumberSign(text, start) {
  if (text[start] !== "'") return null;
  let position = start + 1;
  let value = '';
  while (position < text.length) {
    let character = text[position++];
    if (character === "'") {
      if (text[position] === "'") {
        position++;
        value += "'";
        continue;
      }
      return { value, position };
    }
    if (character !== '\\') {
      value += character;
      continue;
    }
    if (position >= text.length) return null;
    character = text[position++];
    if (character === '\n') continue;
    const controls = { a: '\x07', b: '\b', r: '\r', f: '\f', t: '\t', n: '\n', v: '\v' };
    if (controls[character] != null) {
      value += controls[character];
      continue;
    }
    value += character;
  }
  return null;
}

function parseIsoNumber(text) {
  if (text.length === 0) return null;
  let position = skipNumberLayout(text, 0);
  let sign = '';

  if (text[position] === '-') {
    const next = text[position + 1] ?? '';
    // Every token class may carry leading layout (6.4).  Thus a negative
    // number may have layout between the name `-` and its numeric token.  A
    // `%...\n` comment can start immediately after `-` because `%` cannot
    // continue a graphic name token.  In contrast `/*...*/` cannot start
    // there without separating layout: `/` *can* continue the graphic token,
    // and the eager-consumer rule therefore keeps `-/**/1` ill-formed (the
    // number_chars continuation corpus case 24).
    if (/[\u0009-\u000d\u0020]/.test(next) || next === '%') {
      position = skipNumberLayout(text, position + 1);
      sign = '-';
    }
  } else {
    const quoted = quotedNumberSign(text, position);
    if (quoted?.value === '-') {
      position = skipNumberLayout(text, quoted.position);
      sign = '-';
    }
  }

  const numericText = `${sign}${text.slice(position)}`;
  // 8.16.7/8.16.8 parse the character sequence according to the syntax rules
  // for numbers and negative numbers (6.3.1.1/6.3.1.2), not as an arbitrary
  // term whose value happens to be numeric. Every such number starts with a
  // decimal digit after an optional negative sign, so parenthesized terms such
  // as `(0)` or `-(0)` must be rejected before the general term parser sees
  // them. This keeps the parser reuse below from admitting grouping syntax.
  if (!/^-?\d/.test(numericText)) return null;
  // ISO floating-point syntax requires a decimal fraction before an exponent.
  if (/^-?\d+[eE][+-]?\d+$/.test(numericText)) return null;
  try {
    const value = parseNumberTokenText(numericText);
    if (isDecimalInteger(value.name)) return numberTerm(BigInt(value.name).toString());
    const finite = Number(value.name);
    if (!Number.isFinite(finite)) return null;
    return numberTerm(numberTextFromDouble(finite));
  } catch (error) {
    if (error instanceof NumberRepresentationError) throw new PrologError(error.formal);
    return null;
  }
}

function sameNumber(left, right) {
  return sameNumberValue(left.name, right.name);
}

function canonicalNumberText(value) {
  if (isDecimalInteger(value.name)) return BigInt(value.name).toString();
  const finite = Number(value.name);
  // ISO 13211-1 has a single floating-point zero: a source spelling with a
  // minus sign does not denote a distinct -0.0 value.  Generate the same
  // character sequence for both spellings so converting that sequence back
  // cannot make number_chars/2 change its own subsequent output.
  if (finite === 0) return '0.0';
  if (Number.isFinite(finite) && /^-?\d+\.\d+(?:[eE][+-]?\d+)?$/.test(value.name)) {
    return value.name;
  }
  const text = numberTextFromDouble(finite);
  if (text == null) throw new PrologError(floatRepresentationErrorFormal(value.name));
  return text;
}

function numberListText(list, env, kind, valueIsBound) {
  const whole = deref(list, env);
  const { items, tail } = listElements(list, env);
  const proper = tail.type === ATOM && tail.name === '[]';
  if (tail.type !== VAR && !proper) throw new PrologError('type_error(list)', whole);

  const invalid = items.find((item) => item.type !== VAR &&
    (kind === 'chars' ? !oneChar(item) : !validCharacterCode(item)));
  if (invalid) {
    if (kind === 'chars') throw new PrologError('type_error(character)', invalid);
    if (invalid.type !== NUMBER || !isDecimalInteger(invalid.name)) {
      throw new PrologError('type_error(integer)', invalid);
    }
    throw new PrologError('representation_error(character_code)');
  }

  const hasVariable = tail.type === VAR || items.some((item) => item.type === VAR);
  if (!valueIsBound && hasVariable) throw new PrologError('instantiation_error');
  if (hasVariable) return null;
  return items.map((item) => kind === 'chars'
    ? item.name
    : String.fromCodePoint(Number(item.name))).join('');
}

const numberSyntaxError = new PrologError('syntax_error(number)');

function numberListBuiltin(kind) {
  return function* ({ goal, env }) {
    const value = deref(goal.args[0], env);
    if (value.type !== VAR && value.type !== NUMBER) throw new PrologError('type_error(number)', value);
    const list = deref(goal.args[1], env);
    if (value.type === VAR && list.type === VAR) throw new PrologError('instantiation_error');
    const text = numberListText(list, env, kind, value.type === NUMBER);
    if (value.type === NUMBER) {
      if (text != null) {
        const parsed = parseIsoNumber(text);
        if (parsed == null) throw numberSyntaxError;
        if (sameNumber(value, parsed)) yield env.clone();
        return;
      }
      const items = characters(canonicalNumberText(value)).map((ch) =>
        kind === 'chars' ? atom(ch) : numberTerm(ch.codePointAt(0)));
      const next = env.clone();
      if (unify(goal.args[1], listFromItems(items), next)) yield next;
      return;
    }
    const parsed = parseIsoNumber(text);
    if (parsed == null) throw numberSyntaxError;
    const next = env.clone();
    if (unify(goal.args[0], parsed, next)) yield next;
  };
}
const numberCharsBuiltin = numberListBuiltin('chars');
const numberCodesBuiltin = numberListBuiltin('codes');

class FindallListTerm {
  constructor(items, offset = 0) {
    this.type = COMPOUND;
    this.name = '.';
    this._items = items;
    this._offset = offset;
    this._compactLength = BigInt(items.length - offset);
    this._args = null;
  }
  get arity() { return 2; }
  get args() {
    if (this._args == null) {
      const next = this._offset + 1;
      this._args = [
        typeof this._items.get === 'function' ? this._items.get(this._offset) : this._items[this._offset],
        next >= this._items.length ? emptyList() : new FindallListTerm(this._items, next),
      ];
    }
    return this._args;
  }
}

class FlatCompoundFindallItems {
  constructor(template) {
    this.name = template.name;
    this.arity = template.arity;
    this.columns = Array.from({ length: this.arity }, () => []);
  }
  get length() {
    return this.arity === 0 ? 0 : this.columns[0].length;
  }
  push(template, env) {
    const values = new Array(this.arity);
    for (let i = 0; i < this.arity; i++) {
      const value = deref(template.args[i], env);
      if (value.type === VAR || value.type === COMPOUND) return false;
      values[i] = value;
    }
    for (let i = 0; i < this.arity; i++) this.columns[i].push(values[i]);
    return true;
  }
  get(index) {
    return compound(this.name, this.columns.map((column) => column[index]));
  }
  materialize() {
    const out = new Array(this.length);
    for (let i = 0; i < out.length; i++) out[i] = this.get(i);
    return out;
  }
}

function findallListFromItems(items) {
  return items.length === 0 ? emptyList() : new FindallListTerm(items);
}

function flatFindallTemplate(template) {
  return template.type === COMPOUND && template.arity > 0 &&
    template.args.every((arg) => arg.type !== COMPOUND)
    ? new FlatCompoundFindallItems(template)
    : null;
}

function* findallBuiltin({ solver, goal, env }) {
  const [template, innerGoal, bag] = goal.args;
  assertListOrPartial(bag, env);
  const collector = solver.cloneForInnerGoal(10000000);
  let compact = flatFindallTemplate(template);
  let collected = compact == null ? [] : null;
  for (const answerEnv of collector.solve([callable(innerGoal, env)], env.clone(), 0)) {
    if (compact != null && compact.push(template, answerEnv)) continue;
    if (compact != null) {
      collected = compact.materialize();
      compact = null;
    }
    collected.push(freshCopy(template, answerEnv));
  }
  solver.absorbStatsFrom(collector);
  const next = env.clone();
  if (unify(bag, findallListFromItems(compact ?? collected), next)) yield next;
}

function collectVariableNames(term, env, names = new Set()) {
  term = deref(term, env);
  if (term.type === VAR) {
    names.add(term.name);
  } else {
    for (const arg of term.args) collectVariableNames(arg, env, names);
  }
  return names;
}

function bagGoalParts(term, env) {
  const quantified = new Set();
  let iterated = deref(term, env);
  while (iterated.type === COMPOUND && iterated.name === '^' && iterated.arity === 2) {
    collectVariableNames(iterated.args[0], env, quantified);
    iterated = deref(iterated.args[1], env);
  }
  return { iterated: callable(iterated, env), quantified };
}

function assertListOrPartial(term, env) {
  if (properListItems(term, env) != null || isPartialList(term, env)) return;
  throw new PrologError('type_error(list)', deref(term, env));
}

function freeVariables(goal, template, quantified, env) {
  const templateNames = collectVariableNames(template, env);
  const goalNames = collectVariableNames(goal, env);
  return [...goalNames]
    .filter((name) => !templateNames.has(name) && !quantified.has(name))
    .map(variable);
}

function sameWitness(left, right) {
  return variantTerms(left, new Env(), right, new Env());
}

function sortedUnique(items) {
  const variableRanks = new Map();
  const compare = (left, right) => compareTerms(left, right, variableRanks);
  const sorted = [...items].sort(compare);
  return sorted.filter((item, index) => index === 0 || compare(sorted[index - 1], item) !== 0);
}

function allSolutionsBuiltin(asSet) {
  return function* ({ solver, goal, env }) {
    assertListOrPartial(goal.args[2], env);
    const { iterated, quantified } = bagGoalParts(goal.args[1], env);
    const free = freeVariables(iterated, goal.args[0], quantified, env);
    const collector = solver.cloneForInnerGoal(10000000);
    const groups = [];
    for (const answerEnv of collector.solve([iterated], env.clone(), 0)) {
      const copied = freshCopy(compound('$bag', [
        compound('$witness', free),
        goal.args[0],
      ]), answerEnv);
      let group = groups.find((candidate) => sameWitness(candidate.witness, copied.args[0]));
      if (!group) {
        group = { witness: copied.args[0], templates: [] };
        groups.push(group);
        group.templates.push(copied.args[1]);
      } else {
        const alignment = new Env();
        unify(copied.args[0], group.witness, alignment);
        group.templates.push(copyResolved(copied.args[1], alignment));
      }
    }
    solver.absorbStatsFrom(collector);
    for (const group of groups) {
      const next = env.clone();
      let matches = true;
      for (let i = 0; i < free.length; i++) {
        if (!unify(free[i], group.witness.args[i], next)) { matches = false; break; }
      }
      const templates = asSet ? sortedUnique(group.templates) : group.templates;
      if (matches && unify(goal.args[2], listFromItems(templates), next)) yield next;
    }
  };
}
const bagofBuiltin = allSolutionsBuiltin(false);
const setofBuiltin = allSolutionsBuiltin(true);

function callable(term, env) {
  term = deref(term, env);
  if (term.type === VAR) throw new PrologError('instantiation_error');
  if (term.type !== ATOM && term.type !== COMPOUND) throw new PrologError('type_error(callable)', term);
  validateControlCallable(term, term, env);
  return term;
}
function validateControlCallable(term, culprit, env) {
  // Only control constructs need their nested goals validated at meta-call
  // entry. Walk them iteratively and dereference each nested goal lazily so
  // passing a callable that contains a very deep data term (for example
  // phrase(a, List) with an 8k-cell List) never consumes the JavaScript stack.
  const pending = [term];
  while (pending.length > 0) {
    const current = deref(pending.pop(), env);
    if (current.type !== COMPOUND || ![',', ';', '->'].includes(current.name) || current.arity !== 2) continue;
    for (let index = current.arity - 1; index >= 0; index--) {
      const argument = deref(current.args[index], env);
      // A variable nested in a control construct is not an error at call/1
      // entry: an earlier goal may instantiate it before execution reaches
      // that position. If it is still unbound when selected, the solver then
      // raises instantiation_error at that point, after any preceding effects.
      // Non-variable non-callables are different: ISO call/1 validates those
      // eagerly and reports the whole control term as the culprit.
      if (argument.type === VAR) continue;
      if (argument.type !== ATOM && argument.type !== COMPOUND) {
        throw new PrologError('type_error(callable)', culprit);
      }
      pending.push(argument);
    }
  }
}
function* callBuiltin({ solver, goal, env }) {
  const child = solver.cloneForInnerGoal();
  try {
    yield* child.solve([callable(goal.args[0], env)], env, 0);
  } finally {
    solver.absorbStatsFrom(child);
  }
}
function* callClosureBuiltin({ solver, goal, env }) {
  const closure = callable(goal.args[0], env);
  const existing = closure.type === COMPOUND ? closure.args : [];
  const invoked = compound(closure.name, [...existing, ...goal.args.slice(1)]);
  if (closure.module != null) invoked.module = closure.module;
  const child = solver.cloneForInnerGoal();
  try {
    yield* child.solve([invoked], env, 0);
  } finally {
    solver.absorbStatsFrom(child);
  }
}

function* countAllBuiltin({ solver, goal, env }) {
  const requested = deref(goal.args[1], env);
  // Validate Count before inspecting or executing Goal. This preserves the
  // expected error priority for e.g. countall(throw(x), -1).
  if (requested.type !== VAR) {
    if (requested.type !== NUMBER || !isDecimalInteger(requested.name)) {
      throw new PrologError('type_error(integer)', requested);
    }
    if (BigInt(requested.name) < 0n) {
      throw new PrologError('domain_error(not_less_than_zero)', requested);
    }
  }

  const invoked = callable(goal.args[0], env);
  let count = solver.fastCountGoal?.(invoked, env) ?? null;
  if (count == null) {
    const child = solver.cloneForInnerGoal();
    count = 0n;
    try {
      for (const _ of child.solve([invoked], env.clone(), 0)) count++;
    } finally {
      solver.absorbStatsFrom(child);
    }
  }

  const next = env.clone();
  if (unify(goal.args[1], numberTerm(count), next)) yield next;
}

function monotonicMilliseconds() {
  return globalThis.performance?.now?.() ?? Date.now();
}

function writeElapsedTime(solver, startedAt, inferences) {
  const stream = solver.io.resolve(solver.io.currentOutput);
  if (stream?.type !== 'text') throw new PrologError('permission_error(output, binary_stream)');
  const elapsedSeconds = Math.max(0, monotonicMilliseconds() - startedAt) / 1000;
  const mlips = elapsedSeconds > 0 ? inferences / elapsedSeconds / 1_000_000 : 0;
  solver.io.writeUnit(
    stream,
    `% Time elapsed ${elapsedSeconds.toFixed(3)}s, ${inferences} Inferences, ${mlips.toFixed(3)} MLips\n`,
  );
}

function* timeBuiltin({ solver, goal, env }) {
  const invoked = callable(goal.args[0], env);
  const child = solver.cloneForInnerGoal();
  let startedAt = monotonicMilliseconds();
  let startedInferences = child.inferenceObservation.value;
  let yieldedAny = false;
  try {
    for (const answerEnv of child.solve([invoked], env, 0)) {
      writeElapsedTime(solver, startedAt, child.inferenceObservation.value - startedInferences);
      yieldedAny = true;
      yield answerEnv;
      // A resumed time/1 measures only the work required to reach the next
      // answer, so nondeterministic calls get one timing line per solution.
      startedAt = monotonicMilliseconds();
      startedInferences = child.inferenceObservation.value;
    }
    // A call that fails without producing an answer still reports the work.
    if (!yieldedAny) writeElapsedTime(solver, startedAt, child.inferenceObservation.value - startedInferences);
  } finally {
    solver.absorbStatsFrom(child);
  }
}

function* callNthBuiltin({ solver, goal, env }) {
  const requestedTerm = deref(goal.args[1], env);
  // Zero is the one Nth value that fails before Goal is inspected.
  if (requestedTerm.type === NUMBER && isDecimalInteger(requestedTerm.name) && BigInt(requestedTerm.name) === 0n) return;

  const invoked = callable(goal.args[0], env);
  let requested = null;
  if (requestedTerm.type !== VAR) {
    if (requestedTerm.type !== NUMBER || !isDecimalInteger(requestedTerm.name)) {
      throw new PrologError('type_error(integer)', requestedTerm);
    }
    requested = BigInt(requestedTerm.name);
    if (requested < 0n) throw new PrologError('domain_error(not_less_than_zero)', requestedTerm);
  }

  const child = solver.cloneForInnerGoal();
  let nth = 0n;
  try {
    for (const answerEnv of child.solve([invoked], env, 0)) {
      nth++;
      if (requested != null && nth < requested) continue;
      const next = answerEnv.clone();
      if (unify(goal.args[1], numberTerm(nth.toString()), next)) yield next;
      if (requested != null) return;
    }
  } finally {
    solver.absorbStatsFrom(child);
  }
}

function* freezeBuiltin({ solver, goal, env }) {
  const watched = deref(goal.args[0], env);
  if (watched.type !== VAR) {
    const child = solver.cloneForInnerGoal();
    try {
      yield* child.solve([callable(goal.args[1], env)], env, 0);
    } finally {
      solver.absorbStatsFrom(child);
    }
    return;
  }
  const next = env.clone();
  next.delay(watched.name, goal.args[1], goal.module ?? 'user');
  yield next;
}

function* phraseBuiltin({ solver, goal, env }) {
  const grammarBody = deref(goal.args[0], env);
  if (grammarBody.type === VAR) throw new PrologError('instantiation_error');
  if (grammarBody.type !== ATOM && grammarBody.type !== COMPOUND) {
    throw new PrologError('type_error(callable)', grammarBody);
  }
  const input = goal.args[1];
  const requestedOutput = goal.arity === 2 ? emptyTerminalSequence() : goal.args[2];
  validateDcgEmbeddedGoals(grammarBody, input, requestedOutput);
  if (!isListOrPartialList(input, env)) {
    throw new PrologError('type_error(list)', deref(input, env));
  }
  if (!isListOrPartialList(requestedOutput, env)) {
    throw new PrologError('type_error(list)', deref(requestedOutput, env));
  }

  // phrase/2 fixes the remainder to [] from the outset. phrase/3 keeps a
  // private output variable and delays the final unification so its third
  // argument remains steadfast as required by the Part 3 execution model.
  const finalOutput = goal.arity === 2
    ? requestedOutput
    : variable(`\u0000phrase:${++isoFresh}`);
  const expanded = expandDcgBody(grammarBody, input, finalOutput, {
    env,
    module: goal.module ?? grammarBody.module ?? 'user',
  });
  const finish = goal.arity === 2 ? null : compound('=', [finalOutput, requestedOutput]);
  // Recursive DCGs are automatically tabled in normal mode. Keep tables in a
  // phrase-local scope keyed by the whole invocation. Repeatedly testing the
  // same grammar/input (issue #48) reuses its completed table, while switching
  // to a distinct input (issue #28) drops the previous invocation as one unit
  // instead of retaining or individually evicting every recursive tail.
  const phraseModule = goal.module ?? grammarBody.module ?? 'user';
  const tableScopeSignature = solver.innerTableSignature(
    [grammarBody, input, requestedOutput],
    env,
    `${phraseModule}:`,
  );
  const previousPhraseScope = solver.innerTableScopes.get('phrase');
  const repeatedInvocation = previousPhraseScope?.signature === tableScopeSignature;
  const child = solver.cloneForInnerGoal(solver.solutionLimit, {
    tableScope: 'phrase',
    tableScopeSignature,
    // A new phrase input cannot benefit from tables retained for a different
    // input. For structurally tail-consuming DCGs, execute it directly. If the
    // same invocation repeats (the issue #48 pattern), normal tabling resumes
    // and the compact phrase-local table is reused by subsequent repetitions.
    skipListTailTabling: !repeatedInvocation,
  });
  try {
    yield* child.solve(finish == null ? [expanded] : [expanded, finish], env, 0);
  } finally {
    solver.absorbStatsFrom(child);
    solver.trimInnerTableScope('phrase');
  }
}
const defaultErrorContext = atom('eyeprolog');

function parseFormalErrorTerm(text) {
  const open = text.indexOf('(');
  if (open === -1) return atom(text);
  const name = text.slice(0, open);
  const inner = text.slice(open + 1, -1);
  const args = [];
  let start = 0;
  let depth = 0;
  for (let i = 0; i <= inner.length; i++) {
    const ch = inner[i];
    if (ch === '(') depth++;
    else if (ch === ')') depth--;
    else if ((ch === ',' || i === inner.length) && depth === 0) {
      args.push(parseFormalErrorTerm(inner.slice(start, i).trim()));
      start = i + 1;
    }
  }
  return compound(name, args);
}

function hasDefaultGroundErrorShape(error) {
  return error.formalTerm == null && error.culprit == null && error.contextTerm == null;
}

export function formalErrorTerm(error) {
  // Reused processor errors can occur hundreds of thousands of times in a
  // caught failure loop. Cache their immutable ground error/2 term on the
  // error object itself instead of rebuilding the same tree on every catch.
  if (hasDefaultGroundErrorShape(error) && error._groundErrorTerm != null) {
    return error._groundErrorTerm;
  }

  const context = error.contextTerm ?? defaultErrorContext;
  let formal = error.formalTerm ?? parseFormalErrorTerm(error.formal);
  if (error.culprit != null) {
    if (formal.type === COMPOUND) formal = compound(formal.name, [...formal.args, error.culprit]);
    else if (formal.type === ATOM && formal.name === 'uninstantiation_error') {
      formal = compound(formal.name, [error.culprit]);
    }
  }
  const term = compound('error', [formal, context]);
  if (hasDefaultGroundErrorShape(error)) error._groundErrorTerm = term;
  return term;
}

function prologErrorBall(error) {
  const term = formalErrorTerm(error);
  // Ground terms are immutable from unification's perspective: bindings are
  // recorded only in the catcher Env, so copying them is unnecessary.
  if (hasDefaultGroundErrorShape(error) || termIsGround(term)) return term;
  return freshCopy(term, new Env());
}
function* catchBuiltin({ solver, goal, env }) {
  let child = null;
  try {
    // Corrigendum 2 removed catch/3's own callability errors so that errors
    // raised while converting/executing the protected goal are catchable.
    const invoked = callable(goal.args[0], env);
    const direct = solver.registry.get(invoked.name, invoked.arity);
    if (direct?.deterministic && (direct.shouldUse == null || direct.shouldUse({ solver, goal: invoked, env }))) {
      // A deterministic builtin has no choice points whose lifetime must be
      // isolated in a child solver. Running it directly avoids constructing a
      // complete Solver for hot caught failures such as number_chars/2 syntax
      // probes, while the cloned environment keeps catch/3's rollback boundary.
      const iterator = direct.handler({ solver, goal: invoked, env: env.clone() });
      const result = iterator.next();
      if (result.done) solver.stats.deterministic_builtin_failures++;
      else {
        solver.stats.deterministic_builtin_successes++;
        yield result.value;
      }
      return;
    }
    child = solver.cloneForInnerGoal();
    yield* child.solve([invoked], env.clone(), 0);
  } catch (error) {
    const ball = error instanceof ThrownTerm
      ? error.term
      : error instanceof PrologError
        ? prologErrorBall(error)
        : null;
    if (ball == null) throw error;
    const recovered = env.clone();
    if (!unify(goal.args[1], ball, recovered)) throw error;
    const recovery = callable(goal.args[2], recovered);
    if (recovery.type === ATOM && (recovery.name === 'false' || recovery.name === 'fail')) return;
    if (recovery.type === ATOM && recovery.name === 'true') {
      yield recovered;
      return;
    }
    yield* solver.solve([recovery], recovered, 0);
  } finally {
    if (child != null) solver.absorbStatsFrom(child);
  }
}
function* throwBuiltin({ goal, env }) {
  const ball = deref(goal.args[0], env);
  if (ball.type === VAR) throw new PrologError('instantiation_error');
  // ISO throw/1 copies the thrown term before control unwinds. Freshen
  // variables so the catcher cannot retain aliases to the protected goal.
  throw new ThrownTerm(freshCopy(ball, env));
}
function* onceBuiltin({ solver, goal, env }) {
  const child = solver.cloneForInnerGoal(1);
  for (const answer of child.solve([callable(goal.args[0], env)], env.clone(), 0)) {
    solver.absorbStatsFrom(child);
    yield answer;
    return;
  }
  solver.absorbStatsFrom(child);
}
function* repeatBuiltin({ env }) {
  while (true) yield env;
}
function* negationBuiltin({ solver, goal, env }) {
  const invoked = callable(goal.args[0], env);
  const direct = solver.registry.get(invoked.name, invoked.arity);
  if (direct?.deterministic && (direct.shouldUse == null || direct.shouldUse({ solver, goal: invoked, env }))) {
    const iterator = direct.handler({ solver, goal: invoked, env: env.clone() });
    const result = iterator.next();
    if (result.done) {
      solver.stats.deterministic_builtin_failures++;
      yield env;
    } else {
      solver.stats.deterministic_builtin_successes++;
    }
    return;
  }
  const fastTruth = solver.fastGroundGoalTruth?.(invoked, env) ?? null;
  if (fastTruth != null) {
    if (!fastTruth) yield env;
    return;
  }
  for (const _ of solver.cloneForInnerGoal(1).solve([invoked], env.clone(), 0)) return;
  yield env;
}
function* solveControlBranch(solver, goal, env) {
  for (const answer of solver.solve([callable(goal, env)], env, 0)) {
    // A branch answer is internal to its enclosing control construct. The
    // surrounding solve will count the completed control goal after the
    // builtin yields it. Leaving both counts in place makes a bounded search
    // such as once/1 or negation stop before it can observe the branch answer.
    if (solver.solutionsSeen > 0) solver.solutionsSeen--;
    yield answer;
  }
}
function* disjunctionBuiltin({ solver, goal, env }) {
  const left = deref(goal.args[0], env);
  if (left.type === COMPOUND && left.name === '->' && left.arity === 2) {
    for (const conditionEnv of solver.cloneForInnerGoal(1).solve([callable(left.args[0], env)], env.clone(), 0)) {
      yield* solveControlBranch(solver, left.args[1], conditionEnv);
      return;
    }
    yield* solveControlBranch(solver, goal.args[1], env.clone());
    return;
  }
  const marker = solver.active[solver.active.length - 1] ?? null;
  const markerCutEpoch = marker?.cutEpoch ?? 0;
  const solverCutEpoch = solver.cutEpoch;
  yield* solveControlBranch(solver, goal.args[0], env.clone());
  const cutThisScope = marker == null
    ? solver.cutEpoch !== solverCutEpoch
    : (marker.cutEpoch ?? 0) !== markerCutEpoch;
  if (cutThisScope) return;
  yield* solveControlBranch(solver, goal.args[1], env.clone());
}
function* ifThenBuiltin({ solver, goal, env }) {
  for (const conditionEnv of solver.cloneForInnerGoal(1).solve([callable(goal.args[0], env)], env.clone(), 0)) {
    yield* solveControlBranch(solver, goal.args[1], conditionEnv);
    return;
  }
}

export { arithmeticValueTerm, evaluateArithmetic, compareArithmeticValues } from './iso-arithmetic.js';
import { isBuiltin, arithmeticComparison } from './iso-arithmetic.js';


export class BuiltinRegistry {
  constructor() {
    this.defs = new Map();
  }

  add(name, arity, handler, options = {}) {
    this.defs.set(`${name}/${arity}`, {
      name,
      arity,
      handler,
      deterministic: options.deterministic ?? false,
      ready: options.ready ?? null,
      fallbackWhenNotReady: options.fallbackWhenNotReady ?? false,
      shouldUse: options.shouldUse ?? null,
      eyePrologLibrary: options.eyePrologLibrary ?? false,
    });
    return this;
  }

  get(name, arity) {
    return this.defs.get(`${name}/${arity}`) ?? null;
  }

  remove(name, arity) {
    this.defs.delete(`${name}/${arity}`);
    return this;
  }
}

export function createDefaultRegistry() {
  const registry = new BuiltinRegistry();
  isoBuiltins.register(registry);
  return registry;
}

// ISO/IEC 13211-1:1995 + Corrigenda 1-3 only.  phrase/2-3 and grammar-rule
// expansion belong to the separate grammar-rule specification, while the
// EyeProlog standard-library/CLP(Z) adapters are registered elsewhere.
export function createStrictIsoRegistry() {
  return createDefaultRegistry()
    .remove('phrase', 2)
    .remove('phrase', 3);
}

let defaultRegistry = null;
let strictIsoRegistry = null;

export function getDefaultRegistry() {
  if (defaultRegistry == null) defaultRegistry = createDefaultRegistry();
  return defaultRegistry;
}

export function getStrictIsoRegistry() {
  if (strictIsoRegistry == null) strictIsoRegistry = createStrictIsoRegistry();
  return strictIsoRegistry;
}
