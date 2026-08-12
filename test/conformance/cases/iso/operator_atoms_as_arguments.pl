% ISO 6.3.3.1: an arg may be an atom which is an operator.

%% goal: operator_atoms(Priority, Specifier, List)

operator_atoms(Priority, Specifier, List) :-
    current_op(Priority, Specifier, :-),
    List = [:-,-].
