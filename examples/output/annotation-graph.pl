triple(:annotation, :confirms, triple(:a, :name, "Alice")).
triple(:annotation, :source, "input/annotation.trig").
triple(:annotation, :status, :annotationVerified).
triple(:t, :recorded, "2021-07-07").
triple(:t, :statedBy, :bob).
triple(:t, log:nameOf, graph([triple(:a, :name, "Alice")])).
