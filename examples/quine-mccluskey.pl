% Eyelet-inspired Quine-McCluskey minimization using findall/3 and sort/2.
% Problem: f(A,B,C,D) = Sigma m(1,3,7,11,15) + d(0,2,5).

minterm(1).
minterm(3).
minterm(7).
minterm(11).
minterm(15).

dont_care(0).
dont_care(2).
dont_care(5).

bits(0, [0, 0, 0, 0]).
bits(1, [0, 0, 0, 1]).
bits(2, [0, 0, 1, 0]).
bits(3, [0, 0, 1, 1]).
bits(4, [0, 1, 0, 0]).
bits(5, [0, 1, 0, 1]).
bits(6, [0, 1, 1, 0]).
bits(7, [0, 1, 1, 1]).
bits(8, [1, 0, 0, 0]).
bits(9, [1, 0, 0, 1]).
bits(10, [1, 0, 1, 0]).
bits(11, [1, 0, 1, 1]).
bits(12, [1, 1, 0, 0]).
bits(13, [1, 1, 0, 1]).
bits(14, [1, 1, 1, 0]).
bits(15, [1, 1, 1, 1]).

initial_pattern(P) :- minterm(M), bits(M, P).
initial_pattern(P) :- dont_care(D), bits(D, P).

combine(A, B, R) :-
  diff_count(A, B, 0, 1, [], Rev),
  reverse(Rev, R).

diff_count([], [], Count, Count, Acc, Acc).
diff_count([X | A], [X | B], Count, Max, Acc, R) :-
  diff_count(A, B, Count, Max, [X | Acc], R).
diff_count([X | A], [Y | B], Count, Max, Acc, R) :-
  neq(X, Y),
  add(Count, 1, Next),
  le(Next, Max),
  diff_count(A, B, Next, Max, [x | Acc], R).

combined_once(P) :-
  initial_pattern(A),
  initial_pattern(B),
  combine(A, B, P).

combined_twice(P) :-
  combined_once(A),
  combined_once(B),
  combine(A, B, P).

used_initial(P) :-
  initial_pattern(Q),
  combine(P, Q, _R).

used_once(P) :-
  combined_once(Q),
  combine(P, Q, _R).

prime(P) :-
  initial_pattern(P),
  not(used_initial(P)).
prime(P) :-
  combined_once(P),
  not(used_once(P)).
prime(P) :-
  combined_twice(P).

prime_implicants(Primes) :-
  findall(P, prime(P), Raw),
  sort(Raw, Primes).

covers([], []).
covers([x | Pattern], [_Bit | Bits]) :-
  covers(Pattern, Bits).
covers([Bit | Pattern], [Bit | Bits]) :-
  neq(Bit, x),
  covers(Pattern, Bits).

covers_int(Pattern, Int) :-
  bits(Int, Bits),
  covers(Pattern, Bits).

covers_all(_Cover, []).
covers_all(Cover, [M | Minterms]) :-
  member(P, Cover),
  covers_int(P, M),
  covers_all(Cover, Minterms).

minterms(Minterms) :-
  findall(M, minterm(M), Raw),
  sort(Raw, Minterms).

pair_from([A | Rest], A, B) :-
  member(B, Rest).
pair_from([_Head | Rest], A, B) :-
  pair_from(Rest, A, B).

cover_candidate(Cover) :-
  prime_implicants(Primes),
  pair_from(Primes, A, B),
  sort([A, B], Cover),
  minterms(Minterms),
  covers_all(Cover, Minterms).

minimal_cover(Cover) :-
  findall(C, cover_candidate(C), Raw),
  sort(Raw, [Cover | _Alternatives]).

triple(quine_mccluskey, primeImplicants, Primes) :-
  prime_implicants(Primes).

triple(quine_mccluskey, minimalCover, Cover) :-
  minimal_cover(Cover).

triple(quine_mccluskey, equation, "f = ~A~B + CD") :-
  minimal_cover([[0, 0, x, x], [x, x, 1, 1]]).

triple(quine_mccluskey, reason, "findall builds implicant sets and sort removes duplicates before cover selection").
