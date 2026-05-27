% Memoize trajectories because different start values quickly merge into
% shared Collatz tails.
materialize(collatzTrajectory, 2).

% Collatz trajectory benchmark adapted from Eyeling collatz-1000.n3.
% The reusable builtin keeps this large output example focused on data volume
% rather than recursive integer arithmetic overhead.

collatzTrajectory(N, Trajectory) :-
  between(1, 1000, N),
  collatz_trajectory(N, Trajectory).
