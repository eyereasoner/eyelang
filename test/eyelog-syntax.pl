% Eyelog syntax/API coverage tests.
% This file covers the Prolog-like subset Eyelog intentionally supports.
% It is not a complete ISO Prolog conformance suite.

% Comments and whitespace are ignored between tokens.
materialize(lower, 2).
materialize(underscore_digit, 2).
materialize(p, 2).
materialize(value, 2).
materialize(simple, 2).
materialize(escaped, 2).
materialize(number, 2).
materialize(term, 2).
materialize(tail, 2).
materialize(matched, 2).

lower(atom_case, atom).
underscore_digit(atom_case, atom_123).
p('quoted atom', 'atom with space').
p('needs''quote', ok).
p('empty atom', '').
value(graphic_atom, #).

simple(string_case, "hello world").
escaped(string_case, "line\nquote: \"ok\"").

number(integer_case, 123).
number(negative_integer, -42).
number(decimal_case, 0.25).
number(scientific, 1.25e-3).
number(scientific_plus, 1.25e+3).
number(negative_decimal, -2.5).

term(compound_case, pair(3, nested(atom, [x, y]))).
term(zero_arity_compound, nil()).
value(empty_list_case, []).
value(proper_list_case, [a, b, c]).
value(improper_list_case, [a, b | tail]).
value(formula_case, (b(a, c), e(d, f))).

pair(foo, bar).
tail_of([_Head | Tail], Tail).
tail(list_case, Tail) :- tail_of([a, b, c], Tail).
matched(anonymous_case, true) :- pair(_, _).
matched(parenthesized_conjunction, true) :- (pair(foo, bar), tail_of([a, b], [b])).
matched(eq_case, true) :- eq(pair(a, b), pair(a, b)).
matched(neq_case, true) :- neq(pair(a, b), pair(a, c)).
