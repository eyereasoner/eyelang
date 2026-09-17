# Source: eyeleng/examples/import-lib.srl (b7c7e46f8297).
# Standalone form of the imported library; the sentinel keeps parent/2 defined.
parent(none, none).
ancestor(?x, ?y) if parent(?x, ?y).
ancestor(?x, ?z) if parent(?x, ?y), ancestor(?y, ?z).
ask ancestor(none, none).
