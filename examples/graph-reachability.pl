% Graph reachability example adapted from Eyelet input/graph-reachability.pl.
%
% The original uses Prolog negation and member/2 to avoid revisiting nodes.
% eyelang expresses the same finite search with not(member(...)).

materialize(reachable, 2).
materialize(not_reachable, 2).

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

reachable(reachability_case, path(a, f)) :-
  is_reachable(a, f).

reachable(reachability_case, path(c, g)) :-
  is_reachable(c, g).

not_reachable(reachability_case, path(b, e)) :-
  not(is_reachable(b, e)).
