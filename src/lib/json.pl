/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Written Apr 2021 by Aram Panasenco (panasenco@ucla.edu)
   Part of Scryer Prolog. Adapted for EyeProlog; the same JSON DCG is also
   distributed by Trealla Prolog.

   BSD 3-Clause License

   Copyright (c) 2021, Aram Panasenco
   All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:

   * Redistributions of source code must retain the above copyright notice, this
     list of conditions and the following disclaimer.

   * Redistributions in binary form must reproduce the above copyright notice,
     this list of conditions and the following disclaimer in the documentation
     and/or other materials provided with the distribution.

   * Neither the name of the copyright holder nor the names of its
     contributors may be used to endorse or promote products derived from
     this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
   DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
   FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
   DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
   SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
   CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
   OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

:- module(json, [json_chars//1]).

:- use_module(library(dcgs)).
:- use_module(library(dif)).

json_chars(Internal) --> json_element(Internal).

json_value(pairs(Pairs))    --> json_object(Pairs).
json_value(list(List))      --> json_array(List).
json_value(string(Chars))   --> json_string(Chars).
json_value(number(Number))  --> json_number(Number).
json_value(boolean(Bool))   --> json_boolean(Bool).
json_value(null)            --> "null".

json_boolean(true) --> "true".
json_boolean(false) --> "false".

json_object([]) --> "{", json_ws, "}".
json_object([Pair|Pairs]) --> "{", json_members(Pairs, Pair), "}".

json_members([], Key-Value) --> json_member(Key, Value).
json_members([NextPair|Pairs], Key-Value) -->
    json_member(Key, Value), ",", json_members(Pairs, NextPair).

json_member(string(Key), Value) --> json_ws, json_string(Key), json_ws, ":", json_element(Value).

json_array([]) --> "[", json_ws, "]".
json_array([Value|Values]) --> "[", json_elements(Values, Value), "]".

json_elements([], Value) --> json_element(Value).
json_elements([NextValue|Values], Value) -->
    json_element(Value), ",", json_elements(Values, NextValue).

json_element(Value) --> json_ws, json_value(Value), json_ws.
json_string(Chars) --> "\"", json_characters(Chars), "\"".

json_characters([]) --> [].
json_characters([Char|Chars]) --> json_character(Char), json_characters(Chars).

escape_char('"', '"').
escape_char('\\', '\\').
escape_char('/', '/').
escape_char('\b', 'b').
escape_char('\f', 'f').
escape_char('\n', 'n').
escape_char('\r', 'r').
escape_char('\t', 't').

json_character(EscapeChar) -->
    { escape_char(EscapeChar, PrintChar) }, "\\", [PrintChar].
json_character(PrintChar) -->
    [PrintChar],
    { dif(PrintChar, '\\'), dif(PrintChar, '"'), char_code(PrintChar, Code), Code >= 32 }.
json_character(EscapeChar) -->
    "\\u",
    ( parsing ->
        json_hex4(Code),
        json_unicode_parsed(Code, EscapeChar)
    ; { char_code(EscapeChar, Code) },
      json_unicode_generated(Code)
    ).

% JSON's \u escape syntax encodes UTF-16 code units. Combine a valid surrogate
% pair while parsing and split supplementary Unicode scalar values while
% generating. Lone surrogate code units are not Unicode scalar values and are
% therefore rejected instead of being passed to char_code/2.
json_unicode_parsed(Code, Char) -->
    { Code >= 55296, Code =< 56319 }, !,
    "\\u", json_hex4(Low),
    { Low >= 56320, Low =< 57343,
      Scalar is 65536 + (Code - 55296) * 1024 + (Low - 56320),
      char_code(Char, Scalar) }.
json_unicode_parsed(Code, _) -->
    { Code >= 56320, Code =< 57343 }, !,
    { fail }.
json_unicode_parsed(Code, Char) -->
    { char_code(Char, Code) }.

json_unicode_generated(Code) -->
    { Code > 65535 }, !,
    { Scalar is Code - 65536,
      High is 55296 + Scalar // 1024,
      Low is 56320 + Scalar mod 1024 },
    json_hex4(High), "\\u", json_hex4(Low).
json_unicode_generated(Code) -->
    { ( Code < 55296 ; Code > 57343 ) },
    json_hex4(Code).

json_hex4(Code) -->
    json_hex(H1), json_hex(H2), json_hex(H3), json_hex(H4),
    { ( nonvar(H1) ->
          Code is H1*4096 + H2*256 + H3*16 + H4
      ; H1 is (Code // 4096) mod 16,
        H2 is (Code // 256) mod 16,
        H3 is (Code // 16) mod 16,
        H4 is Code mod 16
      ) }.

json_hex(Digit) --> json_digit(Digit).
json_hex(10) --> "a". json_hex(11) --> "b". json_hex(12) --> "c".
json_hex(13) --> "d". json_hex(14) --> "e". json_hex(15) --> "f".
json_hex(10) --> "A". json_hex(11) --> "B". json_hex(12) --> "C".
json_hex(13) --> "D". json_hex(14) --> "E". json_hex(15) --> "F".

parsing, [C] --> [C], { nonvar(C) }.

json_number(Number) -->
    ( parsing ->
        json_sign_noplus(Sign), json_integer(Integer), json_fraction(Fraction), json_exponent(Exponent),
        { ( Exponent >= 0 -> Base = 10 ; Base = 10.0 ),
          Number is Sign * (Integer + Fraction) * Base ^ Exponent }
    ; { number_chars(Number, Chars) }, Chars
    ).

json_integer(Digit) --> json_digit(Digit).
json_integer(Total) -->
    json_onenine(First), json_digits(Remaining, Power),
    { Total is First * 10 ^ (Power + 1) + Remaining }.

json_digits(Digit, 0) --> json_digit(Digit).
json_digits(Value, Power) -->
    json_digit(First), json_digits(Remaining, NextPower),
    { Power is NextPower + 1, Value is First * 10^Power + Remaining }.

json_digit(0) --> "0".
json_digit(Digit) --> json_onenine(Digit).
json_onenine(1) --> "1". json_onenine(2) --> "2". json_onenine(3) --> "3".
json_onenine(4) --> "4". json_onenine(5) --> "5". json_onenine(6) --> "6".
json_onenine(7) --> "7". json_onenine(8) --> "8". json_onenine(9) --> "9".

json_fraction(0) --> [].
json_fraction(Fraction) -->
    ".", json_digits(Value, Power), { Fraction is Value / 10.0 ^ (Power + 1) }.

json_exponent(0) --> [].
json_exponent(Exponent) -->
    json_exponent_signifier, json_sign(Sign), json_digits(Value, _),
    { Exponent is Sign * Value }.

json_exponent_signifier --> "E".
json_exponent_signifier --> "e".
json_sign_noplus(1) --> [].
json_sign_noplus(-1) --> "-".
json_sign(Sign) --> json_sign_noplus(Sign).
json_sign(1) --> "+".

json_ws_empty --> [].
json_ws_nonempty --> " ".
json_ws_nonempty --> "\n".
json_ws_nonempty --> "\r".
json_ws_nonempty --> "\t".
json_ws_greedy --> json_ws_nonempty, json_ws_greedy.
json_ws_greedy --> json_ws_empty.
json_ws_lazy --> json_ws_empty.
json_ws_lazy --> json_ws_nonempty, json_ws_lazy.
json_ws --> ( parsing -> json_ws_greedy ; json_ws_lazy ).
