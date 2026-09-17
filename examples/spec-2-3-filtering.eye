# Source: eyeleng/examples/spec-2-3-filtering.srl (b7c7e46f8297).
population(town1, 1000). population(town2, 2000).
large_town(?town) if population(?town, ?population), ?population > 1500.
ask large_town(?town).
