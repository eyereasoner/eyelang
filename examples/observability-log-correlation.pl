% Observability example: parse service logs, then correlate events that share
% a trace id. The noisy health-check line deliberately remains unparsed.
%
% The documented format has the fixed key order shown below, single spaces
% between fields, and nonempty printable ASCII values. Levels, events, and
% users contain ASCII letters, digits, or underscores. Timestamps and IPs are
% opaque tokens. Version 00 traceparent fields contain 32, 16, and 2 lowercase
% hexadecimal digits; this example does not implement every trace-context rule.
%
% Character-code lists and ordinary clauses perform the parse. Parsed fields
% become ordinary terms; =../2 lets one rule expose their names and values.

:- table parse_log/2, literal/3, field/3, field_tail/3, word_codes/1,
         hex_segment/4, member/2, append/3.

% Raw service logs.
raw_log(l1, 'ts=2026-06-18T10:00:00Z level=warn event=login_failed user=alice ip=203.0.113.9 traceparent=00-4bf92f3577b34da6a3ce929d0e0e4736-00f067aa0ba902b7-01').
raw_log(l2, 'ts=2026-06-18T10:00:03Z level=error event=payment_denied user=alice ip=203.0.113.9 traceparent=00-4bf92f3577b34da6a3ce929d0e0e4736-aaf067aa0ba90000-01').
raw_log(l3, 'ts=2026-06-18T10:01:12Z level=info event=login_success user=bob ip=198.51.100.4 traceparent=00-aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa-bbbbbbbbbbbbbbbb-01').
raw_log(noise, 'healthcheck ok').

append([], Right, Right).
append([Head | Rest], Right, [Head | Joined]) :- append(Rest, Right, Joined).
member(Head, [Head | _]).
member(Value, [_ | Rest]) :- member(Value, Rest).
literal(Text, Codes, Rest) :- string_codes(Text, Prefix), append(Prefix, Rest, Codes).

% A field consumes a nonempty token and exactly one following space.
field([Code | Codes], [Code | Value], Rest) :-
  Code >= 33, Code =< 126, field_tail(Codes, Value, Rest).
field_tail([32 | Rest], [], Rest).
field_tail([Code | Codes], [Code | Value], Rest) :-
  Code >= 33, Code =< 126, field_tail(Codes, Value, Rest).
word_codes([]).
word_codes([Code | Rest]) :- word_code(Code), word_codes(Rest).
word_code(Code) :- Code >= 48, Code =< 57.
word_code(Code) :- Code >= 65, Code =< 90.
word_code(Code) :- Code >= 97, Code =< 122.
word_code(95).
hex_code(Code) :- Code >= 48, Code =< 57.
hex_code(Code) :- Code >= 97, Code =< 102.
hex_segment(0, Rest, [], Rest).
hex_segment(Count, [Code | Codes], [Code | Value], Rest) :-
  Count > 0,
  hex_code(Code),
  Previous is Count - 1,
  hex_segment(Previous, Codes, Value, Rest).

parse_log(Codes, [ts(Ts), level(Level), event(Event), user(User), ip(Ip),
                  trace_id(Trace), span_id(Span), flags(Flags)]) :-
  literal("ts=", Codes, A), field(A, TsCodes, B),
  literal("level=", B, C), field(C, LevelCodes, D), word_codes(LevelCodes),
  literal("event=", D, E), field(E, EventCodes, F), word_codes(EventCodes),
  literal("user=", F, G), field(G, UserCodes, H), word_codes(UserCodes),
  literal("ip=", H, I), field(I, IpCodes, J),
  literal("traceparent=00-", J, K),
  hex_segment(32, K, TraceCodes, [45 | L]),
  hex_segment(16, L, SpanCodes, [45 | M]),
  hex_segment(2, M, FlagCodes, []),
  atom_codes(Ts, TsCodes), atom_codes(Level, LevelCodes),
  atom_codes(Event, EventCodes), atom_codes(User, UserCodes),
  atom_codes(Ip, IpCodes), atom_codes(Trace, TraceCodes),
  atom_codes(Span, SpanCodes), atom_codes(Flags, FlagCodes).

parsed(Log, Context) :- raw_log(Log, Text), atom_codes(Text, Codes), parse_log(Codes, Context).
parsed_log(Log) :- parsed(Log, _).
unparsed_log(Log) :- raw_log(Log, _), \+ parsed_log(Log).
captured_field(Log, Name, Value) :- parsed(Log, Context), member(Field, Context), Field =.. [Name, Value].
parsed_event(Log, Event, User, Ip, Traceid) :-
  parsed(Log, Context),
  member(event(Event), Context), member(user(User), Context),
  member(ip(Ip), Context), member(trace_id(Traceid), Context).
trace_alert(User, Traceid, Ip) :-
  parsed_event(Loginlog, login_failed, User, Ip, Traceid),
  parsed_event(Paymentlog, payment_denied, User, Ip, Traceid),
  Loginlog \= Paymentlog.

% Answer and Reason
?- parsed_event(Log, Event, User, Ip, Trace).
?- captured_field(Log, Name, Value).
?- trace_alert(User, Trace, Ip).
?- why.
?- unparsed_log(Log).

% Check
:- assertion(trace_alert(alice, '4bf92f3577b34da6a3ce929d0e0e4736', '203.0.113.9')).
:- assertion(captured_field(l1, level, warn)).
:- assertion(captured_field(l2, event, payment_denied)).
:- assertion(captured_field(l3, user, bob)).
:- assertion(captured_field(l1, flags, '01')).
:- assertion(unparsed_log(noise)).
:- assertion(aggregate_all(count, parsed_log(Log), 3)).
:- assertion(aggregate_all(count, captured_field(Log, Name, Value), 24)).
:- assertion(aggregate_all(count, trace_alert(User, Trace, Ip), 1)).
:- assertion(\+ parsed_log(noise)).
