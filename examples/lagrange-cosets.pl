% Cosets and Lagrange's identity in the permutation group S3.
%
% Each permutation lists the images of 1, 2, and 3. Product P*Q applies Q first
% and P second. The subgroup {e,t12} has order 2; its three left cosets partition
% the six group elements. The checks exhaust this finite group and subgroup.
% Left and right cosets also provide explicit evidence that this subgroup is
% not normal. Coset representatives use the least atom name in each coset.

:- table apply/3, compose/3.

element(e,    [1, 2, 3]).
element(t12,  [2, 1, 3]).
element(t13,  [3, 2, 1]).
element(t23,  [1, 3, 2]).
element(c123, [2, 3, 1]).
element(c132, [3, 1, 2]).
subgroup(e).
subgroup(t12).

apply([A, _, _], 1, A).
apply([_, B, _], 2, B).
apply([_, _, C], 3, C).
compose(P, [A, B, C], [X, Y, Z]) :- apply(P, A, X), apply(P, B, Y), apply(P, C, Z).
product(P, Q, R) :- element(P, ImagesP), element(Q, ImagesQ), compose(ImagesP, ImagesQ, ImagesR), element(R, ImagesR).
inverse(P, Q) :- product(P, Q, e), product(Q, P, e).
left_member(P, Member) :- element(P, _), subgroup(H), product(P, H, Member).
right_member(P, Member) :- element(P, _), subgroup(H), product(H, P, Member).
smaller_left_member(P) :- left_member(P, Member), Member @< P.
left_coset(P, Member) :- left_member(P, Member), \+ smaller_left_member(P).
representative(P) :- left_coset(P, _).
covered(Member) :- left_coset(_, Member).
cosets_overlap :- left_coset(P, Member), left_coset(Q, Member), P \= Q.
normality_counterexample(P, Member) :- left_member(P, Member), \+ right_member(P, Member).
associativity_failure :-
  product(P, Q, PQ), product(PQ, R, Left), product(Q, R, QR), product(P, QR, Right), Left \= Right.
identity_failure :- element(P, _), product(e, P, Left), Left \= P.
identity_failure :- element(P, _), product(P, e, Right), Right \= P.
subgroup_closure_failure :- subgroup(P), subgroup(Q), product(P, Q, R), \+ subgroup(R).
lagrange(Order, SubgroupOrder, Index) :-
  aggregate_all(count, element(P, Images), Order),
  aggregate_all(count, subgroup(P), SubgroupOrder),
  aggregate_all(count, representative(P), Index),
  Order =:= SubgroupOrder * Index.

% Answer and Reason
?- left_coset(Representative, Member).
?- why(left_coset(c123, Member)).
?- lagrange(Order, SubgroupOrder, Index).
?- why.
?- normality_counterexample(Permutation, Member).

% Check
:- assertion(lagrange(6, 2, 3)).
:- assertion(aggregate_all(count, product(P, Q, R), 36)).
:- assertion(aggregate_all(count, inverse(P, Q), 6)).
:- assertion(aggregate_all(count, covered(P), 6)).
:- assertion(aggregate_all(count, left_coset(P, Member), 6)).
:- assertion(\+ cosets_overlap).
:- assertion(\+ associativity_failure).
:- assertion(\+ identity_failure).
:- assertion(\+ subgroup_closure_failure).
:- assertion(normality_counterexample(c123, t13)).
:- assertion(product(c123, c132, e)).
