# ISO/WG17 compatibility extensions

EyeProlog separates its strict ISO core from carefully selected compatibility
extensions. `isoStrict: true` targets ISO/IEC 13211-1:1995 plus Corrigenda 1-3;
newer or non-core features belong in the normal profile until they are part of
the claimed strict baseline.

## Selection rule

A proposed extension is a good candidate when it has all of these properties:

1. it solves a concrete portability or usability problem;
2. its syntax/semantics are precise enough to test independently;
3. it has clear WG17 momentum, a published ISO technical specification, or
   established interoperable implementation practice; and
4. it does not silently change strict ISO behavior.

This intentionally excludes adopting every discussion item on the ISO Prolog
working-notes pages. Draft/editorial proposals can change, and controversial
changes are more valuable as tracked tests/documentation than as premature
language behavior.

## Implemented high-value items

- **Digit separators (normal profile).** Decimal, binary, octal, and hexadecimal
  integer constants accept a single underscore between digit groups. Layout,
  line comments, and block comments may follow the underscore before the next
  digit, matching the accepted WG17 options described at
  <https://www.complang.tuwien.ac.at/ulrich/iso-prolog/digit_separators>.
  Consecutive/trailing separators and separators inside floats/exponents are
  rejected. Strict ISO mode rejects the extension.
- **Corrigenda 1-3.** The strict suite explicitly covers the published
  corrections, including `variable_names/1` write behavior.
- **Cleanup.** `setup_call_cleanup/3` and `call_cleanup/2` are available in the
  normal compatibility/library surface and are regression tested.
- **DCGs.** EyeProlog supports grammar-rule expansion and `phrase/2-3` in the
  normal profile, aligned with ISO/IEC TS 13211-3:2025. These remain outside
  the Part 1 strict-core claim.
- **Prologue/library portability.** The normal profile includes a portable
  standard-library surface and autoloading rather than treating those
  predicates as Part 1 core built-ins.

## What should be considered next?

The best next work is evidence-driven rather than feature-count driven:

- keep running the public WG17 syntax/conformance corpora and close concrete
  interoperability gaps they expose;
- prefer published specifications (for example additional fully testable parts
  of the DCG TS) over draft syntax experiments;
- evaluate Prolog-prologue predicates when they materially improve source
  portability and can be implemented with compatible errors/modes;
- keep module conformance as a separate Part 2 effort instead of mixing it into
  the Part 1 strict claim; and
- track draft STC/WG17 proposals in tests/status documents until their intended
  behavior is stable enough to adopt explicitly.

In particular, the digit-separator page currently leaves float separator forms
such as `1_1.25`, `11.2_5`, and `1.0e1_0` unresolved. EyeProlog therefore does
**not** generalize integer separators into float syntax.

## Regression expectations

Every accepted compatibility extension should have tests for positive syntax,
negative/boundary syntax, stream or conversion entry points where applicable,
and an explicit strict-mode rejection when the feature is not in the strict
baseline. This keeps the normal profile useful without weakening the meaning of
`isoStrict: true`.
