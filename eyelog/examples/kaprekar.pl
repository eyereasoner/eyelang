% Kaprekar's constant demo, adapted from Eyelet's input/kaprekar.pl.
%
% This is deliberately a rule-level example, not a native builtin.  It extracts
% four digits, sorts them, subtracts ascending from descending, and recurses
% until Kaprekar's constant 6174 is reached.  The sample set is small so the
% example remains a millisecond-scale demo in the normal test suite.

materialize(constant, 2).
materialize(kaprekarSteps, 2).
materialize(reachesConstant, 2).

memoize(kaprekar, 3).

number_to_digits(A, [B, C, D, E]) :-
  div(A, 1000, B),
  mod(A, 1000, F),
  div(F, 100, C),
  mod(F, 100, G),
  div(G, 10, D),
  mod(G, 10, E).

digits_to_number([A, B, C, D], N) :-
  mul(A, 1000, A1),
  mul(B, 100, B1),
  mul(C, 10, C1),
  add(A1, B1, T1),
  add(T1, C1, T2),
  add(T2, D, N).

select_min([X|Xs], Min, Rest) :-
  select_min_acc(Xs, X, [], Min, RevRest),
  reverse(RevRest, Rest).

select_min_acc([], Min, Rest, Min, Rest).
select_min_acc([X|Xs], CurrentMin, Acc, Min, Rest) :-
  le(CurrentMin, X),
  select_min_acc(Xs, CurrentMin, [X|Acc], Min, Rest).
select_min_acc([X|Xs], CurrentMin, Acc, Min, Rest) :-
  gt(CurrentMin, X),
  select_min_acc(Xs, X, [CurrentMin|Acc], Min, Rest).

sort_digits([], []).
sort_digits(List, [Min|Sorted]) :-
  select_min(List, Min, Rest),
  sort_digits(Rest, Sorted).

kaprekar(6174, Count, Count).

kaprekar(A, B, C) :-
  neq(A, 6174),
  gt(A, 0),
  number_to_digits(A, Digits),
  sort_digits(Digits, Asc),
  reverse(Asc, Desc),
  digits_to_number(Asc, Low),
  digits_to_number(Desc, High),
  sub(High, Low, Next),
  add(B, 1, Count),
  eq(Next, 6174),
  eq(C, Count).

kaprekar(A, B, C) :-
  neq(A, 6174),
  gt(A, 0),
  number_to_digits(A, Digits),
  sort_digits(Digits, Asc),
  reverse(Asc, Desc),
  digits_to_number(Asc, Low),
  digits_to_number(Desc, High),
  sub(High, Low, Next),
  gt(Next, 0),
  neq(Next, 6174),
  add(B, 1, Count),
  kaprekar(Next, Count, C).

recursion_count(N, Count) :-
  kaprekar(N, 0, Count).

sample(3524).
sample(2111).
sample(9831).
sample(6174).
constant(kaprekar, 6174).

kaprekarSteps(N, Count) :-
  sample(N),
  recursion_count(N, Count).

reachesConstant(kaprekar, N) :-
  sample(N),
  recursion_count(N, _Count).
