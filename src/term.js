// Term model, environments, unification, readback, and ordering helpers.
// Keep dependencies minimal because nearly every other module imports this file.
import { sameNumberValue } from './number-value.js';

export const VAR = 'var';
export const ATOM = 'atom';
export const STRING = 'string';
export const NUMBER = 'number';
export const COMPOUND = 'compound';
const EMPTY_ARGS = Object.freeze([]);
const ENV_FLATTEN_DEPTH = 1024;

export class Term {
  constructor(type, name, args = []) {
    this.type = type;
    this.name = String(name ?? '');
    this.args = args;
  }
  get arity() {
    return this.args.length;
  }
}

// A fixed-length list of fresh variables is represented as one compact
// skeleton and expanded cell-by-cell only when a goal actually inspects it.
// This keeps ordinary logical construction proportional to what the program
// observes instead of eagerly allocating two host objects per list element.
export class CompactListTerm {
  constructor(length, variablePrefix, offset = 0n, state = null) {
    this.type = COMPOUND;
    this.name = '.';
    this._compactLength = BigInt(length);
    this._variablePrefix = variablePrefix;
    this._offset = BigInt(offset);
    this._compactState = state ?? { maxPossiblyBoundIndex: -1n };
    this._args = null;
  }
  get arity() {
    return 2;
  }
  get args() {
    if (this._args == null) {
      const head = variable(`${this._variablePrefix}${this._offset}`);
      head._compactState = this._compactState;
      head._compactIndex = this._offset;
      const tail = this._compactLength === 1n
        ? emptyList()
        : new CompactListTerm(
          this._compactLength - 1n,
          this._variablePrefix,
          this._offset + 1n,
          this._compactState,
        );
      this._args = [head, tail];
    }
    return this._args;
  }
  mayContainVariable(name) {
    if (String(name).startsWith(this._variablePrefix)) {
      const indexText = String(name).slice(this._variablePrefix.length);
      if (/^\d+$/.test(indexText)) {
        const index = BigInt(indexText);
        if (index >= this._offset && index < this._offset + this._compactLength) return true;
      }
    }
    // If no generated head in this suffix has ever participated in a binding,
    // an unrelated variable cannot occur below it. This remains conservative
    // across backtracking because the high-water mark is never rolled back.
    return this._compactState.maxPossiblyBoundIndex >= this._offset;
  }
}

export const variable = (name) => new Term(VAR, name, EMPTY_ARGS);
export const atom = (name) => new Term(ATOM, name, EMPTY_ARGS);
export const stringTerm = (value) => new Term(STRING, value, EMPTY_ARGS);
export const numberTerm = (value) => new Term(NUMBER, value, EMPTY_ARGS);
export const compound = (name, args = []) => args.length === 0 ? atom(name) : new Term(COMPOUND, name, args);
export const emptyList = () => atom('[]');
export const cons = (head, tail) => compound('.', [head, tail]);
export const compactVariableList = (length, variablePrefix) => {
  const size = BigInt(length);
  return size === 0n ? emptyList() : new CompactListTerm(size, variablePrefix);
};
export const isCompactList = (term) => term instanceof CompactListTerm;
export const compactListLength = (term) => typeof term?._compactLength === 'bigint' ? term._compactLength : null;

export class Env {
  constructor(bindings) {
    this._state = {
      bindings: bindings ? new Map(bindings) : null,
      bindingName: null,
      bindingValue: undefined,
      parent: null,
      depth: 0,
      cacheName: null,
      cacheValue: undefined,
      cache: null,
    };
    this._delays = null;
    this._clpz = null;
    this._occursCheckHandler = null;
  }
  clone() {
    // Most speculative environments are either rejected without a binding or
    // only compare ground terms. Persistent layers make cloning constant-time
    // and keep later writes to either branch isolated. Hot-path layers store a
    // single binding directly; a Map is allocated only when a deep chain is
    // occasionally flattened.
    const clone = Object.create(Env.prototype);
    clone._state = this._state;
    clone._delays = this._delays;
    clone._clpz = this._clpz;
    clone._occursCheckHandler = this._occursCheckHandler;
    return clone;
  }
  setOccursCheckHandler(handler) {
    this._occursCheckHandler = typeof handler === 'function' ? handler : null;
    return this;
  }
  has(name) {
    return this.get(name) !== undefined;
  }
  get(name) {
    const root = this._state;
    if (root.cacheName === name) return root.cacheValue;
    const cached = root.cache?.get(name);
    if (cached !== undefined) return cached;
    for (let state = root; state != null; state = state.parent) {
      let value;
      let found = false;
      if (state.bindingName === name) {
        value = state.bindingValue;
        found = true;
      } else if (state.bindings?.has(name)) {
        value = state.bindings.get(name);
        found = true;
      }
      if (found) {
        if (root.depth >= 4) {
          if (root.cacheName == null) {
            root.cacheName = name;
            root.cacheValue = value;
          } else {
            (root.cache ??= new Map([[root.cacheName, root.cacheValue]])).set(name, value);
          }
        }
        return value;
      }
    }
    return undefined;
  }
  bind(name, term) {
    if (this._state.depth >= ENV_FLATTEN_DEPTH) {
      const flattened = new Map();
      for (let state = this._state; state != null; state = state.parent) {
        if (state.bindingName != null && !flattened.has(state.bindingName)) {
          flattened.set(state.bindingName, state.bindingValue);
        }
        if (state.bindings) {
          for (const [key, value] of state.bindings) {
            if (!flattened.has(key)) flattened.set(key, value);
          }
        }
      }
      flattened.set(name, term);
      this._state = {
        bindings: flattened,
        bindingName: null,
        bindingValue: undefined,
        parent: null,
        depth: 0,
        cacheName: null,
        cacheValue: undefined,
        cache: null,
      };
      return;
    }
    this._state = {
      bindings: null,
      bindingName: name,
      bindingValue: term,
      parent: this._state,
      depth: this._state.depth + 1,
      cacheName: null,
      cacheValue: undefined,
      cache: null,
    };
  }
  delay(name, goal, module = 'user') {
    const delays = new Map(this._delays ?? []);
    delays.set(name, [...(delays.get(name) ?? []), { goal, module }]);
    this._delays = delays;
  }
  takeReadyDelays() {
    if (this._delays == null || this._delays.size === 0) return [];
    const ready = [];
    let remaining = this._delays;
    for (const [name, delays] of this._delays) {
      if (deref(variable(name), this).type === VAR) continue;
      if (remaining === this._delays) remaining = new Map(this._delays);
      remaining.delete(name);
      ready.push(...delays);
    }
    if (ready.length > 0) this._delays = remaining;
    return ready;
  }
}

export function deref(term, env) {
  // Follow variable bindings until a non-variable term is reached. The seen set
  // protects readback from accidental cycles in partially constructed terms.
  let current = term;
  let seen = null;
  while (current?.type === VAR) {
    const next = env?.get(current.name);
    if (next === undefined) break;
    if (seen?.has(current.name)) break;
    (seen ??= new Set()).add(current.name);
    current = next;
  }
  return current;
}

export function isScalar(term) {
  return term && (term.type === ATOM || term.type === STRING || term.type === NUMBER);
}

export function isEmptyList(term) {
  return term?.type === ATOM && term.name === '[]';
}

export function isCons(term) {
  return term?.type === COMPOUND && term.name === '.' && term.arity === 2;
}

export function isConjunction(term) {
  return term?.type === COMPOUND && term.name === ',' && term.arity === 2;
}

function occurs(variableName, term, env) {
  // Walk bindings and compound arguments iteratively so the occurs check also
  // remains safe for very deep terms. The visited sets make this defensive
  // against cycles introduced through the public Env API.
  if (isScalar(term)) return false;
  const stack = [term];
  const seenVariables = new Set();
  const seenTerms = new Set();

  while (stack.length) {
    const current = stack.pop();
    if (current?.type === VAR) {
      if (current.name === variableName) return true;
      if (seenVariables.has(current.name)) continue;
      seenVariables.add(current.name);
      const binding = env?.get(current.name);
      if (binding !== undefined) stack.push(binding);
      continue;
    }
    if (isCompactList(current) && !current.mayContainVariable(variableName)) continue;
    if (current?.type !== COMPOUND || seenTerms.has(current)) continue;
    seenTerms.add(current);
    for (let i = 0; i < current.arity; i++) stack.push(current.args[i]);
  }

  return false;
}

export function unify(left, right, env, options = {}) {
  // Iterative unification avoids deep JavaScript recursion on long lists or
  // deeply nested compounds. The occurs check gives EyeProlog finite-tree
  // unification: a variable cannot be bound to a term containing itself.
  // Bindings are written into the supplied Env.
  const occursCheckHandler = options.occursCheck === 'fail' ? null : env?._occursCheckHandler;
  // Callers may provide a proof that selected variables cannot occur in the
  // term they are about to receive.  Source-level first-use analysis and a few
  // construction fast paths share this internal proof; ordinary unification
  // remains fully occurs-checked.
  const knownNonoccurringVariables = options.knownNonoccurringVariables ?? null;
  const stack = [[left, right]];
  while (stack.length) {
    let [a, b] = stack.pop();
    a = deref(a, env);
    b = deref(b, env);

    if (a.type === VAR && b.type === VAR && a.name === b.name) continue;
    if (a.type === VAR && b.type === VAR) {
      // Both variables are already dereferenced and unbound, so linking them
      // cannot create a cycle and needs no occurs-check traversal.
      markCompactVariableBound(a);
      env.bind(a.name, b);
      continue;
    }
    if (a.type === VAR) {
      if (!knownNonoccurringVariables?.has(a.name) && occurs(a.name, b, env)) {
        occursCheckHandler?.(a, b, env);
        return false;
      }
      markCompactVariableBound(a);
      env.bind(a.name, b);
      continue;
    }
    if (b.type === VAR) {
      if (!knownNonoccurringVariables?.has(b.name) && occurs(b.name, a, env)) {
        occursCheckHandler?.(b, a, env);
        return false;
      }
      markCompactVariableBound(b);
      env.bind(b.name, a);
      continue;
    }

    if (a.type !== b.type) {
      return false;
    }

    if (isScalar(a)) {
      if (a.type === NUMBER ? !sameNumberValue(a.name, b.name) : a.name !== b.name) return false;
      continue;
    }

    if (a.type === COMPOUND) {
      if (a.name !== b.name || a.arity !== b.arity) return false;
      for (let i = a.arity - 1; i >= 0; i--) stack.push([a.args[i], b.args[i]]);
      continue;
    }

    return false;
  }
  return true;
}

function markCompactVariableBound(term) {
  if (term?._compactState == null || term._compactIndex == null) return;
  if (term._compactIndex > term._compactState.maxPossiblyBoundIndex) {
    term._compactState.maxPossiblyBoundIndex = term._compactIndex;
  }
}

export function cloneTerm(term) {
  if (term.type === VAR) return variable(term.name);
  const cloned = term.type === COMPOUND && term.arity === 0
    ? atom(term.name)
    : new Term(term.type, term.name, term.args.map(cloneTerm));
  if (term.module != null) cloned.module = term.module;
  return cloned;
}

export function freshTerm(term, suffix, variables = new Map()) {
  if (term.type === VAR) {
    let fresh = variables.get(term.name);
    if (fresh == null) {
      fresh = variable(`${term.name}#${suffix}`);
      variables.set(term.name, fresh);
    }
    return fresh;
  }
  const fresh = term.type === COMPOUND && term.arity === 0
    ? atom(term.name)
    : new Term(term.type, term.name, term.args.map((arg) => freshTerm(arg, suffix, variables)));
  if (term.module != null) fresh.module = term.module;
  return fresh;
}

export function copyResolved(term, env) {
  const resolved = deref(term, env);
  if (resolved.type === VAR) return variable(resolved.name);
  const copied = resolved.type === COMPOUND && resolved.arity === 0
    ? atom(resolved.name)
    : new Term(resolved.type, resolved.name, resolved.args.map((arg) => copyResolved(arg, env)));
  if (resolved.module != null) copied.module = resolved.module;
  return copied;
}

export function termIsGround(term, env = new Env()) {
  const pending = [term];
  const seen = new Set();
  while (pending.length > 0) {
    const resolved = deref(pending.pop(), env);
    if (resolved.type === VAR) return false;
    if (seen.has(resolved)) continue;
    seen.add(resolved);
    // Visit leftmost arguments first. Lists and other recursive structures
    // commonly carry their first unbound variable there, allowing a
    // non-ground check to finish without walking the complete tail.
    for (let index = resolved.args.length - 1; index >= 0; index--) {
      pending.push(resolved.args[index]);
    }
  }
  return true;
}

const graphicAtomChars = new Set('!#$&*+-/<=>@^~\\'.split(''));

function atomNeedsQuotes(name) {
  if (!name) return true;
  if (name === '[]' || name === '{}') return false;
  if (name === '\\+' || name === '+' || name === '-' || name === '\\') return true;
  if (/^[a-z][A-Za-z0-9_]*$/.test(name)) return false;
  for (const ch of name) if (!graphicAtomChars.has(ch)) return true;
  return false;
}

function quoteAtom(name) {
  let out = "'";
  for (const ch of name) {
    if (ch === "'") out += "''";
    else if (ch === '\\') out += '\\\\';
    else if (ch === '\n') out += '\\n';
    else if (ch === '\t') out += '\\t';
    else out += ch;
  }
  return out + "'";
}

function writeAtom(name) {
  return atomNeedsQuotes(name) ? quoteAtom(name) : name;
}

function legacyVariableToIso(name) {
  if (name === '?') return '_';
  const tail = name.slice(1);
  if (!tail) return '_';
  if (tail[0] === '_') return tail;
  return tail[0].toUpperCase() + tail.slice(1);
}

function writeVariable(name) {
  name = String(name ?? '');
  if (/^\?(?:[A-Za-z_][A-Za-z0-9_]*)?$/.test(name)) return legacyVariableToIso(name);
  if (/^(?:_|[A-Z_][A-Za-z0-9_]*)$/.test(name)) return name;
  const sanitized = name.replace(/[^A-Za-z0-9_]/g, '_');
  if (!sanitized) return '_';
  return /^[A-Z_]/.test(sanitized) ? sanitized : `_${sanitized}`;
}

function writeString(value, quoteStrings) {
  if (!quoteStrings) return value;
  let out = '"';
  for (const ch of value) {
    if (ch === '"' || ch === '\\') out += `\\${ch}`;
    else if (ch === '\x07') out += '\\a';
    else if (ch === '\b') out += '\\b';
    else if (ch === '\r') out += '\\r';
    else if (ch === '\f') out += '\\f';
    else if (ch === '\t') out += '\\t';
    else if (ch === '\n') out += '\\n';
    else if (ch === '\v') out += '\\v';
    else out += ch;
  }
  return out + '"';
}

function quotedListText(term, env, doubleQuotes) {
  if (doubleQuotes !== 'chars' && doubleQuotes !== 'codes') return null;
  const characters = [];
  let cursor = term;
  while (true) {
    cursor = deref(cursor, env);
    if (isEmptyList(cursor)) return characters.length === 0 ? null : characters.join('');
    if (!isCons(cursor)) return null;
    const item = deref(cursor.args[0], env);
    if (doubleQuotes === 'chars') {
      if (item.type !== ATOM || Array.from(item.name).length !== 1) return null;
      characters.push(item.name);
    } else {
      if (item.type !== NUMBER || !/^\d+$/.test(item.name)) return null;
      const code = BigInt(item.name);
      if (code < 0n || code > 0x10ffffn || (code >= 0xd800n && code <= 0xdfffn)) return null;
      characters.push(String.fromCodePoint(Number(code)));
    }
    cursor = cursor.args[1];
  }
}

function writeList(term, env, options) {
  const quotedText = quotedListText(term, env, options.doubleQuotes);
  if (quotedText != null) return writeString(quotedText, true);
  const parts = [];
  let cursor = term;
  while (true) {
    cursor = deref(cursor, env);
    if (isEmptyList(cursor)) return `[${parts.join(', ')}]`;
    if (!isCons(cursor)) {
      if (parts.length) return `[${parts.join(', ')} | ${termToString(cursor, env, true, options)}]`;
      return `[${termToString(cursor, env, true, options)}]`;
    }
    parts.push(termToString(cursor.args[0], env, true, options));
    cursor = cursor.args[1];
  }
}

export function termToString(term, env = new Env(), quoteStrings = true, options = {}) {
  options = {
    ...options,
    doubleQuotes: options.doubleQuotes ?? 'chars',
    readVariableNames: options.readVariableNames instanceof Map ? options.readVariableNames : new Map(),
    usedReadVariableNames: options.usedReadVariableNames instanceof Set ? options.usedReadVariableNames : new Set(),
  };
  const resolved = deref(term, env);
  if (resolved.type === VAR) {
    if (resolved.displayName == null) return writeVariable(resolved.name);
    let printed = options.readVariableNames.get(resolved.name);
    if (printed == null) {
      const base = writeVariable(resolved.displayName);
      printed = base;
      let suffix = 1;
      while (options.usedReadVariableNames.has(printed)) printed = `${base}_${suffix++}`;
      options.readVariableNames.set(resolved.name, printed);
      options.usedReadVariableNames.add(printed);
    }
    return printed;
  }
  if (isCons(resolved)) return writeList(resolved, env, options);
  if (resolved.type === STRING) return writeString(resolved.name, quoteStrings);
  if (resolved.type === ATOM) return writeAtom(resolved.name);
  if (resolved.type === NUMBER) return resolved.name;
  if (resolved.type === COMPOUND && resolved.arity === 0) return writeAtom(resolved.name);
  if (resolved.type === COMPOUND && resolved.name === '{}' && resolved.arity === 1) {
    return `{${termToString(resolved.args[0], env, true, options)}}`;
  }
  if (resolved.type === COMPOUND && resolved.name === ':' && resolved.arity === 2) {
    return `${termToString(resolved.args[0], env, true, options)}:${termToString(resolved.args[1], env, true, options)}`;
  }
  if (isConjunction(resolved)) {
    const parts = [];
    let cursor = resolved;
    while (true) {
      cursor = deref(cursor, env);
      if (isConjunction(cursor)) {
        parts.push(termToString(cursor.args[0], env, true, options));
        cursor = cursor.args[1];
      } else {
        parts.push(termToString(cursor, env, true, options));
        break;
      }
    }
    return `(${parts.join(', ')})`;
  }
  return `${writeAtom(resolved.name)}(${resolved.args.map((arg) => termToString(arg, env, true, options)).join(', ')})`;
}

export function lexicalValue(term, env) {
  const resolved = deref(term, env);
  if (resolved.type === VAR) return null;
  if (resolved.type === ATOM || resolved.type === STRING || resolved.type === NUMBER) return resolved.name;
  return termToString(resolved, env, true);
}

export function properListItems(list, env) {
  const items = [];
  let cursor = deref(list, env);
  while (isCons(cursor)) {
    items.push(cursor.args[0]);
    cursor = deref(cursor.args[1], env);
  }
  if (!isEmptyList(cursor)) return null;
  return items;
}

export function listFromItems(items, start = 0, end = items.length, tail = emptyList()) {
  let result = tail;
  for (let i = end - 1; i >= start; i--) result = cons(items[i], result);
  return result;
}

export function flattenConjunction(goal) {
  const out = [];
  const stack = [goal];
  while (stack.length) {
    const current = stack.pop();
    if (isConjunction(current)) {
      stack.push(current.args[1], current.args[0]);
    } else {
      out.push(current);
    }
  }
  return out;
}

export function termSignature(term) {
  return term?.type === COMPOUND ? `${term.name}/${term.arity}` : null;
}

export function variantTerms(left, leftEnv, right, rightEnv, pairs = new Map(), reverse = new Map()) {
  // Variant checks sit on the recursive-call hot path. Use an explicit work
  // stack so long lists do not consume the JavaScript call stack.
  const pending = [[left, right]];
  const seen = new WeakMap();
  while (pending.length > 0) {
    [left, right] = pending.pop();
    left = deref(left, leftEnv);
    right = deref(right, rightEnv);
    if (left.type === VAR || right.type === VAR) {
      if (left.type !== VAR || right.type !== VAR) return false;
      if (pairs.has(left.name) || reverse.has(right.name)) {
        if (pairs.get(left.name) !== right.name || reverse.get(right.name) !== left.name) return false;
        continue;
      }
      pairs.set(left.name, right.name);
      reverse.set(right.name, left.name);
      continue;
    }

    if (left.type !== right.type || left.arity !== right.arity) return false;
    if (left.type === NUMBER ? !sameNumberValue(left.name, right.name) : left.name !== right.name) return false;
    if (left.type !== COMPOUND) continue;

    let rights = seen.get(left);
    if (rights?.has(right)) continue;
    if (rights == null) {
      rights = new WeakSet();
      seen.set(left, rights);
    }
    rights.add(right);
    for (let i = left.arity - 1; i >= 0; i--) pending.push([left.args[i], right.args[i]]);
  }
  return true;
}

export function compareTerms(left, right, variableRanks = null) {
  // ISO 7.2.1 deliberately leaves the order of distinct variables
  // implementation dependent.  Do not attach a permanent ordinal to a
  // logical variable: besides retaining implementation history, that would
  // make the chosen order observable outside the operation that needs it.
  // A caller that is constructing one sorted list can pass a shared Map so
  // every comparison in that operation uses one consistent variable order.
  const ranks = variableRanks ?? new Map();
  return compareTermsWithRanks(left, right, ranks);
}

function variableRank(name, ranks) {
  let rank = ranks.get(name);
  if (rank == null) {
    rank = ranks.size;
    ranks.set(name, rank);
  }
  return rank;
}

function compareTermsWithRanks(left, right, variableRanks) {
  const rank = (term) => ({ [VAR]: 0, [NUMBER]: 1, [ATOM]: 2, [STRING]: 3, [COMPOUND]: 4 })[term.type];
  left = deref(left, new Env());
  right = deref(right, new Env());
  const lr = rank(left);
  const rr = rank(right);
  if (lr !== rr) return lr < rr ? -1 : 1;
  if (left.type === NUMBER) {
    const leftInteger = isDecimalInteger(left.name);
    const rightInteger = isDecimalInteger(right.name);
    if (leftInteger !== rightInteger) return leftInteger ? 1 : -1;
    return compareNumberText(left.name, right.name);
  }
  if (left.type === VAR) {
    if (left.name === right.name) return 0;
    const leftOrder = variableRank(left.name, variableRanks);
    const rightOrder = variableRank(right.name, variableRanks);
    return leftOrder < rightOrder ? -1 : 1;
  }
  if (left.type === ATOM || left.type === STRING) return left.name < right.name ? -1 : left.name > right.name ? 1 : 0;
  if (left.arity !== right.arity) return left.arity < right.arity ? -1 : 1;
  if (left.name !== right.name) return left.name < right.name ? -1 : 1;
  for (let i = 0; i < left.arity; i++) {
    const cmp = compareTermsWithRanks(left.args[i], right.args[i], variableRanks);
    if (cmp) return cmp;
  }
  return 0;
}

export function isDecimalInteger(text) {
  return /^-?\d+$/.test(text ?? '');
}

export function compareIntegerText(left, right) {
  const a = BigInt(left);
  const b = BigInt(right);
  return a < b ? -1 : a > b ? 1 : 0;
}

export function parseFiniteNumber(text) {
  if (text == null || text === '') return null;
  if (!/^[+-]?(?:\d+(?:\.\d*)?|\.\d+)(?:[eE][+-]?\d+)?$/.test(text)) return null;
  const n = Number(text);
  return Number.isFinite(n) ? n : null;
}

export function numberTextFromDouble(value) {
  if (!Number.isFinite(value)) return null;
  if (Object.is(value, -0)) value = 0;
  let text = Number(value).toPrecision(17);
  if (text.includes('e') || text.includes('E')) {
    text = text
      .replace(/(\.\d*?[1-9])0+(e[+-]?\d+)$/i, '$1$2')
      // ISO floating-point syntax requires a fractional part before the
      // exponent. Keep one zero when the fraction is otherwise all zeros so
      // generated text remains readable by EyeProlog itself (for example
      // 1.0e-8 rather than JavaScript's 1e-8).
      .replace(/\.0+(e[+-]?\d+)$/i, '.0$1');
  } else if (text.includes('.')) {
    text = text.replace(/0+$/, '').replace(/\.$/, '');
  }
  if (!/[.eE]/.test(text)) text += '.0';
  return text;
}

export function compareNumberText(left, right) {
  if (isDecimalInteger(left) && isDecimalInteger(right)) return compareIntegerText(left, right);
  const a = parseFiniteNumber(left);
  const b = parseFiniteNumber(right);
  if (a != null && b != null) return a < b ? -1 : a > b ? 1 : 0;
  return left < right ? -1 : left > right ? 1 : 0;
}
