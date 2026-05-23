% Blocks-world planning without cut.
%
% A finite-depth planner searches for a three-move plan.  States are sorted
% lists of on(Block, Support) facts so state comparison is structural.

initial([on(a, table), on(b, table), on(c, a)]).
goal([on(a, table), on(b, a), on(c, b)]).

block(a).
block(b).
block(c).

support(table, _State).
support(Block, State) :-
  block(Block),
  member(on(Block, _Below), State).

clear(Block, State) :-
  not(member(on(_Other, Block), State)).

clear_support(table, _State).
clear_support(Block, State) :-
  block(Block),
  clear(Block, State).

move(State, move(Block, From, To), NewState) :-
  member(on(Block, From), State),
  clear(Block, State),
  support(To, State),
  clear_support(To, State),
  neq(Block, To),
  neq(From, To),
  select(on(Block, From), State, Rest),
  sort([on(Block, To)|Rest], NewState).

plan(State, Goal, 0, [], State) :-
  eq(State, Goal).

plan(State, Goal, Depth, [Move|Moves], Final) :-
  gt(Depth, 0),
  move(State, Move, Next),
  sub(Depth, 1, RestDepth),
  plan(Next, Goal, RestDepth, Moves, Final).

three_move_plan(Moves, Final) :-
  initial(Start),
  goal(Goal),
  sort(Start, SortedStart),
  sort(Goal, SortedGoal),
  plan(SortedStart, SortedGoal, 3, Moves, Final).

triple(blocks_world, status, planned) :-
  once(three_move_plan(_Moves, _Final)).

triple(blocks_world, plan, Moves) :-
  once(three_move_plan(Moves, _Final)).

triple(blocks_world, finalState, Final) :-
  once(three_move_plan(_Moves, Final)).
