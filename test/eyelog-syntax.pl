% Eyelog syntax/API coverage tests.
% This file covers the Prolog-like subset Eyelog intentionally supports.
% It is not a complete ISO Prolog conformance suite.

% Comments and whitespace are ignored between tokens.
triple(atom_case, lower, atom).
triple(atom_case, underscore_digit, atom_123).
triple('quoted atom', p, 'atom with space').
triple('needs''quote', p, ok).
triple('empty atom', p, '').
triple(graphic_atom, value, #).

triple(string_case, simple, "hello world").
triple(string_case, escaped, "line\nquote: \"ok\"").

triple(integer_case, number, 123).
triple(negative_integer, number, -42).
triple(decimal_case, number, 0.25).
triple(scientific, number, 1.25e-3).
triple(scientific_plus, number, 1.25e+3).
triple(negative_decimal, number, -2.5).

triple(compound_case, term, pair(3, nested(atom, [x, y]))).
triple(zero_arity_compound, term, nil()).
triple(empty_list_case, value, []).
triple(proper_list_case, value, [a, b, c]).
triple(improper_list_case, value, [a, b | tail]).
triple(formula_case, value, (triple(a, b, c), triple(d, e, f))).

pair(foo, bar).
tail_of([_Head | Tail], Tail).
triple(list_case, tail, Tail) :- tail_of([a, b, c], Tail).
triple(anonymous_case, matched, true) :- pair(_, _).
triple(parenthesized_conjunction, matched, true) :- (pair(foo, bar), tail_of([a, b], [b])).
triple(eq_case, matched, true) :- eq(pair(a, b), pair(a, b)).
triple(neq_case, matched, true) :- neq(pair(a, b), pair(a, c)).
