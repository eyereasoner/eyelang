% Parametric deep taxonomy stress case.
materialize(a, 2).
materialize(is, 2).

taxonomy_depth(1000).

a(ind, n0).
a(ind, Class) :- taxonomy_depth(Max), between(1, Max, N), atom_concat(n, N, Class).
a(ind, Label) :- taxonomy_depth(Max), between(1, Max, N), atom_concat(i, N, Label).
a(ind, Label) :- taxonomy_depth(Max), between(1, Max, N), atom_concat(j, N, Label).
is(test, true) :- taxonomy_depth(Max), atom_concat(n, Max, Terminal), a(ind, Terminal).
