% Critical-path scheduling for a small project network.
%
% earliest_start/2 is the maximum finish time over all predecessors; finish_time/2
% adds task duration. Critical tasks are reconstructed by following predecessors
% that attain those maxima. Tabling lets the schedule, finish date, and path
% queries share the same project-network subproblems.
%
% task/3 stores each predecessor list explicitly. A recursive maximum fold keeps
% dependency evaluation positive; the project-wide aggregate runs afterwards.
% The task network must be a finite directed acyclic graph with nonnegative
% durations. Time units are arbitrary, and tasks have no resource constraints.

:- table earliest_start/2, finish_time/2, latest_finish/2, member/2, critical_chain/2.

% Durations are in arbitrary project time units.
task(requirements, 2, []).
task(architecture, 3, [requirements]).
task(api_design, 2, [requirements]).
task(database, 4, [architecture]).
task(backend, 6, [api_design, database]).
task(frontend, 5, [api_design]).
task(auth, 3, [architecture]).
task(integration, 4, [backend, frontend, auth]).
task(security_review, 3, [integration]).
task(load_test, 2, [integration]).
task(launch, 1, [security_review, load_test]).

member(Head, [Head | _]).
member(Value, [_ | Rest]) :- member(Value, Rest).
depends(Task, Predecessor) :- task(Task, _, Predecessors), member(Predecessor, Predecessors).

earliest_start(Task, Start) :- task(Task, _, Predecessors), latest_finish(Predecessors, Start).
latest_finish([], 0).
latest_finish([Predecessor | Rest], Latest) :-
  finish_time(Predecessor, Finish),
  latest_finish(Rest, Remaining),
  Latest is max(Finish, Remaining).
finish_time(Task, Finish) :-
  task(Task, Duration, _),
  earliest_start(Task, Start),
  Finish is Start + Duration.

% Retain every predecessor attaining the maximum, including tied branches.
critical_predecessor(Task, Predecessor) :-
  depends(Task, Predecessor),
  finish_time(Predecessor, Finish),
  earliest_start(Task, Finish).
project_finish(Finish) :-
  aggregate_all(max(Time), (task(Task, _, _), finish_time(Task, Time)), Finish).
final_task(Task) :- project_finish(Finish), task(Task, _, _), finish_time(Task, Finish).
critical_chain(Task, Task).
critical_chain(Task, Predecessor) :-
  critical_predecessor(Task, Parent),
  critical_chain(Parent, Predecessor).
critical_task(Task) :- final_task(Final), critical_chain(Final, Task).

critical_path_answer(project_finish, Finish) :- project_finish(Finish).
critical_path_answer(critical_task, Task) :- critical_task(Task).
critical_path_answer(schedule, task(Task, Start, Finish)) :-
  task(Task, _, _), earliest_start(Task, Start), finish_time(Task, Finish).

% Answer and Reason
?- critical_path_answer(Kind, Value).
?- why(critical_task(launch)).
?- why(earliest_start(integration, Start)).

% Check
:- assertion(project_finish(23)).
:- assertion(earliest_start(integration, 15)).
:- assertion(finish_time(launch, 23)).
:- assertion(critical_predecessor(integration, backend)).
:- assertion(critical_task(database)).
:- assertion(\+ critical_task(frontend)).
:- assertion(aggregate_all(count, critical_task(Task), 7)).
:- assertion(aggregate_all(count, critical_path_answer(schedule, Schedule), 11)).
