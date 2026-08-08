% From The Art of EyeProlog, Chapter 28.
integer_rectangle(Area, W, H) :-
  between(1, Area, W),
  between(W, Area, H),
  (Area is W * H).
