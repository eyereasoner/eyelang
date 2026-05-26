% Cryptarithmetic without cut.
%
% Two column-pruned puzzles are included.  SEND + MORE = MONEY is the classic
% eight-letter puzzle, and DONALD + GERALD = ROBERT uses all ten digits across
% a six-column addition.  Each column constraint is applied as soon as possible
% so the finite digit search prunes early without cut.

materialize(status, 2).
materialize(assignment, 2).
materialize(equation, 2).

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

number6(A, B, C, D, E, F, N) :-
  mul(A, 100000, N1),
  mul(B, 10000, N2),
  mul(C, 1000, N3),
  mul(D, 100, N4),
  mul(E, 10, N5),
  add(N1, N2, T1),
  add(T1, N3, T2),
  add(T2, N4, T3),
  add(T3, N5, T4),
  add(T4, F, N).

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

donald_gerald_robert(solution(D, O, N, A, L, G, E, R, B, T), Donald, Gerald, Robert) :-
  digits(Digits),

  select(D, Digits, D0),
  neq(D, 0),
  select(G, D0, D1),
  neq(G, 0),

  select(T, D1, D2),
  add(D, D, Sum1),
  mod(Sum1, 10, T),
  div(Sum1, 10, Carry1),

  select(L, D2, D3),
  select(R, D3, D4),
  neq(R, 0),
  add(L, L, LL),
  add(LL, Carry1, Sum2),
  mod(Sum2, 10, R),
  div(Sum2, 10, Carry2),

  select(A, D4, D5),
  select(E, D5, D6),
  add(A, A, AA),
  add(AA, Carry2, Sum3),
  mod(Sum3, 10, E),
  div(Sum3, 10, Carry3),

  select(N, D6, D7),
  select(B, D7, D8),
  add(N, R, NR),
  add(NR, Carry3, Sum4),
  mod(Sum4, 10, B),
  div(Sum4, 10, Carry4),

  select(O, D8, _Rest),
  add(O, E, OE),
  add(OE, Carry4, Sum5),
  mod(Sum5, 10, O),
  div(Sum5, 10, Carry5),

  add(D, G, DG),
  add(DG, Carry5, R),

  number6(D, O, N, A, L, D, Donald),
  number6(G, E, R, A, L, D, Gerald),
  number6(R, O, B, E, R, T, Robert),
  add(Donald, Gerald, Robert).

status(send_more_money, solved) :-
  once(send_more_money(_Solution, _Send, _More, _Money)).

assignment(send_more_money, Solution) :-
  once(send_more_money(Solution, _Send, _More, _Money)).

equation(send_more_money, plus(Send, More, Money)) :-
  once(send_more_money(_Solution, Send, More, Money)).

status(donald_gerald_robert, solved) :-
  once(donald_gerald_robert(_Solution, _Donald, _Gerald, _Robert)).

assignment(donald_gerald_robert, Solution) :-
  once(donald_gerald_robert(Solution, _Donald, _Gerald, _Robert)).

equation(donald_gerald_robert, plus(Donald, Gerald, Robert)) :-
  once(donald_gerald_robert(_Solution, Donald, Gerald, Robert)).
