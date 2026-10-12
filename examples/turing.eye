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
if the machine of first is second and the start of second is third
and the input of first is [fourth | fifth]
then first runs [third, [], fourth, fifth].

if the machine of first is second and the start of second is third
and the input of first is []
then first runs [third, [], blank, []].

# Write the symbol and move right, extending the tape with blank if needed.
if first runs [second, third, fourth, [fifth | sixth]]
and the machine of first is seventh
and the transition of [seventh, second, fourth] is [eighth, ninth, right]
then first runs [eighth, [ninth | third], fifth, sixth].

if first runs [second, third, fourth, []]
and the machine of first is fifth
and the transition of [fifth, second, fourth] is [sixth, seventh, right]
then first runs [sixth, [seventh | third], blank, []].

# Write the symbol and move left, extending the tape with blank if needed.
if first runs [second, [third | fourth], fifth, sixth]
and the machine of first is seventh
and the transition of [seventh, second, fifth] is [eighth, ninth, left]
then first runs [eighth, fourth, third, [ninth | sixth]].

if first runs [second, [], third, fourth]
and the machine of first is fifth
and the transition of [fifth, second, third] is [sixth, seventh, left]
then first runs [sixth, [], blank, [seventh | fourth]].

# A stay instruction writes without moving the head.
if first runs [second, third, fourth, fifth]
and the machine of first is sixth
and the transition of [sixth, second, fourth] is [seventh, eighth, stay]
then first runs [seventh, third, eighth, fifth].

# On halt, turn the reversed left side around and join it to the rest.
if first runs [halt, second, third, fourth]
then the unfinished-output of first is [second, [third | fourth]].

if the unfinished-output of first is [[second | third], fourth]
then the unfinished-output of first is [third, [second | fourth]].

if the unfinished-output of first is [[], second]
then the output of first is second.

if the output of first is second then first is a finished-case.

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
