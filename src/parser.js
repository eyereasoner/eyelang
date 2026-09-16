import { variable, atom, struct, scalar, nil, cons, ground, variablesIn } from './terms.js';

export class SyntaxError extends Error {
  constructor(message, token) {
    super(`${message} at ${token.line}:${token.column}`);
    this.name = 'EyelitSyntaxError';
  }
}

function tokenize(source) {
  const tokens = [];
  let offset = 0, line = 1, column = 1;
  while (offset < source.length) {
    const rest = source.slice(offset);
    const skipped = /^(?:\s+|#[^\n]*)/.exec(rest);
    const match = skipped || /^(?:"(?:[^"\\\r\n]|\\.)*"|\?[A-Za-z_][A-Za-z_0-9]*|[A-Za-z_][A-Za-z_0-9]*|\d+(?:\.\d+)?(?:[eE][+-]?\d+)?|!=|<=|>=|\/\/|[()\[\]{},.|=+*\/%<>-])/.exec(rest);
    if (!match) throw new SyntaxError(`Unexpected character ${JSON.stringify(rest[0])}`, { line, column });
    const text = match[0];
    if (!skipped) tokens.push({ text, line, column });
    for (const char of text) {
      if (char === '\n') { line++; column = 1; } else column++;
    }
    offset += text.length;
  }
  tokens.push({ text: '<eof>', line, column });
  return tokens;
}

const precedence = { '+': 10, '-': 10, '*': 20, '/': 20, '//': 20, '%': 20 };
export function parse(source) {
  const tokens = tokenize(source);
  let position = 0, scope = new Map();
  const peek = () => tokens[position];
  const take = () => tokens[position++];
  const accept = value => peek().text === value ? (take(), true) : false;
  function expect(value) {
    if (!accept(value)) throw new SyntaxError(`Expected ${JSON.stringify(value)}, got ${JSON.stringify(peek().text)}`, peek());
  }
  function term() {
    const token = take(), text = token.text;
    if (text.startsWith('?')) {
      if (text === '?_') return variable('_');
      if (!scope.has(text)) scope.set(text, variable(text.slice(1)));
      return scope.get(text);
    }
    if (text.startsWith('"')) {
      try { return scalar(JSON.parse(text)); } catch { throw new SyntaxError('Invalid string escape', token); }
    }
    if (/^\d/.test(text)) return scalar(/[.eE]/.test(text) ? finite(Number(text), token) : BigInt(text));
    if (text === '-') {
      const number = term();
      if (number.kind !== 'number' && number.kind !== 'bigint') throw new SyntaxError('Expected a number after minus in a term', token);
      return scalar(-number.value);
    }
    if (text === '[') {
      if (accept(']')) return nil;
      const items = [term()];
      while (accept(',')) items.push(term());
      const tail = accept('|') ? term() : nil;
      expect(']');
      return items.reduceRight((rest, item) => cons(item, rest), tail);
    }
    if (/^[A-Za-z_][A-Za-z_0-9]*$/.test(text)) {
      if (text === 'true' || text === 'false') return scalar(text === 'true');
      if (!accept('(')) return atom(text);
      const args = [];
      if (!accept(')')) {
        args.push(term());
        while (accept(',')) args.push(term());
        expect(')');
      }
      return struct(text, args);
    }
    throw new SyntaxError('Expected a value or variable', token);
  }
  function expression(min = 0) {
    let left;
    if (accept('-')) left = { type: 'unary', arg: expression(30) };
    else if (accept('(')) { left = expression(); expect(')'); }
    else if (/^[A-Za-z_]/.test(peek().text) && tokens[position + 1].text === '(') {
      const name = take().text;
      expect('(');
      const args = [];
      if (!accept(')')) {
        args.push(expression());
        while (accept(',')) args.push(expression());
        expect(')');
      }
      left = { type: 'function', name, args };
    } else left = { type: 'value', term: term() };
    while (precedence[peek().text] !== undefined && precedence[peek().text] >= min) {
      const op = take().text;
      left = { type: 'binary', op, left, right: expression(precedence[op] + 1) };
    }
    return left;
  }
  function goal() {
    if (accept('not')) return { type: 'not', term: callable(term()) };
    if (accept('let')) {
      const target = term();
      expect('=');
      return { type: 'let', target, expression: expression() };
    }
    if (accept('collect')) {
      const target = term();
      expect('=');
      const template = term();
      expect('where'); expect('{');
      const body = goals('}');
      expect('}');
      return { type: 'collect', target, template, body };
    }
    const left = term();
    if (['=', '!=', '<', '>', '<=', '>='].includes(peek().text)) {
      return { type: 'compare', op: take().text, left, right: term() };
    }
    return { type: 'call', term: callable(left) };
  }
  function callable(value) {
    if (value.kind === 'atom') return struct(value.name, []);
    if (value.kind !== 'struct' || ['cons', 'nil'].includes(value.name)) throw new SyntaxError('Expected a relation call', peek());
    return value;
  }
  function goals(end) {
    if (peek().text === end) return [];
    const body = [goal()];
    while (accept(',')) body.push(goal());
    return body;
  }
  const rules = [], queries = [];
  while (peek().text !== '<eof>') {
    scope = new Map();
    const location = { line: peek().line, column: peek().column };
    if (accept('ask')) {
      const body = goals('.');
      queries.push({ body, variables: queryVariables(body), location });
    } else {
      const head = callable(term());
      const body = accept('if') ? goals('.') : [];
      // Non-ground unit clauses are useful relational definitions, e.g. append([], ?ys, ?ys).
      rules.push({ id: rules.length + 1, head, body, location, fact: body.length === 0 && ground(head) });
    }
    expect('.');
  }
  return { rules, queries };
}

function finite(number, token) {
  if (!Number.isFinite(number)) throw new SyntaxError('Number must be finite', token);
  return number;
}

export function queryVariables(body) {
  const variables = new Map();
  function expr(value) {
    if (value.type === 'value') variablesIn(value.term, variables);
    if (value.arg) expr(value.arg);
    if (value.left) { expr(value.left); expr(value.right); }
    if (value.args) value.args.forEach(expr);
  }
  for (const goal of body) {
    if (goal.type === 'call' || goal.type === 'not') variablesIn(goal.term, variables);
    if (goal.type === 'compare') { variablesIn(goal.left, variables); variablesIn(goal.right, variables); }
    if (goal.target) variablesIn(goal.target, variables);
    if (goal.expression) expr(goal.expression);
    // Collection-local variables do not escape into query results.
  }
  return [...variables.values()];
}
