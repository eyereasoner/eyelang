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

## Stage 2: source expansion substrate

This stage is implemented. Normal-profile source loading now invokes already
loaded module-local and `user` `term_expansion/2` and `goal_expansion/2` hooks
left-to-right. A term expansion may yield one clause or a list of clauses, and
`expand_term/2` exposes the processor's DCG lowering so a hook can generate the
ordinary clauses used by Scryer's CLP(Z) parser generators. Goal expansion is
recursive across control constructs and preserves sharing with variables in the
surrounding clause.

Module-qualified hook clauses such as `user:goal_expansion/2` are also compiled
with the correct split between procedure ownership and lexical body context. A
hook defined from a library module therefore lives in `user` while its
unqualified helper calls still resolve in the defining library. The compiler
executes hooks with a fresh bounded solver against the partially built program;
`solver.js` imports clause-selection helpers directly from `program-indexing.js`,
so this compile-time service remains acyclic. Strict ISO Part 1 mode does not run
these extension hooks.

The regression corpus covers clause-list generation, variable-sharing goal
expansion, qualified hook lexical context, and the Scryer pattern where a
`term_expansion/2` hook calls `expand_term/2` to generate a DCG predicate.

## Stage 3: Scryer support-library surface

This stage is implemented. EyeProlog now registers the library names imported by
Scryer's current `clpz.pl`: `assoc`, `pairs`, `between`, `dcgs`, `terms`,
`error`, `si`, `freeze`, `arithmetic`, `debug`, and `format`. The implementations
are deliberately small compatibility layers where CLP(Z) needs only a subset of
the upstream module, while observable predicate contracts stay at the Prolog
library boundary. In particular, `library(freeze)` is implemented with the same
attributed-variable `verify_attributes/3` protocol introduced in Stage 1.

Two remaining Scryer runtime facilities are generic rather than constraint
specific. `Env` now carries a copy-on-write backtrackable blackboard, exposed to
Prolog through `bb_get/2` and `bb_b_put/2` compatibility wrappers, and
`library(terms)` provides `copy_term_nat/2` using EyeProlog's attribute-free
logical copy semantics. Regression coverage exercises the support modules,
blackboard rollback, attribute-free copying, and the exact import/attribute
prelude used by upstream CLP(Z).

## What still prevents replacing `src/clpz.js`

The VM/compiler and named support-library blockers are now closed. The remaining
work is direct upstream-source integration: vendor a pinned Scryer `clpz.pl`,
apply only the small compatibility patches exposed by loading the complete file,
and run it side-by-side against EyeProlog's existing CLP(Z) corpus plus selected
Scryer regressions. Only after behavioral and performance parity should the
`eyeprolog__clpz_*` adapters and `Env._clpz` store be removed.

This boundary is intentional: Stage 3 does not claim that the complete upstream
solver is active merely because its dependency prelude loads.

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
