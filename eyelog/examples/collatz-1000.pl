% Memoize trajectories because different start values quickly merge into
% shared Collatz tails.
materialize(collatzTrajectory, 2).

memoize(collatz, 2).

% Collatz trajectory benchmark adapted from Eyeling collatz-1000.n3.
% Output mirrors Eyeling semantically: each start value maps to its full trajectory.

collatz(1, [1]).
collatz(N, [N|Rest]) :-
  gt(N, 1),
  mod(N, 2, 0),
  div(N, 2, Next),
  collatz(Next, Rest).
collatz(N, [N|Rest]) :-
  gt(N, 1),
  mod(N, 2, 1),
  mul(N, 3, T),
  add(T, 1, Next),
  collatz(Next, Rest).

collatzTrajectory(N, Trajectory) :-
  between(1, 1000, N),
  collatz(N, Trajectory).
