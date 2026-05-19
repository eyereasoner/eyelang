% Rules-as-data graph-term example adapted from Eyeling derived-rule.n3.
% A first graph pattern derives a second quoted rule; the derived rule then fires.

fact_graph(:Facts, graph([
  triple(:Minka, rdf:type, :Cat),
  triple(:Charly, rdf:type, :Dog)
])).

% If the fact graph contains a cat, derive a rule whose own premise is a graph
% pattern for a dog and whose conclusion is another graph.
rule_template(
  :CatEnablesDogRule,
  graph([triple(var(:x), rdf:type, :Cat)]),
  rule(graph([triple(var(:y), rdf:type, :Dog)]), graph([triple(:test, :is, true)]))
).

graph_triple(graph(Statements), Subject, Predicate, Object) :-
  member(triple(Subject, Predicate, Object), Statements).

term_matches(var(_Name), _Value).
term_matches(Value, Value).

triple_matches(triple(ExpectedS, ExpectedP, ExpectedO), Graph) :-
  graph_triple(Graph, ActualS, ActualP, ActualO),
  term_matches(ExpectedS, ActualS),
  term_matches(ExpectedP, ActualP),
  term_matches(ExpectedO, ActualO).

graph_satisfied(graph([]), _Graph).
graph_satisfied(graph([Edge|Rest]), Graph) :-
  triple_matches(Edge, Graph),
  graph_satisfied(graph(Rest), Graph).

derived_rule(Name, Rule) :-
  rule_template(Name, Antecedent, Rule),
  fact_graph(:Facts, Facts),
  graph_satisfied(Antecedent, Facts).

derived_triple(Subject, Predicate, Object) :-
  derived_rule(_Name, rule(Antecedent, Consequent)),
  fact_graph(:Facts, Facts),
  graph_satisfied(Antecedent, Facts),
  graph_triple(Consequent, Subject, Predicate, Object).

triple(Name, :derivedRule, Rule) :- derived_rule(Name, Rule).
triple(Subject, Predicate, Object) :- derived_triple(Subject, Predicate, Object).
triple(:derivedRuleDemo, :status, :fired) :- derived_triple(:test, :is, true).
