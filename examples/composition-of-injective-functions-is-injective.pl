% Composition of injective functions is injective, adapted from the Eyeling
% example with the same name.
%
% Functions are represented by app(Function, Input, Output), and composition
% is represented by compositeOf(Composite, Outer, Inner).

materialize(injective, 1).
materialize(theorem, 1).

inX(a).
inX(b).
inY(c).
inY(d).
inZ(e).
inZ(f).

sameTerm(X, X) :- inX(X).
sameTerm(X, X) :- inY(X).
sameTerm(X, X) :- inZ(X).
sameTerm(Y, X) :- sameTerm(X, Y).

app(f, a, c).
app(f, b, d).
app(g, c, e).
app(g, d, f_value).

injective(f).
injective(g).
compositeOf(h, g, f).

app(H, X, Z) :-
  compositeOf(H, G, F),
  app(F, X, Y),
  app(G, Y, Z).

sameTerm(X, Y) :-
  injective(F),
  app(F, X, U),
  app(F, Y, V),
  sameTerm(U, V).

injective(H) :-
  compositeOf(H, G, F),
  injective(G),
  injective(F).

theorem(composition_of_injective_functions_is_injective) :-
  injective(h).
