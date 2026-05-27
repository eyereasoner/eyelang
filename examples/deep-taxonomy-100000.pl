% Parametric deep taxonomy stress case.
materialize(a, 2).
materialize(is, 2).

taxonomy_depth(100000).

a(ind, n0).
a(ind, Label) :- taxonomy_depth(Max), atom_ranges([n, i, j], 1, Max, Label).
is(test, true) :- taxonomy_depth(Max), atom_concat(n, Max, Terminal), a(ind, Terminal).
