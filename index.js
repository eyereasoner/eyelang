import { parse } from './src/parser.js';
import { analyze, checkQuery } from './src/analyze.js';
import { solve, createContext } from './src/engine.js';
export { parse } from './src/parser.js';
export { LimitError } from './src/engine.js';
export { format, atom, struct, scalar, variable, list } from './src/terms.js';
export { formatResult, formatCheck } from './src/output.js';
export { parseNQuads, formatNQuads, nquadsToEyelang, rdfAnswersToNQuads } from './src/rdf.js';

/** Run embedded ask statements. Values retain their tagged term representation. */
export function run(source, options = {}) {
  const parsed = parse(source), program = analyze(parsed.rules);
  const context = createContext(options);
  const queries = parsed.queries.map(query => {
    const answers = solve(program, query.body, query.variables, context);
    return {
      location: query.location,
      body: query.body,
      variables: query.variables,
      answers: answers.map(answer => ({
        bindings: Object.fromEntries(query.variables.map((variable, i) => [variable.name, answer.term.args[i]])),
        proof: answer.proof,
      })),
    };
  });
  return {
    status: 'complete', queries, proofs: context.proofs,
    stats: { steps: context.steps, tables: context.tables, answers: context.answers },
  };
}

/** Parse and validate dependencies without evaluating the program. */
export function check(source) {
  const parsed = parse(source), program = analyze(parsed.rules);
  // Query validation must also run for a check-only invocation.
  for (const query of parsed.queries) checkQuery(query.body, program);
  return { rules: parsed.rules.length, queries: parsed.queries.length, strata: Object.fromEntries(program.strata) };
}
