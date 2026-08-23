/** Reproducible UUID version 4 generation. */

:- module(uuid, [uuid/3]).

:- use_module(library(random), [random/3]).

% Seed-threaded UUID version 4 generation. The version and variant nibbles are
% fixed by RFC 9562; all other nibbles come from random/3. Reusing Seed0
% reproduces the same UUID, while threading Seed produces a deterministic
% sequence of different UUIDs.
uuid(Seed0, UUID, Seed) :-
    uuid__uuid_hex(8, Seed0, Group1, Seed1),
    uuid__uuid_hex(4, Seed1, Group2, Seed2),
    uuid__uuid_hex(3, Seed2, Group3, Seed3),
    random(Seed3, _, Seed4),
    VariantValue is 8 + Seed4 mod 4,
    uuid__hex_digit(VariantValue, Variant),
    uuid__uuid_hex(3, Seed4, Group4, Seed5),
    uuid__uuid_hex(12, Seed5, Group5, Seed),
    uuid__append(Group1, ['-'|Tail1], Chars),
    uuid__append(Group2, ['-','4'|Tail2], Tail1),
    uuid__append(Group3, ['-',Variant|Tail3], Tail2),
    uuid__append(Group4, ['-'|Group5], Tail3),
    atom_chars(UUID, Chars).

uuid__uuid_hex(0, Seed, [], Seed).
uuid__uuid_hex(Count, Seed0, [Digit|Digits], Seed) :-
    Count > 0,
    random(Seed0, _, Seed1),
    Value is Seed1 mod 16,
    uuid__hex_digit(Value, Digit),
    NextCount is Count - 1,
    uuid__uuid_hex(NextCount, Seed1, Digits, Seed).

uuid__hex_digit(0, '0').
uuid__hex_digit(1, '1').
uuid__hex_digit(2, '2').
uuid__hex_digit(3, '3').
uuid__hex_digit(4, '4').
uuid__hex_digit(5, '5').
uuid__hex_digit(6, '6').
uuid__hex_digit(7, '7').
uuid__hex_digit(8, '8').
uuid__hex_digit(9, '9').
uuid__hex_digit(10, a).
uuid__hex_digit(11, b).
uuid__hex_digit(12, c).
uuid__hex_digit(13, d).
uuid__hex_digit(14, e).
uuid__hex_digit(15, f).

uuid__append([], Ys, Ys).
uuid__append([X|Xs], Ys, [X|Zs]) :- uuid__append(Xs, Ys, Zs).

