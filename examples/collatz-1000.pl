next_collatz(N, Next) :- mod(N, 2, 0), div(N, 2, Next).
next_collatz(N, Next) :- mod(N, 2, 1), mul(N, 3, T), add(T, 1, Next).
triple(:collatz, seed_871, length_179).
triple(:collatz_next, N, Next) :- between(1, 1000, N), next_collatz(N, Next).
