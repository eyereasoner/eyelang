% Generic Towers of Hanoi move generation.
hanoi_size(3).

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

hanoi_move(1, From, To, _Via, 1, Text) :-
  str_concat("move disk 1 from ", From, A),
  str_concat(A, " to ", B),
  str_concat(B, To, Text).

hanoi_move(N, From, To, Via, Step, Text) :-
  gt(N, 1),
  sub(N, 1, N1),
  pow(2, N1, Pow),
  sub(Pow, 1, Half),
  le(Step, Half),
  hanoi_move(N1, From, Via, To, Step, Text).

hanoi_move(N, From, To, _Via, Step, Text) :-
  gt(N, 1),
  sub(N, 1, N1),
  pow(2, N1, Pow),
  eq(Step, Pow),
  str_concat("move disk ", N, A),
  str_concat(A, " from ", B),
  str_concat(B, From, C),
  str_concat(C, " to ", D),
  str_concat(D, To, Text).

hanoi_move(N, From, To, Via, Step, Text) :-
  gt(N, 1),
  sub(N, 1, N1),
  pow(2, N1, Pow),
  gt(Step, Pow),
  sub(Step, Pow, Step2),
  hanoi_move(N1, Via, To, From, Step2, Text).

triple(:hanoi, Step, Text) :-
  hanoi_size(N),
  pow(2, N, Pow),
  sub(Pow, 1, MaxStep),
  between(1, MaxStep, Step),
  hanoi_move(N, left, right, middle, Step, Text).
