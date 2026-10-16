% Establish candidate permissions, then apply closed-world exclusions.
role(alice, editor).
role(bob, viewer).
role(carol, editor).
permits(editor, read).
permits(editor, write).
permits(viewer, read).
suspended(carol).

candidate(User, Action) :-
    role(User, Role),
    permits(Role, Action).
allowed(User, Action) :-
    candidate(User, Action),
    \+ suspended(User).

% Answer and Reason
?- allowed(User, Action).
?- why.
?- candidate(carol, Action).
?- why.

% Check
:- assertion(allowed(alice, read)).
:- assertion(allowed(alice, write)).
:- assertion(allowed(bob, read)).
:- assertion(\+ allowed(bob, write)).
:- assertion(candidate(carol, read)).
:- assertion(candidate(carol, write)).
:- assertion(\+ allowed(carol, read)).
:- assertion(\+ allowed(carol, write)).
:- assertion(aggregate_all(count, allowed(User, Action), 3)).
