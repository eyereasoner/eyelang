triple(:check, :C1, true).
triple(:check, :C2, true).
triple(:check, :C3, true).
triple(:check, :C4, true).
triple(:check, :C5, true).
triple(:decision, :outcome, "Take the direct route via Brugge.").
triple(:decision, :recommendedRoute, :routeDirect).
triple(:report, log:outputString, "# gps\n\n## Source files\n\n- [N3 rules](../gps.n3)\n\nGPS — Goal driven route planning\n\n## Answer\nTake the direct route via Brugge.\nRecommended route: Gent → Brugge → Oostende\n\n## Reason Why\nFrom Gent to Oostende, the planner found two routes in this small map. The direct route (Gent → Brugge → Oostende) takes 2400 seconds at cost 0.01, with belief 0.9408 and comfort 0.99. The alternative (Gent → Kortrijk → Brugge → Oostende) takes 4100 seconds at cost 0.018, with belief 0.903168 and comfort 0.9801.\nSo the direct route is faster, cheaper, more reliable, and slightly more comfortable.\n\n## Check\nC1 OK - the direct Gent → Brugge → Oostende route was derived.\nC2 OK - the alternative Gent → Kortrijk → Brugge → Oostende route was derived.\nC3 OK - the recommended route is faster than the alternative.\nC4 OK - the recommended route is cheaper than the alternative.\nC5 OK - the recommended route has higher belief and comfort scores.").
