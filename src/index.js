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

import { Program, autoloadProgramGoals } from './program.js';
import { Solver } from './solver.js';
import { whyNoProof, whyProof } from './explain.js';
import { getStrictIsoRegistry } from './iso.js';
import { getEyePrologRegistry } from './standard-library.js';
import { executeGoals, normalizeGoals } from './execute.js';

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
  if (source instanceof Program) autoloadProgramGoals(program, requestedGoals, options);
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
  const goals = normalizeGoals(requestedGoals, solver);
  const { haltCode } = executeGoals(program, solver, goals, {
    onAnswer: (line, resolved) => {
      output.push(line);
      if (includeWhy) appendExplanation(output, program, resolved, runOptions.registry);
    },
  });
  return { stdout: output.join(''), stats: solver.stats, haltCode };
}

function appendExplanation(output, program, resolved, registry) {
  const proof = whyProof(program, resolved, { registry });
  output.push(proof.text);
  if (!proof.ok) output.push(whyNoProof(resolved));
}

export * from './explain.js';
