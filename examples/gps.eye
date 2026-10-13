# Which route should we take from Gent to Oostende?
the location of traveller is gent.
the destination of trip is oostende.

# One-way roads. Durations are seconds; the other values are sample scores.
the road of [gent, brugge] is drive-gent-brugge.
the duration of drive-gent-brugge is 1500.
the cost of drive-gent-brugge is 0.006.
the belief of drive-gent-brugge is 0.96.
the comfort of drive-gent-brugge is 0.99.

the road of [gent, kortrijk] is drive-gent-kortrijk.
the duration of drive-gent-kortrijk is 1600.
the cost of drive-gent-kortrijk is 0.007.
the belief of drive-gent-kortrijk is 0.96.
the comfort of drive-gent-kortrijk is 0.99.

the road of [kortrijk, brugge] is drive-kortrijk-brugge.
the duration of drive-kortrijk-brugge is 1600.
the cost of drive-kortrijk-brugge is 0.007.
the belief of drive-kortrijk-brugge is 0.96.
the comfort of drive-kortrijk-brugge is 0.99.

the road of [brugge, oostende] is drive-brugge-oostende.
the duration of drive-brugge-oostende is 900.
the cost of drive-brugge-oostende is 0.004.
the belief of drive-brugge-oostende is 0.98.
the comfort of drive-brugge-oostende is 1.

# Work backwards: one road, or a road followed by the rest of a route.
the route of [?from, ?to] is [?road]
if the road of [?from, ?to] is ?road.

the route of [?from, ?to] is [?road | ?rest]
if the road of [?from, ?via] is ?road
and the route of [?via, ?to] is ?rest.

the route of trip is ?actions
if the location of traveller is ?from
and the destination of trip is ?to
and the route of [?from, ?to] is ?actions.

# Name the two action lists direct and via-kortrijk.
the name of [drive-gent-brugge, drive-brugge-oostende] is direct.
the name of [drive-gent-kortrijk, drive-kortrijk-brugge, drive-brugge-oostende] is via-kortrijk.
the label of direct is "Gent → Brugge → Oostende".
the label of via-kortrijk is "Gent → Kortrijk → Brugge → Oostende".

if the route of trip is ?actions and the name of ?actions is ?route
then the actions of ?route is ?actions.
if the actions of ?route is ?actions then ?route is an available-route.

# Add duration and cost along an action list. Multiply belief and comfort.
the duration of [] is 0.
the cost of [] is 0.
the belief of [] is 1.
the comfort of [] is 1.

the duration of [?action | ?rest] is ?value plus ?remaining
if the duration of ?action is ?value and the duration of ?rest is ?remaining.
the cost of [?action | ?rest] is ?value plus ?remaining
if the cost of ?action is ?value and the cost of ?rest is ?remaining.
the belief of [?action | ?rest] is ?value times ?remaining
if the belief of ?action is ?value and the belief of ?rest is ?remaining.
the comfort of [?action | ?rest] is ?value times ?remaining
if the comfort of ?action is ?value and the comfort of ?rest is ?remaining.

# A named route has the scores calculated from its actions.
the duration of ?route is ?value
if the actions of ?route is ?actions and the duration of ?actions is ?value.
the cost of ?route is ?value
if the actions of ?route is ?actions and the cost of ?actions is ?value.
the belief of ?route is ?value
if the actions of ?route is ?actions and the belief of ?actions is ?value.
the comfort of ?route is ?value
if the actions of ?route is ?actions and the comfort of ?actions is ?value.

# In this two-route map, recommend the route that wins on all four scores.
?route beats ?other
if ?route is an available-route and ?other is an available-route
and the duration of ?route is ?duration and the duration of ?other is ?other-duration
and ?duration is less than ?other-duration
and the cost of ?route is ?cost and the cost of ?other is ?other-cost
and ?cost is less than ?other-cost
and the belief of ?route is ?belief and the belief of ?other is ?other-belief
and ?belief is greater than ?other-belief
and the comfort of ?route is ?comfort and the comfort of ?other is ?other-comfort
and ?comfort is greater than ?other-comfort.

the recommended-route of trip is ?route if ?route beats ?other.
the outcome of trip is ?label
if the recommended-route of trip is ?route and the label of ?route is ?label.

# Answer: the available routes, their scores, and our choice.
what is the route of trip?
who is an available-route?
what is the duration of direct?
what is the cost of direct?
what is the belief of direct?
what is the comfort of direct?
what is the duration of via-kortrijk?
what is the cost of via-kortrijk?
what is the belief of via-kortrijk?
what is the comfort of via-kortrijk?
what is the recommended-route of trip?
what is the outcome of trip?

# Reason: trace the recommendation through every road, calculation, and comparison.
why?

# Check: both routes were found, and the computed scores support the choice.
check that there are 2 available-routes.
check that the route of trip is [drive-gent-brugge, drive-brugge-oostende].
check that the route of trip is [drive-gent-kortrijk, drive-kortrijk-brugge, drive-brugge-oostende].
check that the duration of direct is 2400.
check that the cost of direct is 0.01.
check that the belief of direct is 0.9408.
check that the comfort of direct is 0.99.
check that the duration of via-kortrijk is 4100.
check that the cost of via-kortrijk is 0.018.
check that the belief of via-kortrijk is 0.903168.
check that the comfort of via-kortrijk is 0.9801.
check that direct beats via-kortrijk.
check that not via-kortrijk beats direct.
check that the recommended-route of trip is direct.
check that not the recommended-route of trip is via-kortrijk.
check that the outcome of trip is "Gent → Brugge → Oostende".
check that not the route of [oostende, gent] is [drive-brugge-oostende, drive-gent-brugge].
