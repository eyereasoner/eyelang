# EyeProlog source architecture

The runtime is intentionally layered so semantic modules do not depend back on
higher-level frontends.

## Layers

1. **Kernel representation and syntax** — `term.js`, `number-value.js`,
   `syntax-scan.js`, `parser.js`, `write.js`, `errors.js`.
2. **Program preparation** — `program.js` plus `program-analysis.js` and
   `program-indexing.js`. Static recursion/Datalog/WFS classification lives in
   `program-analysis.js`; compact clauses and candidate indexes live in
   `program-indexing.js`.
3. **Execution** — `solver.js`, `cleanup.js`, `io.js`, `datalog.js`, `wfs.js`,
   `clpz.js`. `cleanup.js` owns lifecycle-aware disposal of protected builtin
   iterators and registers the normal-profile cleanup controls without making
   `solver.js` depend back on the language registry.
4. **Language services** — `iso.js`, `iso-arithmetic.js`, `dcg.js`,
   `standard-library.js`, and `src/lib/`.
5. **Frontends/tools** — `execute.js`, `repl.js`, `cli.js`, `quads.js`,
   `explain.js`, and the playground worker.

`iso.js` and `program.js` remain facade modules for their existing exports, so
this refactor does not change the public JavaScript API.

## Dependency rule

Dependencies should point down or sideways within a layer, never back from a
kernel component into the ISO registry or a frontend.  In particular,
`errors.js` owns `PrologError` and `HaltSignal`; DCG expansion can therefore
report processor errors without importing `iso.js` and creating an
`iso.js <-> dcg.js` cycle.

The JavaScript runtime stays flat directly under `src/`; the existing `src/lib/`
contains Prolog library sources rather than JavaScript runtime modules. The architecture
test rejects JavaScript import cycles under `src/`. Cleanup lifecycle hooks are
installed from the public API and CLI entry paths; `standard-library.js` only
registers the predicates, so the execution layer remains acyclic.

## Performance rule

Architecture changes must not add runtime strategy objects, callbacks, or
extra dispatch in solver hot paths.  Existing scalar/indexed solver paths stay
as direct function calls.  Candidate indexing is separated physically but
retains the same data structures and selection functions.

Large solver fast paths deliberately remain co-located in `solver.js` until a
split can demonstrate benchmark parity.  A cleaner file layout is not worth a
runtime regression.
