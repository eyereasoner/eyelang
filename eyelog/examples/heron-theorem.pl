% Heron's theorem: area = sqrt(s(s-a)(s-b)(s-c)).

materialize(semiperimeter, 2).
materialize(heronProduct, 2).
materialize(area, 2).
materialize(status, 2).

triangle(field_plot, 13, 14, 15).

semiperimeter(Triangle, S) :-
  triangle(Triangle, A, B, C),
  add(A, B, AB),
  add(AB, C, Sum),
  div(Sum, 2, S).

heron_product(Triangle, Product) :-
  triangle(Triangle, A, B, C),
  semiperimeter(Triangle, S),
  sub(S, A, SA),
  sub(S, B, SB),
  sub(S, C, SC),
  mul(S, SA, T1),
  mul(T1, SB, T2),
  mul(T2, SC, Product).

area(Triangle, Area) :-
  heron_product(Triangle, Product),
  pow(Product, 0.5, Area).

heronProduct(Triangle, P) :- heron_product(Triangle, P).
status(Triangle, valid_survey_triangle) :- area(Triangle, A), gt(A, 0).
