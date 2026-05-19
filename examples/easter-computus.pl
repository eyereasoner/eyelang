% Adapted from Eyeling's easter.n3.
% Gregorian computus for a sample decade, with independent range/window checks.

case(:y2026, 2026).
case(:y2027, 2027).
case(:y2028, 2028).
case(:y2029, 2029).
case(:y2030, 2030).
case(:y2031, 2031).
case(:y2032, 2032).
case(:y2033, 2033).
case(:y2034, 2034).
case(:y2035, 2035).

valid_golden(N) :- between(0, 18, N).
valid_epact(N) :- between(0, 29, N).
valid_weekday(N) :- between(0, 6, N).
legal_easter_date(3, D) :- between(22, 31, D).
legal_easter_date(4, D) :- between(1, 25, D).
month_name(3, :March).
month_name(4, :April).

computus(Case, Year, Month, Day, J, K, Q, R, V, Z) :-
  case(Case, Year),
  math:remainder(Year, 19, J),
  math:integerQuotient(Year, 100, K),
  math:remainder(Year, 100, H),
  math:integerQuotient(K, 4, M),
  math:remainder(K, 4, N),
  math:sum(K, 8, KP8),
  math:integerQuotient(KP8, 25, P),
  math:difference(K, P, KminusP),
  math:sum(KminusP, 1, KminusPplus1),
  math:integerQuotient(KminusPplus1, 3, Q),
  math:product(19, J, NineteenJ),
  math:sum(NineteenJ, K, T1),
  math:difference(T1, M, T2),
  math:difference(T2, Q, T3),
  math:sum(T3, 15, T4),
  math:remainder(T4, 30, R),
  math:integerQuotient(H, 4, S),
  math:remainder(H, 4, U),
  math:product(2, N, TwoN),
  math:product(2, S, TwoS),
  math:sum(32, TwoN, L1),
  math:sum(L1, TwoS, L2),
  math:difference(L2, R, L3),
  math:difference(L3, U, L4),
  math:remainder(L4, 7, V),
  math:product(11, R, ElevenR),
  math:product(22, V, TwentyTwoV),
  math:sum(J, ElevenR, W1),
  math:sum(W1, TwentyTwoV, W2),
  math:integerQuotient(W2, 451, W),
  math:product(7, W, SevenW),
  math:sum(R, V, X1),
  math:difference(X1, SevenW, X2),
  math:sum(X2, 114, X3),
  math:integerQuotient(X3, 31, Month),
  math:remainder(X3, 31, Z),
  math:sum(Z, 1, Day).

checks_pass(Case) :-
  computus(Case, _Year, Month, Day, J, _K, _Q, R, V, _Z),
  valid_golden(J),
  valid_epact(R),
  valid_weekday(V),
  month_name(Month, _Name),
  legal_easter_date(Month, Day).

triple(Case, :easterDate, date(Year, MonthName, Day)) :-
  computus(Case, Year, Month, Day, _J, _K, _Q, _R, _V, _Z),
  month_name(Month, MonthName).

triple(Case, :computusRemainders, remainders(J, R, V)) :-
  computus(Case, _Year, _Month, _Day, J, _K, _Q, R, V, _Z).

triple(Case, :legalGregorianWindow, true) :-
  checks_pass(Case).
