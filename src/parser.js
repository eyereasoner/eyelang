// Tokenizer and recursive-descent parser for the eyelang source language.
// It preserves the compact Prolog-like syntax while producing Term objects for the solver.
import { atom, compound, cons, emptyList, numberTerm, stringTerm, variable } from './term.js';

const TOK = {
  EOF: 'eof', ATOM: 'atom', VAR: 'var', STRING: 'string', NUMBER: 'number',
  LPAREN: '(', RPAREN: ')', LBRACKET: '[', RBRACKET: ']', COMMA: ',', BAR: '|', DOT: '.', IF: ':-'
};

function isWhitespaceCode(code) {
  return code === 32 || code === 9 || code === 10 || code === 13 || code === 12 || code === 11;
}

function isDigitCode(code) {
  return code >= 48 && code <= 57;
}

function isVariableStart(text) {
  const code = text.charCodeAt(0);
  return code === 95 || (code >= 65 && code <= 90);
}

function isAtomCharCode(code) {
  // Stop at whitespace and the punctuation tokens that have syntactic meaning.
  return code > 0 &&
    !isWhitespaceCode(code) &&
    code !== 40 && code !== 41 && code !== 91 && code !== 93 &&
    code !== 44 && code !== 124 && code !== 46 &&
    code !== 39 && code !== 34 && code !== 58;
}

class Parser {
  constructor(source, options = {}) {
    this.source = String(source ?? '');
    this.filename = options.filename ?? '<input>';
    this.pos = 0;
    this.line = 1;
    this.anonymous = 0;
    this.token = this.nextToken();
  }
  peek(offset = 0) {
    return this.source[this.pos + offset] ?? '';
  }
  take() {
    const ch = this.peek();
    if (ch) {
      this.pos++;
      if (ch === '\n') this.line++;
    }
    return ch;
  }
  skipWhitespaceAndComments() {
    const source = this.source;
    const len = source.length;
    while (true) {
      while (this.pos < len) {
        const code = source.charCodeAt(this.pos);
        if (!isWhitespaceCode(code)) break;
        if (code === 10) this.line++;
        this.pos++;
      }
      if (source.charCodeAt(this.pos) === 37) { // % line comment
        while (this.pos < len && source.charCodeAt(this.pos) !== 10) this.pos++;
        continue;
      }
      break;
    }
  }
  nextToken() {
    // The tokenizer keeps just enough state for useful parse-line errors and
    // treats quoted atoms and quoted strings differently, as Prolog syntax does.
    this.skipWhitespaceAndComments();
    const line = this.line;
    const ch = this.peek();
    if (!ch) return { type: TOK.EOF, text: '', line };

    const punct = { '(': TOK.LPAREN, ')': TOK.RPAREN, '[': TOK.LBRACKET, ']': TOK.RBRACKET, ',': TOK.COMMA, '|': TOK.BAR, '.': TOK.DOT };
    if (punct[ch]) {
      this.take();
      return { type: punct[ch], text: ch, line };
    }
    if (ch === ':' && this.peek(1) === '-') {
      this.pos += 2;
      return { type: TOK.IF, text: ':-', line };
    }
    if (ch === ':') throw new Error('colon names are not supported; use name or prefix_name');

    if (ch === '"' || ch === "'") {
      const quote = this.take();
      let text = '';
      while (true) {
        if (!this.peek()) throw new Error(`parse line ${line}: unterminated quoted term`);
        let value = this.take();
        if (value === quote) {
          if (this.peek() === quote) {
            this.take();
            value = quote;
          } else {
            break;
          }
        } else if (value === '\\' && this.peek()) {
          const escaped = this.take();
          if (escaped === 'n') value = '\n';
          else if (escaped === 't') value = '\t';
          else value = escaped;
        }
        text += value;
      }
      return { type: quote === '"' ? TOK.STRING : TOK.ATOM, text, line };
    }

    if (isDigitCode(ch.charCodeAt(0)) || (ch === '-' && isDigitCode(this.peek(1).charCodeAt(0)))) {
      const start = this.pos;
      if (this.peek() === '-') this.take();
      while (isDigitCode(this.peek().charCodeAt(0))) this.take();
      if (this.peek() === '.' && isDigitCode(this.peek(1).charCodeAt(0))) {
        this.take();
        while (isDigitCode(this.peek().charCodeAt(0))) this.take();
      }
      if ((this.peek() === 'e' || this.peek() === 'E')) {
        let idx = this.pos + 1;
        if (this.source[idx] === '+' || this.source[idx] === '-') idx++;
        if (isDigitCode((this.source[idx] ?? '').charCodeAt(0))) {
          this.take();
          if (this.peek() === '+' || this.peek() === '-') this.take();
          while (isDigitCode(this.peek().charCodeAt(0))) this.take();
        }
      }
      return { type: TOK.NUMBER, text: this.source.slice(start, this.pos), line };
    }

    const start = this.pos;
    while (this.pos < this.source.length && isAtomCharCode(this.source.charCodeAt(this.pos))) this.pos++;
    if (this.pos === start) throw new Error(`parse line ${line}: bad character ${JSON.stringify(ch)}`);
    let text = this.source.slice(start, this.pos);
    let type = isVariableStart(text) ? TOK.VAR : TOK.ATOM;
    if (type === TOK.VAR && text === '_') text = `__anon${this.anonymous++}`;
    return { type, text, line };
  }
  advance() {
    this.token = this.nextToken();
  }
  expect(type, desc = type) {
    if (this.token.type !== type) throw new Error(`parse line ${this.token.line}: expected ${desc}, got ${this.token.text}`);
  }
  parseParenthesizedTerm() {
    // Parenthesized comma terms are represented as right-associated ','/2
    // compounds, which lets the solver flatten conjunctions uniformly.
    this.expect(TOK.LPAREN, '(');
    this.advance();
    const items = [];
    while (true) {
      items.push(this.parseTerm());
      if (this.token.type === TOK.COMMA) {
        this.advance();
        continue;
      }
      break;
    }
    this.expect(TOK.RPAREN, ')');
    this.advance();
    let term = items[items.length - 1];
    for (let i = items.length - 2; i >= 0; i--) term = compound(',', [items[i], term]);
    return term;
  }
  parseList() {
    // Lists are lowered to './2' cons cells and [] so list predicates can work
    // on a single canonical representation.
    this.expect(TOK.LBRACKET, '[');
    this.advance();
    if (this.token.type === TOK.RBRACKET) {
      this.advance();
      return emptyList();
    }
    const items = [];
    let tail = null;
    while (true) {
      items.push(this.parseTerm());
      if (this.token.type === TOK.COMMA) {
        this.advance();
        continue;
      }
      if (this.token.type === TOK.BAR) {
        this.advance();
        tail = this.parseTerm();
        this.expect(TOK.RBRACKET, ']');
        this.advance();
        break;
      }
      this.expect(TOK.RBRACKET, ']');
      this.advance();
      tail = emptyList();
      break;
    }
    for (let i = items.length - 1; i >= 0; i--) tail = cons(items[i], tail);
    return tail;
  }
  parseTerm() {
    if (this.token.type === TOK.LPAREN) return this.parseParenthesizedTerm();
    if (this.token.type === TOK.LBRACKET) return this.parseList();
    if (this.token.type === TOK.VAR) {
      const name = this.token.text;
      this.advance();
      return variable(name);
    }
    if (this.token.type === TOK.STRING) {
      const value = this.token.text;
      this.advance();
      return stringTerm(value);
    }
    if (this.token.type === TOK.NUMBER) {
      const value = this.token.text;
      this.advance();
      return numberTerm(value);
    }
    if (this.token.type === TOK.ATOM) {
      const name = this.token.text;
      this.advance();
      if (this.token.type === TOK.LPAREN) {
        this.advance();
        const args = [];
        if (this.token.type !== TOK.RPAREN) {
          while (true) {
            args.push(this.parseTerm());
            if (this.token.type === TOK.COMMA) {
              this.advance();
              continue;
            }
            break;
          }
        }
        this.expect(TOK.RPAREN, ')');
        this.advance();
        return compound(name, args);
      }
      return atom(name);
    }
    throw new Error(`parse line ${this.token.line}: bad term`);
  }
  parseProgram() {
    const clauses = [];
    while (this.token.type !== TOK.EOF) {
      const line = this.token.line;
      const head = this.parseTerm();
      const body = [];
      if (this.token.type === TOK.IF) {
        this.advance();
        while (true) {
          body.push(this.parseTerm());
          if (this.token.type === TOK.COMMA) {
            this.advance();
            continue;
          }
          break;
        }
      }
      this.expect(TOK.DOT, '.');
      this.advance();
      clauses.push({ head, body, source: { filename: this.filename, line, clause: clauses.length + 1 } });
    }
    return clauses;
  }
}

export function parseClauses(source, options = {}) {
  return new Parser(source, options).parseProgram();
}

export function parseProgramText(source) {
  return parseClauses(source);
}

export function parseQueryGoal(query) {
  const clauses = parseClauses(`q(${query}).`);
  const head = clauses[0]?.head;
  if (!head || head.args.length < 1) throw new Error('bad query');
  return head.args[0];
}
