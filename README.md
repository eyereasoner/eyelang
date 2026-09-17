# Eyelang

*Small language. Clear reasoning.*

Eyelang is an experimental logic programming language with a standalone
JavaScript reference interpreter. It supports facts, rules, questions,
structured terms, finite search, stratified negation, collection, and
explanations.

```eye
parent(alice, bob).
parent(bob, carol).

ancestor(?x, ?y) if parent(?x, ?y).
ancestor(?x, ?z) if parent(?x, ?y), ancestor(?y, ?z).

ask ancestor(alice, ?who).
```

## Start here

Eyelang requires Node.js 18 or newer and has no runtime dependencies.

```sh
node bin/eyelang.js examples/ancestor.eye
node bin/eyelang.js --proof examples/socrates.eye
node bin/eyelang.js --rdf-input examples/rdf12-interoperability.nq examples/rdf12-interoperability.eye
npm test
```

- [User manual](docs/manual.md): tutorial, CLI, built-ins, proofs, API, and examples.
- [Language specification](docs/specification.md): normative grammar, semantics,
  validation, and result vocabulary.
- [Example guide](examples/README.md): executable programs and their verification.

## Repository

- `bin/eyelang.js` — command-line interface
- `src/` — parser, analyzer, evaluator, terms, built-ins, and output writer
- `examples/` — native Eyelang programs plus checked answer and proof documents
- `test/` — semantic, closure, API, and CLI tests
- `index.js` — public JavaScript API
