% HTTP/HTTPS client example. This file has no automatic golden query because it
% intentionally depends on the network endpoint supplied by the caller.
%
% Example query:
%   ?- fetch_json("https://example.org/api/status", JSON, Code).

:- use_module(library(http)).
:- use_module(library(json)).
:- use_module(library(dcgs)).

fetch_json(URL, JSON, Code) :-
    http_get(URL, Body, [status_code(Code), header("accept", "application/json")]),
    phrase(json_chars(JSON), Body).
