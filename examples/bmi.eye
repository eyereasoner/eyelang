# Source: eyeleng/examples/bmi.srl (b7c7e46f8297).
metric_input(72.0, 178.0).
bmi(?value) if metric_input(?weight, ?cm), let ?m = ?cm / 100.0, let ?square = ?m * ?m, let ?value = ?weight / ?square.
category(normal) if bmi(?value), ?value >= 18.5, ?value < 25.0.
ask bmi(?value), category(?category).
