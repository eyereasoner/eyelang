# CLP(Z) migration toward Scryer's Prolog implementation

EyeProlog's current `library(clpz)` has a Prolog API in `src/lib/clpz.pl` and a
CLP(Z)-specific propagation store in `src/clpz.js`. The long-term target is to
reuse Markus Triska's MIT-licensed [`clpz.pl` from Scryer
Prolog](https://github.com/mthom/scryer-prolog/blob/master/src/lib/clpz.pl) and
keep the JavaScript runtime responsible for generic Prolog VM facilities rather
than a second finite-domain solver.

## Stage 1: attributed-variable substrate

This stage is implemented. `Env` carries persistent per-module Prolog
attributes in addition to the generic constraint descriptors introduced for
`dif/2`. `src/atts.js` and `library(atts)` expose the operations required by the
Scryer style: `put_atts/2`, `get_atts/2`, `put_attr/3`, `get_attr/3`,
`del_attr/2`, and `term_attributed_variables/2`. The parser accepts the
`attribute` declaration operator, Scryer-style comma-separated
`:- attribute a/1, b/0.` directives, and `op/3` entries in module export lists.

The important unification protocol is also implemented. Before an attributed
variable is bound to a nonvariable, or before two variables carrying attributes
for the same owner module are aliased, the solver invokes the owner's
`verify_attributes/3`. A failed hook rejects the unification. Goals returned in
the third argument are queued only after the binding succeeds. Aliasing an
attributed variable with a plain variable transfers the persistent attribute map
to the surviving representative, which is equivalent to Scryer's CLP(Z)
`verify_attributes/3` transfer branch and avoids a recursive hook call while
entering the hook itself.

The substrate is covered by regressions for lookup, alias transfer, conflicting
attributes, post-binding goals, backtracking, `term_attributed_variables/2`, and
REPL projection through the conventional module `attribute_goals//1` hook.
`examples/attributed-variables.pl` is the runnable source-level example.

## What still prevents a drop-in Scryer `clpz.pl`

The upstream solver is not only an attributed-variable client. It also relies on
compile-time facilities that EyeProlog does not yet provide generically:

- user-defined `term_expansion/2` and `goal_expansion/2` during module loading;
- the generated predicates at the end of Scryer's `clpz.pl` and its custom Duo
  DCG `++>` expansion;
- the supporting Scryer library surface (`assoc`, `pairs`, `between`, `dcgs`,
  `terms`, `error`, `si`, `freeze`, `arithmetic`, `debug`, and `format`) at the
  interfaces expected by that source;

These are compatibility gaps, not reasons to add more CLP(Z)-specific code to
`term.js` or `solver.js`.

## Migration rule

`src/clpz.js` remains the active implementation until an upstream-based Prolog
solver passes the existing EyeProlog CLP(Z) corpus and the selected Scryer CLP(Z)
regressions. During the transition it is the behavioral reference, not the
architecture to extend. New generic VM work should go into attributed variables,
term/goal expansion, or reusable library support where possible.

Once the upstream source loads and reaches parity, remove the corresponding
`eyeprolog__clpz_*` adapters and the `_clpz` store in one or more reviewable
steps. Keep the upstream copyright and MIT license notice intact and keep local
patches small enough that future Scryer updates can be diffed mechanically.
