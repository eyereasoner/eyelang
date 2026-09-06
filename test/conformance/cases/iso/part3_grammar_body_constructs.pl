% ISO/IEC TS 13211-3:2023, 7.14 - the semantics of each grammar body element,
% expressed as the phrase/3 identities the TS states for them.
digit(D) --> [D], { member(D, [a,b]) }.

% 7.14.1  phrase([], S0, S) is true iff S0 = S.
answer(empty_sequence, S) :- phrase([], [a,b], S).

% 7.14.3  phrase((A,B), S0, S) iff phrase(A, S0, S1), phrase(B, S1, S).
answer(concatenation, S) :- phrase(([a], [b]), [a,b,c], S).

% 7.14.4  phrase((A;B), S0, S) iff ( phrase(A,S0,S) ; phrase(B,S0,S) ).
answer(alternative, S) :- phrase(([a] ; [b]), [b,c], S).

% 7.14.5.3  the if-then-else examples given verbatim in the TS.
answer(ite_13, yes) :- phrase((("1" | "2") -> "3" ; "4"), "13").
answer(ite_23, yes) :- phrase((("1" | "2") -> "3" ; "4"), "23").
answer(ite_4, yes) :- phrase((("1" | "2") -> "3" ; "4"), "4").
answer(ite_single, no) :- \+ phrase((("1" | "2") -> "3" ; "4"), [_]).

% 7.14.7  phrase({G}, S0, S) is true iff ( G, S0 = S ).
answer(grammar_body_goal, S) :- phrase({true}, [a], S).

% 7.14.9  phrase(phrase(NT), S0, S) iff phrase(NT, S0, S).
answer(phrase_nonterminal, S) :- phrase(phrase([a]), [a,b], S).

% 7.14.10  phrase(!, S0, S) is true iff S0 = S.
answer(cut_identity, S) :- phrase(!, [a,b], S).

% 7.14.11  phrase(\+ GRBody, S0, S) iff ( \+ phrase(GRBody, S0, _), S0 = S ).
answer(negation_identity, S) :- phrase(\+ [a], [b,c], S).
answer(negation_blocks, no) :- \+ phrase(\+ [a], [a], _).

% 7.14.2  ('.')//2 separates a terminal from the rest of the sequence.
answer(terminal_split, D) :- phrase(digit(D), [b]).
%% goal: answer(X0, X1)
