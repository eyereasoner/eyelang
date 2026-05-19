% Adapted from Eyeling's fundamental-theorem-arithmetic.n3.
% Compute a prime factorization by repeated smallest-divisor decomposition,
% then check product reconstruction and primality of the distinct factors.

case(:fta, 202692987).
expected_factors(:fta, [3, 3, 7, 829, 3881]).

% A divides B in positive integers.
divides(A, B) :-
  math:greaterThan(A, 0),
  math:greaterThan(B, 0),
  math:remainder(B, A, 0).

smallest_divisor_from(N, D, D) :-
  divides(D, N).

smallest_divisor_from(N, D, N) :-
  math:product(D, D, D2),
  math:greaterThan(D2, N).

smallest_divisor_from(N, D, S) :-
  not(divides(D, N)),
  math:product(D, D, D2),
  math:notGreaterThan(D2, N),
  math:sum(D, 1, D1),
  smallest_divisor_from(N, D1, S).

trial_prime(2).
trial_prime(3).
trial_prime(P) :-
  math:greaterThan(P, 3),
  smallest_divisor_from(P, 2, P).

factor_smallest(N, []) :-
  math:lessThan(N, 2).

factor_smallest(N, [N]) :-
  math:notLessThan(N, 2),
  smallest_divisor_from(N, 2, N).

factor_smallest(N, Factors) :-
  math:notLessThan(N, 2),
  smallest_divisor_from(N, 2, D),
  math:notEqualTo(D, N),
  math:integerQuotient(N, D, Q),
  factor_smallest(D, Left),
  factor_smallest(Q, Right),
  list:append(Left, Right, Factors).

factor_largest(N, Factors) :-
  factor_smallest(N, Smallest),
  list:reverse(Smallest, Factors).

product([], 1).
product([X|Rest], P) :-
  product(Rest, P0),
  math:product(X, P0, P).

all_expected_primes(true) :-
  trial_prime(3),
  trial_prime(7),
  trial_prime(829),
  trial_prime(3881).

triple(:case, :n, N) :-
  case(:fta, N).

triple(:case, :factorsSmallest, Factors) :-
  case(:fta, N),
  factor_smallest(N, Factors).

triple(:case, :factorsLargest, Factors) :-
  case(:fta, N),
  factor_largest(N, Factors).

triple(:case, :product, Product) :-
  case(:fta, N),
  factor_smallest(N, Factors),
  product(Factors, Product).

triple(:case, :expectedFactorsMatched, true) :-
  case(:fta, N),
  expected_factors(:fta, Factors),
  factor_smallest(N, Factors).

triple(:case, :productReconstructsInput, true) :-
  case(:fta, N),
  factor_smallest(N, Factors),
  product(Factors, N).

triple(:case, :distinctPrimeCount, 4) :-
  all_expected_primes(true).

triple(:case, :smallestPrimeFactor, 3) :-
  case(:fta, N),
  factor_smallest(N, [3|_]).

triple(:case, :largestPrimeFactor, 3881) :-
  case(:fta, N),
  factor_largest(N, [3881|_]).
