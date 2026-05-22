% Vector dot product, Euclidean norm, and cosine similarity.

vector(pair1, a, [1.0, 2.0, 3.0]).
vector(pair1, b, [4.0, -5.0, 6.0]).

dot([], [], 0.0).
dot([A|As], [B|Bs], Dot) :-
  mul(A, B, Product),
  dot(As, Bs, Rest),
  add(Product, Rest, Dot).

sum_squares([], 0.0).
sum_squares([X|Xs], Total) :-
  pow(X, 2.0, Squared),
  sum_squares(Xs, Rest),
  add(Squared, Rest, Total).

norm(Vector, Norm) :-
  sum_squares(Vector, SumSquares),
  pow(SumSquares, 0.5, Norm).

cosine_similarity(Case, Similarity) :-
  vector(Case, a, A),
  vector(Case, b, B),
  dot(A, B, Dot),
  norm(A, NormA),
  norm(B, NormB),
  mul(NormA, NormB, Denominator),
  div(Dot, Denominator, Similarity).

triple(Case, dotProduct, Dot) :-
  vector(Case, a, A),
  vector(Case, b, B),
  dot(A, B, Dot).

triple(Case, normA, NormA) :-
  vector(Case, a, A),
  norm(A, NormA).

triple(Case, normB, NormB) :-
  vector(Case, b, B),
  norm(B, NormB).

triple(Case, cosineSimilarity, Similarity) :-
  cosine_similarity(Case, Similarity).
