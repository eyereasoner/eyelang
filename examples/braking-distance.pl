% Illustrative constant-friction model on a level road, without air resistance.
% Units: speed m/s, reaction time s, gravity m/s^2, distances m.
% The result only compares the model's distance with the supplied gap.

gravity(9.8).
reaction_time(1.0).
% scenario(Name, Speed, FrictionCoefficient, AvailableDistance).
scenario(city_dry, 13.9, 0.8, 40.0).
scenario(highway_short_gap, 27.8, 0.8, 60.0).
scenario(city_wet, 13.9, 0.4, 40.0).
scenario(city_ice, 13.9, 0.2, 30.0).

distance(Name, Reaction, Braking, Total) :-
  scenario(Name, Speed, Mu, _), gravity(G), reaction_time(T),
  Speed >= 0, Mu > 0, Mu =< 1, G > 0, T >= 0,
  Reaction is Speed*T,
  Braking is Speed*Speed/(2*Mu*G),
  Total is Reaction+Braking.

gap_status(Name, sufficient_in_model) :-
  distance(Name, _, _, Total), scenario(Name, _, _, Available),
  Total =< Available.
gap_status(Name, insufficient_in_model) :-
  distance(Name, _, _, Total), scenario(Name, _, _, Available),
  Total > Available.

% Round displayed distances to six decimal places; checks use raw values.
stopping_distance_m(Name, Rounded) :-
  distance(Name, _, _, Total),
  Rounded is round(Total*1000000)/1000000.

% Answer and Reason
?- gap_status(Name, Status).
?- why.
?- stopping_distance_m(Name, Distance).

% Check
:- assertion(gap_status(city_dry, sufficient_in_model)).
:- assertion(gap_status(city_wet, sufficient_in_model)).
:- assertion(gap_status(highway_short_gap, insufficient_in_model)).
:- assertion(gap_status(city_ice, insufficient_in_model)).
:- assertion((distance(city_dry, _, _, Dry), distance(city_wet, _, _, Wet), distance(city_ice, _, _, Ice), Dry < Wet, Wet < Ice)).
:- assertion((distance(city_dry, R, B, D), abs(D-R-B) < 1.0e-12)).
