% Eyelet-inspired Basic Monadic Benchmark summary using findall/3 and sort/2.
% This compact port keeps the monadic-classification shape and reports canonical classes.

link(i_0, i_10, i_96).
link(i_0, i_12, i_66).
link(i_0, i_12, i_9).
link(i_0, i_21, i_87).
link(i_0, i_24, i_93).
link(i_10, i_0, i_24).
link(i_10, i_0, i_81).
link(i_10, i_15, i_63).
link(i_10, i_17, i_87).
link(i_11, i_0, i_27).
link(i_11, i_11, i_63).
link(i_11, i_23, i_24).
link(i_12, i_0, i_6).
link(i_12, i_0, i_9).
link(i_12, i_30, i_84).
link(i_12, i_63, i_81).
link(i_75, i_50, i_69).
link(i_75, i_59, i_96).
link(i_75, i_75, i_69).
link(i_76, i_0, i_30).
link(i_76, i_29, i_48).
link(i_76, i_76, i_84).
link(i_93, i_12, i_96).
link(i_93, i_24, i_72).
link(i_93, i_93, i_45).

source_class(Source) :- link(Source, _Left, _Right).
left_entity(Entity) :- link(_Source, Entity, _Right).
right_entity(Entity) :- link(_Source, _Left, Entity).

observed_entity(Entity) :- source_class(Entity).
observed_entity(Entity) :- left_entity(Entity).
observed_entity(Entity) :- right_entity(Entity).

self_loop(Source) :- link(Source, Source, _Right).
high_index_object(Object) :- link(_Source, _Left, Object), member(Object, [i_81, i_84, i_87, i_93, i_96]).

canonical_sources(Sources) :-
  findall(S, source_class(S), Raw),
  sort(Raw, Sources).

canonical_entities(Entities) :-
  findall(E, observed_entity(E), Raw),
  sort(Raw, Entities).

canonical_self_loops(Loops) :-
  findall(S, self_loop(S), Raw),
  sort(Raw, Loops).

canonical_high_objects(Objects) :-
  findall(O, high_index_object(O), Raw),
  sort(Raw, Objects).

triple(basic_monadic, sourceClasses, Sources) :-
  canonical_sources(Sources).

triple(basic_monadic, entityCount, Count) :-
  canonical_entities(Entities),
  length(Entities, Count).

triple(basic_monadic, selfLoops, Loops) :-
  canonical_self_loops(Loops).

triple(basic_monadic, highIndexObjects, Objects) :-
  canonical_high_objects(Objects).

triple(basic_monadic, reason, "findall collects benchmark classifications and sort canonicalizes duplicate-heavy relations").
