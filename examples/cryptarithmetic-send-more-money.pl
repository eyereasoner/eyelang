% Cryptarithmetic without cut: SEND + MORE = MONEY.
%
% Column constraints are applied as soon as possible so the finite digit search
% prunes early instead of enumerating every permutation.

digits([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]).

number4(A, B, C, D, N) :-
  mul(A, 1000, N1),
  mul(B, 100, N2),
  mul(C, 10, N3),
  add(N1, N2, T1),
  add(T1, N3, T2),
  add(T2, D, N).

number5(A, B, C, D, E, N) :-
  mul(A, 10000, N1),
  mul(B, 1000, N2),
  mul(C, 100, N3),
  mul(D, 10, N4),
  add(N1, N2, T1),
  add(T1, N3, T2),
  add(T2, N4, T3),
  add(T3, E, N).

send_more_money(solution(S, E, N, D, M, O, R, Y), Send, More, Money) :-
  digits(Digits),
  select(M, Digits, D0),
  eq(M, 1),

  select(D, D0, D1),
  select(E, D1, D2),
  add(D, E, Sum1),
  mod(Sum1, 10, Y),
  div(Sum1, 10, Carry1),
  select(Y, D2, D3),

  select(N, D3, D4),
  select(R, D4, D5),
  add(N, R, NR),
  add(NR, Carry1, Sum2),
  mod(Sum2, 10, E),
  div(Sum2, 10, Carry2),

  select(O, D5, D6),
  add(E, O, EO),
  add(EO, Carry2, Sum3),
  mod(Sum3, 10, N),
  div(Sum3, 10, Carry3),

  select(S, D6, _Rest),
  neq(S, 0),
  add(S, M, SM),
  add(SM, Carry3, Sum4),
  mod(Sum4, 10, O),
  div(Sum4, 10, M),

  number4(S, E, N, D, Send),
  number4(M, O, R, E, More),
  number5(M, O, N, E, Y, Money),
  add(Send, More, Money).

triple(send_more_money, status, solved) :-
  once(send_more_money(_Solution, _Send, _More, _Money)).

triple(send_more_money, assignment, Solution) :-
  once(send_more_money(Solution, _Send, _More, _Money)).

triple(send_more_money, equation, plus(Send, More, Money)) :-
  once(send_more_money(_Solution, Send, More, Money)).
