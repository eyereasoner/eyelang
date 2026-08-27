// Shared goal preparation and execution for the CLI and embedding API.
import { ATOM, COMPOUND, VAR, Env, copyResolved, termIsGround } from './term.js';
import { parseGoalText } from './parser.js';
import { HaltSignal, PrologError } from './iso.js';
import { formatTermForWrite } from './write.js';

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
