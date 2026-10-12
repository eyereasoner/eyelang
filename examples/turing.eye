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
if the machine of someone is something
and the start of something is first
then the initial-state of someone is first.

if the machine of someone is first
and the transition of [first, second, number] is something
then the instruction of [someone, second, number] is something.

# A configuration is [state, reversed-left-tape, current-symbol, right-tape].
# [first | second] separates the first item from the rest of a list.
if the input of someone is [first | second]
and the initial-state of someone is number
then someone runs [number, [], first, second].

if the input of someone is []
and the initial-state of someone is first
then someone runs [first, [], blank, []].

# Find the instruction for this state and the symbol under the head.
if someone runs [first, something, number, second]
then the tape of [someone, first, number] is [something, second].

if the tape of [someone, first, number] is second
and the instruction of [someone, first, number] is something
then someone moves [something, second].

# Write the symbol and move right, extending the tape with blank if needed.
if someone moves [[first, number, right], [something, second]]
then someone shifts [first, [number | something], second].

if someone shifts [first, something, [number | second]]
then someone runs [first, something, number, second].

if someone shifts [first, something, []]
then someone runs [first, something, blank, []].

# Write the symbol and move left, extending the tape with blank if needed.
if someone moves [[first, number, left], [something, second]]
then someone slides [first, something, [number | second]].

if someone slides [first, [number | something], second]
then someone runs [first, something, number, second].

if someone slides [first, [], second]
then someone runs [first, [], blank, second].

# A stay instruction writes without moving the head.
if someone moves [[first, number, stay], [something, second]]
then someone runs [first, something, number, second].

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
