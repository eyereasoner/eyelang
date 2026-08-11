/** Reproducible pseudo-random values with explicit state. */

:- module(random, [random/3]).

% A Park-Miller generator with explicit state. Threading Seed into the next
% call makes a sequence reproducible without mutable runtime state. Schrage's
% method keeps every intermediate integer within the exact 32-bit range.
random(Seed0, Value, Seed) :-
    integer(Seed0),
    random__random_normalize_seed(Seed0, Normalized),
    High is Normalized // 44488,
    Low is Normalized mod 44488,
    Candidate is 48271 * Low - 3399 * High,
    random__random_wrap(Candidate, Seed),
    Value is (Seed - 1) / 2147483646.

random__random_normalize_seed(Seed, 1) :-
    0 is Seed mod 2147483647,
    !.
random__random_normalize_seed(Seed, Normalized) :-
    Normalized is Seed mod 2147483647.

random__random_wrap(Candidate, Candidate) :- Candidate > 0, !.
random__random_wrap(Candidate, Seed) :- Seed is Candidate + 2147483647.
