materialize(is, 2).

% Existential-rule example adapted from Eyeling existential-rule.n3.
% Eyeling creates blank-node witnesses.  eyelang has Herbrand terms only, so the
% witness is represented explicitly by a deterministic Skolem-style term.

type(socrates, human).
type(plato, human).

witness(socrates, sk_0).
witness(plato, sk_1).

is(Person, Witness) :-
  type(Person, human),
  witness(Person, Witness).
