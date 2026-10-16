% An ordered event log defines a relation between successive account states.
% Each event references its predecessor; no stored balance is mutated.
:- table balance/2.

opening_balance(100).
event(1, deposit, 25).
event(2, withdraw, 40).
event(3, withdraw, 20).

balance(0, Amount) :-
    opening_balance(Amount).
balance(N, Amount) :-
    N > 0,
    event(N, deposit, Value),
    Before is N - 1,
    balance(Before, Previous),
    Amount is Previous + Value.
balance(N, Amount) :-
    N > 0,
    event(N, withdraw, Value),
    Before is N - 1,
    balance(Before, Previous),
    Amount is Previous - Value.

% Answer and Reason
?- balance(3, Amount).
?- why.
?- between(0, 3, N), balance(N, Amount).
?- why.

% Check
:- assertion(balance(0, 100)).
:- assertion(balance(1, 125)).
:- assertion(balance(2, 85)).
:- assertion(balance(3, 65)).
:- assertion(aggregate_all(count, balance(4, Amount), 0)).
