export { Program, makeProgram } from './program.js';
export { parseClauses, parseProgramText, parseQueryGoal } from './parser.js';
export { Solver } from './solver.js';
export * from './term.js';
export { BuiltinRegistry, createDefaultRegistry } from './builtins/registry.js';

import { Env, copyResolved, termIsGround, termToString } from './term.js';
import { Program } from './program.js';
import { Solver } from './solver.js';
import { parseQueryGoal } from './parser.js';

export function run(source, options = {}) {
  const program = source instanceof Program ? source : Program.parse(source);
  const solver = new Solver(program, options);
  const output = [];
  if (options.query) {
    const goal = typeof options.query === 'string' ? parseQueryGoal(options.query) : options.query;
    for (const env of solver.solve([goal], new Env(), 0)) {
      output.push(`${termToString(goal, env, true)}.\n`);
    }
  } else {
    const facts = program.sourceFactLines();
    const seen = new Set();
    for (const goal of program.materializationGoals()) {
      const localSolver = new Solver(program, options);
      for (const env of localSolver.solve([goal], new Env(), 0)) {
        const resolved = copyResolved(goal, env);
        if (!termIsGround(resolved)) continue;
        const line = `${termToString(resolved, new Env(), true)}.\n`;
        if (!facts.has(line)) seen.add(line);
      }
    }
    output.push(...[...seen].sort());
  }
  return { stdout: output.join(''), stats: solver.stats };
}
export * from './explain.js';
