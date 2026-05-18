% BigInt Fibonacci via fast doubling, implemented in Prolog using generic
% decimal add/sub/mul built-ins.
fib_case(:fib8, 8).
fib_case(:fib10000, 10000).

fib(N, Value) :- fib_pair(N, Value, _Next).

fib_pair(0, 0, 1).
fib_pair(N, F, G) :-
  gt(N, 0),
  div(N, 2, Half),
  fib_pair(Half, A, B),
  mul(B, 2, TwoB),
  sub(TwoB, A, TwoBMinusA),
  mul(A, TwoBMinusA, C),
  mul(A, A, AA),
  mul(B, B, BB),
  add(AA, BB, D),
  mod(N, 2, 0),
  eq(F, C),
  eq(G, D).
fib_pair(N, F, G) :-
  gt(N, 0),
  div(N, 2, Half),
  fib_pair(Half, A, B),
  mul(B, 2, TwoB),
  sub(TwoB, A, TwoBMinusA),
  mul(A, TwoBMinusA, C),
  mul(A, A, AA),
  mul(B, B, BB),
  add(AA, BB, D),
  mod(N, 2, 1),
  add(C, D, Next),
  eq(F, D),
  eq(G, Next).

triple(:test, Predicate, Value) :-
  fib_case(Predicate, N),
  fib(N, Value).
