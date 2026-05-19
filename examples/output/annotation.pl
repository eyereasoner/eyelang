triple(:__md_output, :text, "# annotation\n").
triple(:__md_output, log:outputString, "# annotation\n").
triple(:a, :name, "Alice").
triple(:t, :recorded, "2021-07-07").
triple(:t, :statedBy, :bob).
triple(:t, log:nameOf, triple(:a, :name, "Alice")).
