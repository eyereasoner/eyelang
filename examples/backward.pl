materialize(isIndeedMoreInterestingThan, 2).

% Backward rule example adapted from Eyeling backward.n3.
% Eyeling writes the interestingness rule backward; eyelog records the same
% relation as an ordinary rule whose body is the numeric comparison.

moreInterestingThan(X, Y) :- gt(X, Y).

isIndeedMoreInterestingThan(5, 3) :- moreInterestingThan(5, 3).
