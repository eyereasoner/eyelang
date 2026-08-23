% Float-reading draft review associated with STC #73 / issue #54. EyeProlog's
% finite-double profile permits input underflow to round to zero.
% https://www.complang.tuwien.ac.at/ulrich/iso-prolog/stc#73
%% goal: float_underflow_input

float_underflow_input :-
  number_chars(Positive, "1.0e-99999"),
  Positive =:= 0.0,
  number_chars(Negative, "-1.0e-99999"),
  Negative =:= 0.0.
