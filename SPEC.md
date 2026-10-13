# eyelang Specification

```text
Document: eyelang-spec-0001
Category: Experimental
Language version: 0.0.11
Date: 2026-10-13
```

## Status of This Memo

This is a project specification in RFC style, not an IETF RFC. It defines the
current eyelang experiment. Future revisions may change the language.

## Abstract

eyelang is a symbolic logic programming language.
Programs contain facts, rules, questions, and checks. Evaluation
derives consequences, explains selected answers, and tests stated expectations.
This document specifies syntax, values, inference, arithmetic, negation,
aggregation, explanations, errors, and the command-line interface.

## Contents

1. [Conventions and conformance](#1-conventions-and-conformance)
2. [Program model](#2-program-model)
3. [Lexical conventions and values](#3-lexical-conventions-and-values)
4. [Facts and rules](#4-facts-and-rules)
5. [Arithmetic and comparisons](#5-arithmetic-and-comparisons)
6. [Inference and negation](#6-inference-and-negation)
7. [Questions and aggregation](#7-questions-and-aggregation)
8. [Explanations](#8-explanations)
9. [Checks](#9-checks)
10. [Errors and command-line interface](#10-errors-and-command-line-interface)
11. [Reference implementation and examples](#11-reference-implementation-and-examples)
12. [Security and resource considerations](#12-security-and-resource-considerations)
13. [IANA considerations](#13-iana-considerations)
14. [References](#14-references)

## 1. Conventions and conformance

Uppercase MUST, MUST NOT, SHOULD, and MAY express the requirement levels of
BCP 14 ([RFC 2119](https://www.rfc-editor.org/rfc/rfc2119.html),
[RFC 8174](https://www.rfc-editor.org/rfc/rfc8174.html)). Lowercase words have
their ordinary meanings.

A conforming implementation MUST implement the syntax, value operations, and
evaluation behavior specified here. Internal representation, indexing, and
evaluation scheduling MAY differ. Answer order and the chosen derivation are
unspecified when several valid choices exist. Examples are informative;
requirements and the accompanying semantic descriptions are normative.

The grammar fragments below use quoted literals, `|` for alternatives, square
brackets for optional parts, and braces for repetition. They describe sentence
shapes; the lexical and well-formedness requirements also apply. They are not
ABNF and do not imply general English parsing.

A *ground* term contains no variables. A *clue* is a rule premise. A *completed
program* is the result after forward inference and all requested backward calls
have reached a fixed point in each inference layer.

## 2. Program model

```text
program   = { statement }
statement = sentence "."
          | range "."
          | "if" clue { "and" clue } "then" sentence "."
          | sentence "if" clue { "and" clue } "."
          | question "?"
          | "check that" assertion "."
```

Implementations MUST parse the whole program before evaluation, load all input
facts, request the goals in all questions and checks, complete inference, answer
questions in their written order, and then evaluate checks in their written
order. A question can use facts or rules written later in the file. Checks MUST
NOT assert facts; like questions, they can request backward computation.

Each ordinary sentence denotes a binary relation:

| Shape | Relation | Arguments |
| --- | --- | --- |
| `socrates is a human` | membership | `socrates`, `human` |
| `human implies mortal` | named verb `implies` | `human`, `mortal` |
| `the score of milo is 7` | named property `score` | `milo`, `7` |

Membership, verbs, and properties have separate relation identities. For
example, a verb named `score` does not denote the property named `score`.
There are no implicit subclass rules: `implies` gains its meaning from the
rules supplied by the program.

## 3. Lexical conventions and values

### 3.1. Source text

Source files use UTF-8 and conventionally have the `.eye` extension. Outside
quoted text, implementations MUST lowercase words and collapse whitespace.
Statements can span lines or share a line.

`#` begins a comment ending at the next newline, except inside quoted text.
Comments MUST NOT change the line numbers reported for following statements.
`.` ends a fact, rule, range, or check. At the start of a token, `?` followed
immediately by a Unicode letter starts a named variable; other occurrences of
`?` end a question. Punctuation inside quoted text does not end a statement.
A dot between two decimal digits belongs
to a numeric literal: use whitespace in `1. 2` to separate numeric sentences.
Keywords and separators inside quoted text, lists, or parentheses MUST NOT
split the enclosing sentence or rule.

### 3.2. Names and variables

A name starts with a Unicode letter. Remaining characters are Unicode letters,
Unicode numbers, `_`, or `-`. Normalization uses Unicode lowercase conversion.
The following words are reserved:

```text
if then and is a an why does plus minus not
```

A named variable is `?` followed by a name:

```text
variable = "?" name
examples = ?person ?kind ?value ?birth-year
```

Names after `?` follow the same character and lowercase normalization rules
as ordinary names. There is no fixed list or limit on variable names.
A variable's scope is one rule or one question. It can bind any value, and two
different variables MAY bind the same value. Repeated occurrences in the same
scope MUST agree; identical names in different scopes are independent.

`who` and `what` are additional query variables; they MUST NOT occur in facts
or rules. Named variables MAY occur in rules and questions, but MUST NOT occur
in facts. Checks MUST be ground. Relation and property names MUST be fixed
names, not variables or reserved words. Unprefixed ordinal words are ordinary
names and have no variable meaning.

### 3.3. Numbers

Numeric literals have this form, where `digits` is one or more ASCII digits:

```text
number = [ "-" ] digits [ "." digits ] [ "e" [ "+" | "-" ] digits ]
```

Integer literals MUST be canonicalized exactly, without leading zeroes or
negative zero. Decimal and scientific literals MUST use finite IEEE 754
binary64 values and canonical decimal strings equivalent to JavaScript
`String(Number(literal))`. Thus `1.0` becomes `1`; decimal input can round
before subsequent operations. Non-finite numeric input MUST be rejected.

Ordinary matching compares canonical numeric representations. Numeric
comparison clues instead compare numeric values (Section 5.2). This distinction
matters when a large integer and a scientific literal have different canonical
representations of the same numerical value.

### 3.4. Quoted text

Double-quoted strings use JSON string syntax and escapes, including `\"`,
`\\`, `\n`, and `\uXXXX`. Implementations MUST preserve decoded capitalization
and whitespace. Unescaped line breaks and invalid escapes MUST be rejected.
Quoted text is distinct from a name or number: `"milo"` differs from `milo`,
and `"7"` differs from `7`. Matching compares decoded text exactly.

### 3.5. Lists

```text
list = "[" "]"
     | "[" term { "," term } [ "|" tail ] "]"
```

Lists MAY contain numbers, names, quoted text, nested lists, and variables or
calculations where their context permits. A tail MUST be a list or a variable
that binds to a list. Improper lists MUST be rejected. Closed tails MUST be
flattened: `[1 | [2]]` equals `[1, 2]`.

In a pattern, `[?item | ?rest]` matches a nonempty list and binds its first
item and remaining list. In a conclusion it constructs a list. List matching
MUST use structural equality and enforce repeated-variable agreement. Every
derived list MUST be ground.

## 4. Facts and rules

### 4.1. Sentences and ranges

```text
sentence = term "is" article term
         | term verb term
         | "the" property "of" term "is" term
article  = "a" | "an"
range    = "every number from" integer "to" integer "is" article kind
```

In membership and verb sentences, each argument occupies one top-level token;
quoted strings, lists, and parenthesized calculations each count as one token.
Multiword calculations in those positions need parentheses. Property arguments
also accept unparenthesized calculations. A membership kind MUST evaluate to an
unquoted atomic value; quoted text and lists are invalid kinds.

Facts MUST be ground and MUST NOT contain arithmetic expressions. Both
articles have the same meaning. Ranges MUST supply an inclusive sequence of
ordinary membership facts. Bounds MUST be integer literals, and the first
bound MUST NOT exceed the last. A range is not an execution limit.

### 4.2. Rules and safety

A rule has at least one clue and exactly one conclusion. All its clues must
hold under the same variable bindings. A positive ordinary clue can bind
previously unbound variables by matching facts, including elements of lists.

`if clues then answer.` is a forward rule. `answer if clues.` is a backward
rule: its conclusion is called the *head*, and evaluation starts when a question,
check, or ordinary rule clue requests a matching answer. Both forms express the
same implication, with different directions of evaluation.

Implementations MUST process binding requirements in premise order. For a
forward rule:

1. Variables used in arithmetic MUST be bound by an earlier positive clue.
2. Variables in a comparison MUST be bound by an earlier positive clue.
3. Variables in a negative clue MUST be bound by an earlier positive clue.
4. Every conclusion variable MUST have been bound in the premises.

For a backward rule, variables in ordinary head positions MAY instead receive
bindings from the call. These include variables inside head lists and tails,
but exclude variables occurring only inside head calculations. Such head
variables count as available for static safety checking. At runtime, every
variable needed by arithmetic, a comparison, or negation MUST actually be
ground when that clue is reached. Every emitted answer MUST be ground. A call
that reaches a clue or answer without the necessary bindings MUST fail with
an error, rather than silently return no answers.

Comparisons and negative clues MUST NOT introduce bindings. Arithmetic is
forward evaluation, not inverse solving. Unsafe rules MUST be rejected.
Negative and computed comparison sentences MUST NOT be facts or conclusions.
Calculations in a backward head MUST be evaluated after its clues succeed and
the resulting ground answer MUST match the original call. A false body MUST
NOT evaluate its head calculations.

The hello world of reasoning uses an ordinary verb and variable kinds:

```text
socrates is a human.
human implies mortal.
if ?person is a ?kind and ?kind implies ?superkind then ?person is a ?superkind.
```

The rule derives `socrates is a mortal.`. Additional kinds and implication
facts can use the same rule, including chains of implications.

A backward definition can use a supplied number without a range of input facts:

```text
the fibonacci of 0 is 0.
the fibonacci of 1 is 1.
the fibonacci of ?index is ?previous plus ?earlier
if ?index is greater than 1
and the fibonacci of ?index minus 1 is ?previous
and the fibonacci of ?index minus 2 is ?earlier.
what is the fibonacci of 10000?
```

The question binds `?index`; recursive clues request its two predecessors.
An unrestricted `the fibonacci of who is what?` MUST fail because the comparison
requires a known `?index`. Supplying a result does not solve for its index.

## 5. Arithmetic and comparisons

### 5.1. Calculations

The operators below are ordered from lowest to highest binary precedence:

| Operators | Associativity |
| --- | --- |
| `plus`, `minus` | Left |
| `times`, `divided by` | Left |
| `to the power of` | Right |

Parentheses override precedence. Prefix functions bind to the next value or
parenthesized expression, more tightly than binary operators:

```text
square root of       absolute value of
natural log of       exponential of
sine of              cosine of
arc sine of          arc cosine of
```

`angle of real with imaginary` computes `atan2(imaginary, real)`, normalized
to `[0, 2*pi)`. The first argument is an expression ending at `with`; the
second binds like a prefix-function argument. All angles are in radians.
The angle of `(0, 0)` is defined as zero.

When both canonical operands are integers, addition, subtraction,
multiplication, nonnegative integer powers, and division with an integer
result MUST be exact. Other operations MUST use binary64 arithmetic equivalent
to the reference implementation's JavaScript Number and Math operations.
Decimal input that canonicalizes to an integer participates in exact integer
operations. Large integers converted for approximate operations can round.

Quoted text, names, and lists MUST NOT be coerced into arithmetic operands.
Division by zero, non-finite conversions or results, and real-function domain
errors MUST fail. Complex numbers are ordinary named values with `real` and
`imaginary` properties; they are not a built-in numeric type.

### 5.2. Computed clues

```text
comparison = term "is" order term
           | term "contains the text" term
order      = "less than" | "at most" | "greater than" | "at least" | "equal to"
```

Ordering MUST accept two numbers or two quoted texts. Integers MUST compare
exactly. Mixed integer/binary64 comparisons MUST preserve the exact integer
operand, as JavaScript BigInt/Number relational comparisons do; they MUST NOT
first round both operands to binary64.

Text ordering MUST use lexicographic UTF-16 code-unit order, without locale
or date interpretation. Numeric equality compares numerical values. Other
equality compares atomic or structural values. Incompatible ordering types
MUST fail. `contains the text` MUST accept two quoted texts and test substring
membership after lowercasing both decoded strings.

A leading `not` inverts a computed test. It MUST NOT search for the absence of
a fact named by that comparison. Successful tests MUST contribute computed
evidence to explanations, without becoming ordinary inferred facts.
Computed comparisons are available in rule clues and checks, not as standalone
ordinary questions.

## 6. Inference and negation

### 6.1. Positive inference

Facts have set semantics. Implementations MUST add each distinct ground
relation/argument tuple at most once. Several values for one property subject
are distinct facts; there is no replacement or implicit uniqueness constraint.

Forward rules MUST be evaluated to a fixed point over all available facts.
Backward rules MUST be evaluated for requested calls only, including calls
created by forward or backward clues. A rule set with no requested backward
calls MUST NOT enumerate its backward definitions. Matching supplied facts and
answers from either rule form MUST be available to both forms.

Implementations MUST table backward calls: calls differing only in variable
names share one evaluation, preserving repeated-variable constraints. Each
matching answer MUST be delivered once per waiting consumer. An active
recursive call MUST suspend its consumers and resume them as answers arrive;
it MUST NOT be treated as failure or expanded into an unbounded recursive
execution stack. Positive recursive components MUST reach their least fixed
point, including an empty result when there is no supporting base fact.
Tables MUST be local to a program run.

For terminating positive programs whose calls supply the required inputs,
requested answers MUST agree with the least fixed point of the implications
and input facts. Unrequested backward consequences need not be materialized.
Rule and question ordering MUST NOT change the answer sets. Inference MAY
change answer order or select a different valid first derivation.

### 6.2. Absence clues

Rules accept these negative shapes:

```text
?player is not a tired-player
?player does not need rest
not the score of milo is 7
```

An ordinary negative clue holds exactly when no fact matching its ground
positive form follows from the completed producer layers. This is absence of
evidence within the program, not explicit falsity or a claim about the world.

Implementations MUST stratify dependencies of both rule forms before inference.
Positive dependencies MAY share a layer; a negative consumer MUST run strictly
after all possible producers of its negative premise. Any dependency cycle
through a negative edge MUST be rejected.
Testing absence MUST request the positive form of the goal and complete all
its producer work first, including newly requested backward calls. An active
or not-yet-requested call MUST NOT be mistaken for absent evidence.

In this version, membership dependencies distinguish fixed kind constants.
A variable kind overlaps every membership kind. Other dependencies use the
verb or property identity, regardless of subject/value constants. This
conservative dependency analysis can reject programs whose finer-grained
dependencies would be stratifiable. Negative computed tests have no fact
producers and introduce no negative dependency edges.

### 6.3. Termination and scope

With a finite value domain and finitely many distinct call patterns, fixed-point
evaluation terminates even with positive cycles. Arithmetic and list construction
can create an unbounded domain of answers or calls, so termination is then a
property of the program. Tabling does not make every query finite. Inputs can
bound backward computation, as in the Fibonacci example; no separate range is
needed. No semantic depth limit or automatic truncation is defined.

This version has no explicit false facts, disjunction, general term
constructors beyond lists, mutation, imports, or external calls.

## 7. Questions and aggregation

### 7.1. Ordinary questions

Supported shapes include:

```text
who is a mortal?
?person is a mortal?
is socrates a mortal?
who likes luna?
what does milo like?
does milo like luna?
the score of who is what?
what is the score of milo?
is the score of milo equal to 7?
is milo not a dog?
does milo not need rest?
```

Ordinary sentences containing query variables can serve as questions. Positive
queries MUST return all matching facts, once each. A ground positive query
MUST answer yes when matching evidence exists and unknown otherwise. It MUST
NOT treat missing positive evidence as an explicit no answer.
Questions and checks MUST request matching backward calls before answers are
rendered. Ground negative questions MUST request and complete their positive
form before testing absence.

Arithmetic in a question MUST be ground. Query variables can match values
but MUST NOT occur inside calculations.

Named negative membership and action questions MUST test absence in the
completed program: yes for no match, no when a positive match exists. Negative
questions MUST be ground. The property equality question tests matching
property evidence; it is distinct from a numeric comparison clue.

Base verbs in `does` forms are converted to the stored third-person form:
`have` becomes `has`; consonant-plus-`y` becomes `ies`; endings `s`, `sh`,
`ch`, `x`, `z`, or `o` take `es`; other verbs take `s`. This controlled
inflection does not cover all English verbs.

### 7.2. Aggregation

```text
how many players are there?
what is the total of all scores?
what is the smallest of all scores?
what is the largest of all scores?
```

Aggregation MUST run over the completed inferred facts, not partial results.
It MUST request all matching backward membership kinds or property relations
with their subjects and values unconstrained. It MUST NOT aggregate only the
answers already cached by other questions. Thus finite definitions can be
aggregated independently of question order; a definition requiring a ground
input, such as Fibonacci above, MUST report an insufficient-input error when
an aggregate attempts unrestricted enumeration. A variable-kind backward head
MUST be requested with both arguments unconstrained for membership counts.
Counting selects matching membership kinds and counts distinct subjects.
Value aggregates select matching property names and operate on every distinct
subject/value fact. Identical repeated facts count once; equal values from
different subjects contribute separately. Multiple values for a subject also
contribute separately.

The query label is the plural of the kind or property name. Pluralization uses
the verb-inflection rules above, with these overrides:

| Singular | Plural |
| --- | --- |
| person | people |
| child | children |
| mouse | mice |
| sheep | sheep |
| fish | fish |

Totals and extrema MUST accept only canonical whole-number values and MUST
calculate exactly. Non-integer values MUST fail rather than be ignored.
Empty counts and totals yield zero; empty smallest/largest queries yield
unknown. Aggregation is available in questions and checks, not within rules.

## 8. Explanations

A ground question or aggregate question MAY be prefixed with `why`.
`why?` MUST explain all answers to the preceding non-follow-up question.
Consecutive follow-ups keep that same context, local to the current run.
A follow-up with no preceding question MUST ask for a question first; one
after an unanswered question MUST report that there is no answer to explain.

For a negative question answered no, the explanation MUST show the positive
evidence refuting absence. A successful absence explanation MUST identify the
completed search and lack of a matching fact. It MUST NOT label absence as a
supplied fact.

Every derived fact MUST retain a successful supporting rule and its premises.
This applies to both forward and backward derivations. A call supplies bindings,
not new input facts; it MUST NOT appear as a supplied-fact premise.
Input facts MUST be identified as supplied. Arithmetic explanations MUST show
concrete operands and results; computed comparisons MUST be identified as
checked values. Aggregate explanations MUST identify the operation and its
contributing facts, including an empty search where applicable.

Shared or deep explanations MUST avoid recursively expanding common premises
over and over. The reference implementation uses indented text for one small,
unshared proof and numbered steps otherwise. Each numbered rule application
references earlier premise steps, and the final line identifies the explained
root steps. Implementations MUST NOT silently omit proof steps or numeric
digits. Exact layout and the threshold for numbered output MAY differ.

Explanations MUST make the bindings of each rule application explicit.
The reference implementation substitutes actual values into the rule text in
short explanations. Numbered explanations share rule templates and show the
variable bindings at each application; those bindings are local to that step.

An explanation records a derivation selected by the evaluator. It does not
independently certify that inference was correct or that an absence or
aggregate search was complete.

## 9. Checks

```text
assertion = ground-clue
          | "there are" nonnegative-integer plural-label
          | "there is" nonnegative-integer singular-label
          | "the" aggregate-operation "of all" plural-label "is" integer
aggregate-operation = "total" | "smallest" | "largest"
```

A check ends with `.`, not `?`. It MUST be ground. An ordinary positive check
passes if matching evidence exists; a negative check passes if it is absent.
Computed conditions use Section 5.2. Counts and value aggregates MUST use the
same semantics as aggregate questions and compare against the stated exact
integer. Missing extrema MUST fail their checks.

Checks MUST run after all questions and explanations, even when interleaved
with them in the source. They MUST NOT alter `why?` context. Each successful
check emits `check passed: condition.`. The first failed check MUST stop the
run with a source line and `Check failed: condition.` diagnostic. Other errors
while evaluating a check MUST also identify its source line.

Checks are assertions about selected results. They use the same interpreter
as inference and are not an independent proof verifier. Programs SHOULD use
independent expected values or different mathematical identities when useful.

## 10. Errors and command-line interface

Implementations MUST reject malformed or unfinished statements, unsafe
variables, invalid negative cycles, unsupported sentence forms, invalid
arithmetic, and failed checks. Syntax errors MUST identify the source line.
A runtime inference error need not carry a line number. Unknown answers are
ordinary query results and MUST NOT by themselves cause failure.

The reference command accepts exactly one file path or `-` for standard input:

```sh
node eyelang.js examples/socrates.eye
node eyelang.js - < examples/socrates.eye
node eyelang.js --help
```

Successful command execution MUST exit zero. Errors MUST be written to stderr
and cause a nonzero status. The reference command renders all questions and
checks before writing their output; if any check fails, it prints no successful
answer transcript. Successful output in the CLI and playground MUST contain
three sections headed by the comments `# Answer`, `# Reason`, and `# Check`,
in that order. Ordinary query answers appear under `# Answer`; explicit why
questions and follow-ups appear under `# Reason`; successful checks appear
under `# Check`. Blocks within each section retain their written order and
are separated by blank lines. All three headings appear even when a section
has no results; a message indicates what was not requested. Section grouping
MUST NOT change the preceding-question context used by `why?`.

Programs with no questions or checks receive a prompt to add a question.
`--help` and `-h` display usage. `--version` and `-v` display `eyelang` followed
by the package version. The reference implementation requires Node.js 18 or
later and no third-party packages.

## 11. Reference implementation and examples

This section is informative.

`src/language.js` exports `parse`, `infer`, `say`, and `run`. Parsing produces
facts, rules, questions, and checks; inference requests their goals and returns
materialized facts with evidence (including requested backward answers);
`run(source)` returns rendered output blocks or throws an error;
`run(source, { arc: true })` groups those blocks into the three ARC sections
used by the CLI and playground. `eyelang.js` supplies
the file/stdin interface. Importing the language module has no CLI side effects.

`playground.html` and `src/playground.js` provide a browser editor, bundled examples,
draft storage, share links, file/URL loading, and output downloads. Each run
uses `src/playground-worker.js`, which imports the same language module; Stop
terminates that worker. The displayed output preview is explicitly bounded,
while copying and downloading retain the full result. `node src/playground-server.js`
starts a local HTTP server; the browser assets also work on a static host.
These UI facilities do not change language syntax or inference semantics.

The evaluator indexes binary facts by both arguments, either argument, or
neither. Partial matches wait for their next clue. A FIFO work queue joins
existing and newly derived facts without recursive evaluator calls. Queues
prioritize lower inference layers, including work requested by backward calls.
Variant calls share a table and use the same fact indexes to resume consumers.
Ground lists use structural index keys; non-ground patterns use broader indexes
and structural matching. Explanations use an iterative walk over the evidence
graph and retain one successful derivation per distinct fact.

Every bundled example follows [ARC: Answer, Reason, Check](https://josd.github.io/arc/):

- `socrates.eye` supplies generic inheritance of membership through implication.
- Animals, friends, and paths introduce facts, joins, and positive cycles.
- French cities requests reachability through one-way roads. Explanations expose
  supporting routes; the example does not optimize route length.
- GPS builds action lists from Gent to Oostende, adds duration and cost, and
  multiplies belief and comfort. It recommends the route that strictly beats
  the alternative on all four scores in its two-route map.
- Age checks whether a person is strictly older than a whole number of calendar
  years, using supplied `[year, month, day]` lists. The comparison date is
  explicit; on the birthday itself the person is exactly that age. This example
  does not read a clock or implement general date/duration arithmetic.
- Fibonacci works backwards from its requested indices by addition, including
  exact Fibonacci 10000 (2090 digits). Checks include Cassini's identity.
  Adding `why?` after the Fibonacci 10000 question explains that answer using
  20000 shared evidence records instead of expanding a recursive proof tree.
- Ackermann uses backward hyperoperation rules and exact exponentiation to
  answer twelve sample calls. `A(3, 1000)` equals `2^1003 - 3`, and `A(4, 2)`
  equals `2^65536 - 3` (19729 digits). Explanations retain the recursive work;
  larger inputs can require impractical amounts of time, memory, or output.
- Bayes diagnosis multiplies supplied symptom likelihoods and priors, then
  normalizes across the diseases listed for each case. An observed absent
  symptom contributes `1 - p`; an unobserved symptom contributes no factor.
  The toy model assumes conditional independence and alternative diseases;
  its results are relative to that candidate list. Checks reject probabilities
  outside `[0, 1]`, require a positive total, and verify normalization.
- Complex numbers uses forward rules for results and backward rules for helper
  calculations in powers and inverse functions. The real input is configurable,
  initially `5.22`. For real inputs outside the
  unit interval, this example chooses positive imaginary inverse sine and
  negative imaginary inverse cosine. Checks use explicit rounding tolerances
  and recover the input with forward functions.
- The Turing machine is an ordinary list-based rule interpreter. Its supplied
  transition table adds one to a binary tape and retains visited blank cells.
- Delfour derives a shopping authorization, sugar warning, and lowest-sugar
  same-shelf alternative; tied minima are all answers. Each case keeps its own
  policy and insight. Signature verification is declared trusted input, the
  hash check compares supplied digests, and audit/file counts are sample data.
  Quoted timestamps share one UTC format so text order matches time order.
- Negation and aggregation illustrate completed-program search and set semantics.
- Five taxonomies have 10 through 100000 steps. The largest has 300001 rules,
  derives 300002 facts, and explains the full chain to its terminal label.

`npm test` exercises these behaviors, including deliberate assertion failures.
Reference tests independently compare Fibonacci against fast doubling and
Turing outputs against binary addition; explanation tests check shared steps
and concrete values. Large examples print long explanations and can be run
with stdout redirected to a file.

## 12. Security and resource considerations

An eyelang program can consume unbounded time or memory through arithmetic,
list construction, broad joins, materialized ranges, or large explanations.
Hosts processing untrusted programs SHOULD impose external resource limits.
Any imposed limit MUST cause explicit failure rather than a silently partial
answer presented as a completed result.

Explanations can expose supplied facts, including sensitive input. Applications
SHOULD treat the explanation output as data derived from the whole input.
The language performs no network requests, cryptographic verification, or
external actions. A trusted-input declaration or passed assertion alone does
not authenticate a source.

## 13. IANA considerations

This specification requests no IANA registrations. `.eye` is a project file
convention; no media type is registered by this memo.

## 14. References

### 14.1. Normative references

- [RFC 2119: Key words for use in RFCs to Indicate Requirement Levels](https://www.rfc-editor.org/rfc/rfc2119.html).
- [RFC 8174: Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words](https://www.rfc-editor.org/rfc/rfc8174.html).

### 14.2. Informative references

- [ARC: Answer, Reason, Check](https://josd.github.io/arc/).
- [README.md](https://github.com/eyereasoner/eyelang/blob/main/README.md): introduction and example index.
- [src/language.js](https://github.com/eyereasoner/eyelang/blob/main/src/language.js): reference implementation.
- [test/](https://github.com/eyereasoner/eyelang/tree/main/test): executable behavior and regression checks.
