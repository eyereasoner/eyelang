// Terms are immutable by convention. Environments belong to one search branch.
let nextVariable = 0;
export const variable = (name = '_') => ({ kind: 'var', name, id: nextVariable++ });
export const atom = name => ({ kind: 'atom', name });
export const struct = (name, args) => ({ kind: 'struct', name, args });
export const scalar = value => ({ kind: typeof value, value });
export const nil = struct('nil', []);
export const cons = (head, tail) => struct('cons', [head, tail]);
export const list = values => values.reduceRight((tail, head) => cons(head, tail), nil);

export function deref(term, env) {
  while (term.kind === 'var' && env.has(term.id)) term = env.get(term.id);
  return term;
}

export function instantiate(term, env) {
  term = deref(term, env);
  return term.kind === 'struct' ? struct(term.name, term.args.map(x => instantiate(x, env))) : term;
}

function occurs(id, term, env) {
  term = deref(term, env);
  return term.kind === 'var' ? term.id === id
    : term.kind === 'struct' && term.args.some(x => occurs(id, x, env));
}

// Mutates a branch-local environment. Callers discard it on failure.
export function unify(a, b, env) {
  const pending = [[a, b]];
  while (pending.length) {
    let [left, right] = pending.pop();
    left = deref(left, env);
    right = deref(right, env);
    if (left.kind === 'var') {
      if (right.kind === 'var' && left.id === right.id) continue;
      if (occurs(left.id, right, env)) return false;
      env.set(left.id, right);
    } else if (right.kind === 'var') {
      if (occurs(right.id, left, env)) return false;
      env.set(right.id, left);
    } else if (left.kind !== right.kind) return false;
    else if (left.kind === 'struct') {
      if (left.name !== right.name || left.args.length !== right.args.length) return false;
      for (let i = 0; i < left.args.length; i++) pending.push([left.args[i], right.args[i]]);
    } else if (left.kind === 'atom' ? left.name !== right.name : left.value !== right.value) return false;
  }
  return true;
}

export function ground(term) {
  return term.kind !== 'var' && (term.kind !== 'struct' || term.args.every(ground));
}

export function fresh(term, variables = new Map()) {
  if (term.kind === 'var') {
    if (!variables.has(term.id)) variables.set(term.id, variable(term.name));
    return variables.get(term.id);
  }
  return term.kind === 'struct' ? struct(term.name, term.args.map(x => fresh(x, variables))) : term;
}

// A canonical variant key: variable names and allocation IDs do not matter.
export function key(term, variables = new Map()) {
  if (term.kind === 'var') {
    if (!variables.has(term.id)) variables.set(term.id, variables.size);
    return ['var', variables.get(term.id)];
  }
  if (term.kind === 'struct') return ['struct', term.name, term.args.map(x => key(x, variables))];
  return [term.kind, term.kind === 'atom' ? term.name : String(term.value)];
}
export const termKey = term => JSON.stringify(key(term));

export function array(term) {
  const values = [];
  while (term.kind === 'struct' && term.name === 'cons' && term.args.length === 2) {
    values.push(term.args[0]);
    term = term.args[1];
  }
  if (term.kind !== 'struct' || term.name !== 'nil' || term.args.length) throw new Error('Expected a finite, closed list');
  return values;
}

export function format(term, variables = new Map()) {
  switch (term.kind) {
    case 'var':
      if (!variables.has(term.id)) variables.set(term.id, `v${variables.size}`);
      return `?${variables.get(term.id)}`;
    case 'atom': return term.name;
    case 'string': return JSON.stringify(term.value);
    case 'bigint': case 'boolean': return String(term.value);
    case 'number': {
      const text = String(term.value);
      return Number.isInteger(term.value) && !/[eE]/.test(text) ? `${text}.0` : text;
    }
    case 'struct': {
      if (term.name === 'nil' && !term.args.length) return '[]';
      if (term.name === 'cons' && term.args.length === 2) {
        const parts = [];
        let tail = term;
        while (tail.kind === 'struct' && tail.name === 'cons' && tail.args.length === 2) {
          parts.push(format(tail.args[0], variables));
          tail = tail.args[1];
        }
        const closed = tail.kind === 'struct' && tail.name === 'nil' && !tail.args.length;
        return `[${parts.join(', ')}${closed ? '' : ` | ${format(tail, variables)}`}]`;
      }
      return `${term.name}(${term.args.map(arg => format(arg, variables)).join(', ')})`;
    }
    default: throw new Error(`Unknown term kind: ${term.kind}`);
  }
}

export function variablesIn(term, out = new Map()) {
  if (term.kind === 'var' && term.name !== '_') out.set(term.id, term);
  if (term.kind === 'struct') term.args.forEach(x => variablesIn(x, out));
  return out;
}
