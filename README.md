# Eyelit

*Small language. Clear reasoning.*

Eyelit is an experimental logic programming language and a standalone JavaScript
reference interpreter. It combines facts, rules, questions, structured terms,
and explanations in a fixed syntax. It draws on problems explored in EyeProlog,
Eyeling, and Eyeleng; it does not parse their languages or claim their conformance.

This first prototype has no runtime dependencies. It runs on Node.js 18 or newer.
The package is private while the language is being designed.

```text
parent(alice, bob).
parent(bob, carol).

ancestor(?x, ?y) if parent(?x, ?y).
ancestor(?x, ?z) if parent(?x, ?y), ancestor(?y, ?z).

ask ancestor(alice, ?who).
```

Variables start with `?`. A rule reads “the head holds if its body holds.”
Queries return distinct answers; recursive calls exchange answers through tables.
This also handles left recursion and cycles when the demanded computation is finite.

## Try it

From the Eyelit directory, without installing anything:

```sh
node bin/eyelit.js examples/ancestor.eye
node bin/eyelit.js examples/fibonacci.eye
node bin/eyelit.js examples/four-queens.eye
node bin/eyelit.js --proof examples/socrates.eye
npm test
```

The Fibonacci example returns the exact integer `354224848179261915075` for F(100).
The four-queens program searches and returns both solutions, using general rules
and a bounded range relation.

More CLI options:

```sh
node bin/eyelit.js --json examples/type-inference.eye
node bin/eyelit.js --check examples/policy.eye
node bin/eyelit.js --query 'ancestor(bob, ?who)' examples/ancestor.eye
node bin/eyelit.js --max-steps 100000 examples/shortest-path.eye
```

Default output is an Eyelit program, including `--proof` and `--check` output.
It can be saved as `.eye` and queried by another invocation. JSON remains an
explicit alternative with `--json`.

```sh
node bin/eyelit.js --proof examples/socrates.eye
node bin/eyelit.js examples/proof/socrates.eye examples/proof-audit.eye
node bin/eyelit.js examples/output/ancestor.eye --query 'answer(1, [binding("who", ?person)])'
```

The Socrates proof output is:

```text
query(1, at(3, 1), [call(mortal(socrates))], []).
result(1, complete, 1).
answer(1, []).
why(1, [], 3).
proof(1, human(socrates), rule(1, at(1, 1)), []).
proof(2, mortal(socrates), rule(2, at(2, 1)), [uses(1, human(socrates))]).
proof(3, solution([]), query, [uses(2, mortal(socrates))]).
```

`query` records a question as data; it does not execute an `ask` statement when
reloaded. `answer` records bindings, `result` distinguishes completion with no
answers, and `why` links an answer to a proof. Proof conclusions and premises
are structured terms that Eyelit rules can inspect directly.

Checked documents for every example live in [examples/output](examples/output)
and [examples/proof](examples/proof). Regenerate them after an intentional change
with `node tools/update-examples.js`, then review the diff and run `npm test`.

`--query` appends a question to embedded `ask` statements. Multiple source files
are concatenated in argument order. Use `-` as a filename to read standard input.
Locations currently refer to the combined source, not individual filenames.

Exit codes: `0` completed (including no answers), `1` syntax/validation/runtime
error, `2` incomplete evaluation due to a configured limit. Results are printed
only after all questions complete successfully.

## JavaScript

```js
import { run, format } from './index.js';

const result = run(`
  human(socrates).
  mortal(?x) if human(?x).
  ask mortal(?who).
`);

for (const answer of result.queries[0].answers) {
  console.log(format(answer.bindings.who)); // socrates
  console.log(answer.proof);               // index into the explanation graph
}
```

`run(source, options)` returns `{ status, queries, proofs, stats }` or throws.
Each answer contains tagged term values and a proof ID. Integers use JavaScript
`bigint`; CLI JSON writes their decimal value as a string under `kind: "bigint"`.
Variable IDs are opaque; equal IDs within an answer denote the same variable.
`format(term, variables?)` accepts an optional shared Map for displaying several
bindings with consistent residual variable names.

`formatResult(result, { proof: true })` serializes a completed run to `.eye`.
Omit the option for answers without derivations. `formatCheck(check(source))`
serializes a validation summary. See the [output format](docs/output.md) for the
record vocabulary and variable/identifier scope.

Options `maxSteps`, `maxTables`, and `maxAnswers` are positive integers. Defaults
are 1,000,000, 100,000, and 100,000, respectively, shared across all questions and
their nested evaluations. These are work counters, not time or memory guarantees.

`check(source)` checks syntax and predicate dependencies, including stratification.
Input modes, types, and arithmetic function names are currently checked at runtime.

## What is here

- Facts, rules, questions, lists with tails, and arbitrary-arity constructor terms.
- Unification with an occurs check, and variant-based answer tables.
- Exact integer and finite floating-point arithmetic; explicit `let` computation.
- Ground negation and distinct collection over completed lower dependencies.
- General finite search using `range`; list `length` and `sort` built-ins.
- Explanation graphs with rule locations and explicit built-in/negation steps.
- Fourteen runnable examples, including proof analysis written in Eyelit itself.
- Automated semantic, CLI, saved-output, and parse/print/parse closure checks.

See [the language specification](docs/language.md), [implementation design](docs/implementation.md),
[output format](docs/output.md), and [migration plan](docs/migration.md).

## Boundaries of this prototype

Constraint propagation, RDF parsing, N3 quoted formulas and generated rules,
existential witnesses, mutable databases, and source-language compatibility are
not implemented. The graph example uses RDF-shaped constructor values only.
Explanations record derivations; they are not independently verified proof certificates.

The interpreter favors a small, inspectable implementation. It replays dependent
clauses as answers arrive and has not been optimized for the 100,000-level taxonomy
examples. It is not yet a replacement for the three existing implementations.

Released under the [MIT License](LICENSE.md).
