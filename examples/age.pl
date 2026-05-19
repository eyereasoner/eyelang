% Age checker adapted from Eyeling.
%
% Is the age of a person above some duration?

% Person data.
triple(patH, birthDay, "1944-08-21").
triple(check, duration, "P80Y").

% A person is above a duration if the local date minus the birthday is greater
% than that duration.
triple(S, ageAbove, A) :-
  triple(S, birthDay, B),
  triple(check, duration, A),
  local_time(D),
  difference(D, B, F),
  gt(F, A).

% Test mirroring the Eyeling example.
triple(test, is, true) :-
  triple(S, ageAbove, "P80Y").
