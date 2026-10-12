# eyelang

[Repository](https://github.com/eyereasoner/eyelang) ·
[Playground](https://eyereasoner.github.io/eyelang/playground) ·
[Language specification](https://eyereasoner.github.io/eyelang/SPEC)

A small, experimental logic programming language, written so kids can read it.
Tell it facts and rules. Ask a question. See why the answer follows, and check it.

## Hello, Socrates

```text
socrates is a human.
human implies mortal.

if first is a second and second implies third then first is a third.

# Answer
who is a mortal?
# Reason
why?
# Check
check that socrates is a mortal.
check that there is 1 mortal.
```

Run it with Node.js 18 or later. No packages to install:

```sh
node eyelang.js examples/socrates.eye
```

The answer is `socrates is a mortal.`. The explanation shows the rule and its
two clues. The checks confirm the answer and that there is exactly one mortal.
This is [ARC: Answer, Reason, Check](https://josd.github.io/arc/).
Output is grouped under `# Answer`, `# Reason`, and `# Check`.

## Playground

Open [the playground](https://eyereasoner.github.io/eyelang/playground), choose an example,
and press **Run program** (or Ctrl/⌘ + Enter). **Stop** cancels a long run.
You can open `.eye` files or URLs, save programs and full output, and share a
program as a link. Your draft is saved on this device when storage is available.
Unchanged examples get short links such as `#example=socrates`; edited programs
are included in the link. **Create Gist share** shares a program through GitHub
with an optional token, or helps you create a Gist on GitHub's website. Programs
too large for an inline link also offer Gist sharing.
Large output has a labeled preview; copying or saving preserves the complete result.
For local use, run `node src/playground-server.js` and open
http://127.0.0.1:8000/playground.html.

## The essentials

- Facts end with `.`; questions end with `?`. Notes start with `#`.
- Names are single words: `socrates`, `red-fox`. Capitalization does not matter.
  Double quotes preserve text: `"Classic Tea Biscuits"`.
- `if clues then answer.` follows facts forward. `answer if clues.` works
  backwards from a question, remembering answers so recursive rules can reuse them.
  Join clues with `and`. Placeholders keep the same value within one rule:
  `first` through `sixteenth`.
- Ask `who is a mortal?`, `is socrates a mortal?`, or `what does milo like?`.
  Follow a question with `why?` to explain all its answers.
- Properties look like `the score of milo is 7.`. Lists look like `[1, 0, 1]`.
- Calculations include `plus`, `minus`, `times`, `divided by`, and powers.
  Whole-number arithmetic is exact; real functions use approximate arithmetic.
- `not` means there is no matching evidence in the completed program.
  An ordinary unanswered question says “I don't know.”
- `check that … .` tests an expectation. A failed check stops the run with a
  line number and a failing exit status. Update expectations when you change inputs.

These are fixed sentence shapes. The complete syntax and meaning are in
[SPEC.md](SPEC.md).

For example, this calculates just the Fibonacci numbers needed for the question:

```text
the fibonacci of 0 is 0.
the fibonacci of 1 is 1.
the fibonacci of first is second plus third
if first is greater than 1
and the fibonacci of first minus 1 is second
and the fibonacci of first minus 2 is third.

what is the fibonacci of 10000?
```

Give a backward rule the inputs its calculations need. Asking for every Fibonacci
number has no finite stopping point; asking for one has.

## Examples

Every example includes answers, reasons, and executable checks.

| Example | Try it for |
| --- | --- |
| [Socrates](https://github.com/eyereasoner/eyelang/blob/main/examples/socrates.eye) | The hello world of reasoning |
| [Animals](https://github.com/eyereasoner/eyelang/blob/main/examples/animals.eye) | Facts, rules, and missing evidence |
| [Friends](https://github.com/eyereasoner/eyelang/blob/main/examples/friends.eye) | Combining clues |
| [Paths](https://github.com/eyereasoner/eyelang/blob/main/examples/paths.eye) | Rules with a loop |
| [French cities](https://github.com/eyereasoner/eyelang/blob/main/examples/french-cities.eye) | Routes through one-way roads |
| [GPS](https://github.com/eyereasoner/eyelang/blob/main/examples/gps.eye) | Choosing a route by duration, cost, belief, and comfort |
| [Age](https://github.com/eyereasoner/eyelang/blob/main/examples/age.eye) | Checking an age against a supplied date |
| [Bayes diagnosis](https://github.com/eyereasoner/eyelang/blob/main/examples/bayes-diagnosis.eye) | Updating toy disease probabilities from symptom evidence |
| [Fibonacci](https://github.com/eyereasoner/eyelang/blob/main/examples/fibonacci.eye) | Exact Fibonacci 10000 and Cassini's identity |
| [Ackermann](https://github.com/eyereasoner/eyelang/blob/main/examples/ackermann.eye) | Exact large integers and nested backward calls |
| [Complex numbers](https://github.com/eyereasoner/eyelang/blob/main/examples/complex.eye) | Powers, `asin(5.22)`, and inverse checks |
| [Turing machine](https://github.com/eyereasoner/eyelang/blob/main/examples/turing.eye) | Running binary tapes with ordinary rules |
| [Delfour](https://github.com/eyereasoner/eyelang/blob/main/examples/delfour.eye) | A shopping policy and a lower-sugar recommendation |
| [Negation](https://github.com/eyereasoner/eyelang/blob/main/examples/negation.eye) | Reasoning from absent evidence |
| [Aggregation](https://github.com/eyereasoner/eyelang/blob/main/examples/aggregation.eye) | Counts, totals, and smallest/largest values |

Deep taxonomy examples have [10](https://github.com/eyereasoner/eyelang/blob/main/examples/deep-taxonomy-10.eye),
[100](https://github.com/eyereasoner/eyelang/blob/main/examples/deep-taxonomy-100.eye), [1000](https://github.com/eyereasoner/eyelang/blob/main/examples/deep-taxonomy-1000.eye),
[10000](https://github.com/eyereasoner/eyelang/blob/main/examples/deep-taxonomy-10000.eye), and
[100000](https://github.com/eyereasoner/eyelang/blob/main/examples/deep-taxonomy-100000.eye) steps.

Run any `.eye` file in the same way. Fibonacci and the larger taxonomies print
long explanations; save their output to a file:

```sh
node eyelang.js examples/fibonacci.eye > fibonacci-arc.txt
node eyelang.js my-program.eye
node eyelang.js - < my-program.eye
node eyelang.js --version
npm test
```

To release, commit your changes and run `./release patch "$(git log -1 --pretty=%B)"`.
Use `minor` or `major` instead of `patch` for a larger version bump.
The version bump updates the specification and playground; pushing the tag
runs the tests and creates a GitHub release with that message.
