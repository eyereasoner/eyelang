triple(sat_instance, modelCount, 4).
triple(sat_instance, reason, "finite CNF search succeeds without cut").
triple(sat_instance, status, satisfiable).
triple(sat_instance, witness, [value(a, true), value(b, false), value(c, true), value(d, true)]).
