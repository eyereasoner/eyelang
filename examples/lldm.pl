% Leg Length Discrepancy Measurement, adapted from Eyeling lldm.n3.
%
% The example computes projected hip/knee points and the final discrepancy
% from four measured X/Y points.  N3 math built-ins are mapped to Eyelog's
% native arithmetic predicates: sub/3, div/3, mul/3, add/3, pow/3, lt/2,
% and gt/2.

% measurement data
triple(meas47, type, measurement).
triple(meas47, p1xCm, 10.1).
triple(meas47, p1yCm, 7.8).
triple(meas47, p2xCm, 45.1).
triple(meas47, p2yCm, 5.6).
triple(meas47, p3xCm, 3.6).
triple(meas47, p3yCm, 29.8).
triple(meas47, p4xCm, 54.7).
triple(meas47, p4yCm, 28.5).

% measurement axioms
triple(p1, type, point).
triple(p1, incident, l1).
triple(p2, type, point).
triple(p2, incident, l1).
triple(p3, type, point).
triple(p3, incident, l3).
triple(p4, type, point).
triple(p4, incident, l4).
triple(p5, type, point).
triple(p5, incident, l1).
triple(p5, incident, l3).
triple(p6, type, point).
triple(p6, incident, l1).
triple(p6, incident, l4).
triple(l1, type, line).
triple(l1, perpendicular, l3).
triple(l1, perpendicular, l4).
triple(l3, type, line).
triple(l4, type, line).
triple(incident, rdfs_domain, point).
triple(incident, rdfs_range, line).
triple(incident, owl_inverseOf, contains).
triple(perpendicular, rdfs_domain, line).
triple(perpendicular, rdfs_range, line).
triple(perpendicular, type, owl_SymmetricProperty).
triple(p1xCm, rdfs_domain, measurement).
triple(p1xCm, rdfs_range, quantity).
triple(p1yCm, rdfs_domain, measurement).
triple(p1yCm, rdfs_range, quantity).
triple(p2xCm, rdfs_domain, measurement).
triple(p2xCm, rdfs_range, quantity).
triple(p2yCm, rdfs_domain, measurement).
triple(p2yCm, rdfs_range, quantity).
triple(p3xCm, rdfs_domain, measurement).
triple(p3xCm, rdfs_range, quantity).
triple(p3yCm, rdfs_domain, measurement).
triple(p3yCm, rdfs_range, quantity).
triple(p4xCm, rdfs_domain, measurement).
triple(p4xCm, rdfs_range, quantity).
triple(p4yCm, rdfs_domain, measurement).
triple(p4yCm, rdfs_range, quantity).
triple(p5xCm, rdfs_domain, measurement).
triple(p5xCm, rdfs_range, quantity).
triple(p5yCm, rdfs_domain, measurement).
triple(p5yCm, rdfs_range, quantity).
triple(p6xCm, rdfs_domain, measurement).
triple(p6xCm, rdfs_range, quantity).
triple(p6yCm, rdfs_domain, measurement).
triple(p6yCm, rdfs_range, quantity).
triple(dx12Cm, rdfs_domain, measurement).
triple(dx12Cm, rdfs_range, quantity).
triple(dx51Cm, rdfs_domain, measurement).
triple(dx51Cm, rdfs_range, quantity).
triple(dx53Cm, rdfs_domain, measurement).
triple(dx53Cm, rdfs_range, quantity).
triple(dx62Cm, rdfs_domain, measurement).
triple(dx62Cm, rdfs_range, quantity).
triple(dx64Cm, rdfs_domain, measurement).
triple(dx64Cm, rdfs_range, quantity).
triple(dy12Cm, rdfs_domain, measurement).
triple(dy12Cm, rdfs_range, quantity).
triple(dy13Cm, rdfs_domain, measurement).
triple(dy13Cm, rdfs_range, quantity).
triple(dy24Cm, rdfs_domain, measurement).
triple(dy24Cm, rdfs_range, quantity).
triple(dy53Cm, rdfs_domain, measurement).
triple(dy53Cm, rdfs_range, quantity).
triple(dy64Cm, rdfs_domain, measurement).
triple(dy64Cm, rdfs_range, quantity).
triple(cL1, rdfs_domain, measurement).
triple(cL1, rdfs_range, quantity).
triple(dL3m, rdfs_domain, measurement).
triple(dL3m, rdfs_range, quantity).
triple(cL3, rdfs_domain, measurement).
triple(cL3, rdfs_range, quantity).
triple(pL1x1Cm, rdfs_domain, measurement).
triple(pL1x1Cm, rdfs_range, quantity).
triple(pL1x2Cm, rdfs_domain, measurement).
triple(pL1x2Cm, rdfs_range, quantity).
triple(pL3x3Cm, rdfs_domain, measurement).
triple(pL3x3Cm, rdfs_range, quantity).
triple(pL3x4Cm, rdfs_domain, measurement).
triple(pL3x4Cm, rdfs_range, quantity).
triple(dd13Cm, rdfs_domain, measurement).
triple(dd13Cm, rdfs_range, quantity).
triple(ddy13Cm, rdfs_domain, measurement).
triple(ddy13Cm, rdfs_range, quantity).
triple(dd24Cm, rdfs_domain, measurement).
triple(dd24Cm, rdfs_range, quantity).
triple(ddy24Cm, rdfs_domain, measurement).
triple(ddy24Cm, rdfs_range, quantity).
triple(ddL13, rdfs_domain, measurement).
triple(ddL13, rdfs_range, quantity).
triple(pL1dx51Cm, rdfs_domain, measurement).
triple(pL1dx51Cm, rdfs_range, quantity).
triple(pL1dx62Cm, rdfs_domain, measurement).
triple(pL1dx62Cm, rdfs_range, quantity).
triple(sdx53Cm2, rdfs_domain, measurement).
triple(sdx53Cm2, rdfs_range, quantity).
triple(sdx64Cm2, rdfs_domain, measurement).
triple(sdx64Cm2, rdfs_range, quantity).
triple(sdy53Cm2, rdfs_domain, measurement).
triple(sdy53Cm2, rdfs_range, quantity).
triple(sdy64Cm2, rdfs_domain, measurement).
triple(sdy64Cm2, rdfs_range, quantity).
triple(sdd53Cm2, rdfs_domain, measurement).
triple(sdd53Cm2, rdfs_range, quantity).
triple(sdd64Cm2, rdfs_domain, measurement).
triple(sdd64Cm2, rdfs_range, quantity).
triple(ssd53Cm2, rdfs_domain, measurement).
triple(ssd53Cm2, rdfs_range, quantity).
triple(ssd64Cm2, rdfs_domain, measurement).
triple(ssd64Cm2, rdfs_range, quantity).
triple(d53Cm, rdfs_domain, measurement).
triple(d53Cm, rdfs_range, quantity).
triple(d64Cm, rdfs_domain, measurement).
triple(d64Cm, rdfs_range, quantity).
triple(dCm, rdfs_domain, measurement).
triple(dCm, rdfs_range, quantity).

% measurement implications
triple(M, dx12Cm, Z) :- triple(M, type, measurement), triple(M, p1xCm, X), triple(M, p2xCm, Y), sub(X, Y, Z).
triple(M, dx51Cm, Z) :- triple(M, type, measurement), triple(M, p5xCm, X), triple(M, p1xCm, Y), sub(X, Y, Z).
triple(M, dx53Cm, Z) :- triple(M, type, measurement), triple(M, p5xCm, X), triple(M, p3xCm, Y), sub(X, Y, Z).
triple(M, dx62Cm, Z) :- triple(M, type, measurement), triple(M, p6xCm, X), triple(M, p2xCm, Y), sub(X, Y, Z).
triple(M, dx64Cm, Z) :- triple(M, type, measurement), triple(M, p6xCm, X), triple(M, p4xCm, Y), sub(X, Y, Z).
triple(M, dy12Cm, Z) :- triple(M, type, measurement), triple(M, p1yCm, X), triple(M, p2yCm, Y), sub(X, Y, Z).
triple(M, dy13Cm, Z) :- triple(M, type, measurement), triple(M, p1yCm, X), triple(M, p3yCm, Y), sub(X, Y, Z).
triple(M, dy24Cm, Z) :- triple(M, type, measurement), triple(M, p2yCm, X), triple(M, p4yCm, Y), sub(X, Y, Z).
triple(M, dy53Cm, Z) :- triple(M, type, measurement), triple(M, p5yCm, X), triple(M, p3yCm, Y), sub(X, Y, Z).
triple(M, dy64Cm, Z) :- triple(M, type, measurement), triple(M, p6yCm, X), triple(M, p4yCm, Y), sub(X, Y, Z).
triple(M, cL1, Z) :- triple(M, type, measurement), triple(M, dy12Cm, Y), triple(M, dx12Cm, X), div(Y, X, Z).
triple(M, dL3m, Z) :- triple(M, type, measurement), triple(M, cL1, X), div(1, X, Z).
triple(M, cL3, Z) :- triple(M, type, measurement), triple(M, dL3m, X), sub(0, X, Z).
triple(M, pL1x1Cm, Z) :- triple(M, type, measurement), triple(M, cL1, X), triple(M, p1xCm, Y), mul(X, Y, Z).
triple(M, pL1x2Cm, Z) :- triple(M, type, measurement), triple(M, cL1, X), triple(M, p2xCm, Y), mul(X, Y, Z).
triple(M, pL3x3Cm, Z) :- triple(M, type, measurement), triple(M, cL3, X), triple(M, p3xCm, Y), mul(X, Y, Z).
triple(M, pL3x4Cm, Z) :- triple(M, type, measurement), triple(M, cL3, X), triple(M, p4xCm, Y), mul(X, Y, Z).
triple(M, dd13Cm, Z) :- triple(M, type, measurement), triple(M, pL1x1Cm, X), triple(M, pL3x3Cm, Y), sub(X, Y, Z).
triple(M, ddy13Cm, Z) :- triple(M, type, measurement), triple(M, dd13Cm, X), triple(M, dy13Cm, Y), sub(X, Y, Z).
triple(M, dd24Cm, Z) :- triple(M, type, measurement), triple(M, pL1x2Cm, X), triple(M, pL3x4Cm, Y), sub(X, Y, Z).
triple(M, ddy24Cm, Z) :- triple(M, type, measurement), triple(M, dd24Cm, X), triple(M, dy24Cm, Y), sub(X, Y, Z).
triple(M, ddL13, Z) :- triple(M, type, measurement), triple(M, cL1, X), triple(M, cL3, Y), sub(X, Y, Z).
triple(M, pL1dx51Cm, Z) :- triple(M, type, measurement), triple(M, cL1, X), triple(M, dx51Cm, Y), mul(X, Y, Z).
triple(M, pL1dx62Cm, Z) :- triple(M, type, measurement), triple(M, cL1, X), triple(M, dx62Cm, Y), mul(X, Y, Z).
triple(M, p5xCm, Z) :- triple(M, type, measurement), triple(M, ddy13Cm, X), triple(M, ddL13, Y), div(X, Y, Z).
triple(M, p5yCm, Z) :- triple(M, type, measurement), triple(M, pL1dx51Cm, X), triple(M, p1yCm, Y), add(X, Y, Z).
triple(M, p6xCm, Z) :- triple(M, type, measurement), triple(M, ddy24Cm, X), triple(M, ddL13, Y), div(X, Y, Z).
triple(M, p6yCm, Z) :- triple(M, type, measurement), triple(M, pL1dx62Cm, X), triple(M, p2yCm, Y), add(X, Y, Z).
triple(M, sdx53Cm2, Z) :- triple(M, type, measurement), triple(M, dx53Cm, X), pow(X, 2, Z).
triple(M, sdx64Cm2, Z) :- triple(M, type, measurement), triple(M, dx64Cm, X), pow(X, 2, Z).
triple(M, sdy53Cm2, Z) :- triple(M, type, measurement), triple(M, dy53Cm, X), pow(X, 2, Z).
triple(M, sdy64Cm2, Z) :- triple(M, type, measurement), triple(M, dy64Cm, X), pow(X, 2, Z).
triple(M, ssd53Cm2, Z) :- triple(M, type, measurement), triple(M, sdx53Cm2, X), triple(M, sdy53Cm2, Y), add(X, Y, Z).
triple(M, ssd64Cm2, Z) :- triple(M, type, measurement), triple(M, sdx64Cm2, X), triple(M, sdy64Cm2, Y), add(X, Y, Z).
triple(M, d53Cm, Z) :- triple(M, type, measurement), triple(M, ssd53Cm2, X), pow(X, 0.5, Z).
triple(M, d64Cm, Z) :- triple(M, type, measurement), triple(M, ssd64Cm2, X), pow(X, 0.5, Z).
triple(M, dCm, Z) :- triple(M, type, measurement), triple(M, d53Cm, X), triple(M, d64Cm, Y), sub(X, Y, Z).
triple(M, type, lld_alarm) :- triple(M, type, measurement), triple(M, dCm, X), lt(X, -1.25).
triple(M, type, lld_alarm) :- triple(M, type, measurement), triple(M, dCm, X), gt(X, 1.25).
