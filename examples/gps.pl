% Goal-driven route planning adapted from Eyeling's gps.n3 example.
% Lists hold the planned action sequence; list:append/3 extends paths.
route_query(:gent, :oostende).

road(:gent, :brugge, drive_gent_brugge, 1500, 6).
road(:gent, :kortrijk, drive_gent_kortrijk, 1600, 7).
road(:kortrijk, :brugge, drive_kortrijk_brugge, 1600, 7).
road(:brugge, :oostende, drive_brugge_oostende, 900, 4).

path(From, To, [Action], Duration, Cost) :-
  road(From, To, Action, Duration, Cost).

path(From, To, Actions, Duration, Cost) :-
  road(From, Mid, Action, D1, C1),
  path(Mid, To, RestActions, D2, C2),
  list:append([Action], RestActions, Actions),
  add(D1, D2, Duration),
  add(C1, C2, Cost).

direct_route(Duration, Cost) :-
  path(:gent, :oostende, [drive_gent_brugge, drive_brugge_oostende], Duration, Cost).

via_kortrijk_route(Duration, Cost) :-
  path(:gent, :oostende, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], Duration, Cost).

triple(:gps, :path, route(Actions, Duration, Cost)) :-
  route_query(From, To),
  path(From, To, Actions, Duration, Cost).

triple(:gps, :recommended, [drive_gent_brugge, drive_brugge_oostende]) :-
  direct_route(DirectDuration, DirectCost),
  via_kortrijk_route(ViaDuration, ViaCost),
  lt(DirectDuration, ViaDuration),
  lt(DirectCost, ViaCost).
