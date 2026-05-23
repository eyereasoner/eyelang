% SAT solving without cut.
%
% A compact DPLL-style example for a finite CNF formula.  The program first
% generates truth assignments, then checks every clause declaratively.  The
% result reports satisfiability, a witness model, and the number of models.

problem(sat_instance,
  [a, b, c, d],
  [
    [pos(a), pos(b)],
    [neg(a), pos(c)],
    [neg(b), pos(c)],
    [neg(c), pos(d)],
    [neg(d), pos(a)]
  ]).

truth(false).
truth(true).

assignment([], []).
assignment([Var|Vars], [value(Var, Truth)|Rest]) :-
  truth(Truth),
  assignment(Vars, Rest).

literal_true(pos(Var), Assignment) :-
  member(value(Var, true), Assignment).
literal_true(neg(Var), Assignment) :-
  member(value(Var, false), Assignment).

clause_true([Literal|_Rest], Assignment) :-
  literal_true(Literal, Assignment).
clause_true([_Literal|Rest], Assignment) :-
  clause_true(Rest, Assignment).

cnf_true([], _Assignment).
cnf_true([Clause|Clauses], Assignment) :-
  clause_true(Clause, Assignment),
  cnf_true(Clauses, Assignment).

model(Name, Assignment) :-
  problem(Name, Variables, Clauses),
  assignment(Variables, Assignment),
  cnf_true(Clauses, Assignment).

triple(sat_instance, status, satisfiable) :-
  once(model(sat_instance, _Assignment)).

triple(sat_instance, witness, Assignment) :-
  once(model(sat_instance, Assignment)).

triple(sat_instance, modelCount, Count) :-
  findall(Assignment, model(sat_instance, Assignment), Models),
  length(Models, Count).

triple(sat_instance, reason, "finite CNF search succeeds without cut").
