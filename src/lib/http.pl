/** HTTP/HTTPS client helpers and a small HTTP server facade.

    The client API combines the Scryer http_open/3 option surface with the
    Trealla convenience predicates. HTTP and HTTPS client exchanges are
    performed by the matching src/http-host.js adapter; response bodies are
    returned as ordinary EyeProlog text streams.
*/

:- module(http, [
    http_open/3,
    http_get/3,
    http_post/4,
    http_patch/4,
    http_put/4,
    http_delete/3,
    http_server/2,
    http_request/5
]).

:- use_module(library(charsio), [get_line_to_chars/3, get_n_chars/3]).
:- use_module(library(error), [must_be/2]).
:- use_module(library(lists), [append/3, member/2, memberchk/2, maplist/3]).
:- use_module(library(sockets)).

:- meta_predicate(http_server(1, '?')).

http_open(Address0, Response, Options0) :-
    must_be(list, Options0),
    http__normalize_address(Address0, Options0, Address, Options),
    http__method(Options, Method),
    http__data(Options, Data),
    http__request_headers(Options, RequestHeaders),
    eyeprolog__http_open(Address, Response, Method, Data, Code, RequestHeaders, RawHeaders, FinalUrl),
    http__scryer_headers(RawHeaders, Headers),
    http__bind_option(status_code, Code, Options),
    http__bind_option(headers, Headers, Options),
    http__bind_option(final_url, FinalUrl, Options),
    http__bind_size(Options, RawHeaders).


http__normalize_address(Address, Options, URL, Effective) :-
    nonvar(Address),
    memberchk(host(Host), Address),
    memberchk(path(Path), Address), !,
    append(Address, Options, Effective),
    ( memberchk(scheme(Scheme0), Address) -> Scheme = Scheme0
    ; memberchk(https(true), Address) -> Scheme = https
    ; Scheme = http
    ),
    http__text_chars(Scheme, SchemeChars),
    http__text_chars(Host, HostChars),
    http__text_chars(Path, Path0),
    http__ensure_slash(Path0, PathChars),
    ( memberchk(port(Port), Address) ->
        http__text_chars(Port, PortChars),
        append(HostChars, [':'|PortChars], Authority)
    ; Authority = HostChars
    ),
    append(SchemeChars, "://", A0),
    append(A0, Authority, A1),
    append(A1, PathChars, URL).
http__normalize_address(Address, Options, Address, Options).

http__text_chars(Text, Chars) :- atom(Text), !, atom_chars(Text, Chars).
http__text_chars(Text, Chars) :- number(Text), !, number_chars(Text, Chars).
http__text_chars(Text, Text).

http__ensure_slash([], "/") :- !.
http__ensure_slash(['/'|Rest], ['/'|Rest]) :- !.
http__ensure_slash(Path, ['/'|Path]).

http_get(Address, Data, Options) :-
    http__request_data(Address, get, [], Data, Options).

http_post(Address, PostData, Reply, Options) :-
    http__request_data(Address, post, PostData, Reply, Options).

http_patch(Address, PostData, Reply, Options) :-
    http__request_data(Address, patch, PostData, Reply, Options).

http_put(Address, PostData, Reply, Options) :-
    http__request_data(Address, put, PostData, Reply, Options).

http_delete(Address, Data, Options) :-
    http__request_data(Address, delete, [], Data, Options).

http__request_data(Address, DefaultMethod, Payload, Data, Options) :-
    must_be(list, Options),
    ( memberchk(method(Method0), Options) -> http__valid_method(Method0), Method = Method0 ; Method = DefaultMethod ),
    ( memberchk(data(Data0), Options) -> Payload0 = Data0 ; Payload0 = Payload ),
    http__request_headers(Options, RequestHeaders),
    eyeprolog__http_open(Address, Stream, Method, Payload0, Code, RequestHeaders, RawHeaders, FinalUrl),
    get_n_chars(Stream, _, Data),
    close(Stream),
    http__trealla_headers(RawHeaders, Headers),
    http__bind_option(status_code, Code, Options),
    http__bind_option(headers, Headers, Options),
    http__bind_option(final_url, FinalUrl, Options),
    http__bind_size(Options, RawHeaders).

http__method(Options, Method) :-
    ( memberchk(method(Method0), Options) -> http__valid_method(Method0), Method = Method0 ; Method = get ).

http__valid_method(Method) :-
    ( var(Method) -> throw(error(instantiation_error, http_open/3))
    ; memberchk(Method, [get,post,put,delete,patch,head]) -> true
    ; throw(error(domain_error(http_option, method(Method)), http_open/3))
    ).

http__data(Options, Data) :-
    ( memberchk(data(Data0), Options) ->
        ( var(Data0) -> throw(error(instantiation_error, http_open/3)) ; Data = Data0 )
    ; Data = []
    ).

http__request_headers(Options, Headers) :-
    ( memberchk(request_headers(Input), Options) ->
        ( var(Input) -> throw(error(instantiation_error, http_open/3)) ; true ),
        maplist(http__header_term, Input, Base)
    ; Base = [header('user-agent', "EyeProlog")]
    ),
    http__trealla_request_headers(Options, Extra),
    append(Base, Extra, Headers).

http__trealla_request_headers([], []).
http__trealla_request_headers([header(Name,Value)|Options], [header(Name,Value)|Headers]) :- !,
    http__trealla_request_headers(Options, Headers).
http__trealla_request_headers([_|Options], Headers) :-
    http__trealla_request_headers(Options, Headers).

http__header_term(header(Name,Value), header(Name,Value)) :- !.
http__header_term(Name-Value, header(Name,Value)) :- !.
http__header_term(Name:Value, header(Name,Value)) :- !.
http__header_term(Term, header(Name,Value)) :-
    Term =.. [Name,Value].

http__scryer_headers([], []).
http__scryer_headers([header(Name,Value)|Headers], [Term|Terms]) :-
    Term =.. [Name,Value],
    http__scryer_headers(Headers, Terms).

http__trealla_headers([], []).
http__trealla_headers([header(Name,Value)|Headers], [NameChars:Value|Terms]) :-
    atom_chars(Name, NameChars),
    http__trealla_headers(Headers, Terms).

http__bind_option(Name, Value, Options) :-
    ( member(Option, Options), Option =.. [Name,Target] -> Target = Value ; true ).

http__bind_size(Options, RawHeaders) :-
    ( memberchk(size(Size), Options) ->
        ( memberchk(header('content-length',Chars), RawHeaders) -> number_chars(Size, Chars) ; fail )
    ; true
    ).

% One accepted connection per call. This mirrors Trealla's compact facade while
% keeping EyeProlog's synchronous execution model explicit.
http_server(Goal, Options) :-
    must_be(list, Options),
    ( memberchk(port(Port), Options) -> true ; Port = 0 ),
    socket_server_open(Port, Server),
    socket_server_accept(Server, _Client, Stream, [type(text)]),
    socket_server_close(Server),
    call(Goal, Stream).

http_request(Stream, Method, Path, Version, Headers) :-
    http__read_line(Stream, RequestLine),
    http__split_once(' ', RequestLine, Method0, Rest0),
    http__split_once(' ', Rest0, Path, Version0),
    http__uppercase(Method0, Method),
    http__drop_http_prefix(Version0, Version),
    http__read_headers(Stream, Headers).

http__read_headers(Stream, Headers) :-
    http__read_line(Stream, Line),
    ( Line = [] -> Headers = []
    ; http__split_once(':', Line, Name0, Value0),
      http__lowercase(Name0, Name),
      http__trim_left(Value0, Value),
      Headers = [Name:Value|Rest],
      http__read_headers(Stream, Rest)
    ).

http__read_line(Stream, Line) :-
    get_line_to_chars(Stream, Raw, []),
    http__strip_line_end(Raw, Line).

http__strip_line_end(Raw, Line) :-
    ( append(Line0, ['\r','\n'], Raw) -> Line = Line0
    ; append(Line0, ['\n'], Raw) -> Line = Line0
    ; Line = Raw
    ).

http__split_once(Sep, [Sep|Xs], [], Xs) :- !.
http__split_once(Sep, [X|Xs], [X|Ys], Rest) :-
    http__split_once(Sep, Xs, Ys, Rest).

http__drop_http_prefix(['H','T','T','P','/'|Version], Version) :- !.
http__drop_http_prefix(Version, Version).

http__trim_left([' '|Xs], Ys) :- !, http__trim_left(Xs, Ys).
http__trim_left(['\t'|Xs], Ys) :- !, http__trim_left(Xs, Ys).
http__trim_left(Xs, Xs).

http__uppercase([], []).
http__uppercase([C|Cs], [U|Us]) :-
    char_code(C, Code),
    ( Code >= 97, Code =< 122 -> Upper is Code - 32, char_code(U, Upper) ; U = C ),
    http__uppercase(Cs, Us).

http__lowercase([], []).
http__lowercase([C|Cs], [L|Ls]) :-
    char_code(C, Code),
    ( Code >= 65, Code =< 90 -> Lower is Code + 32, char_code(L, Lower) ; L = C ),
    http__lowercase(Cs, Ls).
