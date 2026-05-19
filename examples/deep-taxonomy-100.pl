% Parametric deep taxonomy stress case.
taxonomy_depth(100).

triple(ind, a, n0).
triple(ind, a, Class) :- taxonomy_depth(Max), between(1, Max, N), atom_concat(n, N, Class).
triple(ind, a, Label) :- taxonomy_depth(Max), between(1, Max, N), atom_concat(i, N, Label).
triple(ind, a, Label) :- taxonomy_depth(Max), between(1, Max, N), atom_concat(j, N, Label).
triple(test, is, true) :- taxonomy_depth(Max), atom_concat(n, Max, Terminal), triple(ind, a, Terminal).
