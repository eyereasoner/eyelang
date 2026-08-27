// Small host primitives needed by Scryer-style declarative libraries.
//
// Keep these facilities generic: they are not part of the CLP(Z) engine. The
// backtrackable blackboard lives in Env so ordinary Prolog choice points undo
// writes automatically.

import { ATOM, COMPOUND, NUMBER, STRING, VAR, atom, compound, deref, listFromItems, unify } from './term.js';
import { PrologError } from './errors.js';
import { formatTermForWrite } from './write.js';

function blackboardKey(term, env) {
  const value = deref(term, env);
  if (value.type === ATOM) return `a:${value.name}`;
  if (value.type === NUMBER) return `n:${value.name}`;
  if (value.type === STRING) return `s:${value.name}`;
  if (value.type === 'var') throw new PrologError('instantiation_error');
  throw new PrologError('type_error(atomic)', value);
}

function* bbGetBuiltin({ goal, env }) {
  const key = blackboardKey(goal.args[0], env);
  const stored = env.getBacktrackableBlackboard(key);
  if (stored === undefined) return;
  const next = env.clone();
  if (unify(goal.args[1], stored, next)) yield next;
}

function* bbPutBuiltin({ goal, env }) {
  const next = env.clone();
  const key = blackboardKey(goal.args[0], next);
  next.putBacktrackableBlackboard(key, deref(goal.args[1], next));
  yield next;
}

function* bbGlobalGetBuiltin({ solver, goal, env }) {
  const key = blackboardKey(goal.args[0], env);
  const stored = solver.nonBacktrackableBlackboard.get(key);
  if (stored === undefined) return;
  const next = env.clone();
  if (unify(goal.args[1], stored, next)) yield next;
}

function* bbGlobalPutBuiltin({ solver, goal, env }) {
  const key = blackboardKey(goal.args[0], env);
  solver.nonBacktrackableBlackboard.set(key, deref(goal.args[1], env));
  yield env;
}

const charTypeNames = new Set([
  'alnum', 'alpha', 'alphabetic', 'alphanumeric', 'ascii', 'ascii_graphic',
  'ascii_punctuation', 'binary_digit', 'control', 'decimal_digit', 'exponent',
  'graphic', 'graphic_token', 'hexadecimal_digit', 'layout', 'lower', 'meta',
  'numeric', 'octal_digit', 'octet', 'prolog', 'sign', 'solo',
  'symbolic_control', 'symbolic_hexadecimal', 'upper', 'whitespace',
]);

function charTypeCandidates(ch) {
  const code = ch.codePointAt(0);
  const letter = /\p{L}/u.test(ch);
  const decimal = /\p{Nd}/u.test(ch);
  const numeric = /\p{N}/u.test(ch);
  const whitespace = /\s/u.test(ch);
  const control = /\p{Cc}/u.test(ch);
  const lower = /\p{Ll}/u.test(ch);
  const upper = /\p{Lu}/u.test(ch);
  const asciiGraphic = code >= 0x21 && code <= 0x7e;
  const out = [];
  const add = (name, yes) => { if (yes) out.push(atom(name)); };
  add('alnum', letter || decimal);
  add('alpha', letter);
  add('alphabetic', letter);
  add('alphanumeric', letter || decimal);
  add('ascii', code <= 0x7f);
  add('ascii_graphic', asciiGraphic);
  add('ascii_punctuation', asciiGraphic && !letter && !decimal);
  add('binary_digit', ch === '0' || ch === '1');
  add('control', control);
  add('decimal_digit', decimal);
  add('exponent', ch === 'e' || ch === 'E');
  add('graphic', !whitespace && !control);
  add('graphic_token', '#$&*+-./:<=>?@\\^~'.includes(ch));
  add('hexadecimal_digit', /^[0-9A-Fa-f]$/.test(ch));
  add('layout', whitespace);
  add('lower', lower);
  add('meta', "\\'\"`".includes(ch));
  add('numeric', numeric);
  add('octal_digit', /^[0-7]$/.test(ch));
  add('octet', code <= 0xff);
  add('prolog', true);
  add('sign', ch === '+' || ch === '-');
  add('solo', '!,;[]{}()|'.includes(ch));
  add('symbolic_control', '#$&*+-./:<=>?@\\^~'.includes(ch));
  add('symbolic_hexadecimal', /^[A-Fa-f]$/.test(ch));
  add('upper', upper);
  add('whitespace', whitespace);
  out.push(compound('lower', [listFromItems([...ch.toLowerCase()].map(atom))]));
  out.push(compound('upper', [listFromItems([...ch.toUpperCase()].map(atom))]));
  return out;
}

function validCharType(term) {
  return (term.type === ATOM && charTypeNames.has(term.name)) ||
    (term.type === COMPOUND && ['lower', 'upper'].includes(term.name) && term.arity === 1);
}

function charTypeBuiltin(context) {
  const state = { pending: false };
  const iterator = charTypeSolutions(context, state);
  iterator.hasPendingAlternatives = () => state.pending;
  return iterator;
}

function* charTypeSolutions({ goal, env }, state) {
  const char = deref(goal.args[0], env);
  const type = deref(goal.args[1], env);
  if (char.type === VAR && type.type === VAR) throw new PrologError('instantiation_error');
  if (char.type !== VAR && (char.type !== ATOM || [...char.name].length !== 1)) {
    throw new PrologError('type_error(character)', char);
  }
  if (type.type !== VAR && !validCharType(type)) throw new PrologError('domain_error(char_type)', type);

  const firstCode = char.type === VAR ? 0 : char.name.codePointAt(0);
  const lastCode = char.type === VAR ? 0x10ffff : firstCode;
  for (let code = firstCode; code <= lastCode; code++) {
    if (code >= 0xd800 && code <= 0xdfff) continue;
    const ch = String.fromCodePoint(code);
    const candidates = charTypeCandidates(ch).filter((candidate) =>
      type.type === VAR || (candidate.type === type.type && candidate.name === type.name));
    for (let index = 0; index < candidates.length; index++) {
      const candidate = candidates[index];
      const next = env.clone();
      if (unify(goal.args[0], atom(ch), next) && unify(goal.args[1], candidate, next)) {
        state.pending = index + 1 < candidates.length || code < lastCode;
        yield next;
      }
    }
  }
  state.pending = false;
}

const shortMonths = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
const longMonths = ['January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December'];
const shortWeekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
const longWeekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

function chars(value) {
  return listFromItems([...String(value)].map(atom));
}

function* currentTimeBuiltin({ goal, env }) {
  const now = new Date();
  const pad = (value, width = 2) => String(value).padStart(width, '0');
  const dayOfYear = Math.floor((
    Date.UTC(now.getFullYear(), now.getMonth(), now.getDate()) -
    Date.UTC(now.getFullYear(), 0, 1)
  ) / 86400000) + 1;
  const entries = [
    ['Y', String(now.getFullYear())],
    ['m', pad(now.getMonth() + 1)],
    ['d', pad(now.getDate())],
    ['H', pad(now.getHours())],
    ['M', pad(now.getMinutes())],
    ['S', pad(now.getSeconds())],
    ['y', pad(now.getFullYear() % 100)],
    ['b', shortMonths[now.getMonth()]],
    ['B', longMonths[now.getMonth()]],
    ['a', shortWeekdays[now.getDay()]],
    ['A', longWeekdays[now.getDay()]],
    ['w', String(now.getDay())],
    ['u', String(now.getDay() === 0 ? 7 : now.getDay())],
    ['j', pad(dayOfYear, 3)],
  ].map(([key, value]) => compound('=', [atom(key), chars(value)]));
  const next = env.clone();
  if (unify(goal.args[0], listFromItems(entries), next)) yield next;
}

function* abolishAllTablesBuiltin({ solver, env }) {
  solver.memo.clear();
  solver.subsumptiveMemo.clear();
  solver.wfsModels.clear();
  solver.datalogModels.clear();
  solver.tableCoordinator = null;
  solver.groundChainSuccess.clear();
  solver.compactChainSuccess.clear();
  for (const scope of solver.innerTableScopes.values()) {
    scope.memo.clear();
    scope.subsumptiveMemo.clear();
  }
  yield env;
}

function* termCharsBuiltin({ solver, goal, env }) {
  const mode = deref(goal.args[0], env);
  if (mode.type !== ATOM || !['a', 'd', 'q', 'w'].includes(mode.name)) {
    throw new PrologError('domain_error(format_control)', mode);
  }
  const value = deref(goal.args[1], env);
  if (mode.name === 'd' && value.type !== NUMBER) throw new PrologError('type_error(integer)', value);
  if (mode.name === 'a' && ![ATOM, NUMBER, STRING].includes(value.type)) {
    throw new PrologError('type_error(atomic)', value);
  }
  const text = formatTermForWrite(goal.args[1], env, {
    quoted: mode.name === 'q',
    numbervars: true,
    compact: true,
    minimalOperatorSpacing: true,
    operatorAtomsAsArgs: true,
    generateVariableNames: true,
    variableNameState: solver.writeVariableState,
    operators: solver.program.operators.values(),
  });
  const next = env.clone();
  if (unify(goal.args[2], chars(text), next)) yield next;
}

export const scryerCompatibilityBuiltins = {
  register(registry) {
    registry.add('eyeprolog__bb_get', 2, bbGetBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__bb_b_put', 2, bbPutBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__bb_global_get', 2, bbGlobalGetBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__bb_global_put', 2, bbGlobalPutBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__char_type', 2, charTypeBuiltin, { eyePrologLibrary: true });
    registry.add('eyeprolog__current_time', 1, currentTimeBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__abolish_all_tables', 0, abolishAllTablesBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__term_chars', 3, termCharsBuiltin, { deterministic: true, eyePrologLibrary: true });
  },
};
