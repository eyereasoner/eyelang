import { atom, struct, scalar, format, ground, termKey } from './terms.js';

const XSD_STRING = 'http://www.w3.org/2001/XMLSchema#string';
const node = (name, ...args) => struct(name, args);

class Reader {
  constructor(source, blankNodePrefix = '') {
    this.source = source;
    this.blankNodePrefix = blankNodePrefix;
    this.offset = 0;
    this.line = 1;
    this.column = 1;
  }

  error(message) {
    throw new SyntaxError(`${message} at ${this.line}:${this.column}`);
  }

  starts(text) { return this.source.startsWith(text, this.offset); }
  peek() { return this.source[this.offset]; }

  take() {
    const char = this.source[this.offset++];
    if (char === '\n') { this.line++; this.column = 1; } else this.column++;
    return char;
  }

  expect(text) {
    if (!this.starts(text)) this.error(`Expected ${JSON.stringify(text)}`);
    for (let i = 0; i < text.length; i++) this.take();
  }

  skip() {
    while (this.offset < this.source.length) {
      if (/\s/u.test(this.peek())) { this.take(); continue; }
      if (this.peek() === '#') {
        while (this.offset < this.source.length && this.peek() !== '\n' && this.peek() !== '\r') this.take();
        continue;
      }
      break;
    }
  }

  uchar() {
    const marker = this.take();
    const size = marker === 'u' ? 4 : marker === 'U' ? 8 : 0;
    if (!size) this.error('Expected Unicode escape');
    let digits = '';
    for (let i = 0; i < size; i++) digits += this.take() || '';
    if (!new RegExp(`^[0-9A-Fa-f]{${size}}$`).test(digits)) this.error('Invalid Unicode escape');
    const value = Number.parseInt(digits, 16);
    if (value > 0x10ffff || (value >= 0xd800 && value <= 0xdfff)) this.error('Invalid Unicode scalar value');
    return String.fromCodePoint(value);
  }

  iri() {
    this.expect('<');
    let value = '';
    while (this.offset < this.source.length && this.peek() !== '>') {
      const char = this.take();
      if (char === '\\') value += this.uchar();
      else {
        if (char.codePointAt(0) <= 0x20 || /[<>"{}|^`]/u.test(char)) this.error('Invalid character in IRI');
        value += char;
      }
    }
    this.expect('>');
    return node('iri', scalar(value));
  }

  blank() {
    this.expect('_:');
    let label = '';
    while (this.offset < this.source.length) {
      const char = this.peek();
      if (/\s/u.test(char) || char === '#') break;
      if (char === '.' && (this.offset + 1 === this.source.length || /\s/u.test(this.source[this.offset + 1]) || this.source[this.offset + 1] === '#')) break;
      if (!/[\p{L}\p{N}\p{M}_.\-\u00b7\u203f\u2040]/u.test(char)) break;
      label += this.take();
    }
    const scoped = `${this.blankNodePrefix}${label}`;
    if (!validBlank(scoped)) this.error('Invalid blank node label');
    return node('blank', scalar(scoped));
  }

  string() {
    this.expect('"');
    let value = '';
    const escapes = { t: '\t', b: '\b', n: '\n', r: '\r', f: '\f', '"': '"', "'": "'", '\\': '\\' };
    while (this.offset < this.source.length && this.peek() !== '"') {
      const char = this.take();
      if (char === '\n' || char === '\r' || char.codePointAt(0) < 0x20) this.error('Invalid character in literal');
      if (char !== '\\') value += char;
      else {
        const escaped = this.peek();
        if (escaped === 'u' || escaped === 'U') value += this.uchar();
        else if (Object.hasOwn(escapes, escaped)) { this.take(); value += escapes[escaped]; }
        else this.error('Invalid literal escape');
      }
    }
    this.expect('"');
    return value;
  }

  literal() {
    const lexical = scalar(this.string());
    if (this.starts('^^')) {
      this.expect('^^');
      return node('literal', lexical, node('datatype', this.iri()));
    }
    if (this.peek() === '@') {
      this.take();
      let tag = '';
      while (this.offset < this.source.length && /[A-Za-z0-9-]/.test(this.peek())) tag += this.take();
      const directional = /^(.*)--(ltr|rtl)$/i.exec(tag);
      if (directional) {
        const language = directional[1].toLowerCase(), direction = directional[2].toLowerCase();
        if (!validLanguage(language)) this.error('Invalid language tag');
        return node('literal', lexical, node('language', scalar(language), atom(direction)));
      }
      tag = tag.toLowerCase();
      if (!validLanguage(tag)) this.error('Invalid language tag');
      return node('literal', lexical, node('language', scalar(tag)));
    }
    return node('literal', lexical, node('datatype', node('iri', scalar(XSD_STRING))));
  }

  tripleTerm() {
    this.expect('<<('); this.skip();
    const subject = this.term('subject'); this.skip();
    const predicate = this.term('predicate'); this.skip();
    const object = this.term('object'); this.skip();
    this.expect(')>>');
    return node('triple', subject, predicate, object);
  }

  term(position) {
    if (position === 'object' && this.starts('<<(')) return this.tripleTerm();
    if (position === 'predicate') {
      if (this.starts('<')) return this.iri();
      this.error('Expected RDF predicate IRI');
    }
    if (this.starts('<')) return this.iri();
    if (this.starts('_:')) return this.blank();
    if (position === 'object' && this.starts('"')) return this.literal();
    this.error(`Expected RDF ${position}`);
  }

  version() {
    this.expect('VERSION');
    if (!/\s/u.test(this.peek() || '')) this.error('Expected whitespace after VERSION');
    this.skip();
    if (this.string() !== '1.2') this.error('Only RDF version 1.2 is supported');
    while (this.offset < this.source.length && this.peek() !== '\n' && this.peek() !== '\r') {
      if (!/\s/u.test(this.peek()) && this.peek() !== '#') this.error('Unexpected text after VERSION directive');
      if (this.peek() === '#') break;
      this.take();
    }
  }

  quad() {
    const subject = this.term('subject'); this.skip();
    const predicate = this.term('predicate'); this.skip();
    const object = this.term('object'); this.skip();
    const graph = this.peek() === '.' ? atom('default_graph') : this.term('graph');
    this.skip(); this.expect('.');
    return node('rdf', subject, predicate, object, graph);
  }

  document() {
    const quads = [];
    this.skip();
    while (this.offset < this.source.length) {
      if (this.starts('VERSION') && !/[A-Za-z0-9_]/.test(this.source[this.offset + 7] || '')) this.version();
      else quads.push(this.quad());
      this.skip();
    }
    return [...new Map(quads.map(quad => [termKey(quad), quad])).values()];
  }
}

const validLanguage = value => /^[A-Za-z]+(?:-[A-Za-z0-9]+)*$/.test(value);
const validBlank = value => /^[\p{L}\p{N}_](?:[\p{L}\p{N}\p{M}_.\-\u00b7\u203f\u2040]*[\p{L}\p{N}\p{M}_\-\u00b7\u203f\u2040])?$/u.test(value);

export function parseNQuads(source, options = {}) {
  return new Reader(source, options.blankNodePrefix || '').document();
}

export function nquadsToEyelang(source, options = {}) {
  const facts = parseNQuads(source, options).map(quad => `${format(quad)}.`);
  return `${facts.join('\n')}${facts.length ? '\n' : ''}`;
}

function stringEscape(value) {
  let output = '"';
  for (const char of value) {
    const escapes = { '\t': '\\t', '\b': '\\b', '\n': '\\n', '\r': '\\r', '\f': '\\f', '"': '\\"', '\\': '\\\\' };
    if (Object.hasOwn(escapes, char)) output += escapes[char];
    else if (char.codePointAt(0) < 0x20) output += `\\u${char.codePointAt(0).toString(16).padStart(4, '0')}`;
    else output += char;
  }
  return `${output}"`;
}

function iriEscape(value) {
  let output = '';
  for (const char of value) {
    const code = char.codePointAt(0);
    if (code <= 0x20 || /[<>"{}|^`\\]/u.test(char)) {
      output += code <= 0xffff ? `\\u${code.toString(16).padStart(4, '0')}` : `\\U${code.toString(16).padStart(8, '0')}`;
    } else output += char;
  }
  return `<${output}>`;
}

function rdfTerm(term, position) {
  if (!ground(term)) throw new Error('RDF output terms must be ground');
  if (term.kind === 'struct' && term.name === 'iri' && term.args.length === 1 && term.args[0].kind === 'string') {
    return iriEscape(term.args[0].value);
  }
  if (position !== 'predicate' && term.kind === 'struct' && term.name === 'blank' && term.args.length === 1 && term.args[0].kind === 'string') {
    const label = term.args[0].value;
    if (!validBlank(label)) throw new Error(`Invalid RDF blank node label ${JSON.stringify(label)}`);
    return `_:${label}`;
  }
  if (position === 'object' && term.kind === 'struct' && term.name === 'literal' && term.args.length === 2 && term.args[0].kind === 'string') {
    const [lexical, descriptor] = term.args;
    const text = stringEscape(lexical.value);
    if (descriptor.kind !== 'struct') throw new Error('Invalid RDF literal descriptor');
    if (descriptor.name === 'datatype' && descriptor.args.length === 1) {
      const datatype = descriptor.args[0];
      if (datatype.kind !== 'struct' || datatype.name !== 'iri' || datatype.args.length !== 1 || datatype.args[0].kind !== 'string') {
        throw new Error('Invalid RDF literal datatype');
      }
      return datatype.args[0].value === XSD_STRING ? text : `${text}^^${rdfTerm(datatype, 'predicate')}`;
    }
    if (descriptor.name === 'language' && [1, 2].includes(descriptor.args.length) && descriptor.args[0].kind === 'string') {
      const language = descriptor.args[0].value.toLowerCase();
      if (!validLanguage(language)) throw new Error(`Invalid RDF language tag ${JSON.stringify(language)}`);
      if (descriptor.args.length === 1) return `${text}@${language}`;
      const direction = descriptor.args[1];
      if (direction.kind !== 'atom' || !['ltr', 'rtl'].includes(direction.name)) throw new Error('Invalid RDF base direction');
      return `${text}@${language}--${direction.name}`;
    }
    throw new Error('Invalid RDF literal descriptor');
  }
  if (position === 'object' && term.kind === 'struct' && term.name === 'triple' && term.args.length === 3) {
    return `<<( ${rdfTerm(term.args[0], 'subject')} ${rdfTerm(term.args[1], 'predicate')} ${rdfTerm(term.args[2], 'object')} )>>`;
  }
  throw new Error(`Invalid RDF ${position} term ${format(term)}`);
}

export function formatNQuads(quads) {
  const lines = quads.map(quad => {
    if (!ground(quad) || quad.kind !== 'struct' || quad.name !== 'rdf' || quad.args.length !== 4) {
      throw new Error(`Expected a ground rdf/4 term; got ${format(quad)}`);
    }
    const [subject, predicate, object, graph] = quad.args;
    const graphText = graph.kind === 'atom' && graph.name === 'default_graph' ? '' : ` ${rdfTerm(graph, 'graph')}`;
    return `${rdfTerm(subject, 'subject')} ${rdfTerm(predicate, 'predicate')} ${rdfTerm(object, 'object')}${graphText} .`;
  });
  const body = [...new Set(lines)].sort().join('\n');
  return lines.length ? `VERSION "1.2"\n${body}\n` : '';
}

export function rdfAnswersToNQuads(query) {
  return formatNQuads(query.answers.map(answer => node('rdf',
    answer.bindings.subject, answer.bindings.predicate, answer.bindings.object, answer.bindings.graph)));
}
