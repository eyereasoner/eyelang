// Public JavaScript API surface for embedders and the browser playground.
// The CLI imports the same parser, program, solver, and term primitives from here.
export { Program, makeProgram } from './program.js';
export { parseClauses, parseGoalText, parseProgramText } from './parser.js';
export { Solver } from './solver.js';
export * from './term.js';
export {
  BuiltinRegistry,
  createDefaultRegistry,
  createStrictIsoRegistry,
  getDefaultRegistry,
  getStrictIsoRegistry,
  HaltSignal,
  PrologError,
} from './iso.js';
export {
  createEyePrologRegistry,
  getEyePrologRegistry,
  standardLibrarySources,
  eyePrologLibraryIndicators,
  eyePrologNativeLibraryIndicators,
  eyePrologPortableLibraryIndicators,
  eyePrologInteropAutoload,
  eyePrologInteropLibraryIndicators,
  eyePrologInteropLibraryModules,
} from './standard-library.js';
export { StreamManager } from './io.js';
export { runQuads } from './quads.js';

import { ATOM, COMPOUND, VAR, Env, copyResolved, termIsGround } from './term.js';
import { Program } from './program.js';
import { Solver } from './solver.js';
import { whyNoProof, whyProof } from './explain.js';
import { HaltSignal, PrologError, getStrictIsoRegistry } from './iso.js';
import { getEyePrologRegistry } from './standard-library.js';
import { parseGoalText } from './parser.js';
import { formatTermForWrite } from './write.js';

export function run(source, options = {}) {
  const includeWhy = options.proof === true || options.why === true || options.explain === true;
  const requestedStrictIso = options.isoStrict === true;
  if (source instanceof Program && requestedStrictIso && source.strictIso !== true) {
    throw new Error('strict ISO mode requires a Program parsed with isoStrict: true');
  }
  const requestedGoals = options.goals ?? (options.goal == null ? [] : [options.goal]);
  const parseOptions = {
    ...options,
    sourceMetadata: includeWhy || requestedStrictIso,
    autoloadGoals: requestedGoals,
  };
  let program = source instanceof Program ? source : Program.parse(source, parseOptions);
  const strictIso = requestedStrictIso || program.strictIso === true;
  const runOptions = strictIso
    ? { ...options, isoStrict: true, registry: getStrictIsoRegistry() }
    : options.registry ? options : { ...options, registry: getEyePrologRegistry() };
  const output = [];
  const solver = new Solver(program, {
    ...runOptions,
    ioOptions: {
      ...(options.ioOptions ?? {}),
      write: (text) => {
        const rendered = String(text);
        output.push(rendered);
        options.ioOptions?.write?.(rendered);
      },
    },
  });
  program = solver.program;
  const goals = normalizeGoals(options, solver);
  const writeOptions = {
    doubleQuotes: solver.prologFlags.get('double_quotes')?.value?.name ?? 'chars',
    operators: [...program.operators.values()],
    quoted: true,
  };
  const queriedKeys = new Set(goals.map((goal) => `${goal.name}/${goal.arity}`));
  const facts = program.sourceFactLines(queriedKeys, writeOptions);
  const seen = new Set();
  let haltCode = null;
  try {
    solver.runInitializations();
    for (const goal of goals) {
      solver.solutionsSeen = 0;
      for (const env of solver.solve([goal], new Env(), 0)) {
        const resolved = copyResolved(goal, env);
        if (!termIsGround(resolved)) continue;
        const currentWriteOptions = {
          doubleQuotes: solver.prologFlags.get('double_quotes')?.value?.name ?? 'chars',
          operators: [...program.operators.values()],
          quoted: true,
        };
        const line = `${formatTermForWrite(resolved, new Env(), currentWriteOptions)}.\n`;
        if (facts.has(line) || seen.has(line)) continue;
        seen.add(line);
        output.push(line);
        if (includeWhy) appendExplanation(output, program, resolved, runOptions.registry);
      }
    }
  } catch (error) {
    if (!(error instanceof HaltSignal)) throw error;
    haltCode = error.code;
  }
  return { stdout: output.join(''), stats: solver.stats, haltCode };
}

function normalizeGoals(options, solver) {
  const requested = options.goals ?? (options.goal == null ? [] : [options.goal]);
  return requested.map((requestedGoal) => {
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

function appendExplanation(output, program, resolved, registry) {
  const proof = whyProof(program, resolved, { registry });
  output.push(proof.text);
  if (!proof.ok) output.push(whyNoProof(resolved));
}

export * from './explain.js';
