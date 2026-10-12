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
the route of [someone, something] is [first]
if the road of [someone, something] is first.

the route of [someone, something] is [first | second]
if the road of [someone, number] is first
and the route of [number, something] is second.

the route of trip is first
if the location of traveller is someone
and the destination of trip is something
and the route of [someone, something] is first.

# Give the two possible action lists friendly names, once their routes exist.
the name of [drive-gent-brugge, drive-brugge-oostende] is direct.
the name of [drive-gent-kortrijk, drive-kortrijk-brugge, drive-brugge-oostende] is via-kortrijk.
the label of direct is "Gent → Brugge → Oostende".
the label of via-kortrijk is "Gent → Kortrijk → Brugge → Oostende".

if the route of trip is someone and the name of someone is something
then the actions of something is someone.
if the actions of someone is something then someone is an available-route.

# Add duration and cost along an action list. Multiply belief and comfort.
the duration of [] is 0.
the cost of [] is 0.
the belief of [] is 1.
the comfort of [] is 1.

the duration of [someone | something] is first plus second
if the duration of someone is first and the duration of something is second.
the cost of [someone | something] is first plus second
if the cost of someone is first and the cost of something is second.
the belief of [someone | something] is first times second
if the belief of someone is first and the belief of something is second.
the comfort of [someone | something] is first times second
if the comfort of someone is first and the comfort of something is second.

# A named route has the scores calculated from its actions.
the duration of someone is second
if the actions of someone is first and the duration of first is second.
the cost of someone is second
if the actions of someone is first and the cost of first is second.
the belief of someone is second
if the actions of someone is first and the belief of first is second.
the comfort of someone is second
if the actions of someone is first and the comfort of first is second.

someone is-faster-than something
if the duration of someone is first and the duration of something is second
and first is less than second.
someone is-cheaper-than something
if the cost of someone is first and the cost of something is second
and first is less than second.
someone is-more-reliable-than something
if the belief of someone is first and the belief of something is second
and first is greater than second.
someone is-more-comfortable-than something
if the comfort of someone is first and the comfort of something is second
and first is greater than second.

# In this two-route map, recommend the route that wins on all four scores.
someone beats something
if someone is an available-route and something is an available-route
and someone is-faster-than something and someone is-cheaper-than something
and someone is-more-reliable-than something and someone is-more-comfortable-than something.

the recommended-route of trip is someone if someone beats something.
the outcome of trip is first
if the recommended-route of trip is someone and the label of someone is first.

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
check that direct is-faster-than via-kortrijk.
check that direct is-cheaper-than via-kortrijk.
check that direct is-more-reliable-than via-kortrijk.
check that direct is-more-comfortable-than via-kortrijk.
check that the recommended-route of trip is direct.
check that not the recommended-route of trip is via-kortrijk.
check that the outcome of trip is "Gent → Brugge → Oostende".
check that not the route of [oostende, gent] is [drive-brugge-oostende, drive-gent-brugge].
