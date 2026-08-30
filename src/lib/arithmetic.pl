/** Integer arithmetic helpers used by Scryer's CLP(Z) source. */

:- module(arithmetic, [
    lsb/2,
    msb/2,
    number_to_rational/2,
    popcount/2,
    rational_numerator_denominator/3
]).

:- use_module(library(error), [must_be/2, domain_error/3]).

lsb(X, N) :-
    must_be(integer, X),
    ( X < 1 -> domain_error(not_less_than_one, X, lsb/2)
    ; Low is X /\ (-X), arithmetic__msb(Low, -1, N)
    ).

msb(X, N) :-
    must_be(integer, X),
    ( X < 1 -> domain_error(not_less_than_one, X, msb/2)
    ; Shifted is X >> 1, arithmetic__msb(Shifted, 0, N)
    ).

arithmetic__msb(0, N, N) :- !.
arithmetic__msb(X, N0, N) :-
    X1 is X >> 1,
    N1 is N0 + 1,
    arithmetic__msb(X1, N1, N).

popcount(X, Count) :-
    must_be(integer, X),
    ( X < 0 -> domain_error(not_less_than_zero, X, popcount/2)
    ; arithmetic__popcount(X, 0, Count)
    ).

arithmetic__popcount(0, Count, Count) :- !.
arithmetic__popcount(X, Count0, Count) :-
    Bit is X /\ 1,
    Count1 is Count0 + Bit,
    X1 is X >> 1,
    arithmetic__popcount(X1, Count1, Count).


% Rational-form compatibility. EyeProlog currently has integer and float
% processor values; non-integral results are represented canonically as the
% ordinary term rdiv(Numerator, Denominator).
number_to_rational(Number, Rational) :-
    eyeprolog__number_to_rational(Number, Rational).

rational_numerator_denominator(Rational, Numerator, Denominator) :-
    eyeprolog__rational_numerator_denominator(Rational, Numerator, Denominator).
