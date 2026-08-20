# WG17 STC draft review status

Source: [post-N289 draft for further technical corrigenda](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/stc)

This file tracks implementation-relevant questions from the WG17 **working
draft**. It is deliberately separate from the ISO/IEC 13211-1 conformance
claim: an STC item is a proposal or defect report until WG17 adopts normative
wording.

The purpose of this ledger is practical. Where an STC item can be expressed as
an executable Prolog observation, EyeProlog keeps a standards-facing case under
`test/conformance/stc/` (or points to an existing strict/WG17 case) so discussion
of the draft can expose implementation problems before they become release
regressions.

## Reviewed executable items

| STC item | Topic | EyeProlog evidence / finding |
| --- | --- | --- |
| [#37](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/stc#37) | `clause/2` variable identity | `stc/clause_variable_identity` verifies sharing between head and body is preserved. |
| [#39](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/stc#39) | negative-number syntax | Covered extensively by the upstream-first WG17 syntax matrix; unary-minus read-back discrepancies found by that matrix were fixed in v1.3.27. |
| [#40](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/stc#40) | inexact float representation | EyeProlog uses the host IEEE-754 binary64 value and requires written floats to read back to that same value. Input underflow is covered by `stc/float_underflow_input`. |
| [#42](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/stc#42) | integer-to-float conversion for float functions | `stc/integer_to_float_evaluable` verifies an integer expression is accepted by `sin/1` and produces a float. |
| [#44](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/stc#44) | `char_code/2` error classification | Existing strict conformance cases require `representation_error(character_code)` for an integer outside the character-code set. |
| [#49](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/stc#49) | `read_term/3` and EOF | Covered by strict reader/conformance tests and the interactive-read regressions. |
| [#50](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/stc#50) | mixed integer/float arithmetic comparison | **Found a bug during this audit.** EyeProlog rounded unbounded integers through JavaScript `Number`; `9007199254740993 > 9007199254740992.0` incorrectly failed. `stc/mixed_integer_float_comparison` now requires exact cross-type ordering and `max/2`/`min/2` use the same comparison. |
| [#55](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/stc#55) | integer rounding function | Existing flag conformance verifies `integer_rounding_function = toward_zero`. |
| [#58](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/stc#58) | `set_prolog_flag/2` instantiation error | Existing strict/error coverage requires an instantiation error when a required flag value is a variable. |
| [#67](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/stc#67) | `bagof/3` answer-order example | `stc/bagof_answer_order` verifies the proposed clarifying example produces `[2,1]`. |
| [#73](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/stc#73) | float-reading limits discussed from issue #54 | Positive/negative literal and `number_chars/2` overflow are kept as explicit draft cases; underflow is tested separately. See the note below. |

## Float-reading note for #73

EyeProlog currently has a finite-double numeric profile. The draft-facing cases
record the behavior discussed in issue #54:

- a positive finite numeric token beyond the representable range raises
  `representation_error(max_float)`;
- the corresponding negative overflow raises `representation_error(min_float)`;
- input underflow may round to `0.0`;
- overflow produced by arithmetic evaluation remains
  `evaluation_error(float_overflow)`.

These `max_float` / `min_float` names are treated as a **provisional draft
extension**, not as a claim about the currently published ISO core standard.
The earlier WG17 float-update material also uses
`representation_error(float_overflow)` for unsupported infinity input, while a
separate reading-floats proposal discusses `max_float` for a finite value above
the implementation's largest finite float. Those cases should remain distinct
when WG17 settles the wording.

Relevant background:

- [WG17 float update](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/core_update_float-2014-07-21)
- [Issue #54](https://github.com/eyereasoner/eyeprolog/issues/54)

## Maintenance rule

When the STC draft changes, review executable changes before a release. Draft
expectations must never silently replace the normative ISO/WG17 expectations;
where the two differ, keep the draft test clearly labelled `stc/` until the
standardization status changes.
