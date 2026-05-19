% Adapted from Eyeling's gd-step-certified.n3.
% One-dimensional gradient descent over certified interval bounds.

max_k(10).
target(1.0).
eta(Eta) :- math:quotient(1.0, 5, Eta).
x_bounds(0, 0.0, 2.0).

index(0). index(1). index(2). index(3). index(4). index(5).
index(6). index(7). index(8). index(9). index(10).

previous(1, 0). previous(2, 1). previous(3, 2). previous(4, 3). previous(5, 4).
previous(6, 5). previous(7, 6). previous(8, 7). previous(9, 8). previous(10, 9).

g_bounds(K, GL, GU) :-
  target(A),
  x_bounds(K, L, U),
  math:difference(L, A, DL),
  math:difference(U, A, DU),
  math:product(2, DL, GL),
  math:product(2, DU, GU).

p_bounds(K, PL, PU) :-
  eta(Eta),
  g_bounds(K, GL, GU),
  math:product(Eta, GL, PL),
  math:product(Eta, GU, PU).

x_bounds(K1, L1, U1) :-
  previous(K1, K),
  x_bounds(K, L, U),
  target(A),
  eta(Eta),
  math:difference(L, A, DL),
  math:difference(U, A, DU),
  math:product(2, DL, GL),
  math:product(2, DU, GU),
  math:product(Eta, GL, PL),
  math:product(Eta, GU, PU),
  math:difference(L, PU, L1),
  math:difference(U, PL, U1).

width(K, W) :-
  x_bounds(K, L, U),
  math:difference(U, L, W).

midpoint(K, M, HalfW) :-
  x_bounds(K, L, U),
  width(K, W),
  math:quotient(W, 2, HalfW),
  math:sum(L, U, Sum),
  math:quotient(Sum, 2, M).

eta_le_half(true) :-
  eta(Eta),
  math:quotient(1.0, 2, Half),
  math:notGreaterThan(Eta, Half).

width_contracts_at(K1, true) :-
  eta_le_half(true),
  previous(K1, K),
  width(K, W),
  width(K1, W1),
  math:notGreaterThan(W1, W).

max2(A, B, A) :- math:notLessThan(A, B).
max2(A, B, B) :- math:lessThan(A, B).
min2(A, B, A) :- math:notGreaterThan(A, B).
min2(A, B, B) :- math:greaterThan(A, B).

end_squares(K, SL, SU) :-
  target(A),
  x_bounds(K, L, U),
  math:difference(L, A, DL),
  math:difference(U, A, DU),
  math:product(DL, DL, SL),
  math:product(DU, DU, SU).

f_upper(K, FU) :-
  end_squares(K, SL, SU),
  max2(SL, SU, FU).

f_lower(K, 0.0) :-
  target(A),
  x_bounds(K, L, U),
  math:notGreaterThan(L, A),
  math:notGreaterThan(A, U).

f_lower(K, FL) :-
  target(A),
  x_bounds(K, L, U),
  math:lessThan(U, A),
  end_squares(K, SL, SU),
  min2(SL, SU, FL).

f_lower(K, FL) :-
  target(A),
  x_bounds(K, L, U),
  math:lessThan(A, L),
  end_squares(K, SL, SU),
  min2(SL, SU, FL).

triple(:result, :eta, Eta) :-
  eta(Eta).

triple(:result, :etaLeHalf, true) :-
  eta_le_half(true).

triple(:result, :xBounds, bounds(K, L, U)) :-
  index(K),
  x_bounds(K, L, U).

triple(:result, :midpoint, midpoint(K, M, HalfW)) :-
  index(K),
  midpoint(K, M, HalfW).

triple(:result, :width, width(K, W)) :-
  index(K),
  width(K, W).

triple(:result, :gradientBounds, gradient(K, GL, GU)) :-
  index(K),
  g_bounds(K, GL, GU).

triple(:result, :stepBounds, step(K, PL, PU)) :-
  index(K),
  p_bounds(K, PL, PU).

triple(:result, :objectiveBounds, f(K, FL, FU)) :-
  index(K),
  f_lower(K, FL),
  f_upper(K, FU).

triple(:result, :widthContractsAt, K) :-
  width_contracts_at(K, true).
