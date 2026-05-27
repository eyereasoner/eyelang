% Alignment demo, adapted from Eyeling's examples/alignment-demo.n3.
%
% Telraam and ANPR concepts are mapped into a small reference taxonomy.
% The derived output shows concepts that roll up to the reference car class.

materialize(rollsUpTo, 2).

concept(ref_car).
concept(tel_car).
concept(tel_heavy_vehicle).
concept(anpr_vehicle_with_plate).
concept(anpr_passenger_car).

broader(anpr_passenger_car, anpr_vehicle_with_plate).
broadMatch(tel_car, ref_car).
broadMatch(tel_heavy_vehicle, ref_car).
broadMatch(anpr_vehicle_with_plate, ref_car).

broader(X, Y) :- broadMatch(X, Y).

broaderTransitive(X, Y) :- broader(X, Y).
broaderTransitive(X, Z) :- broaderTransitive(X, Y), broaderTransitive(Y, Z).

narrowerOrEqualOf(X, X) :- concept(X).
narrowerOrEqualOf(X, Y) :- broaderTransitive(X, Y).

rollsUpTo(X, ref_car) :-
  narrowerOrEqualOf(X, ref_car),
  neq(X, ref_car).
