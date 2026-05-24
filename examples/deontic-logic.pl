% Deontic logic: obligations, prohibitions, compensations, and violations.

materialize(violation, 2).
materialize(compensation, 2).
materialize(status, 2).

actor(alice).
action(share_record).
action(delete_unneeded_copy).

obliged(alice, obtain_consent).
prohibited(alice, share_record).
compensates(share_record, notify_dpo).

performed(alice, share_record).
performed(alice, notify_dpo).
not_performed(alice, obtain_consent).
not_performed(alice, delete_unneeded_copy).

violation(Actor, missed_obligation(Action)) :-
  obliged(Actor, Action),
  not_performed(Actor, Action).

violation(Actor, prohibited_action(Action)) :-
  prohibited(Actor, Action),
  performed(Actor, Action).

compensated_violation(Actor, Action, Compensation) :-
  prohibited(Actor, Action),
  performed(Actor, Action),
  compensates(Action, Compensation),
  performed(Actor, Compensation).

uncompensated_violation(Actor, missed_obligation(Action)) :-
  violation(Actor, missed_obligation(Action)).

uncompensated_violation(Actor, prohibited_action(Action)) :-
  violation(Actor, prohibited_action(Action)),
  not(compensated_violation(Actor, Action, _Compensation)).


compensation(Actor, compensation(Action, Compensation)) :-
  compensated_violation(Actor, Action, Compensation).

status(Actor, requires_review) :-
  uncompensated_violation(Actor, _Violation).
