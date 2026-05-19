% RDF 1.2-style annotation adapted from Eyeling annotation.n3.
% The annotated statement is kept as a graph-valued term and named by :t.

named_graph(:StatementT, graph([
  statement(:a, :name, "Alice")
])).

name_of(:t, :StatementT).
stated_by(:t, :bob).
recorded(:t, "2021-07-07").
input_sidecar(:annotation, "input/annotation.trig").

graph_statement(graph(Statements), Subject, Predicate, Object) :-
  member(statement(Subject, Predicate, Object), Statements).

named_statement(Token, Subject, Predicate, Object) :-
  name_of(Token, GraphName),
  named_graph(GraphName, Graph),
  graph_statement(Graph, Subject, Predicate, Object).

annotation_ok(Token) :-
  named_statement(Token, :a, :name, "Alice"),
  stated_by(Token, :bob),
  recorded(Token, "2021-07-07").

triple(:t, log:nameOf, Graph) :-
  name_of(:t, GraphName),
  named_graph(GraphName, Graph).

triple(:t, :statedBy, Agent) :- stated_by(:t, Agent).
triple(:t, :recorded, Date) :- recorded(:t, Date).
triple(:annotation, :source, Source) :- input_sidecar(:annotation, Source).
triple(:annotation, :confirms, statement(:a, :name, "Alice")) :- annotation_ok(:t).
triple(:annotation, :status, :annotationVerified) :- annotation_ok(:t).
