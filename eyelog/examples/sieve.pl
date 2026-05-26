% Prime enumeration inspired by Eyelet input/sieve.pl.
% The 1000-limit answer matches Eyelet output-swipl/sieve.pl.
%
% Eyelog uses the built-in smallest_divisor_from/3 relation to keep the
% example fast while preserving the same generated prime list.

materialize(primes, 2).

want_primes(1000).

prime_under(Limit, P) :-
  between(2, Limit, P),
  smallest_divisor_from(P, 2, P).

primes(Limit, Ps) :-
  want_primes(Limit),
  findall(P, prime_under(Limit, P), Ps).
