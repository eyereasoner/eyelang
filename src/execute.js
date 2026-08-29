// Shared goal preparation and execution for the CLI and embedding API.
import { ATOM, COMPOUND, NUMBER, VAR, Env, atom, compound, copyResolved, flattenConjunction, numberTerm, termIsGround, variable } from './term.js';
import { parseGoalText } from './parser.js';
import { HaltSignal, PrologError } from './iso.js';
import { formatTermForWrite } from './write.js';
import { modulePredicateKey } from './program-indexing.js';

export function normalizeGoals(requestedGoals, solver) {
  return requestedGoals.map((requestedGoal) => {
    const goal = typeof requestedGoal === 'string'
      ? parseGoalText(requestedGoal, {
          doubleQuotes: solver.prologFlags.get('double_quotes')?.value?.name ?? 'chars',
          operatorDefinitions: [...solver.program.operators.values()],
          isoStrict: solver.isoStrict,
        })
      : requestedGoal;
    if (goal.type === VAR) throw new PrologError('instantiation_error');
    if (goal.type !== ATOM && goal.type !== COMPOUND) throw new PrologError('type_error(callable)', goal);
    return goal;
  });
}

export function executeGoals(program, solver, goals, { onAnswer = () => {} } = {}) {
  const initialWriteOptions = currentWriteOptions(program, solver);
  const queriedKeys = new Set(goals.map((goal) => `${goal.name}/${goal.arity}`));
  const facts = program.sourceFactLines(queriedKeys, initialWriteOptions);
  const seen = new Set();
  let haltCode = null;

  try {
    solver.runInitializations();
    for (const goal of goals) {
      solver.solutionsSeen = 0;
      for (const env of solver.solve([goal], new Env(), 0)) {
        if (!termIsGround(goal, env)) continue;
        const resolved = copyResolved(goal, env);
        const line = `${formatTermForWrite(resolved, new Env(), currentWriteOptions(program, solver))}.\n`;
        if (facts.has(line) || seen.has(line)) continue;
        seen.add(line);
        onAnswer(line, resolved);
      }
    }
  } catch (error) {
    if (!(error instanceof HaltSignal)) throw error;
    haltCode = error.code;
  }

  return { haltCode };
}

function currentWriteOptions(program, solver) {
  return {
    doubleQuotes: solver.prologFlags.get('double_quotes')?.value?.name ?? 'chars',
    operators: [...program.operators.values()],
    quoted: true,
  };
}


// Native EyeProlog forward-rule extension.
//
// Source terms `Conclusion :+ Premise` remain ordinary :+/2 clauses so they
// can be inspected and even derived by Prolog code.  The closure driver below
// replaces Eyelet's Prolog-level meta-interpreter: it asks the solver directly
// for (: +)/2 rule instances whose premises hold, materializes novel
// conclusions, and repeats to a fixed point.  Query and fuse rules retain the
// Eyelet conventions `true :+ Goal` and `false :+ Goal`.
export function hasForwardRules(program) {
  return program.findGroup(':+', 2) != null;
}

export function executeForwardRules(program, solver, {
  onAnswer = () => {},
  onFuse = () => {},
  onDiagnostic = () => {},
} = {}) {
  const group = program.findGroup(':+', 2);
  if (group == null) return { haltCode: null, rounds: 0, derived: 0 };

  solver.runInitializations();
  makeGroupDynamic(program, group);
  predeclareForwardTerms(program, solver, group);
  setSingletonFact(program, 'closure', [numberTerm(0)]);
  setSingletonFact(program, 'limit', [numberTerm(-1)]);

  const seenAnswers = new Set();
  let rounds = 0;
  let derived = 0;
  let haltCode = null;

  // Query-only Eyelet files are common and should be as cheap as ordinary
  // EyeProlog -g goals.  Avoid routing their premises through a variable
  // call/1 and :+/2 clause-selection meta path.  This is especially important
  // for deep deterministic workloads such as Ackermann and the evolutionary
  // example.
  if (forwardGroupIsPlainQueries(group)) {
    for (const clause of group.clauses) {
      const conclusion = clause.head.args[0];
      const premise = clause.head.args[1];
      const child = solver.cloneForInnerGoal(Infinity);
      try {
        for (const env of child.solve([premise], new Env(), 0)) {
          const resolvedPremise = copyResolved(premise, env);
          if (isAtomNamed(conclusion, 'false')) {
            const fuse = compound('fuse', [resolvedPremise]);
            onFuse(forwardLine(fuse, program, solver), fuse);
            haltCode = 2;
            break;
          }
          const line = forwardLine(resolvedPremise, program, solver);
          if (!seenAnswers.has(line)) {
            seenAnswers.add(line);
            onAnswer(line, resolvedPremise);
          }
        }
      } finally {
        solver.absorbStatsFrom(child);
      }
      if (haltCode != null) break;
    }
    return { haltCode, rounds: 1, derived: 0 };
  }

  while (true) {
    rounds++;
    const conc = variable(`\u0000forwardConc${rounds}`);
    const prem = variable(`\u0000forwardPrem${rounds}`);
    const selector = compound(':+', [conc, prem]);
    const invocation = compound('call', [prem]);
    let changed = false;

    const child = solver.cloneForInnerGoal(Infinity);
    try {
      for (const env of child.solve([selector, invocation], new Env(), 0)) {
        const resolvedPremise = copyResolved(prem, env);
        let resolvedConclusion = copyResolved(conc, env);

        if (isAtomNamed(resolvedConclusion, 'true')) {
          const line = forwardLine(resolvedPremise, program, solver);
          if (!seenAnswers.has(line)) {
            seenAnswers.add(line);
            onAnswer(line, resolvedPremise);
          }
          continue;
        }

        if (isAtomNamed(resolvedConclusion, 'false')) {
          const fuse = compound('fuse', [resolvedPremise]);
          const line = forwardLine(fuse, program, solver);
          onFuse(line, fuse);
          haltCode = 2;
          break;
        }

        // A derived rule keeps its variables universally quantified.  Ordinary
        // derived facts use Eyelet's historical existential convention: any
        // conclusion-only variables become sk_0, sk_1, ... before assertion.
        if (!isForwardRuleTerm(resolvedConclusion)) {
          resolvedConclusion = skolemizeForwardConclusion(resolvedConclusion);
        }

        for (const fact of forwardConjuncts(resolvedConclusion)) {
          if (isAtomNamed(fact, 'true') || isAtomNamed(fact, 'false')) continue;
          makePredicateDynamic(program, fact);
          if (!goalHasSolution(solver, fact)) {
            insertForwardFact(program, fact);
            derived++;
            changed = true;
          }
        }
      }
    } finally {
      solver.absorbStatsFrom(child);
    }

    if (haltCode != null) break;

    if (changed) continue;

    const closure = singletonInteger(program, 'closure', 0);
    const limit = singletonInteger(program, 'limit', -1);
    if (closure < limit) {
      setSingletonFact(program, 'closure', [numberTerm(closure + 1)]);
      continue;
    }
    break;
  }

  return { haltCode, rounds, derived };
}


function forwardGroupIsPlainQueries(group) {
  return group.clauses.length > 0 && group.clauses.every((clause) => {
    if ((clause.body?.length ?? 0) !== 0) return false;
    const head = clause.head;
    if (head?.type !== COMPOUND || head.name !== ':+' || head.arity !== 2) return false;
    return isAtomNamed(head.args[0], 'true') || isAtomNamed(head.args[0], 'false');
  });
}

function forwardLine(term, program, solver) {
  return `${formatTermForWrite(term, new Env(), {
    // Eyelet historically used portray_clause/2.  Keep character lists as
    // list syntax here rather than collapsing them to strings according to
    // the ambient double_quotes flag.
    doubleQuotes: null,
    operators: [...program.operators.values()],
    quoted: true,
    compact: true,
    minimalOperatorSpacing: true,
    // Match portray_clause/2 more closely for Eyelet compatibility: current
    // operator atoms are legal unquoted arguments/list elements, and anonymous
    // source variables should be rendered with stable generated names rather
    // than their internal parser identifiers.
    operatorAtomsAsArgs: true,
    generateVariableNames: true,
  })}.\n`;
}

function isAtomNamed(term, name) {
  return term?.type === ATOM && term.name === name;
}

function isForwardRuleTerm(term) {
  return term?.type === COMPOUND && term.name === ':+' && term.arity === 2;
}

function forwardConjuncts(term) {
  if (isAtomNamed(term, 'true') || isAtomNamed(term, 'false')) return [];
  return flattenConjunction(term);
}

function skolemizeForwardConclusion(term) {
  const variables = new Map();
  const copy = (current) => {
    if (current.type === VAR) {
      let skolem = variables.get(current.name);
      if (skolem == null) {
        skolem = atom(`sk_${variables.size}`);
        variables.set(current.name, skolem);
      }
      return skolem;
    }
    if (current.type !== COMPOUND) return current;
    const result = compound(current.name, current.args.map(copy));
    if (current.module != null) result.module = current.module;
    return result;
  };
  return copy(term);
}

function makeGroupDynamic(program, group) {
  group.dynamic = true;
  program.dynamicPredicates.add(modulePredicateKey(group.module ?? 'user', group.name, group.arity));
  program.mutable = true;
}

function makePredicateDynamic(program, term) {
  if (term?.type !== ATOM && term?.type !== COMPOUND) return;
  if (term.type === COMPOUND && term.name === ',' && term.arity === 2) {
    makePredicateDynamic(program, term.args[0]);
    makePredicateDynamic(program, term.args[1]);
    return;
  }
  if (isForwardRuleTerm(term)) {
    const group = program.findGroup(':+', 2, term.module ?? 'user') ?? program.ensureDynamicGroup(':+', 2, term.module ?? 'user');
    makeGroupDynamic(program, group);
    makePredicateDynamic(program, term.args[0]);
    return;
  }
  if (['true', 'false', '!'].includes(term.name)) return;
  const module = term.module ?? 'user';
  const group = program.findGroup(term.name, term.arity, module) ?? program.ensureDynamicGroup(term.name, term.arity, module);
  makeGroupDynamic(program, group);
}

function predeclareForwardTerms(program, solver, group) {
  for (const clause of group.clauses) {
    const head = clause.head;
    if (head?.type !== COMPOUND || head.name !== ':+' || head.arity !== 2) continue;
    // Conclusions may later be asserted, while premise-only predicates need an
    // empty procedure so a not-yet-derived relation fails rather than raising
    // existence_error(procedure), matching Eyelet's former dynify/1 step.
    predeclareConclusionTerm(program, solver, head.args[0]);
    predeclareUnknownTerm(program, solver, head.args[1]);
    for (const bodyGoal of clause.body ?? []) predeclareUnknownTerm(program, solver, bodyGoal);
  }
}

function predeclareConclusionTerm(program, solver, term) {
  if (term?.type === COMPOUND && term.name === ',' && term.arity === 2) {
    predeclareConclusionTerm(program, solver, term.args[0]);
    predeclareConclusionTerm(program, solver, term.args[1]);
    return;
  }
  if (isForwardRuleTerm(term)) {
    makePredicateDynamic(program, term);
    predeclareConclusionTerm(program, solver, term.args[0]);
    predeclareUnknownTerm(program, solver, term.args[1]);
    return;
  }
  if (term?.type === ATOM || term?.type === COMPOUND) makePredicateDynamic(program, term);
}

function predeclareUnknownTerm(program, solver, term) {
  if (term?.type !== ATOM && term?.type !== COMPOUND) return;
  if (term.type === COMPOUND) {
    for (const arg of term.args) predeclareUnknownTerm(program, solver, arg);
  }
  if (['true', 'false', '!'].includes(term.name)) return;
  if (solver.registry.get(term.name, term.arity) != null) return;
  if (program.findGroup(term.name, term.arity, term.module ?? 'user') != null) return;
  const group = program.ensureDynamicGroup(term.name, term.arity, term.module ?? 'user');
  makeGroupDynamic(program, group);
}

function goalHasSolution(solver, goal) {
  const child = solver.cloneForInnerGoal(1);
  const iterator = child.solve([goal], new Env(), 0);
  try {
    const result = iterator.next();
    return !result.done;
  } finally {
    try { iterator.return?.(); } catch (_) { /* best effort */ }
    solver.absorbStatsFrom(child);
  }
}

function insertForwardFact(program, fact) {
  makePredicateDynamic(program, fact);
  program.insertDynamicClause({
    head: fact,
    module: fact.module ?? 'user',
    body: [],
  }, false);
}

function setSingletonFact(program, name, args, keyed = false) {
  const module = 'user';
  let group = program.findGroup(name, args.length, module);
  if (group == null) group = program.ensureDynamicGroup(name, args.length, module);
  makeGroupDynamic(program, group);

  if (keyed && args.length > 0) {
    const key = args[0]?.name;
    for (const clause of [...group.clauses]) {
      if (clause.head?.args?.[0]?.name === key) program.removeDynamicClause(group, clause);
    }
  } else {
    for (const clause of [...group.clauses]) program.removeDynamicClause(group, clause);
  }
  program.insertDynamicClause({ head: compound(name, args), module, body: [] }, false);
}

function singletonInteger(program, name, fallback) {
  const group = program.findGroup(name, 1, 'user');
  if (group == null) return fallback;
  for (let i = group.clauses.length - 1; i >= 0; i--) {
    const arg = group.clauses[i].head?.args?.[0];
    if (arg?.type === NUMBER && /^-?\d+$/.test(arg.name)) return Number(arg.name);
  }
  return fallback;
}


