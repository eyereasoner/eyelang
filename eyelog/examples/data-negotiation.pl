% Data negotiation with policies, adapted from Eyelet input/data-negotiation.pl.
% The accepted negotiation matches Eyelet output-swipl/data-negotiation.pl.

materialize(negotiate, 2).

hasData(agent1, [data1, data2, data3]).
hasData(agent2, [data4, data5, data6]).

want_negotiate(agent1, [agent2, data4]).
want_negotiate(agent1, [agent2, data5]).
want_negotiate(agent1, [agent2, data7]).

policy(agent1, [request, Data]) :-
  member(Data, [data4, data6]).
policy(agent2, [accept, Data]) :-
  neq(Data, data5).

request_data(AgentA, AgentB, Data) :-
  hasData(AgentA, DataListA),
  hasData(AgentB, DataListB),
  member(Data, DataListB),
  not_member(Data, DataListA),
  policy(AgentA, [request, Data]).

accept_request(AgentB, _AgentA, Data) :-
  hasData(AgentB, DataListB),
  member(Data, DataListB),
  policy(AgentB, [accept, Data]).

negotiate(AgentA, [AgentB, Data]) :-
  want_negotiate(AgentA, [AgentB, Data]),
  request_data(AgentA, AgentB, Data),
  accept_request(AgentB, AgentA, Data).
