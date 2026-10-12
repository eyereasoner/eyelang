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
the route of [first, second] is [third]
if the road of [first, second] is third.

the route of [first, second] is [third | fourth]
if the road of [first, fifth] is third
and the route of [fifth, second] is fourth.

the route of trip is first
if the location of traveller is second
and the destination of trip is third
and the route of [second, third] is first.

# Give the two possible action lists friendly names, once their routes exist.
the name of [drive-gent-brugge, drive-brugge-oostende] is direct.
the name of [drive-gent-kortrijk, drive-kortrijk-brugge, drive-brugge-oostende] is via-kortrijk.
the label of direct is "Gent → Brugge → Oostende".
the label of via-kortrijk is "Gent → Kortrijk → Brugge → Oostende".

if the route of trip is first and the name of first is second
then the actions of second is first.
if the actions of first is second then first is an available-route.

# Add duration and cost along an action list. Multiply belief and comfort.
the duration of [] is 0.
the cost of [] is 0.
the belief of [] is 1.
the comfort of [] is 1.

the duration of [first | second] is third plus fourth
if the duration of first is third and the duration of second is fourth.
the cost of [first | second] is third plus fourth
if the cost of first is third and the cost of second is fourth.
the belief of [first | second] is third times fourth
if the belief of first is third and the belief of second is fourth.
the comfort of [first | second] is third times fourth
if the comfort of first is third and the comfort of second is fourth.

# A named route has the scores calculated from its actions.
the duration of first is second
if the actions of first is third and the duration of third is second.
the cost of first is second
if the actions of first is third and the cost of third is second.
the belief of first is second
if the actions of first is third and the belief of third is second.
the comfort of first is second
if the actions of first is third and the comfort of third is second.

# In this two-route map, recommend the route that wins on all four scores.
first beats second
if first is an available-route and second is an available-route
and the duration of first is third and the duration of second is fourth
and third is less than fourth
and the cost of first is fifth and the cost of second is sixth
and fifth is less than sixth
and the belief of first is seventh and the belief of second is eighth
and seventh is greater than eighth
and the comfort of first is ninth and the comfort of second is tenth
and ninth is greater than tenth.

the recommended-route of trip is first if first beats second.
the outcome of trip is first
if the recommended-route of trip is second and the label of second is first.

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
