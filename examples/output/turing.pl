triple(case1, addsOne, true).
triple(case1, input, [1, 0, 1, 0, 0, 1]).
triple(case1, output, [1, 0, 1, 0, 1, 0, #]).
triple(case2, addsOne, true).
triple(case2, input, [1, 0, 1, 1, 1, 1]).
triple(case2, output, [1, 1, 0, 0, 0, 0, #]).
triple(case3, addsOne, true).
triple(case3, input, [1, 1, 1, 1, 1, 1]).
triple(case3, output, [1, 0, 0, 0, 0, 0, 0, #]).
triple(case4, addsOne, true).
triple(case4, input, []).
triple(case4, output, [1, #]).
