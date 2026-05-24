% C-core transitive-closure demonstration.
%
% This is a compact but challenging reasoning workload: generate a long chain
% of nodes, derive direct links, then materialize every transitive reachability
% pair. It exercises recursive rules, unification, arithmetic, atom construction,
% duplicate suppression, and large output generation from a tiny source.
%
% Run a local timing check with:
%
%   make
%   /usr/bin/time -f "%e sec  %M KB" bin/eyelog examples/c-core-transitive-closure.pl > /tmp/eyelog-closure.out
%   wc -l /tmp/eyelog-closure.out
%
% The default scale is test-friendly. Increase closure_nodes/1 to 1000 or more
% for a larger local run.
%
% memoize/2 is an Eyelog declaration: cache answers for calls to the named
% predicate when at least one argument is bound. It is useful for acyclic
% recursive workloads such as this generated chain.

materialize(link, 2).
materialize(reaches, 2).
materialize(nodes, 2).
materialize(directLinks, 2).
materialize(reachablePairs, 2).
materialize(expectedMaterializedRelations, 2).
materialize(firstNode, 2).
materialize(lastNode, 2).
materialize(message, 2).
materialize(is, 2).

memoize(reachable, 2).

closure_nodes(70).

node_number(N, Node) :-
  closure_nodes(Max),
  between(1, Max, N),
  atom_concat(n, N, Node).

next_number(N, Next) :-
  closure_nodes(Max),
  lt(N, Max),
  add(N, 1, Next).

link(From, To) :-
  node_number(N, From),
  next_number(N, Next),
  node_number(Next, To).

reachable(From, To) :-
  link(From, To).

reachable(From, To) :-
  link(From, Via),
  reachable(Via, To).


reaches(From, To) :-
  reachable(From, To).

nodes(report, Max) :-
  closure_nodes(Max).

directLinks(report, Links) :-
  closure_nodes(Max),
  sub(Max, 1, Links).

reachablePairs(report, Pairs) :-
  closure_nodes(Max),
  sub(Max, 1, Previous),
  mul(Max, Previous, TwicePairs),
  div(TwicePairs, 2, Pairs).

expectedMaterializedRelations(report, Total) :-
  closure_nodes(Max),
  sub(Max, 1, Links),
  mul(Max, Links, TwicePairs),
  div(TwicePairs, 2, Pairs),
  add(Pairs, Links, GraphRelations),
  add(GraphRelations, 8, Total).

firstNode(report, n1).

lastNode(report, Last) :-
  closure_nodes(Max),
  atom_concat(n, Max, Last).

message(report, "Recursive closure from a tiny source: this is the C core hot path.").

is(test, true) :-
  closure_nodes(Max),
  atom_concat(n, Max, Last),
  reachable(n1, Last).
