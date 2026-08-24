% Delayed disequality constraints with dif/2.
%
% Unlike \=/2, dif/2 records a constraint when its arguments are still
% unifiable and rechecks that constraint after later bindings.

%% goal: allowed_pair(X, Y)
%% goal: specialization(X, Y)

allowed_pair(X, Y) :-
    dif(X, Y),
    X = left,
    Y = right.

% The structural constraint remains pending after X=Y. Binding both to 1
% then proves X-Y and 1-2 different, so the constraint is discharged.
specialization(X, Y) :-
    dif(X-Y, 1-2),
    X = Y,
    Y = 1.
