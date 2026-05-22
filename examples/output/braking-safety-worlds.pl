triple(braking_safety_worlds, reason, "simplified and naive worlds can be optimistic while the cautious world tightens the reference model").
triple(braking_safety_worlds, status, expected_world_pattern).
triple(city_dry, safeInWorld, w0).
triple(city_dry, safeInWorld, w1).
triple(city_dry, safeInWorld, w2).
triple(city_dry, safeInWorld, w3).
triple(city_ice, riskyInWorld, w0).
triple(city_ice, riskyInWorld, w1).
triple(city_ice, riskyInWorld, w3).
triple(city_ice, safeInWorld, w2).
triple(city_wet, riskyInWorld, w3).
triple(city_wet, safeInWorld, w0).
triple(city_wet, safeInWorld, w1).
triple(city_wet, safeInWorld, w2).
triple(highway_dry_short_gap, riskyInWorld, w0).
triple(highway_dry_short_gap, riskyInWorld, w3).
triple(highway_dry_short_gap, safeInWorld, w1).
triple(highway_dry_short_gap, safeInWorld, w2).
