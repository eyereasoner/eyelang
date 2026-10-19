% Hamming(7,4), even parity. Positions 1, 2, 4 hold parity bits.
% Under the assumption of at most one flipped bit, a nonzero syndrome is its
% position. Two or more errors can be miscorrected; this code does not detect
% all double errors. Payload order: positions 3, 5, 6, 7.

received(packet1, [1, 0, 1, 1, 1, 1, 0]).
bit(0).
bit(1).

:- table decode/4, correct/4, correct_bit/4.
decode([B1, B2, B3, B4, B5, B6, B7], Syndrome, Corrected, [D1, D2, D3, D4]) :-
  bit(B1), bit(B2), bit(B3), bit(B4), bit(B5), bit(B6), bit(B7),
  S1 is (B1+B3+B5+B7) mod 2,
  S2 is (B2+B3+B6+B7) mod 2,
  S4 is (B4+B5+B6+B7) mod 2,
  Syndrome is S1+2*S2+4*S4,
  correct([B1, B2, B3, B4, B5, B6, B7], 1, Syndrome, Corrected),
  Corrected = [_, _, D1, _, D2, D3, D4].

correct([], _, _, []).
correct([Bit|Rest], Position, Syndrome, [Fixed|Tail]) :-
  correct_bit(Position, Syndrome, Bit, Fixed),
  Next is Position+1,
  correct(Rest, Next, Syndrome, Tail).
correct_bit(Position, Syndrome, Bit, Fixed) :-
  Position =:= Syndrome, Fixed is 1-Bit.
correct_bit(Position, Syndrome, Bit, Bit) :-
  Position =\= Syndrome.

decoded(Name, Syndrome, Corrected, Payload) :-
  received(Name, Bits), decode(Bits, Syndrome, Corrected, Payload).

% Answer and Reason
?- decoded(Name, Syndrome, Corrected, Payload).
?- why.

% Check
:- assertion(decoded(packet1, 5, [1, 0, 1, 1, 0, 1, 0], [1, 0, 1, 0])).
:- assertion(decode([1, 0, 1, 1, 0, 1, 0], 0, [1, 0, 1, 1, 0, 1, 0], [1, 0, 1, 0])).
:- assertion(decode([0, 0, 0, 0, 0, 0, 1], 7, [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0])).
