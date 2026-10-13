# Rules over a finite cycle of follows facts.
ada follows ben.
ben follows cara.
cara follows ada.

if ?from follows ?to then ?from reaches ?to.
if ?from reaches ?via and ?via follows ada then ?from reaches ada.

# Answer: who can reach ada?
who reaches ada?
# Reason: follow the links that support ben's answer.
why does ben reach ada?

# Check: the direct and two-link routes to ada are both present.
# The second rule only extends a route when the next link leads to ada.
check that ada does not reach ada.
check that ben reaches ada.
check that cara reaches ada.
check that ben reaches cara.
