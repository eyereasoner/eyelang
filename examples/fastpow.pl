% Fast exponentiation implemented in Prolog.
pow_case(:two_to_ten, 2, 10).
pow_case(:three_to_seven, 3, 7).

pow(_Base, 0, 1).
pow(Base, Exp, Value) :-
  gt(Exp, 0),
  mod(Exp, 2, 0),
  div(Exp, 2, Half),
  pow(Base, Half, HalfValue),
  mul(HalfValue, HalfValue, Value).
pow(Base, Exp, Value) :-
  gt(Exp, 0),
  mod(Exp, 2, 1),
  sub(Exp, 1, EvenExp),
  pow(Base, EvenExp, EvenValue),
  mul(Base, EvenValue, Value).

triple(:power, Name, Value) :-
  pow_case(Name, Base, Exp),
  pow(Base, Exp, Value).
