% Weighted interval scheduling via explicitly tabled dynamic programming.
%
% Intervals are ordered by finish time. best_to(I, Best) compares skipping I
% with taking I and using the best prefix that finishes before I starts.
% chosen_to/2 then walks the cached decisions to report an optimal schedule.
% Taking an interval wins a tie, making reconstruction deterministic.
%
% Intervals are half-open [Start, Finish), so a finish equal to the next start
% is compatible. IDs must be consecutive from 1 through last_interval/1;
% finish times must be nondecreasing, and durations must be positive.

:- table best_to/2, alternatives/4, chosen_to/2, append/3, member/2.

last_interval(8).
interval(1, 1, 4, 5).
interval(2, 3, 5, 1).
interval(3, 0, 6, 8).
interval(4, 4, 7, 4).
interval(5, 3, 9, 6).
interval(6, 5, 9, 3).
interval(7, 6, 10, 2).
interval(8, 8, 11, 4).

% Find the latest earlier interval finishing no later than I starts.
compatible_before(I, J) :-
  interval(I, Start, _, _),
  interval(J, _, Finish, _),
  J < I,
  Finish =< Start.
has_compatible(I) :- compatible_before(I, _).
previous_compatible(I, J) :-
  interval(I, _, _, _),
  aggregate_all(max(K), compatible_before(I, K), J).
previous_compatible(I, 0) :- interval(I, _, _, _), \+ has_compatible(I).

best_to(0, 0).
best_to(I, Best) :-
  I > 0,
  alternatives(I, _, Take, Skip),
  Best is max(Take, Skip).
alternatives(I, Compatible, Take, Skip) :-
  interval(I, _, _, Value),
  Previous is I - 1,
  best_to(Previous, Skip),
  previous_compatible(I, Compatible),
  best_to(Compatible, Prefix),
  Take is Value + Prefix.

% Reconstruct the selected IDs in increasing finish-time order.
chosen_to(0, []).
chosen_to(I, Chosen) :-
  I > 0,
  alternatives(I, Compatible, Take, Skip),
  Take >= Skip,
  chosen_to(Compatible, Prefix),
  append(Prefix, [I], Chosen).
chosen_to(I, Chosen) :-
  I > 0,
  alternatives(I, _, Take, Skip),
  Skip > Take,
  Previous is I - 1,
  chosen_to(Previous, Chosen).
append([], Right, Right).
append([Head | Rest], Right, [Head | Joined]) :- append(Rest, Right, Joined).
member(Head, [Head | _]).
member(Value, [_ | Rest]) :- member(Value, Rest).

optimal_schedule(Ids, Value) :- last_interval(Last), best_to(Last, Value), chosen_to(Last, Ids).
chosen_interval(I) :- optimal_schedule(Ids, _), member(I, Ids).
weighted_interval_answer(best_value, Best) :- optimal_schedule(_, Best).
weighted_interval_answer(chosen_interval, interval(I, Start, Finish, Value)) :-
  chosen_interval(I), interval(I, Start, Finish, Value).
weighted_interval_answer(candidate_count, Count) :-
  aggregate_all(count, interval(I, Start, Finish, Value), Count).

% Answer and Reason
?- weighted_interval_answer(Kind, Value).
?- why(optimal_schedule(Ids, Value)).

% Check
:- assertion(optimal_schedule([1, 4, 8], 13)).
:- assertion(previous_compatible(1, 0)).
:- assertion(previous_compatible(4, 1)).
:- assertion(previous_compatible(8, 4)).
:- assertion(weighted_interval_answer(candidate_count, 8)).
:- assertion(aggregate_all(count, chosen_interval(I), 3)).
:- assertion(\+ chosen_interval(5)).
:- assertion(best_to(0, 0)).
