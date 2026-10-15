% Is Pat older than 80 years?
% Pat was born on 21 August 1944.
% Compare on 12 October 2026. Change these facts to try another date.
% Work backwards from the person and the number of years asked about.
% A larger year difference is enough, even before this year's birthday.
% With the same year difference, the birthday must have passed.
% On the birthday itself, the person is exactly that old, not older.

% Prolog facts and rules.
:- table 'is-older-than'/2.
birthday('pat-h', [1944, 8, 21]).
date(today, [2026, 10, 12]).
person(test, 'pat-h').
'age-limit'(test, 80).

'is-older-than'(Person, Years) :-
    birthday(Person, [BirthYear, BirthMonth, BirthDay]),
    date(today, [Year, Month, Day]),
    _Calc1 is (Year - BirthYear),
    _Calc1 > Years.
'is-older-than'(Person, Years) :-
    birthday(Person, [BirthYear, BirthMonth, BirthDay]),
    date(today, [Year, Month, Day]),
    _Calc1 is (Year - BirthYear),
    _Calc1 = Years,
    Month > BirthMonth.
'is-older-than'(Person, Years) :-
    birthday(Person, [BirthYear, BirthMonth, BirthDay]),
    date(today, [Year, Month, Day]),
    _Calc1 is (Year - BirthYear),
    _Calc1 = Years,
    Month = BirthMonth,
    Day > BirthDay.
is_a(test, 'passed-check') :-
    person(test, Person),
    'age-limit'(test, Years),
    'is-older-than'(Person, Years).

% Answer and Reason
?- 'is-older-than'(Who, 80).
?- is_a(test, 'passed-check').
?- why.

% Check
:- assertion(('is-older-than'('pat-h', 80))).
:- assertion(('is-older-than'('pat-h', 82))).
:- assertion((\+ ('is-older-than'('pat-h', 83)))).
:- assertion((is_a(test, 'passed-check'))).
:- assertion((aggregate_all(count, is_a(Subject, 'passed-check'), 1))).
