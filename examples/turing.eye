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
if the machine of someone is first and the start of first is second
and the input of someone is [third | fourth]
then someone runs [second, [], third, fourth].

if the machine of someone is first and the start of first is second
and the input of someone is []
then someone runs [second, [], blank, []].

# Write the symbol and move right, extending the tape with blank if needed.
if someone runs [first, second, third, [fourth | fifth]]
and the machine of someone is sixth
and the transition of [sixth, first, third] is [seventh, eighth, right]
then someone runs [seventh, [eighth | second], fourth, fifth].

if someone runs [first, second, third, []]
and the machine of someone is fourth
and the transition of [fourth, first, third] is [fifth, sixth, right]
then someone runs [fifth, [sixth | second], blank, []].

# Write the symbol and move left, extending the tape with blank if needed.
if someone runs [first, [second | third], fourth, fifth]
and the machine of someone is sixth
and the transition of [sixth, first, fourth] is [seventh, eighth, left]
then someone runs [seventh, third, second, [eighth | fifth]].

if someone runs [first, [], second, third]
and the machine of someone is fourth
and the transition of [fourth, first, second] is [fifth, sixth, left]
then someone runs [fifth, [], blank, [sixth | third]].

# A stay instruction writes without moving the head.
if someone runs [first, second, third, fourth]
and the machine of someone is fifth
and the transition of [fifth, first, third] is [sixth, seventh, stay]
then someone runs [sixth, second, seventh, fourth].

# On halt, turn the reversed left side around and join it to the rest.
if someone runs [halt, first, number, second]
then the unfinished-output of someone is [first, [number | second]].

if the unfinished-output of someone is [[first | second], something]
then the unfinished-output of someone is [second, [first | something]].

if the unfinished-output of someone is [[], something]
then the output of someone is something.

if the output of someone is something then someone is a finished-case.

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
