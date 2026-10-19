# Tests

Run `npm test` for the full suite. The top-level files group tests by what
they verify:

| File | Coverage |
| --- | --- |
| `examples.test.js` | All bundled examples: complete ARC goldens, independent correctness and supporting-evidence checks, proof certificates, and golden update tooling. |
| `language.test.js` | Parser and engine behavior regressions. |
| `proof.test.js` | Proof certificate checking, tampering, trust obligations, and the proof-checking CLI. |
| `playground.test.js` | Local server, example selector, highlighting, editor state, sharing, and error selection. |
| `documentation.test.js` | Runnable documentation, Pages staging, navigation, and paths. |
| `release.test.js` | Package installation, CLI packaging, and version synchronization. |
| `benchmark.test.js` | Benchmark runner and output reporting. |

The [conformance suite](conformance/README.md) groups specification checks by
language feature. Run it with `npm run test:conformance`.

To focus on one area, pass its file to Node.js, for example:

```sh
node --test test/examples.test.js
node --test test/playground.test.js
```

Ordinary tests only read the bundled example goldens in `examples/output/`.
Tests of the golden update tooling use temporary fixtures. After an intentional
example output change, run `npm run examples:update` and review the diff.
