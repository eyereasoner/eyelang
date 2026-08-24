// Small host primitives needed by Scryer-style declarative libraries.
//
// Keep these facilities generic: they are not part of the CLP(Z) engine. The
// backtrackable blackboard lives in Env so ordinary Prolog choice points undo
// writes automatically.

import { ATOM, NUMBER, STRING, deref, unify } from './term.js';
import { PrologError } from './errors.js';

function blackboardKey(term, env) {
  const value = deref(term, env);
  if (value.type === ATOM) return `a:${value.name}`;
  if (value.type === NUMBER) return `n:${value.name}`;
  if (value.type === STRING) return `s:${value.name}`;
  if (value.type === 'var') throw new PrologError('instantiation_error');
  throw new PrologError('type_error(atomic)', value);
}

function* bbGetBuiltin({ goal, env }) {
  const key = blackboardKey(goal.args[0], env);
  const stored = env.getBacktrackableBlackboard(key);
  if (stored === undefined) return;
  const next = env.clone();
  if (unify(goal.args[1], stored, next)) yield next;
}

function* bbPutBuiltin({ goal, env }) {
  const next = env.clone();
  const key = blackboardKey(goal.args[0], next);
  next.putBacktrackableBlackboard(key, deref(goal.args[1], next));
  yield next;
}

export const scryerCompatibilityBuiltins = {
  register(registry) {
    registry.add('eyeprolog__bb_get', 2, bbGetBuiltin, { eyePrologLibrary: true });
    registry.add('eyeprolog__bb_b_put', 2, bbPutBuiltin, { deterministic: true, eyePrologLibrary: true });
  },
};
