% Engineering example: cantilever beam tip deflection.
%
% The tip deflection for a point load at the free end is F*L^3/(3*E*I).

beam(beam1, force_N, 1200.0).
beam(beam1, length_m, 2.5).
beam(beam1, elasticModulus_Pa, 200000000000.0).
beam(beam1, secondMoment_m4, 0.000008).
limit(beam1, maxDeflection_mm, 5.0).

tip_deflection_m(Beam, Deflection) :-
  beam(Beam, force_N, Force),
  beam(Beam, length_m, Length),
  beam(Beam, elasticModulus_Pa, ElasticModulus),
  beam(Beam, secondMoment_m4, SecondMoment),
  pow(Length, 3.0, LengthCubed),
  mul(Force, LengthCubed, Numerator),
  mul(3.0, ElasticModulus, ThreeE),
  mul(ThreeE, SecondMoment, Denominator),
  div(Numerator, Denominator, Deflection).

tip_deflection_mm(Beam, DeflectionMm) :-
  tip_deflection_m(Beam, DeflectionM),
  mul(DeflectionM, 1000.0, DeflectionMm).

triple(Beam, type, cantilever_beam) :-
  beam(Beam, force_N, _Force).

triple(Beam, tipDeflection_m, DeflectionM) :-
  tip_deflection_m(Beam, DeflectionM).

triple(Beam, tipDeflection_mm, DeflectionMm) :-
  tip_deflection_mm(Beam, DeflectionMm).

triple(Beam, limit_mm, Limit) :-
  limit(Beam, maxDeflection_mm, Limit).

triple(Beam, status, within_deflection_limit) :-
  tip_deflection_mm(Beam, DeflectionMm),
  limit(Beam, maxDeflection_mm, Limit),
  le(DeflectionMm, Limit).
