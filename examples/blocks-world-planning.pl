% Blocks-world planning without cut.
%
% A finite-depth planner searches for a five-move plan over five blocks.  States
% are sorted lists of on(Block, Support) facts so equality and visited-state
% checks are purely structural.

initial([on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]).
goal([on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]).

block(a).
block(b).
block(c).
block(d).
block(e).

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

plan(State, Goal, 0, _Visited, [], State) :-
  eq(State, Goal).

plan(State, Goal, Depth, Visited, [Move|Moves], Final) :-
  gt(Depth, 0),
  move(State, Move, Next),
  not_member(Next, Visited),
  sub(Depth, 1, RestDepth),
  plan(Next, Goal, RestDepth, [Next|Visited], Moves, Final).

five_move_plan(Moves, Final) :-
  initial(Start),
  goal(Goal),
  sort(Start, SortedStart),
  sort(Goal, SortedGoal),
  plan(SortedStart, SortedGoal, 5, [SortedStart], Moves, Final).

triple(blocks_world, status, planned) :-
  once(five_move_plan(_Moves, _Final)).

triple(blocks_world, plan, Moves) :-
  once(five_move_plan(Moves, _Final)).

triple(blocks_world, finalState, Final) :-
  once(five_move_plan(_Moves, Final)).

triple(blocks_world, blockCount, Count) :-
  findall(Block, block(Block), Blocks),
  length(Blocks, Count).
