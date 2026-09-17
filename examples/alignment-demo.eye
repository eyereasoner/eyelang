# Source: eyeleng/examples/alignment-demo.srl (b7c7e46f8297).
concept(car). concept(tel_car). concept(heavy_vehicle). concept(plate_vehicle). concept(passenger_car).
broad_match(tel_car, car). broad_match(heavy_vehicle, car). broad_match(plate_vehicle, car).
broader(passenger_car, plate_vehicle).
broader(?a, ?b) if broad_match(?a, ?b).
broader_transitive(?a, ?b) if broader(?a, ?b).
broader_transitive(?a, ?c) if broader_transitive(?a, ?b), broader_transitive(?b, ?c).
rolls_up_to(?x, car) if broader_transitive(?x, car).
ask rolls_up_to(?concept, car).
