triple(quine_mccluskey, equation, "f = ~A~B + CD").
triple(quine_mccluskey, minimalCover, [[0, 0, x, x], [x, x, 1, 1]]).
triple(quine_mccluskey, primeImplicants, [[0, 0, x, x], [0, x, x, 1], [x, x, 1, 1]]).
triple(quine_mccluskey, reason, "findall builds implicant sets and sort removes duplicates before cover selection").
