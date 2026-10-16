% Peasant multiplication and exponentiation, as in ancient Egyptian arithmetic:
% halve one operand, double (or square) the other, and add (or multiply) in the
% rows where the halved operand was odd. Only halving, doubling and addition
% are needed for multiplication, and the integers stay exact however large
% they grow. Exponentiation also uses squaring and multiplication.
% Supply nonnegative integers.
:- table prod/2, pow/2.

prod([0, _], 0).
prod([X, Y], Z) :-
    X =\= 0,
    0 =:= X rem 2,
    S is X // 2,
    T is Y + Y,
    prod([S, T], Z).
prod([X, Y], Z) :-
    X =\= 0,
    1 =:= X rem 2,
    S is X // 2,
    T is Y + Y,
    prod([S, T], R),
    Z is R + Y.

pow([_, 0], 1).
pow([X, Y], Z) :-
    Y =\= 0,
    0 =:= Y rem 2,
    S is X * X,
    T is Y // 2,
    pow([S, T], Z).
pow([X, Y], Z) :-
    Y =\= 0,
    1 =:= Y rem 2,
    S is X * X,
    T is Y // 2,
    pow([S, T], R),
    Z is R * X.

% Answer and Reason
?- prod([3, 0], Product).
?- prod([5, 6], Product).
?- why.
?- prod([238, 13], Product).
?- prod([8367238, 27133], Product).
?- prod([62713345408367238, 40836723862713345], Product).
?- prod([4083672386271334562713345408367238, 4083672386271334562713345408367238], Product).
?- pow([3, 0], Power).
?- pow([5, 6], Power).
?- why.
?- pow([238, 13], Power).
?- pow([8367238, 2713], Power).

% Check
% Direct multiplication and exponentiation check the recursive algorithms.
:- assertion(prod([3, 0], 0)).
:- assertion(prod([5, 6], 30)).
:- assertion((prod([238, 13], Product), Product =:= 238 * 13)).
:- assertion((prod([8367238, 27133], Product), Product =:= 8367238 * 27133)).
:- assertion((prod([62713345408367238, 40836723862713345], Product),
              Product =:= 62713345408367238 * 40836723862713345)).
:- assertion((prod([4083672386271334562713345408367238, 4083672386271334562713345408367238], Product),
              Product =:= 4083672386271334562713345408367238 ^ 2)).
:- assertion(pow([3, 0], 1)).
:- assertion(pow([5, 6], 15625)).
:- assertion((pow([238, 13], Power), Power =:= 238 ^ 13)).
:- assertion((pow([8367238, 2713], Power), Power =:= 8367238 ^ 2713)).
