materialize(mustHave, 2).

% Dog-license example adapted from Eyeling dog.n3.
% A subject with more than four dogs must have a dog license.

hasDog(alice, dog1).
hasDog(alice, dog2).
hasDog(alice, dog3).
hasDog(alice, dog4).
hasDog(alice, dog5).
hasDog(bob, dog6).
hasDog(bob, dog7).

dogCount(Subject, Count) :-
  hasDog(Subject, _Any),
  countall(hasDog(Subject, _Dog), Count).

mustHave(Subject, dogLicense) :-
  dogCount(Subject, Count),
  gt(Count, 4).
