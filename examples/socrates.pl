% Socrates: facts, a rule, an answer, its reason, and executable checks.
human(socrates).
mortal(Person) :- human(Person).

% Answer
?- mortal(Who).
% Reason
?- why.
% Check
:- assertion(mortal(socrates)).
:- assertion(aggregate_all(count, mortal(Person), 1)).
