% Parametric deep taxonomy stress case.
taxonomy_depth(1000).

triple(:ind, a, :N0).
triple(:ind, a, Class) :- taxonomy_depth(Max), between(1, Max, N), atom_concat(:N, N, Class).
triple(:ind, a, Label) :- taxonomy_depth(Max), between(1, Max, N), atom_concat(:I, N, Label).
triple(:ind, a, Label) :- taxonomy_depth(Max), between(1, Max, N), atom_concat(:J, N, Label).
triple(:test, :is, true) :- taxonomy_depth(Max), atom_concat(:N, Max, Terminal), triple(:ind, a, Terminal).
