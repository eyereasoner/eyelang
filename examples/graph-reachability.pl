% Graph reachability example adapted from Eyelet input/graph-reachability.pl.
%
% The original uses Prolog negation and member/2 to avoid revisiting nodes.
% Eyelog expresses the same finite search with not(member(...)).

edge(a, b).
edge(a, c).
edge(b, d).
edge(c, e).
edge(d, f).
edge(e, f).
edge(f, g).

reachable(Node, Node, _Visited).
reachable(Start, Goal, Visited) :-
  edge(Start, Next),
  not(member(Next, Visited)),
  reachable(Next, Goal, [Next|Visited]).

is_reachable(Start, Goal) :-
  reachable(Start, Goal, [Start]).

triple(reachability_case, reachable, path(a, f)) :-
  is_reachable(a, f).

triple(reachability_case, reachable, path(c, g)) :-
  is_reachable(c, g).

triple(reachability_case, not_reachable, path(b, e)) :-
  not(is_reachable(b, e)).
