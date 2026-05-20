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

triple(From, link, To) :-
  link(From, To).

triple(From, reaches, To) :-
  reachable(From, To).

triple(report, nodes, Max) :-
  closure_nodes(Max).

triple(report, directLinks, Links) :-
  closure_nodes(Max),
  sub(Max, 1, Links).

triple(report, reachablePairs, Pairs) :-
  closure_nodes(Max),
  sub(Max, 1, Previous),
  mul(Max, Previous, TwicePairs),
  div(TwicePairs, 2, Pairs).

triple(report, expectedMaterializedTriples, Total) :-
  closure_nodes(Max),
  sub(Max, 1, Links),
  mul(Max, Links, TwicePairs),
  div(TwicePairs, 2, Pairs),
  add(Pairs, Links, GraphTriples),
  add(GraphTriples, 8, Total).

triple(report, firstNode, n1).

triple(report, lastNode, Last) :-
  closure_nodes(Max),
  atom_concat(n, Max, Last).

triple(report, message, "Recursive closure from a tiny source: this is the C core hot path.").

triple(test, is, true) :-
  closure_nodes(Max),
  atom_concat(n, Max, Last),
  reachable(n1, Last).
