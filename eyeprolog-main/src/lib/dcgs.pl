/** Scryer-compatible DCG helpers.

    EyeProlog already provides phrase/2-3 and ISO-style grammar expansion in the
    runtime.  This module supplies the sequence combinators used by Scryer's
    declarative libraries and exports the built-in phrase predicates under the
    expected module name.
*/

:- module(dcgs, [
    phrase/2,
    phrase/3,
    seq//1,
    seqq//1
]).

seq([]) --> [].
seq([Element|Elements]) --> [Element], seq(Elements).

seqq([]) --> [].
seqq([Elements|Sequences]) --> seq(Elements), seqq(Sequences).

'...' --> [].
'...' --> [_], '...'.
