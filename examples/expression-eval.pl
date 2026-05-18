% Tiny expression evaluator adapted from Eyeling's expression-eval.n3 example.
% Data: (2 * 3) + (10 - 4) = 12.
number(:n2, 2).
number(:n3, 3).
number(:n10, 10).
number(:n4, 4).

expr(:eMul, :mul, :n2, :n3).
expr(:eSub, :sub, :n10, :n4).
expr(:eAdd, :add, :eMul, :eSub).
root(:eAdd).

value(Node, Value) :-
  number(Node, Value).

value(Node, Value) :-
  expr(Node, :add, Left, Right),
  value(Left, LeftValue),
  value(Right, RightValue),
  add(LeftValue, RightValue, Value).

value(Node, Value) :-
  expr(Node, :sub, Left, Right),
  value(Left, LeftValue),
  value(Right, RightValue),
  sub(LeftValue, RightValue, Value).

value(Node, Value) :-
  expr(Node, :mul, Left, Right),
  value(Left, LeftValue),
  value(Right, RightValue),
  mul(LeftValue, RightValue, Value).

triple(:Root, :result, Value) :-
  root(Node),
  value(Node, Value).
