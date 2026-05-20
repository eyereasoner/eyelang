triple(check, c1, true).
triple(check, c2, true).
triple(check, c3, true).
triple(check, c4, true).
triple(check, c5, true).
triple(decision, outcome, "Take the direct route via Brugge.").
triple(decision, recommendedRoute, routeDirect).
triple(report, comparison, dominates(routeDirect, routeViaKortrijk)).
triple(report, selectedRoute, route(routeDirect, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)).
triple(routeDirect, actionSequence, [drive_gent_brugge, drive_brugge_oostende]).
triple(routeDirect, belief, 0.94079999999999997).
triple(routeDirect, comfort, 0.98999999999999999).
triple(routeDirect, cost, 0.01).
triple(routeDirect, durationSeconds, 2400.0).
triple(routeDirect, label, "Gent -> Brugge -> Oostende").
triple(routeViaKortrijk, actionSequence, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]).
triple(routeViaKortrijk, belief, 0.90316799999999997).
triple(routeViaKortrijk, comfort, 0.98009999999999997).
triple(routeViaKortrijk, cost, 0.017999999999999999).
triple(routeViaKortrijk, durationSeconds, 4100.0).
triple(routeViaKortrijk, label, "Gent -> Kortrijk -> Brugge -> Oostende").
