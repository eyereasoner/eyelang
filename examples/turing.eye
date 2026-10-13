# A Turing machine reads a tape, writes one symbol, and moves left or right.
# This machine adds one to a binary number. blank means an empty tape cell.
# A transition maps [machine, state, read] to [next-state, write, movement].
the start of add-one is scan.
the transition of [add-one, scan, 0] is [scan, 0, right].
the transition of [add-one, scan, 1] is [scan, 1, right].
the transition of [add-one, scan, blank] is [carry, blank, left].
the transition of [add-one, carry, 0] is [halt, 1, stay].
the transition of [add-one, carry, 1] is [carry, 0, left].
the transition of [add-one, carry, blank] is [halt, 1, stay].

# Change an input list, or add another case using the same machine.
the machine of case1 is add-one.
the input of case1 is [1, 0, 1, 0, 0, 1].
the machine of case2 is add-one.
the input of case2 is [1, 0, 1, 1, 1, 1].
the machine of case3 is add-one.
the input of case3 is [1, 1, 1, 1, 1, 1].
the machine of case4 is add-one.
the input of case4 is [].

# The rules below run any machine described by this transition-table shape.
# A configuration is [state, reversed-left-tape, current-symbol, right-tape].
# [first | second] separates the first item from the rest of a list.
if the machine of ?case is ?machine and the start of ?machine is ?state
and the input of ?case is [?symbol | ?rest]
then ?case runs [?state, [], ?symbol, ?rest].

if the machine of ?case is ?machine and the start of ?machine is ?state
and the input of ?case is []
then ?case runs [?state, [], blank, []].

# Write the symbol and move right, extending the tape with blank if needed.
if ?case runs [?state, ?left, ?read, [?next-symbol | ?right]]
and the machine of ?case is ?machine
and the transition of [?machine, ?state, ?read] is [?next-state, ?write, right]
then ?case runs [?next-state, [?write | ?left], ?next-symbol, ?right].

if ?case runs [?state, ?left, ?read, []]
and the machine of ?case is ?machine
and the transition of [?machine, ?state, ?read] is [?next-state, ?write, right]
then ?case runs [?next-state, [?write | ?left], blank, []].

# Write the symbol and move left, extending the tape with blank if needed.
if ?case runs [?state, [?previous | ?left], ?read, ?right]
and the machine of ?case is ?machine
and the transition of [?machine, ?state, ?read] is [?next-state, ?write, left]
then ?case runs [?next-state, ?left, ?previous, [?write | ?right]].

if ?case runs [?state, [], ?read, ?right]
and the machine of ?case is ?machine
and the transition of [?machine, ?state, ?read] is [?next-state, ?write, left]
then ?case runs [?next-state, [], blank, [?write | ?right]].

# A stay instruction writes without moving the head.
if ?case runs [?state, ?left, ?read, ?right]
and the machine of ?case is ?machine
and the transition of [?machine, ?state, ?read] is [?next-state, ?write, stay]
then ?case runs [?next-state, ?left, ?write, ?right].

# On halt, turn the reversed left side around and join it to the rest.
if ?case runs [halt, ?left, ?symbol, ?right]
then the unfinished-output of ?case is [?left, [?symbol | ?right]].

if the unfinished-output of ?case is [[?symbol | ?left], ?right]
then the unfinished-output of ?case is [?left, [?symbol | ?right]].

if the unfinished-output of ?case is [[], ?output]
then the output of ?case is ?output.

if the output of ?case is ?output then ?case is a finished-case.

# Answer: read each input and its computed output.
what is the input of case1?
what is the input of case2?
what is the input of case3?
what is the input of case4?

what is the output of case1?
what is the output of case2?
what is the output of case3?
what is the output of case4?

# Reason: show how even an empty tape becomes one.
why?
who is a finished-case?

# Check: 41 + 1 = 42, 47 + 1 = 48, 63 + 1 = 64, and empty + 1 = 1.
# The trailing blank is a tape cell, not a binary digit.
check that the output of case1 is [1, 0, 1, 0, 1, 0, blank].
check that the output of case2 is [1, 1, 0, 0, 0, 0, blank].
check that the output of case3 is [1, 0, 0, 0, 0, 0, 0, blank].
check that the output of case4 is [1, blank].
check that there are 4 finished-cases.
