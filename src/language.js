// Integers use canonical decimal strings; other scalar terms are tagged objects.
const namedVariable = /^[A-Z_][A-Za-z0-9_]*$/;
const numeric = value => typeof value === 'string' || value?.real !== undefined;
const numberValue = value => typeof value === 'string' ? BigInt(value) : value.real;
const atom = value => ({ atom: value });
const finite = value => {
  if (!Number.isFinite(value)) throw new Error('This calculation needs a finite real number; check its inputs.');
  return { real: Object.is(value, -0) ? 0 : value };
};
const toReal = value => finite(Number(value)).real;
const relation = (name, arity) => `predicate:${name}/${arity}`;
const internal = (name, terms) => ({ relation: `internal:${name}/${terms.length}`, terms });
const builtin = (name, terms = []) => ({ relation: `builtin:${name}`, terms });
const binary = new Map([
  ['\\/', [1, 'left']], ['xor', [1, 'left']], ['/\\', [1, 'left']],
  ['<<', [1, 'left']], ['>>', [1, 'left']], ['+', [2, 'left']], ['-', [2, 'left']],
  ['*', [3, 'left']], ['/', [3, 'left']], ['//', [3, 'left']], ['div', [3, 'left']],
  ['rem', [3, 'left']], ['mod', [3, 'left']], ['**', [4, 'none']], ['^', [4, 'right']],
]);

function storeRuleText(text) {
  Object.defineProperty(this, 'text', { value: text, writable: true, enumerable: true, configurable: true });
}

function renderRuleText() {
  const text = [say(this.conclusion), this.premises.length ? ' :- ' : '', this.premises.map(say).join(', '), '.'].join('');
  storeRuleText.call(this, text);
  return text;
}

function* tokenize(source) {
  let position = 0;
  let line = 1;
  const fail = message => { throw new Error(`Line ${line}: ${message}`); };
  const symbols = new Set(['=\\=', '=:=', ':-', '?-', '\\+', '\\=', '=<', '>=', '//', '**', '<<', '>>', '/\\', '\\/', '@=<', '@>=', '@<', '@>']);
  while (position < source.length) {
    const rest = source.slice(position);
    if (/\s/u.test(rest[0])) { if (rest[0] === '\n') line++; position++; continue; }
    if (rest[0] === '%') { while (position < source.length && source[position] !== '\n') position++; continue; }
    if (rest.startsWith('/*')) {
      const end = source.indexOf('*/', position + 2);
      if (end < 0) fail('Close the block comment with */.');
      line += source.slice(position, end + 2).split('\n').length - 1;
      position = end + 2;
      continue;
    }
    const startLine = line;
    if (rest[0] === "'" || rest[0] === '"') {
      const quote = rest[0];
      let value = '';
      position++;
      let closed = false;
      while (position < source.length) {
        const character = source[position++];
        if (character === quote) {
          if (source[position] === quote) { value += quote; position++; continue; }
          closed = true;
          break;
        }
        if (character === '\\') {
          const escaped = source[position++];
          if (escaped === 'u' || escaped === 'U') {
            const length = escaped === 'u' ? 4 : 8;
            const digits = source.slice(position, position + length);
            const code = Number.parseInt(digits, 16);
            if (digits.length !== length || !/^[0-9a-f]+$/i.test(digits) || code > 0x10ffff) fail('Use a valid Unicode escape.');
            value += String.fromCodePoint(code);
            position += length;
            continue;
          }
          const escapes = { b: '\b', f: '\f', n: '\n', r: '\r', t: '\t', '\\': '\\', "'": "'", '"': '"' };
          if (!(escaped in escapes)) fail('Use a supported quoted escape: \\n, \\r, \\t, \\\\, \\" or \\\'.');
          value += escapes[escaped];
        } else {
          if (character === '\n') line++;
          value += character;
        }
      }
      if (!closed) fail(`Close the ${quote === "'" ? 'quoted atom' : 'string'} with ${quote}.`);
      yield { type: quote === "'" ? 'atom' : 'string', value, line: startLine };
      continue;
    }
    const number = /^\d+(?:\.\d+)?(?:[eE][+-]?\d+)?/.exec(rest);
    if (number) {
      const text = number[0];
      if (/[.eE]/.test(text) && !Number.isFinite(Number(text))) fail('A real literal must be finite.');
      yield { type: 'number', value: /[.eE]/.test(text) ? finite(Number(text)) : BigInt(text).toString(), line };
      position += text.length;
      continue;
    }
    const name = /^[A-Za-z_][A-Za-z0-9_]*/.exec(rest);
    if (name) {
      const text = name[0];
      yield { type: namedVariable.test(text) ? 'variable' : 'atom', value: text, line };
      position += text.length;
      continue;
    }
    const three = rest.slice(0, 3);
    const two = rest.slice(0, 2);
    const symbol = symbols.has(three) ? three : symbols.has(two) ? two
      : '.(),[]|+-*/^=<>\\'.includes(rest[0]) ? rest[0] : null;
    if (!symbol) fail(`Unsupported character ${JSON.stringify(rest[0])}. Use Prolog clauses, % comments, and ?- queries.`);
    if (symbol === '.' && rest.length > 1 && !/\s/u.test(rest[1]) && rest[1] !== '%' && !rest.slice(1).startsWith('/*')) fail('A clause-ending period must be followed by whitespace, a comment, or the end of the file.');
    yield { type: 'symbol', value: symbol, line };
    position += symbol.length;
  }
  yield { type: 'end', value: '<end>', line };
}

export function parse(source) {
  const input = tokenize(source);
  const tokens = [];
  let position = 0;
  // Buffer one clause plus lookahead to bound parser memory.
  function tokenAt(index) {
    while (tokens.length <= index) {
      const next = input.next();
      if (next.done) return tokens[tokens.length - 1];
      tokens.push(next.value);
    }
    return tokens[index];
  }
  let anonymous = 0;
  let generated = 0;
  const program = { facts: [], rules: [], questions: [], checks: [] };
  const predicates = new Map();
  function ordinary(name, terms = []) {
    const id = relation(name, terms.length);
    if (!predicates.has(id)) predicates.set(id, id);
    return { relation: predicates.get(id), terms };
  }
  const tabled = new Set();
  const peek = value => tokenAt(position).value === value && tokenAt(position).type !== 'string';
  const fail = message => { throw new Error(`Line ${tokenAt(position).line}: ${message}`); };
  const take = value => { if (peek(value)) { position++; return true; } return false; };
  const expect = value => { if (!take(value)) fail(`Expected ${value}; found ${tokenAt(position).value}.`); };

  function primary() {
    const token = tokenAt(position++);
    if (token.type === 'number') return token.value;
    if (token.type === 'string') return { text: token.value };
    if (token.type === 'variable') return { variable: token.value === '_' ? `$anonymous${++anonymous}` : token.value };
    if (token.type === 'atom') {
      if (!take('(')) return atom(token.value);
      if (peek(')')) fail('A compound term needs at least one argument; write an atom for arity zero.');
      const args = [expression()];
      while (take(',')) args.push(expression());
      expect(')');
      return { functor: token.value, args };
    }
    if (token.value === '(') { const value = expression(); expect(')'); return value; }
    if (token.value === '[') {
      if (take(']')) return list([]);
      const items = [expression()];
      while (take(',')) items.push(expression());
      let tail;
      if (take('|')) tail = expression();
      expect(']');
      if (tail !== undefined && !tail.list && !tail.variable) fail('The part after | must be a list or a variable in this subset.');
      return list(items, tail);
    }
    if (['-', '+', '\\'].includes(token.value)) {
      const value = expression(4);
      if (token.value === '-' && numeric(value)) return typeof value === 'string' ? (-BigInt(value)).toString() : finite(-value.real);
      if (token.value === '+' && numeric(value)) return value;
      return { functor: token.value, args: [value] };
    }
    position--;
    fail(`Expected a term; found ${token.value}.`);
  }
  function expression(minimum = 0) {
    let left = primary();
    while (binary.has(tokenAt(position).value)) {
      const operator = tokenAt(position).value;
      const [precedence, associativity] = binary.get(operator);
      if (precedence < minimum) break;
      position++;
      const right = expression(precedence + (associativity === 'right' ? 0 : 1));
      left = { functor: operator, args: [left, right] };
      if (associativity === 'none' && peek(operator)) fail(`Parenthesize chained ${operator} expressions.`);
    }
    return left;
  }
  const asGoal = value => {
    if (value.atom !== undefined) return ['true', 'false', 'fail'].includes(value.atom) ? builtin(value.atom) : ordinary(value.atom);
    if (!value.functor) fail('A goal must be an atom or a predicate with arguments.');
    const { functor: name, args } = value;
    if (name === 'contains_text' && args.length === 2) return builtin('contains_text', args);
    if (tests.has(name) && args.length === 2) return builtin(name, args);
    return ordinary(name, args);
  };
  const tests = new Set(['is', '=', '\\=', '<', '=<', '>', '>=', '=:=', '=\\=', '@<', '@=<', '@>', '@>=']);
  function oneGoal() {
    if (take('\\+')) {
      let nested;
      if (take('(')) { nested = goals(); expect(')'); } else nested = [oneGoal()];
      if (nested.length !== 1) fail('Negation currently accepts one goal. Define a helper predicate for a conjunction.');
      if (nested[0].negated) fail('Nested negation is outside this subset.');
      return { ...nested[0], negated: true };
    }
    if (peek('(')) {
      let depth = 0;
      let end = position;
      do {
        if (tokenAt(end).value === '(') depth++;
        if (tokenAt(end).value === ')') depth--;
        end++;
      } while (depth && tokenAt(end).type !== 'end');
      if (!binary.has(tokenAt(end).value) && !tests.has(tokenAt(end).value)) {
        position++;
        const nested = goals(); expect(')'); return nested;
      }
    }
    if (peek('aggregate_all') && tokenAt(position + 1)?.value === '(') {
      position += 2;
      const template = expression();
      expect(',');
      let body;
      if (take('(')) { body = goals(); expect(')'); } else body = [oneGoal()].flat();
      expect(',');
      const result = expression();
      expect(')');
      const operation = template.atom === 'count' ? 'count' : template.functor;
      if (!['count', 'sum', 'min', 'max'].includes(operation) || operation !== 'count' && template.args?.length !== 1) {
        fail('Use aggregate_all(count, Goal, N), sum(Value), min(Value), or max(Value).');
      }
      const value = operation === 'count' ? null : template.args[0];
      const names = [...new Set([...body.flatMap(variables), ...(value ? termVariables(value) : [])])];
      const sourceGoal = internal(`aggregate${++generated}`, names.map(variable => ({ variable })));
      addRule(sourceGoal, body);
      return { ...builtin('aggregate', [result]), aggregate: { operation, sourceGoal, value, body } };
    }
    const left = expression();
    if (tests.has(tokenAt(position).value)) {
      const operator = tokenAt(position++).value;
      return builtin(operator, [left, expression()]);
    }
    return asGoal(left);
  }
  function goals() {
    const first = oneGoal();
    const body = Array.isArray(first) ? first : [first];
    while (take(',')) {
      const next = oneGoal();
      if (Array.isArray(next)) body.push(...next);
      else body.push(next);
    }
    return body;
  }
  function addRule(conclusion, premises, text = null) {
    if (conclusion.relation.startsWith('builtin:')) fail('A rule head must name an ordinary predicate.');
    // Range-restricted clauses can be materialized without call inputs. Other
    // clauses use tables so arithmetic and recursive list calls receive inputs.
    const bound = new Set();
    let forward = !conclusion.relation.startsWith('internal:');
    for (const premise of premises) {
      const names = variables(premise);
      if (premise.aggregate) { forward = false; continue; }
      if (premise.negated) {
        if (!names.every(name => bound.has(name))) forward = false;
      } else if (!premise.relation.startsWith('builtin:')) {
        names.forEach(name => bound.add(name));
      } else if (premise.relation === 'builtin:is') {
        if (!termVariables(premise.terms[1]).every(name => bound.has(name))) forward = false;
        termVariables(premise.terms[0]).forEach(name => bound.add(name));
      } else if (premise.relation === 'builtin:=' && premise.terms.some(value => termVariables(value).every(name => bound.has(name)))) {
        names.forEach(name => bound.add(name));
      } else if (!names.every(name => bound.has(name))) forward = false;
    }
    if (!variables(conclusion).every(name => bound.has(name))) forward = false;
    const rule = { conclusion, premises, backward: !forward };
    // Format and cache rule text on first access.
    if (text === null) Object.defineProperty(rule, 'text', {
      get: renderRuleText, set: storeRuleText, enumerable: true, configurable: true,
    });
    else rule.text = text;
    program.rules.push(rule);
    return rule;
  }
  function request(body, text, line) {
    const names = [...new Set(body.flatMap(variables))].filter(name => !name.startsWith('$anonymous') && !name.startsWith('_'));
    const goal = internal(`query${++generated}`, names.map(variable => ({ variable })));
    addRule(goal, body, text).line = line;
    return { goal, names, body };
  }
  while (tokenAt(position).type !== 'end') {
    tokens.splice(0, position);
    position = 0;
    const line = tokenAt(position).line;
    if (take('?-')) {
      if (peek('why') && tokenAt(position + 1)?.value === '.') {
        position += 2;
        program.questions.push({ why: true, previous: true });
        continue;
      }
      const why = peek('why') && tokenAt(position + 1)?.value === '(';
      if (why) position += 2;
      const body = goals();
      if (why) expect(')');
      expect('.');
      program.questions.push({ ...request(body, body.map(say).join(', ') + '.', line), why, line });
    } else if (take(':-')) {
      if (take('table')) {
        do {
          const name = tokenAt(position++);
          if (name.type !== 'atom') fail('A table declaration needs a predicate name and arity.');
          expect('/');
          const arity = tokenAt(position++);
          if (arity.type !== 'number' || typeof arity.value !== 'string' || BigInt(arity.value) < 0n) fail('A predicate arity must be a nonnegative integer.');
          tabled.add(relation(name.value, arity.value));
        } while (take(','));
        expect('.');
      } else if (take('assertion')) {
        expect('(');
        const body = goals();
        expect(')');
        expect('.');
        const text = body.map(say).join(', ');
        program.checks.push({ ...request(body, text + '.', line), text, line });
      } else fail('Supported directives are :- table name/arity. and :- assertion(Goal).');
    } else {
      const conclusion = asGoal(expression());
      if (take(':-')) {
        const premises = goals();
        expect('.');
        addRule(conclusion, premises).line = line;
      } else {
        expect('.');
        if (conclusion.relation.startsWith('builtin:')) fail('A fact must name an ordinary predicate.');
        if (variables(conclusion).length) addRule(conclusion, []).line = line;
        else program.facts.push(conclusion);
      }
    }
  }
  for (const rule of program.rules) if (tabled.has(rule.conclusion.relation)) rule.backward = true;
  return program;
}

function list(items, tail) {
  if (tail?.list) return list([...items, ...tail.list], tail.tail);
  if (tail !== undefined && !tail.variable) throw new Error('The part after | must be a list or a variable in this subset.');
  return tail === undefined ? { list: items } : { list: items, tail };
}

const atomic = value => typeof value === 'string' || value?.atom !== undefined || value?.text !== undefined || value?.real !== undefined;
function variables(goal) { return goal.terms.flatMap(termVariables); }
function termVariables(value) {
  if (value === undefined || atomic(value)) return [];
  if (value.variable) return [value.variable];
  if (value.functor) return value.args.flatMap(termVariables);
  return [...value.list.flatMap(termVariables), ...termVariables(value.tail)];
}

function evaluate(expression, bindings, calculations = null) {
  const value = specialize(expression, bindings);
  if (numeric(value)) return value;
  if (value.variable) throw new Error(`Arithmetic input ${value.variable} is unbound; bind it before using is or a comparison.`);
  if (value.atom === 'pi') return finite(Math.PI);
  if (value.atom === 'e') return finite(Math.E);
  if (!value.functor) throw new Error(`Arithmetic needs a number; found ${sayTerm(value)}.`);
  const args = value.args.map(arg => evaluate(arg, bindings, calculations));
  const name = value.functor;
  const [a, b] = args.map(numberValue);
  const exact = args.every(arg => typeof arg === 'string');
  const whole = () => { if (!exact) throw new Error(`${name} needs integer operands.`); };
  const nonzero = () => { if (b === 0n || b === 0) throw new Error('Cannot divide by zero.'); };
  let result;
  if (args.length === 1) {
    if (name === '+') result = a;
    else if (name === '-') result = -a;
    else if (name === '\\') { whole(); result = ~a; }
    else if (name === 'abs') result = a < 0 ? -a : a;
    else if (name === 'sign') result = BigInt(a < 0 ? -1 : a > 0 ? 1 : 0);
    else if (['floor', 'ceiling', 'round', 'truncate'].includes(name)) {
      if (exact) {
        calculations?.push(`${sayTerm(value)} = ${sayTerm(args[0])}.`);
        return args[0];
      }
      const number = Number(a);
      const rounded = name === 'round' ? Math.sign(number) * Math.round(Math.abs(number))
        : name === 'floor' ? Math.floor(number) : name === 'ceiling' ? Math.ceil(number) : Math.trunc(number);
      if (!Number.isFinite(rounded)) throw new Error('Rounding needs a finite real number.');
      result = BigInt(rounded);
    } else if (name === 'float_integer_part') result = Math.trunc(toReal(a));
    else if (name === 'float_fractional_part') result = toReal(a) - Math.trunc(toReal(a));
    else {
      const functions = { sqrt: Math.sqrt, log: Math.log, exp: Math.exp, sin: Math.sin, cos: Math.cos,
        tan: Math.tan, asin: Math.asin, acos: Math.acos, atan: Math.atan };
      if (!functions[name]) throw new Error(`Unsupported arithmetic function: ${name}/1.`);
      result = functions[name](toReal(a));
    }
  } else if (args.length === 2) {
    const x = exact ? a : Number(a);
    const y = exact ? b : Number(b);
    switch (name) {
      case '+': result = x + y; break;
      case '-': result = x - y; break;
      case '*': result = x * y; break;
      case '/': nonzero(); result = toReal(a) / toReal(b); break;
      case '^': result = exact && b >= 0n ? a ** b : toReal(a) ** toReal(b); break;
      case '**': result = toReal(a) ** toReal(b); break;
      case '//': whole(); nonzero(); result = a / b; break;
      case 'div': case 'mod': {
        whole(); nonzero();
        const q = a / b;
        const r = a % b;
        const floor = r !== 0n && (a < 0n) !== (b < 0n) ? q - 1n : q;
        result = name === 'div' ? floor : a - floor * b;
        break;
      }
      case 'rem': whole(); nonzero(); result = a % b; break;
      case 'min': result = a <= b ? a : b; break;
      case 'max': result = a >= b ? a : b; break;
      case 'gcd': {
        whole(); let x = a < 0n ? -a : a; let y = b < 0n ? -b : b;
        while (y !== 0n) [x, y] = [y, x % y]; result = x; break;
      }
      case '/\\': whole(); result = a & b; break;
      case '\\/': whole(); result = a | b; break;
      case 'xor': whole(); result = a ^ b; break;
      case '<<': case '>>':
        whole(); if (b < 0n) throw new Error('A shift count must be nonnegative.');
        result = name === '<<' ? a << b : a >> b; break;
      case 'atan2': result = Math.atan2(toReal(a), toReal(b)); break;
      default: throw new Error(`Unsupported arithmetic function: ${name}/2.`);
    }
  } else throw new Error(`Unsupported arithmetic function: ${name}/${args.length}.`);
  const answer = typeof result === 'bigint' ? result.toString() : finite(result);
  calculations?.push(`${sayTerm(value)} = ${sayTerm(answer)}.`);
  return answer;
}

function quoteAtom(value) {
  return /^[a-z][A-Za-z0-9_]*$/.test(value) ? value : `'${value.replaceAll('\\', '\\\\').replaceAll("'", "''")}'`;
}
function sayTerm(value) {
  if (typeof value === 'string') return value;
  if (value.atom !== undefined) return quoteAtom(value.atom);
  if (value.real !== undefined) {
    const text = String(value.real);
    return /[.eE]/.test(text) ? text : `${text}.0`;
  }
  if (value.text !== undefined) return JSON.stringify(value.text);
  if (value.variable) return value.variable.startsWith('$') ? '_' : value.variable;
  if (value.functor) {
    if (binary.has(value.functor) && value.args.length === 2) {
      return `(${sayTerm(value.args[0])} ${value.functor} ${sayTerm(value.args[1])})`;
    }
    if (['-', '+', '\\'].includes(value.functor) && value.args.length === 1) return `${value.functor} (${sayTerm(value.args[0])})`;
    return `${quoteAtom(value.functor)}(${value.args.map(sayTerm).join(', ')})`;
  }
  const items = value.list.map(sayTerm).join(', ');
  return `[${items}${value.tail === undefined ? '' : ` | ${sayTerm(value.tail)}`}]`;
}
export function say(goal) {
  if (goal.negated) return `\\+ (${say({ ...goal, negated: false })})`;
  if (goal.aggregate) {
    const { operation, sourceGoal, value } = goal.aggregate;
    const definition = goal.aggregate.body;
    const text = definition ? definition.map(say).join(', ') : say(sourceGoal);
    const template = operation === 'count' ? 'count' : `${operation}(${sayTerm(value)})`;
    return `aggregate_all(${template}, (${text}), ${sayTerm(goal.terms[0])})`;
  }
  if (goal.relation.startsWith('builtin:')) {
    const name = goal.relation.slice(8);
    if (goal.terms.length === 2 && name !== 'contains_text') return `${sayTerm(goal.terms[0])} ${name} ${sayTerm(goal.terms[1])}`;
    return `${name}${goal.terms.length ? `(${goal.terms.map(sayTerm).join(', ')})` : ''}`;
  }
  const name = goal.relation.slice(goal.relation.startsWith('predicate:') ? 'predicate:'.length : 0, goal.relation.lastIndexOf('/'));
  return `${quoteAtom(name)}${goal.terms.length ? `(${goal.terms.map(sayTerm).join(', ')})` : ''}`;
}
const key = goal => JSON.stringify([goal.relation, ...goal.terms]);

function sameTerm(left, right) {
  if (left === right) return true;
  if (typeof left === 'string' || typeof right === 'string') return false;
  if (left.atom !== undefined || right.atom !== undefined) return left.atom !== undefined && left.atom === right.atom;
  if (left.text !== undefined || right.text !== undefined) return left.text !== undefined && left.text === right.text;
  if (left.real !== undefined || right.real !== undefined) return left.real !== undefined && left.real === right.real;
  return JSON.stringify(left) === JSON.stringify(right);
}

function dereference(value, bindings) {
  while (value?.variable && bindings.has(value.variable)) value = bindings.get(value.variable);
  return value;
}

function unify(left, right, bindings) {
  left = dereference(left, bindings);
  right = dereference(right, bindings);
  if (sameTerm(left, right)) return true;

  if (left.variable || right.variable) {
    const variable = left.variable ? left : right;
    const value = left.variable ? right : left;
    const pending = [value];
    while (pending.length) {
      const part = dereference(pending.pop(), bindings);
      if (part.variable === variable.variable) return false;
      if (part.list) pending.push(...part.list, ...(part.tail ? [part.tail] : []));
      if (part.functor) pending.push(...part.args);
    }
    bindings.set(variable.variable, value);
    return true;
  }
  if (left.functor || right.functor) return left.functor === right.functor && left.args.length === right.args.length &&
    left.args.every((arg, index) => unify(arg, right.args[index], bindings));
  if (!left.list || !right.list) return false;
  const common = Math.min(left.list.length, right.list.length);
  for (let index = 0; index < common; index++) {
    if (!unify(left.list[index], right.list[index], bindings)) return false;
  }
  if (left.list.length > common) return right.tail !== undefined &&
    unify(list(left.list.slice(common), left.tail), right.tail, bindings);
  if (right.list.length > common) return left.tail !== undefined &&
    unify(left.tail, list(right.list.slice(common), right.tail), bindings);
  return unify(left.tail ?? { list: [] }, right.tail ?? { list: [] }, bindings);
}

function callKey(goal) {
  const names = new Map();
  function canonical(value) {
    if (atomic(value)) return value;
    if (value.variable) {
      if (!names.has(value.variable)) names.set(value.variable, `$call${names.size}`);
      return { variable: names.get(value.variable) };
    }
    if (value.functor) return { functor: value.functor, args: value.args.map(canonical) };
    return list(value.list.map(canonical), value.tail === undefined ? undefined : canonical(value.tail));
  }
  return { relation: goal.relation, terms: goal.terms.map(canonical) };
}

function matchTerm(wanted, actual, bindings) {
  if (atomic(wanted)) return sameTerm(wanted, actual);
  if (wanted.variable) {
    const resolved = dereference(wanted, bindings);
    if (!resolved.variable) return matchTerm(resolved, actual, bindings);
    bindings.set(resolved.variable, actual);
    return true;
  }
  if (wanted.functor) return actual.functor === wanted.functor && actual.args.length === wanted.args.length &&
    wanted.args.every((arg, index) => matchTerm(arg, actual.args[index], bindings));
  if (!actual.list || wanted.list.length > actual.list.length) return false;
  for (let i = 0; i < wanted.list.length; i++) {
    if (!matchTerm(wanted.list[i], actual.list[i], bindings)) return false;
  }
  if (wanted.tail === undefined) return wanted.list.length === actual.list.length;
  return matchTerm(wanted.tail, { list: actual.list.slice(wanted.list.length) }, bindings);
}

function match(pattern, fact, bindings) {
  if (pattern.relation !== fact.relation || pattern.terms.length !== fact.terms.length) return null;
  const next = new Map(bindings);
  for (let i = 0; i < pattern.terms.length; i++) {
    if (!matchTerm(pattern.terms[i], fact.terms[i], next)) return null;
  }
  return next;
}

function specialize(value, bindings) {
  if (atomic(value)) return value;
  if (value.variable) {
    const resolved = dereference(value, bindings);
    return resolved.variable ? resolved : specialize(resolved, bindings);
  }
  if (value.list) return list(value.list.map(t => specialize(t, bindings)),
    value.tail === undefined ? undefined : specialize(value.tail, bindings));
  return { functor: value.functor, args: value.args.map(t => specialize(t, bindings)) };
}

function ground(value) {
  if (atomic(value)) return true;
  if (value.variable) return false;
  if (value.functor) return value.args.every(ground);
  return value.list.every(ground) && (value.tail === undefined || ground(value.tail));
}

function substitute(goal, bindings) {
  return { relation: goal.relation, terms: goal.terms.map(t => specialize(t, bindings)) };
}

function absence(goal) {
  return { goal: { ...goal, negated: true }, rule: null, premises: [], absence: true };
}

function ruleLayers(rules) {
  if (!rules.some(rule => rule.premises.some(p => p.negated || p.aggregate))) return [rules];
  // Index atomic head arguments to avoid scanning unrelated producers.
  const producers = new Map();
  rules.forEach((rule, index) => {
    const head = rule.conclusion;
    if (!producers.has(head.relation)) producers.set(head.relation, {
      all: [], positions: head.terms.map(() => ({ values: new Map(), wildcard: [] })),
    });
    const entry = producers.get(head.relation);
    entry.all.push(index);
    head.terms.forEach((value, position) => {
      const slot = entry.positions[position];
      if (!atomic(value)) { slot.wildcard.push(index); return; }
      const id = JSON.stringify(value);
      const matching = slot.values.get(id);
      if (matching) matching.push(index);
      else slot.values.set(id, [index]);
    });
  });
  function dependencyCandidates(premise) {
    const dependency = premise.aggregate?.sourceGoal ?? premise;
    const entry = producers.get(dependency.relation);
    if (!entry) return [];
    let candidates = entry.all;
    dependency.terms.forEach((value, position) => {
      if (!atomic(value)) return;
      const slot = entry.positions[position];
      const matching = slot.values.get(JSON.stringify(value)) ?? [];
      if (matching.length + slot.wildcard.length < candidates.length) candidates = [...matching, ...slot.wildcard];
    });
    return candidates.filter(source => !rules[source].conclusion.terms.some((value, position) => atomic(value) &&
      atomic(dependency.terms[position]) && !sameTerm(value, dependency.terms[position])));
  }
  // Facts are already loaded; only rule producers can require lower strata.
  if (!rules.some(rule => rule.premises.some(premise =>
    (premise.negated || premise.aggregate) && dependencyCandidates(premise).length))) return [rules];
  const outgoing = rules.map(() => []);
  const incoming = rules.map(() => []);
  rules.forEach((rule, target) => {
    for (const premise of rule.premises) {
      const weight = premise.negated || premise.aggregate ? 1 : 0;
      for (const source of dependencyCandidates(premise)) {
        outgoing[source].push([target, weight]);
        incoming[target].push(source);
      }
    }
  });
  // Iterative Kosaraju traversal keeps deep positive components off the JS stack.
  const visited = new Uint8Array(rules.length);
  const order = [];
  for (let root = 0; root < rules.length; root++) {
    if (visited[root]) continue;
    visited[root] = 1;
    const stack = [[root, 0]];
    while (stack.length) {
      const frame = stack[stack.length - 1];
      const edges = outgoing[frame[0]];
      if (frame[1] === edges.length) { order.push(frame[0]); stack.pop(); continue; }
      const next = edges[frame[1]++][0];
      if (!visited[next]) { visited[next] = 1; stack.push([next, 0]); }
    }
  }
  const component = new Int32Array(rules.length).fill(-1);
  let count = 0;
  for (const root of order.reverse()) {
    if (component[root] !== -1) continue;
    component[root] = count;
    const stack = [root];
    while (stack.length) {
      for (const next of incoming[stack.pop()]) {
        if (component[next] === -1) { component[next] = count; stack.push(next); }
      }
    }
    count++;
  }
  const edges = Array.from({ length: count }, () => []);
  const indegree = new Int32Array(count);
  outgoing.forEach((targets, source) => {
    for (const [target, weight] of targets) {
      const from = component[source]; const to = component[target];
      if (from === to) {
        if (weight) throw new Error('These rules form a cycle through negation or aggregation. Complete their producers in a lower stratum.');
      } else { edges[from].push([to, weight]); indegree[to]++; }
    }
  });
  const levels = new Int32Array(count);
  const queue = [];
  for (let index = 0; index < count; index++) if (!indegree[index]) queue.push(index);
  for (let cursor = 0; cursor < queue.length; cursor++) {
    const from = queue[cursor];
    for (const [to, weight] of edges[from]) {
      levels[to] = Math.max(levels[to], levels[from] + weight);
      if (--indegree[to] === 0) queue.push(to);
    }
  }
  const layers = [];
  rules.forEach((rule, index) => (layers[levels[component[index]]] ??= []).push(rule));
  return layers;
}

export function infer(program, { validateChecks = false } = {}) {
  const layers = ruleLayers(program.rules);
  const levels = new Map(layers.flatMap((rules, level) => rules.map(rule => [rule, level])));
  const definitions = new Map();
  for (const rule of program.rules) if (rule.backward) {
    if (!definitions.has(rule.conclusion.relation)) definitions.set(rule.conclusion.relation, []);
    definitions.get(rule.conclusion.relation).push(rule);
  }
  const tables = new Set();
  const facts = new Map();
  const absences = new Map();
  const compoundKeys = new WeakMap();
  function termKey(value) {
    if (typeof value === 'string') return `integer:${value}`;
    if (value.atom !== undefined) return `atom:${value.atom}`;
    if (value.text !== undefined) return `text:${value.text}`;
    if (value.real !== undefined) return `real:${value.real}`;
    let id = compoundKeys.get(value);
    if (id === undefined) { id = JSON.stringify(value); compoundKeys.set(value, id); }
    return id;
  }
  // Each rule prefix subscribes to its next goal and sees each matching fact once.
  const known = new Map();
  const waiting = new Map();
  const empty = [];
  const queues = layers.map(() => []);
  const cursors = layers.map(() => 0);
  let nextLevel = queues.length;
  function enqueue(work, level) {
    queues[level].push(work);
    nextLevel = Math.min(nextLevel, level);
  }
  function relationIndex(index, goal) {
    let entry = index.get(goal.relation);
    if (!entry) {
      entry = { all: [], exact: new Map(), positions: goal.terms.map(() => new Map()) };
      index.set(goal.relation, entry);
    }
    return entry;
  }
  function lookup(index, goal, subscription = null) {
    const isGround = goal.terms.every(ground);
    if (index === known && isGround) {
      const record = facts.get(key(goal));
      return record ? [record] : empty;
    }
    const entry = subscription ? relationIndex(index, goal) : index.get(goal.relation);
    if (!entry) return empty;
    let values; let id;
    if (isGround) { values = entry.exact; id = key(goal); }
    else {
      const position = goal.terms.findIndex(ground);
      if (position === -1) {
        if (subscription) entry.all.push(subscription);
        return entry.all;
      }
      values = entry.positions[position]; id = termKey(goal.terms[position]);
    }
    let records = values.get(id);
    if (subscription) {
      if (records) records.push(subscription);
      else { records = [subscription]; values.set(id, records); }
    }
    return records ?? empty;
  }
  function add(goal, reason) {
    const id = key(goal);
    if (facts.has(id)) return false;
    const entry = relationIndex(known, goal);
    const record = { goal, ...reason };
    facts.set(id, record);
    entry.all.push(record);
    const subscribers = waiting.get(goal.relation);
    function notify(subscriptions) {
      for (const subscription of subscriptions ?? empty) {
        enqueue({ subscription, record }, levels.get(subscription.rule));
      }
    }
    notify(subscribers?.all);
    notify(subscribers?.exact.get(id));
    for (let position = 0; position < goal.terms.length; position++) {
      const term = termKey(goal.terms[position]);
      const values = entry.positions[position];
      let records = values.get(term);
      if (records) records.push(record);
      else values.set(term, [record]);
      notify(subscribers?.positions[position].get(term));
    }
    return true;
  }
  function demand(request) {
    const rules = definitions.get(request.relation);
    if (!rules) return;
    const goal = callKey(request);
    const id = key(goal);
    if (tables.has(id)) return;
    // Variant calls share a table after variable names are canonicalized.
    tables.add(id);
    for (const rule of rules) {
      const bindings = new Map();
      if (rule.conclusion.terms.every((head, index) => unify(head, goal.terms[index], bindings))) {
        enqueue({ resume: { rule, position: 0, partial: { bindings, premises: [], calculations: [], table: goal } } }, levels.get(rule));
      }
    }
  }
  function resumeBuiltin(rule, position, partial, bindings, evidence, calculations) {
    enqueue({ resume: { rule, position: position + 1, partial: {
      ...partial, bindings, calculations, premises: partial.premises.concat(evidence),
    } } }, levels.get(rule));
  }
  function advanceBuiltin(rule, position, partial, premise, calculations) {
    const terms = premise.terms.map(value => specialize(value, partial.bindings));
    if (premise.aggregate) {
      if (premise.negated) throw new Error('Define a helper predicate before negating an aggregate.');
      const sourceGoal = substitute(premise.aggregate.sourceGoal, partial.bindings);
      demand(sourceGoal);
      enqueue({ aggregate: { rule, position, partial, premise, sourceGoal, calculations } }, levels.get(rule));
      return;
    }
    const name = premise.relation.slice(8);
    const bindings = new Map(partial.bindings);
    const evidence = { goal: { ...premise, terms }, rule: null, premises: [], comparison: true };
    let holds;
    if (name === 'true') holds = true;
    else if (name === 'fail' || name === 'false') holds = false;
    else if (name === '=') {
      if (premise.negated && !terms.every(ground)) throw new Error('Negated unification needs bound operands in this subset.');
      holds = unify(terms[0], terms[1], bindings);
    } else if (name === '\\=') holds = !unify(terms[0], terms[1], new Map(bindings));
    else if (name === 'is') {
      if (premise.negated && !ground(terms[0])) throw new Error('Negated is/2 needs a bound result in this subset.');
      const result = evaluate(premise.terms[1], bindings, calculations);
      holds = unify(premise.terms[0], result, bindings);
    } else if (name === 'contains_text') {
      if (!terms.every(value => value.text !== undefined)) throw new Error('contains_text/2 needs two bound strings.');
      holds = terms[0].text.toLowerCase().includes(terms[1].text.toLowerCase());
    } else if (name.startsWith('@')) {
      if (!terms.every(ground) || !(terms.every(value => value.text !== undefined) || terms.every(value => value.atom !== undefined))) {
        throw new Error('Term ordering in this subset needs two bound atoms or two bound strings.');
      }
      const [a, b] = terms.map(value => value.atom ?? value.text);
      holds = name === '@<' ? a < b : name === '@=<' ? a <= b : name === '@>' ? a > b : a >= b;
    } else {
      const [a, b] = premise.terms.map(value => numberValue(evaluate(value, bindings, calculations)));
      holds = name === '<' ? a < b : name === '=<' ? a <= b : name === '>' ? a > b
        : name === '>=' ? a >= b : name === '=:=' ? a <= b && a >= b : !(a <= b && a >= b);
    }
    if (holds === Boolean(premise.negated)) return;
    const resultBindings = premise.negated ? partial.bindings : bindings;
    evidence.goal = { ...premise, terms: premise.terms.map(value => specialize(value, resultBindings)) };
    resumeBuiltin(rule, position, partial, resultBindings, evidence, calculations);
  }
  function finishAggregate({ rule, position, partial, premise, sourceGoal, calculations }) {
    const { operation, value } = premise.aggregate;
    const records = lookup(known, sourceGoal)
      .filter(record => match(sourceGoal, record.goal));
    let result;
    if (operation === 'count') result = BigInt(records.length).toString();
    else {
      if (!records.length && operation !== 'sum') return;
      const values = records.map(record => {
        const bindings = match(premise.aggregate.sourceGoal, record.goal);
        return evaluate(value, bindings);
      });
      if (operation === 'sum') result = values.reduce((total, number) => evaluate({ functor: '+', args: [total, number] }, new Map()), '0');
      else result = values.reduce((best, number) => {
        const a = numberValue(best); const b = numberValue(number);
        return operation === 'min' ? a <= b ? best : number : a >= b ? best : number;
      });
    }
    const bindings = new Map(partial.bindings);
    if (!unify(premise.terms[0], result, bindings)) return;
    const evidence = { goal: { ...premise, terms: [result] }, rule: null,
      premises: records.flatMap(record => record.premises), aggregate: { value: result,
        detail: `I computed ${operation} over ${records.length} distinct matching tuples in the completed program.` } };
    resumeBuiltin(rule, position, partial, bindings, evidence, calculations);
  }
  function advance(rule, position, partial) {
    try { return advanceStep(rule, position, partial); }
    catch (error) {
      if (rule.line !== undefined && !/^Line \d+:/.test(error.message)) throw new Error(`Line ${rule.line}: ${error.message}`);
      throw error;
    }
  }
  function advanceStep(rule, position, partial) {
    if (position === rule.premises.length) {
      const calculations = partial.calculations;
      for (const name of rule.backward ? variables(rule.conclusion) : []) {
        if (!ground(specialize({ variable: name }, partial.bindings))) {
          throw new Error(`Give ${name} a value in the question or an earlier goal; an answer must be ground.`);
        }
      }
      const conclusion = substitute(rule.conclusion, partial.bindings);
      if (partial.table && !match(partial.table, conclusion)) return;
      add(conclusion, { rule, premises: partial.premises, calculations, bindings: partial.bindings });
      return;
    }
    const premise = rule.premises[position];
    if (premise.relation.startsWith('builtin:')) {
      advanceBuiltin(rule, position, partial, premise, [...partial.calculations]);
      return;
    }
    const goal = partial.bindings.size === 0 ? premise : substitute(premise, partial.bindings);
    if (premise.negated && !goal.terms.every(ground)) throw new Error(`Negation needs bound inputs: ${say(goal)}.`);
    demand(goal);
    if (premise.negated) {
      // Finish lower-stratum producers before testing absence.
      enqueue({ negative: { rule, position, partial, goal } }, levels.get(rule));
      return;
    }
    const subscription = { rule, position, goal, partial };
    lookup(waiting, goal, subscription);
    for (const record of lookup(known, goal)) enqueue({ subscription, record }, levels.get(rule));
  }
  for (const fact of program.facts) add(fact, { rule: null, premises: [] });
  for (const question of program.questions) if (question.goal) demand(question.goal);
  const initial = { bindings: new Map(), premises: [], calculations: [] };
  for (const layer of layers) {
    for (const rule of layer) if (!rule.backward) advance(rule, 0, initial);
  }
  function drain() {
    while (nextLevel < queues.length) {
      const level = nextLevel;
      const queue = queues[level];
      if (cursors[level] === queue.length) { nextLevel++; continue; }
      const work = queue[cursors[level]];
      queue[cursors[level]++] = null; // Release processed work.
      if (work.resume) {
        const { rule, position, partial } = work.resume;
        advance(rule, position, partial);
        continue;
      }
      if (work.aggregate) {
        try { finishAggregate(work.aggregate); }
        catch (error) {
          const line = work.aggregate.rule.line;
          throw line === undefined ? error : new Error(`Line ${line}: ${error.message}`);
        }
        continue;
      }
      if (work.negative) {
        const { rule, position, partial, goal } = work.negative;
        if (lookup(known, goal).length === 0) {
          const id = key(goal);
          if (!absences.has(id)) absences.set(id, absence(goal));
          advance(rule, position + 1, { ...partial, premises: partial.premises.concat(absences.get(id)) });
        }
        continue;
      }
      const { subscription, record } = work;
      const { rule, position, goal, partial } = subscription;
      const bindings = match(goal, record.goal, partial.bindings);
      if (bindings) advance(rule, position + 1, {
        ...partial, bindings, premises: partial.premises.concat(record),
      });
    }
  }
  drain();
  for (const assertion of program.checks) {
    demand(assertion.goal);
    drain();
    if (validateChecks && !lookup(known, assertion.goal).some(record => match(assertion.goal, record.goal))) {
      throw new Error(`Line ${assertion.line}: Check failed: ${assertion.text}.`);
    }
  }
  return [...facts.values()];
}

function otherReason(record, steps) {
  if (record.comparison) return 'I checked these values.';
  if (record.absence) return 'I checked the completed program and found no matching fact.';
  if (record.aggregate) {
    const uses = record.premises.length ? ` I used steps ${record.premises.map(p => steps.get(p)).join(', ')}.` : '';
    return record.aggregate.detail + uses;
  }
  return 'you told me this.';
}

function appliedBindings(record) {
  return [...record.bindings].filter(([name]) => namedVariable.test(name))
    .map(([name]) => `${name} = ${sayTerm(specialize({ variable: name }, record.bindings))}`).join(', ');
}

function explain(roots) {
  // Iterative postorder visits each shared proof step once.
  const seen = new Set();
  const records = [];
  const pending = roots.slice().reverse().map(record => ({ record, finish: false }));
  while (pending.length) {
    const frame = pending.pop();
    if (frame.finish) {
      records.push(frame.record);
      continue;
    }
    if (seen.has(frame.record)) continue;
    seen.add(frame.record);
    pending.push({ ...frame, finish: true });
    for (let i = frame.record.premises.length - 1; i >= 0; i--) {
      pending.push({ record: frame.record.premises[i], finish: false });
    }
  }
  const rules = new Map();
  for (const record of records) if (record.rule && !rules.has(record.rule)) rules.set(record.rule, rules.size + 1);
  const steps = new Map(records.map((record, index) => [record, index + 1]));
  const chunks = [];
  let lines = [];
  function line(text) {
    lines.push(text);
    if (lines.length === 1024) { chunks.push(lines.join('\n')); lines = []; }
  }
  line('Here is why. Each step is shown once.');
  for (const [rule, number] of rules) line(`rule ${number}: ${rule.text}`);
  for (const record of records) {
    line(`step ${steps.get(record)}: ${say(record.goal)}.`);
    if (!record.rule) line(`  ${otherReason(record, steps)}`);
    else {
      const uses = record.premises.length ? ` uses steps ${record.premises.map(p => steps.get(p)).join(', ')}` : '';
      line(`  because rule ${rules.get(record.rule)}${uses}.`);
      const bindings = appliedBindings(record);
      if (bindings) line(`  with ${bindings}.`);
      for (const calculation of record.calculations ?? []) line(`  ${calculation}`);
    }
  }
  line(`That explains ${roots.length === 1 ? 'step' : 'steps'} ${roots.map(record => steps.get(record)).join(', ')}.`);
  if (lines.length) chunks.push(lines.join('\n'));
  return chunks.join('\n');
}

export function run(source, { arc = false } = {}) {
  const program = parse(source);
  const facts = infer(program, { validateChecks: true });
  let previous = null;
  const answers = program.questions.map(question => {
    if (question.previous) {
      if (previous === null) return 'Ask a query first, then ask ?- why.';
      return previous.length ? explain(previous) : 'There is no successful answer to explain.';
    }
    const found = facts.filter(record => match(question.goal, record.goal));
    previous = found.flatMap(record => record.premises);
    if (question.why) return previous.length ? explain(previous) : 'false.';
    if (!found.length) return 'false.';
    if (!question.names.length) return 'true.';
    return found.map(record => question.names.map((name, index) => `${name} = ${sayTerm(record.goal.terms[index])}`).join(', ') + '.').join('\n');
  });
  for (const assertion of program.checks) answers.push(`check passed: ${assertion.text}.`);
  if (!arc) return answers;
  const sections = [[], [], answers.slice(program.questions.length)];
  program.questions.forEach((question, index) => {
    const answer = question.why ? answers[index] : `?- ${question.body.map(say).join(', ')}.\n${answers[index]}`;
    sections[question.why ? 1 : 0].push(answer);
  });
  const empty = [
    'Add a query such as ?- mortal(Who).',
    'No explanation was requested. Add ?- why. after a query.',
    'No checks were requested.',
  ];
  return ['Answer', 'Reason', 'Check'].map((label, index) => `% ${label}\n${sections[index].join('\n\n') || empty[index]}`);
}
