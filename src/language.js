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
const tests = new Set(['is', '=', '=..', '\\=', '<', '=<', '>', '>=', '=:=', '=\\=', '@<', '@=<', '@>', '@>=']);
const textConversions = new Map([['atom_codes', 'atom'], ['string_codes', 'text']]);
const binary = new Map([
  ['\\/', [1, 'left']], ['xor', [1, 'left']], ['/\\', [1, 'left']],
  ['<<', [1, 'left']], ['>>', [1, 'left']], ['+', [2, 'left']], ['-', [2, 'left']],
  ['*', [3, 'left']], ['/', [3, 'left']], ['//', [3, 'left']], ['div', [3, 'left']],
  ['rem', [3, 'left']], ['mod', [3, 'left']], ['**', [4, 'none']], ['^', [4, 'right']],
]);

function* tokenize(source) {
  let position = 0;
  let line = 1;
  const fail = message => { throw new Error(`Line ${line}: ${message}`); };
  const symbols = new Set(['=..', '=\\=', '=:=', ':-', '?-', '\\+', '\\=', '=<', '>=', '//', '**', '<<', '>>', '/\\', '\\/', '@=<', '@>=', '@<', '@>']);
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
  const program = { facts: [], rules: [], questions: [], checks: [], clauses: [], tables: [] };
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
      if (token.value === '.' && args.length === 2) {
        if (!args[1].list && !args[1].variable) fail('The part after | must be a list or a variable in this subset.');
        return list([args[0]], args[1]);
      }
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
    if (value.atom !== undefined) return ['true', 'false'].includes(value.atom) ? builtin(value.atom) : ordinary(value.atom);
    if (!value.functor) fail('A goal must be an atom or a predicate with arguments.');
    const { functor: name, args } = value;
    if ((name === 'contains_text' || textConversions.has(name)) && args.length === 2) return builtin(name, args);
    if (tests.has(name) && args.length === 2) return builtin(name, args);
    return ordinary(name, args);
  };
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
  function addRule(conclusion, premises) {
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
      } else if (['builtin:=', 'builtin:=..', 'builtin:atom_codes', 'builtin:string_codes'].includes(premise.relation) &&
        premise.terms.some(value => termVariables(value).every(name => bound.has(name)))) {
        names.forEach(name => bound.add(name));
      } else if (!names.every(name => bound.has(name))) forward = false;
    }
    if (!variables(conclusion).every(name => bound.has(name))) forward = false;
    const rule = { conclusion, premises, backward: !forward };
    program.rules.push(rule);
    return rule;
  }
  function request(body, line) {
    const names = [...new Set(body.flatMap(variables))].filter(name => !name.startsWith('$anonymous') && !name.startsWith('_'));
    const goal = internal(`query${++generated}`, names.map(variable => ({ variable })));
    addRule(goal, body).line = line;
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
      program.questions.push({ ...request(body, line), why, line });
    } else if (take(':-')) {
      if (take('table')) {
        do {
          const name = tokenAt(position++);
          if (name.type !== 'atom') fail('A table declaration needs a predicate name and arity.');
          expect('/');
          const arity = tokenAt(position++);
          if (arity.type !== 'number' || typeof arity.value !== 'string' || BigInt(arity.value) < 0n) fail('A predicate arity must be a nonnegative integer.');
          tabled.add(relation(name.value, arity.value));
          program.tables.push(relation(name.value, arity.value));
        } while (take(','));
        expect('.');
      } else if (take('assertion')) {
        expect('(');
        const body = goals();
        expect(')');
        expect('.');
        const text = body.map(say).join(', ');
        program.checks.push({ ...request(body, line), text, line });
      } else fail('Supported directives are :- table name/arity. and :- assertion(Goal).');
    } else {
      const conclusion = asGoal(expression());
      if (take(':-')) {
        const premises = goals();
        expect('.');
        const rule = addRule(conclusion, premises);
        rule.line = line;
        program.clauses.push(rule);
      } else {
        expect('.');
        if (conclusion.relation.startsWith('builtin:')) fail('A fact must name an ordinary predicate.');
        if (variables(conclusion).length) {
          const rule = addRule(conclusion, []);
          rule.line = line;
          program.clauses.push(rule);
        } else {
          program.facts.push(conclusion);
          program.clauses.push({ conclusion, premises: [] });
        }
      }
    }
  }
  for (const rule of program.rules) if (tabled.has(rule.conclusion.relation)) rule.backward = true;
  return program;
}

function list(items, tail) {
  if (tail?.list) return list([...items, ...tail.list], tail.tail);
  if (tail !== undefined && !tail.variable) throw new Error('The part after | must be a list or a variable in this subset.');
  if (!items.length && tail !== undefined) return tail;
  return tail === undefined ? { list: items } : { list: items, tail };
}

function textCodes(name, terms) {
  const kind = textConversions.get(name);
  const [text, codes] = terms;
  const scalar = code => {
    if (!Number.isInteger(code) || code < 0 || code > 0x10ffff || code >= 0xd800 && code <= 0xdfff) {
      throw new Error(`${name}/2 needs Unicode scalar values: integers from 0 to 1114111 excluding 55296 through 57343.`);
    }
    return code;
  };
  if (!text.variable) {
    if (text[kind] === undefined) throw new Error(`${name}/2 needs ${kind === 'atom' ? 'an atom' : 'a string'} as its first argument.`);
    return list(Array.from(text[kind], character => String(scalar(character.codePointAt(0)))));
  }
  if (!codes.list || codes.tail !== undefined || !ground(codes)) {
    throw new Error(`${name}/2 needs a bound ${kind === 'atom' ? 'atom' : 'string'} or a bound proper list of character codes.`);
  }
  return { [kind]: codes.list.map(code => {
    if (typeof code !== 'string') throw new Error(`${name}/2 needs integer character codes.`);
    return String.fromCodePoint(scalar(Number(code)));
  }).join('') };
}

function termParts(term) {
  if (term.functor) return list([atom(term.functor), ...term.args]);
  if (term.list?.length) return list([atom('.'), term.list[0], list(term.list.slice(1), term.tail)]);
  return list([term]);
}

function termFromParts(parts) {
  if (!parts.list || parts.tail !== undefined || !parts.list.length) {
    throw new Error('=../2 needs a nonvariable term or a nonempty proper list of parts.');
  }
  const [name, ...args] = parts.list;
  if (!args.length) {
    if (!atomic(name) && !(name.list?.length === 0 && name.tail === undefined)) {
      throw new Error('=../2 needs an atomic value or [] in a singleton parts list.');
    }
    return name;
  }
  if (name.atom === undefined) throw new Error('=../2 needs a bound atom as the functor in a parts list with arguments.');
  return name.atom === '.' && args.length === 2 ? list([args[0]], args[1]) : { functor: name.atom, args };
}

const atomic = value => typeof value === 'string' || value?.atom !== undefined || value?.text !== undefined || value?.real !== undefined;
function variables(goal) { return goal.terms.flatMap(termVariables); }
function termVariables(value) {
  if (value === undefined || atomic(value)) return [];
  if (value.variable) return [value.variable];
  if (value.functor) return value.args.flatMap(termVariables);
  return [...value.list.flatMap(termVariables), ...termVariables(value.tail)];
}

function evaluate(expression, bindings) {
  const value = specialize(expression, bindings);
  if (numeric(value)) return value;
  if (value.variable) throw new Error(`Arithmetic input ${value.variable} is unbound; bind it before using is or a comparison.`);
  if (value.atom === 'pi') return finite(Math.PI);
  if (value.atom === 'e') return finite(Math.E);
  if (!value.functor) throw new Error(`Arithmetic needs a number; found ${sayTerm(value)}.`);
  const args = value.args.map(arg => evaluate(arg, bindings));
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
      if (exact) return args[0];
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
  return answer;
}

function quoteAtom(value) {
  return /^[a-z][A-Za-z0-9_]*$/.test(value) ? value : `'${value.replaceAll('\\', '\\\\').replaceAll("'", "''")}'`;
}
function sayTerm(value, functional = false) {
  if (typeof value === 'string') return value;
  if (value.atom !== undefined) return quoteAtom(value.atom);
  if (value.real !== undefined) {
    const text = String(value.real);
    return /[.eE]/.test(text) ? text : `${text}.0`;
  }
  if (value.text !== undefined) return JSON.stringify(value.text);
  if (value.variable) return value.variable.startsWith('$') ? '_' : value.variable;
  if (value.functor) {
    if (!functional && binary.has(value.functor) && value.args.length === 2) {
      return `(${sayTerm(value.args[0])} ${value.functor} ${sayTerm(value.args[1])})`;
    }
    if (!functional && ['-', '+', '\\'].includes(value.functor) && value.args.length === 1) return `${value.functor} (${sayTerm(value.args[0])})`;
    return `${quoteAtom(value.functor)}(${value.args.map(part => sayTerm(part, functional)).join(', ')})`;
  }
  const items = value.list.map(part => sayTerm(part, functional)).join(', ');
  return `[${items}${value.tail === undefined ? '' : ` | ${sayTerm(value.tail, functional)}`}]`;
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
    if (tests.has(name)) return `${sayTerm(goal.terms[0])} ${name} ${sayTerm(goal.terms[1])}`;
    return `${name}${goal.terms.length ? `(${goal.terms.map(value => sayTerm(value)).join(', ')})` : ''}`;
  }
  const name = goal.relation.slice(goal.relation.startsWith('predicate:') ? 'predicate:'.length : 0, goal.relation.lastIndexOf('/'));
  return `${quoteAtom(name)}${goal.terms.length ? `(${goal.terms.map(value => sayTerm(value)).join(', ')})` : ''}`;
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
      if (part.list) {
        for (const item of part.list) pending.push(item);
        if (part.tail) pending.push(part.tail);
      }
      if (part.functor) for (const arg of part.args) pending.push(arg);
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
  return { relation: goal.relation, terms: goal.terms.map(value => rename(value, names, '$call')) };
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

function checkBuiltin(premise, inputBindings = new Map()) {
  if (!premise.relation.startsWith('builtin:') || premise.aggregate) throw new Error('Expected a pure builtin.');
  const terms = premise.terms.map(value => specialize(value, inputBindings));
  const name = premise.relation.slice(8);
  const bindings = new Map(inputBindings);
  let holds;
  if (name === 'true') holds = true;
  else if (name === 'false') holds = false;
  else if (name === '=') {
    if (premise.negated && !terms.every(ground)) throw new Error('Negated unification needs bound operands in this subset.');
    holds = unify(terms[0], terms[1], bindings);
  } else if (name === '=..' || textConversions.has(name)) {
    if (premise.negated && !terms.every(ground)) throw new Error(`Negated ${name}/2 needs bound operands.`);
    const target = terms[0].variable ? 0 : 1;
    const result = name === '=..' ? target === 0 ? termFromParts(terms[1]) : termParts(terms[0]) : textCodes(name, terms);
    holds = unify(premise.terms[target], result, bindings);
  } else if (name === '\\=') holds = !unify(terms[0], terms[1], new Map(bindings));
  else if (name === 'is') {
    if (premise.negated && !ground(terms[0])) throw new Error('Negated is/2 needs a bound result in this subset.');
    const result = evaluate(premise.terms[1], bindings);
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
  } else if (tests.has(name)) {
    const [a, b] = premise.terms.map(value => numberValue(evaluate(value, bindings)));
    holds = name === '<' ? a < b : name === '=<' ? a <= b : name === '>' ? a > b
      : name === '>=' ? a >= b : name === '=:=' ? a <= b && a >= b : !(a <= b && a >= b);
  } else throw new Error(`Unknown builtin: ${name}.`);
  return holds === Boolean(premise.negated) ? null : premise.negated ? inputBindings : bindings;
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
        enqueue({ resume: { rule, position: 0, partial: { bindings, premises: [], table: goal } } }, levels.get(rule));
      }
    }
  }
  function resumeBuiltin(rule, position, partial, bindings, evidence) {
    enqueue({ resume: { rule, position: position + 1, partial: {
      ...partial, bindings, premises: partial.premises.concat(evidence),
    } } }, levels.get(rule));
  }
  function advanceBuiltin(rule, position, partial, premise) {
    if (premise.aggregate) {
      for (const term of premise.terms) specialize(term, partial.bindings);
      if (premise.negated) throw new Error('Define a helper predicate before negating an aggregate.');
      const sourceGoal = substitute(premise.aggregate.sourceGoal, partial.bindings);
      demand(sourceGoal);
      enqueue({ aggregate: { rule, position, partial, premise, sourceGoal } }, levels.get(rule));
      return;
    }
    const resultBindings = checkBuiltin(premise, partial.bindings);
    if (resultBindings === null) return;
    const evidence = { goal: { ...premise, terms: premise.terms.map(value => specialize(value, resultBindings)) },
      rule: null, premises: [], comparison: true };
    resumeBuiltin(rule, position, partial, resultBindings, evidence);
  }
  function finishAggregate({ rule, position, partial, premise, sourceGoal }) {
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
      premises: records.flatMap(record => record.premises), bindings: partial.bindings, aggregate: { records } };
    resumeBuiltin(rule, position, partial, bindings, evidence);
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
      for (const name of rule.backward ? variables(rule.conclusion) : []) {
        if (!ground(specialize({ variable: name }, partial.bindings))) {
          throw new Error(`Give ${name} a value in the question or an earlier goal; an answer must be ground.`);
        }
      }
      const conclusion = substitute(rule.conclusion, partial.bindings);
      if (partial.table && !match(partial.table, conclusion)) return;
      add(conclusion, { rule, premises: partial.premises, bindings: partial.bindings });
      return;
    }
    const premise = rule.premises[position];
    if (premise.relation.startsWith('builtin:')) {
      advanceBuiltin(rule, position, partial, premise);
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
  const initial = { bindings: new Map(), premises: [] };
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

const compound = (functor, args) => ({ functor, args });
const is = (term, name, arity) => term?.functor === name && term.args.length === arity;
const items = term => term?.list && term.tail === undefined ? term.list : null;
const integer = term => typeof term === 'string' && /^[1-9][0-9]*$/.test(term) && Number.isSafeInteger(Number(term));
const withTerm = (record, term) => term ? Object.defineProperty(record, 'term', { value: term }) : record;
const primitives = new Set(['true/0', 'false/0', 'contains_text/2',
  ...[...tests, ...textConversions.keys()].map(name => `${name}/2`)]);

function goalTerm(goal, bindings = new Map()) {
  let term;
  if (goal.aggregate) {
    const { operation, value, body } = goal.aggregate;
    term = compound('aggregate_all', [operation === 'count' ? atom('count') : compound(operation, [specialize(value, bindings)]),
      list(body.map(part => goalTerm(part, bindings))), specialize(goal.terms[0], bindings)]);
  } else {
    const name = goal.relation.startsWith('builtin:') ? goal.relation.slice(8)
      : goal.relation.slice('predicate:'.length, goal.relation.lastIndexOf('/'));
    const args = goal.terms.map(term => specialize(term, bindings));
    term = args.length ? compound(name, args) : atom(name);
  }
  return goal.negated ? compound('\\+', [term]) : term;
}

function readGoal(term) {
  if (is(term, '\\+', 1)) {
    const goal = readGoal(term.args[0]);
    if (goal.negated || goal.aggregate) throw new Error('Invalid negated proof goal.');
    return { ...goal, negated: true };
  }
  if (is(term, 'aggregate_all', 3)) {
    const [template, body, result] = term.args;
    const operation = template.atom === 'count' ? 'count' : template.functor;
    if (!items(body)?.length || !['count', 'sum', 'min', 'max'].includes(operation) ||
        operation === 'count' && template.atom !== 'count' ||
        operation !== 'count' && template.args?.length !== 1) throw new Error('Invalid aggregate proof goal.');
    return { relation: 'builtin:aggregate', terms: [result], aggregate: {
      operation, value: operation === 'count' ? null : template.args[0], body: body.list.map(readGoal),
    } };
  }
  const name = term?.atom ?? term?.functor;
  if (name === undefined) throw new Error('A proof goal must name a predicate or builtin.');
  const terms = term.args ?? [];
  return { relation: primitives.has(`${name}/${terms.length}`) ? `builtin:${name}` : `predicate:${name}/${terms.length}`, terms };
}

function rename(term, names, prefix) {
  if (typeof term === 'string') return term;
  if (term.variable) {
    if (!names.has(term.variable)) names.set(term.variable, { variable: `${prefix}${names.size}` });
    return names.get(term.variable);
  }
  if (term.functor) return compound(term.functor, term.args.map(part => rename(part, names, prefix)));
  if (term.list) return { list: term.list.map(part => rename(part, names, prefix)),
    ...(term.tail === undefined ? {} : { tail: rename(term.tail, names, prefix) }) };
  return term;
}

function canonical(term) {
  return proofText(rename(term, new Map(), 'V'));
}

const proofText = term => sayTerm(term, true);

function template(term) {
  if (typeof term === 'string') return term;
  if (term.variable) return compound('var', [atom(term.variable)]);
  if (term.functor) return compound(term.functor, term.args.map(template));
  if (term.list) return term.tail === undefined ? list(term.list.map(template))
    : compound('list', [list(term.list.map(template)), template(term.tail)]);
  return term;
}

const clauseTerms = clause => [goalTerm(clause.conclusion), list(clause.premises.map(part => goalTerm(part)))];
const line = term => `${canonical(term)}.`;
const stepUses = step => step.by.atom === 'collected' ? step.uses.flatMap(tuple => items(tuple) ?? []) : step.uses;

export function renderProof(program, facts, requests = program.questions) {
  const claims = [];
  const roots = [];
  const frame = (record, bindings) => ({ record, bindings: record.rule ? record.bindings : bindings ?? record.bindings });
  const term = ({ record, bindings }) => goalTerm(record.goal, bindings);
  requests.forEach(request => {
    if (!request.goal) return;
    for (const record of facts) if (record.goal.relation === request.goal.relation) {
      const premises = record.premises.map(premise => frame(premise, record.bindings));
      claims.push(compound('claim', [compound('query', [String(program.questions.indexOf(request) + 1)]), list(premises.map(term))]));
      roots.push(...premises);
    }
  });
  const clauses = new Map(program.clauses.map((clause, index) => [clause, index + 1]));
  const supplied = new Map(program.clauses.filter(clause => !clause.premises.length)
    .map(clause => [canonical(goalTerm(clause.conclusion)), clauses.get(clause)]));
  const steps = new Map();
  const ordered = [];
  const cited = new Set();
  const pending = roots.slice().reverse();
  while (pending.length) {
    const current = pending.pop();
    if (current.finish) { ordered.push(steps.get(current.id)); continue; }
    const { record, bindings: context } = current;
    const goal = term(current);
    const id = canonical(goal);
    if (steps.has(id)) continue;
    let by;
    let premises = record.premises.map(premise => frame(premise, context));
    let uses = premises.map(term);
    let bindings = [];
    if (record.rule) {
      const number = clauses.get(record.rule);
      if (!number) throw new Error('A proof step must cite a source clause.');
      by = compound(record.rule.premises.length ? 'rule' : 'fact', [String(number)]);
      bindings = [...record.bindings].filter(([name]) => !name.startsWith('$call'))
        .map(([name, value]) => compound('=', [atom(name), specialize(value, record.bindings)]));
      cited.add(number);
    } else if (record.absence) by = atom('absent');
    else if (record.aggregate) {
      by = atom('collected');
      const tuples = record.aggregate.records.map(tuple => tuple.premises.map(premise => frame(premise, tuple.bindings)));
      uses = tuples.map(tuple => list(tuple.map(term)));
      premises = tuples.flat();
    } else if (record.comparison) by = atom('builtin');
    else {
      const number = supplied.get(id);
      if (!number) throw new Error('A supplied proof fact must occur in the source.');
      by = compound('fact', [String(number)]);
      cited.add(number);
    }
    steps.set(id, compound('step', [goal, by, list(bindings), list(uses)]));
    pending.push({ finish: true, id });
    for (let index = premises.length - 1; index >= 0; index--) pending.push(premises[index]);
  }
  const lines = ['certificate(eyelang, 1).', '', ...claims.map(line), ''];
  for (const number of [...cited].sort((a, b) => a - b)) {
    lines.push(line(compound('clause', [String(number), ...clauseTerms(program.clauses[number - 1]).map(template)])));
  }
  lines.push('');
  for (const [index, step] of ordered.entries()) lines.push(`% step ${index + 1}`, line(step));
  return lines.join('\n') + '\n';
}

// The checker follows recorded premises. It never invokes inference or searches source rules.
export function checkProof(source, document, { allowTrusted = true } = {}) {
  const failures = [];
  const fail = (condition, detail, conclusion = null) => {
    failures.push(withTerm({ condition, detail, ...(conclusion ? { conclusion: proofText(conclusion) } : {}) }, conclusion));
  };
  let program;
  try { program = typeof source === 'string' ? parse(source) : source; }
  catch (error) { fail('C1', `Invalid source program: ${error.message}`); }
  program ??= { clauses: [], questions: [], checks: [] };
  const claims = [];
  const steps = new Map();
  let headers = 0;
  try {
    const parsed = parse(String(document));
    if (parsed.questions.length || parsed.checks.length || parsed.tables.length ||
        parsed.rules.some(rule => rule.conclusion.relation.startsWith('internal:'))) {
      fail('C3', 'Certificate documents may contain records only.');
    }
    for (const clause of parsed.clauses) {
      const term = goalTerm(clause.conclusion);
      if (clause.premises.length) { fail('C3', 'Certificate documents may contain records only.', term); continue; }
      if (is(term, 'certificate', 2)) {
        headers++;
        if (term.args[0].atom !== 'eyelang' || term.args[1] !== '1') fail('C3', 'Unsupported certificate format.', term);
      } else if (is(term, 'clause', 3)) {
        const [number, head, body] = term.args;
        const original = integer(number) && program.clauses[Number(number) - 1];
        if (!original || sayTerm(list(clauseTerms(original).map(template))) !== sayTerm(list([head, body]))) {
          fail('C1', 'Clause display differs from the source program.', term);
        }
      } else if (is(term, 'claim', 2)) {
        if (!items(term.args[1])?.length) fail('C3', 'A claim needs a nonempty proper list of goals.', term);
        else claims.push({ request: term.args[0], uses: term.args[1].list, term });
      } else if (is(term, 'step', 4)) {
        const [goal, by, bindings, uses] = term.args;
        if (!items(bindings) || !items(uses)) { fail('C3', 'Step bindings and uses must be proper lists.', goal); continue; }
        readGoal(goal);
        const id = canonical(goal);
        if (steps.has(id)) { fail('C3', 'Duplicate justification for a goal.', goal); continue; }
        steps.set(id, { goal, by, bindings: bindings.list, uses: uses.list });
      } else fail('C3', 'Unknown certificate record.', term);
    }
  } catch (error) { fail('C3', error.message); }
  if (headers !== 1) fail('C3', 'A certificate needs exactly one certificate(eyelang, 1) header.');
  if (!claims.length || !steps.size) fail('C4', 'A certificate needs successful claims and supporting steps; query failure is not certified.');
  const cover = (goal, conclusion) => {
    if (!steps.has(canonical(goal))) fail('C4', `Missing supporting step: ${sayTerm(goal)}.`, conclusion);
  };
  for (const claim of claims) for (const use of claim.uses) cover(use, claim.term);
  let verified = 0;
  let redecided = 0;
  let confronted = 0;
  const trusted = [];
  const collections = [];
  const absences = [];
  for (const step of steps.values()) {
    const { goal, by, bindings, uses } = step;
    let decoded;
    try { decoded = readGoal(goal); }
    catch (error) { fail('C3', error.message, goal); continue; }
    for (const use of stepUses(step)) cover(use, goal);
    if (is(by, 'rule', 1) || is(by, 'fact', 1)) {
      const number = by.args[0];
      const clause = integer(number) && program.clauses[Number(number) - 1];
      if (!clause) { fail('C1', 'Unknown source clause.', goal); continue; }
      const names = new Map();
      const [head, body] = clauseTerms(clause).map(term => rename(term, names, '$source'));
      const env = new Map();
      const seen = new Set();
      let valid = !decoded.negated && !decoded.relation.startsWith('builtin:') && ground(goal) &&
        (by.functor !== 'fact' || !clause.premises.length);
      for (const binding of bindings) {
        if (!is(binding, '=', 2) || binding.args[0].atom === undefined ||
            !names.has(binding.args[0].atom) || seen.has(binding.args[0].atom)) { valid = false; break; }
        seen.add(binding.args[0].atom);
        if (!unify(names.get(binding.args[0].atom), binding.args[1], env)) valid = false;
      }
      if (!unify(head, goal, env) || !unify(body, list(uses), env) ||
          canonical(specialize(list([head, body]), env)) !== canonical(list([goal, list(uses)]))) valid = false;
      if (valid) verified++;
      else fail('C1', `Step is not an instance of source clause ${number}.`, goal);
    } else if (by.atom === 'builtin') {
      let valid = !bindings.length && !uses.length && decoded.relation.startsWith('builtin:') && !decoded.aggregate;
      if (valid) {
        try {
          const env = checkBuiltin(decoded);
          valid = env !== null && canonical(specialize(goal, env)) === canonical(goal);
        } catch { valid = false; }
      }
      if (valid) redecided++;
      else fail('C5', 'Builtin result cannot be independently recomputed.', goal);
    } else if (by.atom === 'absent' && decoded.negated && !decoded.relation.startsWith('builtin:')) {
      if (bindings.length || uses.length || !ground(goal)) fail('C3', 'An absence needs a ground goal and no bindings or uses.', goal);
      absences.push(step);
      trusted.push(withTerm({ kind: 'absent', reason: 'theory_scoped', conclusion: proofText(goal) }, goal));
    } else if (by.atom === 'collected' && decoded.aggregate && !decoded.negated) {
      if (bindings.length || uses.some(tuple => !items(tuple))) fail('C3', 'A collection needs tuple lists and no bindings.', goal);
      else {
        try {
          const tuples = collectionValues(decoded, uses);
          const expected = aggregateValue(decoded.aggregate.operation, tuples.map(tuple => tuple.value));
          if (expected === null || sayTerm(expected) !== sayTerm(decoded.terms[0])) throw new Error('Aggregate result disagrees with its tuples.');
          redecided++;
          collections.push({ step, decoded, tuples });
        } catch (error) { fail('C5', error.message, goal); }
      }
      trusted.push(withTerm({ kind: 'collected', reason: 'collection_completeness', conclusion: proofText(goal) }, goal));
    } else fail('C3', 'Unknown or inappropriate step justification.', goal);
  }
  if (!allowTrusted) for (const boundary of trusted) fail('C5', `Trusted boundary forbidden: ${boundary.kind}.`);
  const evidence = evidenceIndex(program, steps);
  for (const step of absences) {
    confronted++;
    if (evidenceMatches(step.goal.args[0], evidence).length) fail('C6', 'Absence is contradicted by available evidence.', step.goal);
  }
  for (const { step, decoded, tuples } of collections) {
    confronted++;
    const listed = new Set(tuples.map(tuple => tuple.key));
    try {
      for (const tuple of availableTuples(decoded, evidence)) if (!listed.has(tuple.key)) {
        fail('C6', 'Collection omits a tuple supported by available evidence.', step.goal);
        break;
      }
    } catch (error) { fail('C6', error.message, step.goal); }
  }
  const reached = new Set();
  const pending = claims.flatMap(claim => claim.uses.map(canonical));
  const claimIds = new Set();
  for (const claim of claims) {
    const { request, uses, term } = claim;
    const index = request?.args?.[0];
    const target = integer(index) && (is(request, 'query', 1) ? program.questions[Number(index) - 1]
      : is(request, 'check', 1) ? program.checks[Number(index) - 1] : null);
    const env = new Map();
    const names = new Map();
    const pattern = target?.body && rename(list(target.body.map(part => goalTerm(part))), names, '$question');
    if (!pattern || !unify(pattern, list(uses), env) || canonical(specialize(pattern, env)) !== canonical(list(uses)) ||
        !target.names.every(name => ground(specialize(names.get(name), env)))) {
      fail('C7', 'Claim does not answer the cited query or assertion.', term);
    }
    const id = canonical(term);
    if (claimIds.has(id)) fail('C3', 'Duplicate claim.', term);
    claimIds.add(id);
  }
  while (pending.length) {
    const id = pending.pop();
    if (reached.has(id) || !steps.has(id)) continue;
    reached.add(id);
    for (const use of stepUses(steps.get(id))) pending.push(canonical(use));
  }
  for (const [id, step] of steps) if (!reached.has(id)) fail('C7', 'Step serves no claim.', step.goal);
  checkWellFounded(steps, fail);
  const uses = [...steps.values()].reduce((count, step) => count + stepUses(step).length, 0);
  const conditions = [
    ['C1', 'resolution', verified], ['C2', 'well_founded', steps.size], ['C3', 'justification', steps.size],
    ['C4', 'coverage', claims.length + uses], ['C5', 're_decision', redecided],
    ['C6', 'boundary_consistency', confronted], ['C7', 'relevance', claims.length + steps.size],
  ].map(([id, name, covered]) => ({ id, name, covered, failed: failures.filter(failure => failure.condition === id).length }));
  return { valid: !failures.length, steps: steps.size, claims: claims.length, verified, redecided,
    uses, trusted, failures, conditions };
}

function collectionValues(goal, members) {
  const { operation, value, body } = goal.aggregate;
  const patterns = list(body.map(part => goalTerm(part)));
  const names = [...new Set([...termVariables(patterns), ...(value ? termVariables(value) : [])])];
  const tuples = [];
  const seen = new Set();
  for (const member of members) {
    const env = new Map();
    if (!unify(patterns, member, env) || canonical(specialize(patterns, env)) !== canonical(member)) {
      throw new Error('Collected tuple does not instantiate its producer goals.');
    }
    const values = list(names.map(variable => specialize({ variable }, env)));
    if (!ground(values)) throw new Error('Collected producer variables must be ground.');
    const key = sayTerm(values);
    if (seen.has(key)) throw new Error('Duplicate collected tuple.');
    seen.add(key);
    tuples.push({ key, value: operation === 'count' ? '1' : evaluate(value, env) });
  }
  return tuples;
}

function aggregateValue(operation, values) {
  if (operation === 'count') return String(values.length);
  if (operation === 'sum') return values.reduce((total, value) => evaluate(compound('+', [total, value]), new Map()), '0');
  if (!values.length) return null;
  return values.reduce((best, value) => evaluate(compound(operation, [best, value]), new Map()));
}

function evidenceIndex(program, steps) {
  const evidence = new Map();
  const add = term => {
    const id = `${term.atom ?? term.functor}/${term.args?.length ?? 0}`;
    if (!evidence.has(id)) evidence.set(id, new Map());
    evidence.get(id).set(canonical(term), term);
  };
  for (const clause of program.clauses) if (!clause.premises.length) add(goalTerm(clause.conclusion));
  for (const step of steps.values()) {
    const goal = readGoal(step.goal);
    if (!goal.negated && !goal.relation.startsWith('builtin:') && ground(step.goal)) add(step.goal);
  }
  return { goals: evidence, serial: 0 };
}

function evidenceMatches(pattern, evidence, bindings = new Map()) {
  const id = `${pattern.atom ?? pattern.functor}/${pattern.args?.length ?? 0}`;
  const results = [];
  for (const candidate of evidence.goals.get(id)?.values() ?? []) {
    const env = new Map(bindings);
    const fresh = rename(candidate, new Map(), `$given${++evidence.serial}:`);
    if (unify(pattern, fresh, env)) results.push(env);
  }
  return results;
}

function* availableTuples(goal, evidence) {
  const { body } = goal.aggregate;
  const pending = [{ index: 0, bindings: new Map() }];
  while (pending.length) {
    const { index, bindings } = pending.pop();
    if (index === body.length) {
      const member = list(body.map(part => goalTerm(part, bindings)));
      const names = termVariables(member);
      if (!names.length) yield* collectionValues(goal, [member]);
      continue;
    }
    const part = body[index];
    if (part.aggregate || part.negated) continue;
    if (part.relation.startsWith('builtin:')) {
      try {
        const env = checkBuiltin(part, bindings);
        if (env) pending.push({ index: index + 1, bindings: env });
      } catch { /* Available evidence may leave builtin inputs unknown. */ }
    } else {
      for (const env of evidenceMatches(goalTerm(part, bindings), evidence, bindings)) pending.push({ index: index + 1, bindings: env });
    }
  }
}

function checkWellFounded(steps, fail) {
  const visiting = new Set();
  const visited = new Set();
  for (const start of steps.keys()) {
    if (visited.has(start)) continue;
    visiting.add(start);
    const stack = [{ id: start, uses: stepUses(steps.get(start)).map(canonical), index: 0 }];
    while (stack.length) {
      const top = stack[stack.length - 1];
      if (top.index === top.uses.length) {
        visiting.delete(top.id); visited.add(top.id); stack.pop(); continue;
      }
      const next = top.uses[top.index++];
      if (visiting.has(next)) { fail('C2', 'Cyclic derivation.', steps.get(next).goal); continue; }
      if (!steps.has(next) || visited.has(next)) continue;
      visiting.add(next);
      stack.push({ id: next, uses: stepUses(steps.get(next)).map(canonical), index: 0 });
    }
  }
}

export function checkReportTerms(report) {
  const lines = report.conditions.map(condition => line(compound('condition', [atom(condition.id), atom(condition.name),
    condition.failed ? compound('failed', [String(condition.failed)]) : atom('ok'), String(condition.covered)])));
  for (const failure of report.failures) lines.push(line(compound('failure', [atom(failure.condition),
    failure.term ? template(failure.term) : atom(failure.conclusion ?? 'proof_document'), atom(failure.detail)])));
  for (const boundary of report.trusted) lines.push(line(compound('obligation', [atom(boundary.kind), atom(boundary.reason),
    boundary.term ? template(boundary.term) : atom(boundary.conclusion)])));
  for (const [name, count] of [['steps', report.steps], ['verified', report.verified], ['recomputed', report.redecided],
    ['trusted', report.trusted.length], ['claims', report.claims]]) lines.push(`${name}(${count}).`);
  lines.push(line(compound('verdict', [report.valid ? atom(report.trusted.length ? 'checked_with_obligations' : 'checked')
    : compound('failed', [String(report.failures.length)])])));
  return lines.join('\n') + '\n';
}

export function render(program, facts, { arc = false } = {}) {
  let previous = null;
  let firstReason = null;
  const requests = new Set();
  const answers = program.questions.map((question, index) => {
    if (question.previous) {
      if (previous === null) return 'Ask a query first, then ask ?- why.';
      if (!previous.found.length) return 'There is no successful answer to explain.';
      requests.add(previous.question);
      firstReason ??= index;
      return null;
    }
    const found = facts.filter(record => match(question.goal, record.goal));
    previous = { question, found };
    if (question.why) {
      if (!found.length) return 'false.';
      requests.add(question);
      firstReason ??= index;
      return null;
    }
    if (!found.length) return 'false.';
    if (!question.names.length) return 'true.';
    return found.map(record => question.names.map((name, index) => `${name} = ${sayTerm(record.goal.terms[index])}`).join(', ') + '.').join('\n');
  });
  const checks = program.checks.map(assertion => `check passed: ${assertion.text}.`);
  if (requests.size) {
    const proof = renderProof(program, facts, [...requests]);
    const report = checkProof(program, proof);
    if (!report.valid) throw new Error(`Cannot certify this result: ${report.failures[0].detail}`);
    answers[firstReason] = proof.trimEnd();
    checks.push(checkReportTerms(report).trimEnd());
  }
  if (!arc) return [...answers.filter(answer => answer !== null), ...checks];
  const sections = [[], [], checks];
  program.questions.forEach((question, index) => {
    const answer = answers[index];
    if (answer === null) return;
    if (question.why) sections[1].push(index === firstReason ? answer : `% ${answer}`);
    else sections[0].push(`?- ${question.body.map(say).join(', ')}.\n${answer}`);
  });
  const empty = [
    'Add a query such as ?- mortal(Who).',
    'No explanation was requested. Add ?- why. after a query.',
    'No checks were requested.',
  ];
  return ['Answer', 'Reason', 'Check'].map((label, index) => `% ${label}\n${sections[index].join('\n\n') || empty[index]}`);
}

export function run(source, options) {
  const program = parse(source);
  const facts = infer(program, { validateChecks: true });
  return render(program, facts, options);
}
