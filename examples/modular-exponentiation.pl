% Exact nonnegative integer powers modulo a positive integer.
% Repeated squaring keeps the intermediate integers small. A Fermat congruence
% alone is not a primality test: 561 = 3*11*17 passes for base 7.

:- table pow_mod/4.
pow_mod(_, 0, Modulus, Result) :-
  Modulus > 0, Result is 1 mod Modulus.
pow_mod(Base, Exponent, Modulus, Result) :-
  Exponent > 0, Modulus > 0, Exponent mod 2 =:= 0,
  Half is Exponent//2,
  pow_mod(Base, Half, Modulus, Value),
  Result is (Value*Value) mod Modulus.
pow_mod(Base, Exponent, Modulus, Result) :-
  Exponent > 0, Modulus > 0, Exponent mod 2 =:= 1,
  Half is Exponent//2,
  pow_mod(Base, Half, Modulus, Value),
  Result is (Base*Value*Value) mod Modulus.

% Answer and Reason
?- pow_mod(7, 560, 561, Result).
?- why.
?- pow_mod(2, 1000, 1009, Result).
?- pow_mod(12345678901234567890, 12345, 1000000007, Result).

% Check
:- assertion(pow_mod(7, 560, 561, 1)).
:- assertion(pow_mod(2, 1000, 1009, 942)).
:- assertion(pow_mod(99, 0, 1, 0)).
:- assertion(pow_mod(-2, 5, 7, 3)).
:- assertion(aggregate_all(count, pow_mod(2, -1, 7, _), 0)).
