import test from 'node:test';
import assert from 'node:assert/strict';
import { parseNQuads, formatNQuads, nquadsToEyelang, parse } from '../index.js';

const document = `VERSION "1.2"
<https://example/s> <https://example/plain> "text" .
<https://example/s> <https://example/typed> "42"^^<http://www.w3.org/2001/XMLSchema#integer> .
<https://example/s> <https://example/label> "Bonjour"@FR .
<https://example/s> <https://example/title> "HTML و CSS"@ar--RTL <https://example/g> .
_:claim <https://example/reifies> <<( <https://example/s> <https://example/p> "nested" )>> <https://example/g> .
`;

test('RDF 1.2 N-Quads maps losslessly to ground rdf/4 terms', () => {
  const quads = parseNQuads(document, { blankNodePrefix: 'input_' });
  assert.equal(quads.length, 5);
  assert.equal(quads[0].name, 'rdf');
  assert.match(nquadsToEyelang(document), /literal\("text", datatype\(iri\("http:\/\/www\.w3\.org\/2001\/XMLSchema#string"\)\)\)/);
  assert.match(nquadsToEyelang(document), /language\("fr"\)/);
  assert.match(nquadsToEyelang(document), /language\("ar", rtl\)/);
  assert.match(nquadsToEyelang(document, { blankNodePrefix: 'input_' }), /blank\("input_claim"\)/);
  assert.doesNotThrow(() => parse(nquadsToEyelang(document)));
  assert.equal(parseNQuads('_:élève <https://example/p> _:node·part .').length, 1);
});

test('N-Quads serialization is deterministic and round-trips RDF 1.2 terms', () => {
  const serialized = formatNQuads(parseNQuads(document));
  assert.match(serialized, /^VERSION "1\.2"\n/);
  assert.match(serialized, /"Bonjour"@fr/);
  assert.match(serialized, /"HTML و CSS"@ar--rtl/);
  assert.match(serialized, /<<\( <https:\/\/example\/s> <https:\/\/example\/p> "nested" \)>>/);
  assert.equal(formatNQuads(parseNQuads(serialized)), serialized);
});

test('N-Quads rejects invalid RDF positions and version declarations', () => {
  assert.throws(() => parseNQuads('_:s _:predicate <https://example/o> .'), /predicate IRI/);
  assert.throws(() => parseNQuads('_:-bad <https://example/p> <https://example/o> .'), /blank node label/);
  assert.throws(() => parseNQuads('VERSION "1.1"'), /Only RDF version 1\.2/);
  assert.throws(() => parseNQuads('<https://example/s> <https://example/p> "x"@en--sideways .'), /language tag/);
  const invalidOutput = parse('rdf(iri("https://example/s"), blank("p"), iri("https://example/o"), default_graph).').rules[0].head;
  assert.throws(() => formatNQuads([invalidOutput]), /Invalid RDF predicate term/);
});
