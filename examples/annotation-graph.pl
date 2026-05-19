% RDF 1.2-style annotation adapted from Eyeling annotation.n3.
% The annotated triple is kept as a graph-valued term and named by :t.

named_graph(:StatementT, graph([
  triple(:a, :name, "Alice")
])).

name_of(:t, :StatementT).
stated_by(:t, :bob).
recorded(:t, "2021-07-07").
input_sidecar(:annotation, "input/annotation.trig").

graph_triple(graph(Statements), Subject, Predicate, Object) :-
  member(triple(Subject, Predicate, Object), Statements).

named_triple(Token, Subject, Predicate, Object) :-
  name_of(Token, GraphName),
  named_graph(GraphName, Graph),
  graph_triple(Graph, Subject, Predicate, Object).

annotation_ok(Token) :-
  named_triple(Token, :a, :name, "Alice"),
  stated_by(Token, :bob),
  recorded(Token, "2021-07-07").

triple(:t, log:nameOf, Graph) :-
  name_of(:t, GraphName),
  named_graph(GraphName, Graph).

triple(:t, :statedBy, Agent) :- stated_by(:t, Agent).
triple(:t, :recorded, Date) :- recorded(:t, Date).
triple(:annotation, :source, Source) :- input_sidecar(:annotation, Source).
triple(:annotation, :confirms, triple(:a, :name, "Alice")) :- annotation_ok(:t).
triple(:annotation, :status, :annotationVerified) :- annotation_ok(:t).
