% Fast exponentiation examples adapted from Eyeling fastpow.n3.

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

pow_mod(_Base, 0, _Mod, 1).
pow_mod(Base, Exp, Mod, Value) :-
  gt(Exp, 0),
  mod(Exp, 2, 0),
  div(Exp, 2, Half),
  pow_mod(Base, Half, Mod, HalfValue),
  mul(HalfValue, HalfValue, Square),
  mod(Square, Mod, Value).
pow_mod(Base, Exp, Mod, Value) :-
  gt(Exp, 0),
  mod(Exp, 2, 1),
  sub(Exp, 1, EvenExp),
  pow_mod(Base, EvenExp, Mod, EvenValue),
  mul(Base, EvenValue, Product),
  mod(Product, Mod, Value).

% Tetration values from the Eyeling output set.
tower(2, 4, 65536).
tower_mod(2, 5, 1000000, 156736).

triple([2, 10], :pow, Value) :- pow(2, 10, Value).
triple([2, 10], :powSlow, Value) :- pow(2, 10, Value).
triple([2, 10000], :powMod1e6, Value) :- pow_mod(2, 10000, 1000000, Value).
triple([3, 10000], :powMod1e6, Value) :- pow_mod(3, 10000, 1000000, Value).
triple([2, 4], :tower, Value) :- tower(2, 4, Value).
triple([2, 5], :towerMod1e6, Value) :- tower_mod(2, 5, 1000000, Value).
