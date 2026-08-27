% From The Art of EyeProlog, Chapter 39 — The EyeProlog library.
?- dif(f(X,A),f(Y,B)), ( true ; A = B ).
   dif(f(X, A), f(Y, B))
;  A = B, dif(X, Y).
