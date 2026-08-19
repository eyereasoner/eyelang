# Regression fixtures

`phrase_quad.pl` is an unmodified snapshot of Ulrich Neumerkel's ISO Prolog
`phrase/2-3` quad corpus:

<https://www.complang.tuwien.ac.at/ulrich/iso-prolog/phrase_quad.pl>

Retrieved on 2026-08-11. It is vendored so the regression suite exercises all
58 quads without depending on network access or availability of the source
server.

`prologue_quad.pl` is an unmodified snapshot of the 33 machine-readable quads
for the predicates proposed by the Prolog Prologue working draft:

<https://www.complang.tuwien.ac.at/ulrich/iso-prolog/prologue_quad.pl>

The corresponding working draft is at
<https://www.complang.tuwien.ac.at/ulrich/iso-prolog/prologue>.
The corpus snapshot was retrieved on 2026-08-11.

`prologue_quad_runner.pl` loads EyeProlog's `library(prologue)` and includes
the unmodified corpus, mirroring the draft's requirement that a Prologue be
included before its examples are run.
