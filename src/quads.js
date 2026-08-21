// Embedded quad tests: a query followed by one or more answer descriptions.
// The syntax follows the portable "queries using answer descriptions" format
// used by Trealla and the ISO Prolog working examples linked from issue #1.
import {
  ATOM, COMPOUND, VAR, Env, atom, compound, copyResolved, deref,
  flattenConjunction, listFromItems, properListItems, termIsGround,
  unify, variable,
} from './term.js';
import { parseGoalText } from './parser.js';
import { Program } from './program.js';
import { Solver } from './solver.js';
import { getEyePrologRegistry } from './standard-library.js';
import { formatTermForWrite } from './write.js';

const DEFAULT_QUAD_MAX_INFERENCES = 100000;
const DEFAULT_LOOP_MAX_INFERENCES = 10000;

export function runQuads(source, options = {}) {
  const program = source instanceof Program
    ? source
    : Program.parse(source, { ...options, sourceMetadata: true });
  const quads = program.quads ?? [];
  if (quads.length === 0) {
    return { stdout: 'quads: nothing to run.\n', total: 0, passed: 0, failed: 0, undecided: 0, results: [] };
  }

  if (options.initialize !== false) {
    const initializer = new Solver(program, {
      ...options,
      registry: options.registry ?? getEyePrologRegistry(),
      ioOptions: { write: () => {} },
    });
    initializer.runInitializations();
  }

  const results = [];
  const lines = [];
  for (const quad of quads) {
    // Every indented answer description is an independent portable quad test.
    // Re-run the query for each description so a failed expectation does not
    // prevent later expectations for the same query from being checked.
    for (const description of quad.answers) {
      const result = checkQuadDescription(program, quad, description, options);
      results.push(result);
      if (!result.ok) lines.push(formatFailure(program, quad, result, description));
    }
  }
  const passed = results.filter((result) => result.ok).length;
  const undecided = results.filter((result) => result.kind === 'undecided').length;
  const failed = results.length - passed - undecided;
  const undecidedSummary = undecided === 0 ? '' : `, ${undecided} undecided`;
  lines.push(`quads: ${results.length} run, ${passed} passed, ${failed} failed${undecidedSummary}.\n`);
  return { stdout: lines.join(''), total: results.length, passed, failed, undecided, results };
}

function checkQuadDescription(program, quad, description, options) {
  if (quad.id != null && !termIsGround(quad.id, new Env())) {
    return { ok: false, kind: 'bad_identifier', expected: quad.id };
  }
  return checkDescription(program, quad, description, options);
}

function checkDescription(program, quad, description, options) {
  const alternatives = splitOperator(description, '|');
  // Probe an explicitly accepted nontermination outcome before alternatives
  // that would run the same query without a bound.
  const ordered = [...alternatives].sort((left, right) =>
    Number(alternativeDescribesLoop(right)) - Number(alternativeDescribesLoop(left)));
  for (const alternative of ordered) {
    const malformed = malformedAlternative(quad.query, alternative);
    if (malformed != null) return { ok: false, kind: 'malformed', expected: malformed };
  }
  let unsupported = null;
  let undecided = null;
  for (const alternative of ordered) {
    const checked = checkAlternative(program, quad, alternative, options);
    if (checked.ok) return checked;
    if (checked.kind === 'unsupported') unsupported ??= checked;
    if (checked.kind === 'undecided') undecided ??= checked;
  }
  return unsupported ?? undecided ?? { ok: false, kind: 'failed', expected: description };
}

function checkAlternative(program, quad, alternative, options) {
  const leaves = splitOperator(alternative, ';').map(describeLeaf);
  if (leaves.some((leaf) => leaf.sto)) return { ok: true };
  const unsupported = leaves.find((leaf) => leaf.unsupported != null)?.unsupported;
  if (unsupported != null) {
    return { ok: false, kind: 'unsupported', expected: unsupported };
  }

  const inputSpecs = [...new Set(leaves.filter((leaf) => leaf.input != null).map((leaf) => leaf.input))];
  if (inputSpecs.length > 1) return { ok: false, kind: 'malformed', expected: alternative };
  const input = inputSpecs[0] ?? '';
  if (inputSpecs.length > 0 && leaves.length !== 1) return { ok: false };
  const moreAt = leaves.findIndex((leaf) => leaf.more);
  const describedCount = moreAt < 0 ? leaves.length : moreAt + (leaves[moreAt].hasExpectation ? 1 : 0);
  const maxSolutions = inputSpecs.length > 0
    ? 1
    : moreAt < 0 ? describedCount + 1 : Math.max(describedCount, 1);
  const actual = executeQuery(program, quad.query, input, maxSolutions, {
    ...options,
    detectLoops: leaves.some((leaf) => leaf.loops),
  });

  if (inputSpecs.length > 0) {
    const leaf = leaves[0];
    const matches = actual.inputPosition === input.length && matchLeaf(program, quad.query, leaf, actual, 0);
    if (actual.undecided && !matches) return undecidedResult(actual, alternative);
    return { ok: leaf.unexpected ? !matches : matches };
  }

  let position = 0;
  for (const leaf of leaves) {
    if (leaf.more && !leaf.hasExpectation) return { ok: true };
    const matches = matchLeaf(program, quad.query, leaf, actual, position);
    if (leaf.unexpected ? matches : !matches) {
      if (actual.undecided && leafNeedsMoreSearch(leaf, actual, position)) {
        return undecidedResult(actual, alternative);
      }
      return { ok: false };
    }
    // An unexpected error description is a negative assertion about that
    // particular error pattern.  A different exception may be present and is
    // checked by other descriptions; do not make the final 'no error' test
    // turn a successful negative match back into a failure.
    if (leaf.unexpected && leaf.error != null) return { ok: true };
    if (leaf.more) return { ok: true };
    if (!leaf.unexpected && (leaf.false || leaf.error != null)) {
      if (actual.undecided) return undecidedResult(actual, alternative);
      return { ok: position === leaves.length - 1 };
    }
    position++;
  }

  const ended = position >= actual.solutions.length && actual.error == null && !actual.undecided;
  if (!ended && actual.undecided && position >= actual.solutions.length && actual.error == null) {
    return undecidedResult(actual, alternative);
  }
  return { ok: ended };
}

function malformedAlternative(query, alternative) {
  const queryNames = new Set(namedVariables(query).map((variable) => variable.name));
  for (const leaf of splitOperator(alternative, ';').map(describeLeaf)) {
    if (leaf.malformed != null) return leaf.malformed;
    const names = new Set();
    for (const binding of leaf.bindings) {
      const name = binding.args[0].name;
      if (!queryNames.has(name) || names.has(name)) return binding;
      names.add(name);
    }
    if (!leaf.sto) {
      for (const binding of leaf.bindings) {
        if (namedVariables(binding.args[1]).some((variable) => names.has(variable.name))) return binding;
      }
    }
  }
  return null;
}

function describeLeaf(term) {
  const leaf = {
    bindings: [],
    unexpected: false,
    more: false,
    sto: false,
    false: false,
    truth: false,
    loops: false,
    error: null,
    input: null,
    output: null,
    unsupported: null,
    malformed: null,
    hasExpectation: false,
  };
  for (const item of flattenConjunction(term)) {
    if (item.type === ATOM) {
      if (item.name === 'unexpected' || item.name === 'inattendue') leaf.unexpected = true;
      else if (item.name === '...' || item.name === 'ad_infinitum') leaf.more = true;
      else if (item.name === 'sto') leaf.sto = true;
      else if (item.name === 'loops') leaf.loops = true;
      else if (item.name === 'waits' || item.name === 'other_answer_sequence') {
        leaf.unsupported ??= item;
      } else if (item.name === 'false') leaf.false = true;
      else if (item.name === 'true') leaf.truth = true;
      else if (isErrorDescription(item)) leaf.error = item;
      else leaf.malformed ??= item;
      continue;
    }
    if (item.type === COMPOUND && item.name === '=' && item.arity === 2) {
      if (item.args[0].type !== VAR) leaf.malformed ??= item;
      else leaf.bindings.push(item);
      continue;
    }
    if (item.type === COMPOUND && item.name === 'inputs' && item.arity === 1) {
      const text = characterText(item.args[0]);
      if (text == null || leaf.input != null) leaf.malformed ??= item;
      else leaf.input = text;
      continue;
    }
    if (item.type === COMPOUND && item.name === 'outputs' && item.arity === 1) {
      if (leaf.output != null) leaf.malformed ??= item;
      else leaf.output = item.args[0];
      continue;
    }
    if (item.type === COMPOUND && item.name === 'peeks' && item.arity === 1) {
      leaf.unsupported ??= item;
      continue;
    }
    if (isErrorDescription(item)) leaf.error = item;
    else leaf.malformed ??= item;
  }
  leaf.hasExpectation = leaf.bindings.length > 0 || leaf.truth || leaf.false || leaf.loops || leaf.error != null || leaf.output != null;
  if (!leaf.hasExpectation && !leaf.more && !leaf.sto && leaf.unsupported == null) leaf.malformed ??= term;
  if ([leaf.false, leaf.truth, leaf.error != null].filter(Boolean).length > 1) leaf.malformed ??= term;
  return leaf;
}

function executeQuery(program, query, input, maxSolutions, options) {
  let pendingOutput = '';
  const solver = new Solver(program, {
    ...options,
    registry: options.registry ?? getEyePrologRegistry(),
    maxDepth: options.detectLoops ? (options.loopMaxDepth ?? 1000) : options.maxDepth,
    maxInferences: options.detectLoops
      ? (options.loopMaxInferences ?? DEFAULT_LOOP_MAX_INFERENCES)
      : (options.quadMaxInferences ?? options.maxInferences ?? DEFAULT_QUAD_MAX_INFERENCES),
    // The solver's counter also observes completed nested searches (for
    // example each arm of a DCG disjunction).  Bound the public iterator here
    // instead of letting those internal completions consume the quad's answer
    // allowance.
    solutionLimit: Math.max(maxSolutions, options.solutionLimit ?? 10000000),
    ioOptions: {
      input,
      write: (text) => { pendingOutput += String(text); },
    },
  });
  // Undefined predicates are test failures rather than silent negative
  // answers unless the source explicitly selected another unknown policy.
  if (!(program.prologFlagDirectives ?? []).some(([flag]) => flag.type === ATOM && flag.name === 'unknown')) {
    solver.prologFlags.get('unknown').value = atom('error');
  }
  const solutions = [];
  let error = null;
  let tailOutput = '';
  try {
    const iterator = solver.solve([query], new Env(), 0);
    while (solutions.length < maxSolutions) {
      pendingOutput = '';
      const result = iterator.next();
      if (result.done) {
        tailOutput += pendingOutput;
        break;
      }
      solutions.push({ env: result.value, output: pendingOutput });
    }
  } catch (caught) {
    error = { term: errorTerm(caught), output: pendingOutput };
  }
  const inputPosition = solver.io.resolve('user_input')?.position ?? 0;
  const bounded = solver.depthLimitExceeded || solver.inferenceLimitExceeded;
  const undecided = !options.detectLoops && (solver.recursionCycleDetected || bounded);
  return {
    solutions,
    error,
    tailOutput,
    inputPosition,
    // A loops expectation explicitly asks for bounded nontermination evidence.
    // Other descriptions treat the same exhausted search budget as undecided:
    // a timeout cannot establish finite failure or an exact answer sequence.
    loops: options.detectLoops && (solver.recursionCycleDetected || bounded),
    undecided,
    undecidedReason: solver.inferenceLimitExceeded ? 'inference limit reached'
      : solver.depthLimitExceeded ? 'depth limit reached'
        : solver.recursionCycleDetected ? 'recursion cycle encountered'
          : null,
  };
}

function matchLeaf(program, query, leaf, actual, position) {
  if (leaf.loops) return actual.loops;
  if (leaf.false) {
    return position >= actual.solutions.length && actual.error == null && !actual.undecided &&
      outputMatches(program, leaf.output, actual.tailOutput);
  }
  if (leaf.error != null) {
    return position === actual.solutions.length && actual.error != null &&
      errorMatches(query, leaf.error, actual.error.term) && outputMatches(program, leaf.output, actual.error.output);
  }
  const solution = actual.solutions[position];
  if (!solution || !outputMatches(program, leaf.output, solution.output)) return false;
  return substitutionMatches(query, leaf.bindings, solution.env);
}

function alternativeDescribesLoop(alternative) {
  return splitOperator(alternative, ';').some((term) => describeLeaf(term).loops);
}

function substitutionMatches(query, bindings, actualEnv) {
  const queryVariables = namedVariables(query);
  const queryNames = new Set(queryVariables.map((variable) => variable.name));
  const expectedEnv = new Env();
  const rebound = new Set();
  for (const binding of bindings) {
    const variable = binding.args[0];
    if (!queryNames.has(variable.name) || rebound.has(variable.name)) return false;
    rebound.add(variable.name);
    if (!unify(variable, binding.args[1], expectedEnv)) return false;
  }
  const expected = compound('$quad_answer', queryVariables.map((variable) => copyResolved(variable, expectedEnv)));
  const actual = compound('$quad_answer', queryVariables.map((variable) => copyResolved(variable, actualEnv)));
  return patternVariant(expected, new Env(), actual, new Env());
}

function namedVariables(term) {
  const found = [];
  const seen = new Set();
  const stack = [term];
  while (stack.length) {
    const current = stack.pop();
    if (current.type === VAR) {
      if (!current.name.startsWith('__anon') && !seen.has(current.name)) {
        seen.add(current.name);
        found.push(current);
      }
    } else {
      for (let index = current.args.length - 1; index >= 0; index--) stack.push(current.args[index]);
    }
  }
  return found;
}

function patternVariant(
  pattern, patternEnv, actual, actualEnv, pairs = new Map(), reverse = new Map(), fixedPatternNames = null,
) {
  pattern = deref(pattern, patternEnv);
  actual = deref(actual, actualEnv);
  if (pattern.type === ATOM && pattern.name === '...') return true;
  if (pattern.type === VAR || actual.type === VAR) {
    if (pattern.type !== VAR || actual.type !== VAR) return false;
    if (fixedPatternNames?.has(pattern.name)) return pattern.name === actual.name;
    const paired = pairs.get(pattern.name);
    const reversed = reverse.get(actual.name);
    if (paired != null || reversed != null) return paired === actual.name && reversed === pattern.name;
    pairs.set(pattern.name, actual.name);
    reverse.set(actual.name, pattern.name);
    return true;
  }
  if (pattern.type !== actual.type || pattern.name !== actual.name || pattern.arity !== actual.arity) return false;
  for (let index = 0; index < pattern.arity; index++) {
    if (!patternVariant(
      pattern.args[index], patternEnv, actual.args[index], actualEnv, pairs, reverse, fixedPatternNames,
    )) return false;
  }
  return true;
}

function errorTerm(error) {
  if (error?.name === 'ThrownTerm' && error.term) return compound('$quad_thrown', [error.term]);
  if (error?.name === 'PrologError') {
    let formal;
    try {
      formal = parseGoalText(error.formal);
    } catch (_) {
      formal = atom(error.formal ?? 'system_error');
    }
    if (error.culprit != null) formal = formal.type === COMPOUND
      ? compound(formal.name, [...formal.args, error.culprit])
      : compound(formal.name, [error.culprit]);
    return compound('error', [formal, variable('$quad_context')]);
  }
  return compound('error', [atom('system_error'), variable('$quad_context')]);
}

function errorMatches(query, expected, actual) {
  // Variables named in the query keep their identity in answer descriptions.
  // Seed both directions so a query variable can match only that same query
  // variable, while variables introduced by the description (for example _X)
  // remain fresh pattern variables.  This is especially important for throw/1:
  // ISO requires the thrown ball to be a renamed copy, so throw(g(_X)) may
  // describe throw(g(X)), but throw(g(X)) must not.
  const queryNames = new Set(namedVariables(query).map((item) => item.name));
  const matches = (pattern, term) => patternVariant(
    pattern, new Env(), term, new Env(), new Map(), new Map(), queryNames);

  if (expected.type === COMPOUND && expected.name === 'throw' && expected.arity === 1 &&
      actual.type === COMPOUND && actual.name === '$quad_thrown' && actual.arity === 1) {
    return matches(expected.args[0], actual.args[0]);
  }
  if (actual.type !== COMPOUND || actual.name !== 'error' || actual.arity !== 2) return false;
  if (expected.type === COMPOUND && expected.name === 'error' && expected.arity === 2) {
    return matches(expected, actual);
  }
  return matches(expected, actual.args[0]);
}

function isErrorDescription(term) {
  if (term.type === ATOM) return ['instantiation_error', 'system_error'].includes(term.name);
  return term.type === COMPOUND && [
    'error', 'throw', 'type_error', 'domain_error', 'existence_error',
    'permission_error', 'evaluation_error', 'representation_error',
    'resource_error', 'syntax_error', 'uninstantiation_error',
  ].includes(term.name);
}

function characterText(term) {
  const items = properListItems(term, new Env());
  if (items == null) return null;
  let text = '';
  for (const item of items) {
    if (item.type === ATOM && Array.from(item.name).length === 1) text += item.name;
    else if (item.type === 'number' && /^\d+$/.test(item.name)) text += String.fromCodePoint(Number(item.name));
    else return null;
  }
  return text;
}

function outputMatches(program, expected, actual) {
  if (expected == null) return true;

  // Preserve the original exact character-list/code-list shorthand first.
  const exactText = characterText(expected);
  if (exactText != null && exactText === actual) return true;

  // Trealla's portable quad convention also permits the captured character
  // sequence to unify directly with outputs/1's argument before trying it as a
  // DCG body. This makes outputs(Cs) and partially instantiated character lists
  // useful without weakening the DCG interpretation.
  const actualList = listFromItems(Array.from(actual, (character) => atom(character)));
  if (unify(expected, actualList, new Env())) return true;

  return outputDcgMatches(program, expected, actual);
}

function outputDcgMatches(program, body, actual) {
  const characters = Array.from(actual);
  for (const state of matchOutputDcg(program, body, characters, 0, new Env())) {
    if (state.position === characters.length) return true;
  }
  return false;
}

function* matchOutputDcg(program, body, characters, position, env) {
  body = deref(body, env);

  if (body.type === ATOM && (body.name === '...' || body.name === 'ad_infinitum')) {
    for (let next = position; next <= characters.length; next++) {
      yield { position: next, env: env.clone() };
    }
    return;
  }

  if (body.type === ATOM && body.name === '[]') {
    yield { position, env };
    return;
  }

  if (body.type === COMPOUND && body.name === '.' && body.arity === 2) {
    const items = properListItems(body, env);
    if (items == null) return;
    let states = [{ position, env }];
    for (const item of items) {
      const nextStates = [];
      for (const state of states) {
        if (state.position >= characters.length) continue;
        const expected = outputTerminalTerm(item, state.env);
        if (expected == null) continue;
        const nextEnv = state.env.clone();
        if (unify(expected, atom(characters[state.position]), nextEnv)) {
          nextStates.push({ position: state.position + 1, env: nextEnv });
        }
      }
      states = nextStates;
      if (states.length === 0) return;
    }
    yield* states;
    return;
  }

  if (body.type === COMPOUND && body.name === ',' && body.arity === 2) {
    for (const left of matchOutputDcg(program, body.args[0], characters, position, env)) {
      yield* matchOutputDcg(program, body.args[1], characters, left.position, left.env);
    }
    return;
  }

  if (body.type === COMPOUND && [';', '|'].includes(body.name) && body.arity === 2) {
    yield* matchOutputDcg(program, body.args[0], characters, position, env.clone());
    yield* matchOutputDcg(program, body.args[1], characters, position, env.clone());
    return;
  }

  if ((body.type === ATOM && ['!', '{}'].includes(body.name)) ||
      (body.type === COMPOUND && body.name === '{}' && body.arity === 1 &&
       body.args[0].type === ATOM && body.args[0].name === 'true')) {
    yield { position, env };
    return;
  }

  if (body.type === COMPOUND && body.name === '{}' && body.arity === 1 &&
      body.args[0].type === ATOM && body.args[0].name === 'fail') return;

  // A nonterminal in an outputs/1 DCG body is interpreted against the same
  // program as the query. Ask its expanded /2 relation how much of the
  // remaining captured character list it consumes. This covers user-defined
  // DCGs while the structural cases above handle terminals and ... without
  // requiring a harness-only library import.
  if (body.type === ATOM || body.type === COMPOUND) {
    yield* matchOutputNonterminal(program, body, characters, position, env);
  }
}

let outputDcgFresh = 0;
function* matchOutputNonterminal(program, body, characters, position, env) {
  const input = listFromItems(characters.slice(position).map((character) => atom(character)));
  const output = variable(`\u0000quad-output:${++outputDcgFresh}`);
  let goal;
  if (body.type === ATOM) goal = compound(body.name, [input, output]);
  else goal = compound(body.name, [...body.args, input, output]);
  goal.module = body.module ?? 'user';

  const solver = new Solver(program, {
    registry: getEyePrologRegistry(),
    maxInferences: DEFAULT_QUAD_MAX_INFERENCES,
    solutionLimit: characters.length + 2,
    ioOptions: { write: () => {} },
  });
  try {
    for (const solutionEnv of solver.solve([goal], env.clone(), 0)) {
      const tail = characterText(deref(output, solutionEnv));
      if (tail == null) continue;
      const remaining = characters.slice(position).join('');
      if (!remaining.endsWith(tail)) continue;
      yield {
        position: characters.length - Array.from(tail).length,
        env: solutionEnv,
      };
    }
  } catch (_) {
    // A DCG body that raises while being used as an output matcher simply does
    // not match, mirroring catch(phrase(Expected, Cs), _, fail).
  }
}

function outputTerminalTerm(term, env) {
  term = deref(term, env);
  if (term.type === 'number' && /^\d+$/.test(term.name)) {
    const code = Number(term.name);
    if (!Number.isSafeInteger(code) || code < 0 || code > 0x10ffff || (code >= 0xd800 && code <= 0xdfff)) {
      return null;
    }
    return atom(String.fromCodePoint(code));
  }
  return term;
}

function leafNeedsMoreSearch(leaf, actual, position) {
  if (!actual.undecided) return false;
  if (leaf.false) return true;
  if (leaf.error != null) return actual.error == null && position >= actual.solutions.length;
  return position >= actual.solutions.length;
}

function undecidedResult(actual, expected) {
  return {
    ok: false,
    kind: 'undecided',
    expected,
    reason: actual.undecidedReason ?? 'search budget exhausted',
  };
}


function splitOperator(term, name) {
  if (term.type === COMPOUND && term.name === name && term.arity === 2) {
    return [term.args[0], ...splitOperator(term.args[1], name)];
  }
  return [term];
}

function formatFailure(program, quad, result, description = quad.answers[0]) {
  const source = quad.source ?? { filename: '<input>', line: 1 };
  const label = quad.id == null ? '' : `${formatQuadTerm(program, quad.id)}, `;
  const reason = result.kind === 'malformed' ? 'MALFORMED'
    : result.kind === 'bad_identifier' ? 'BAD_ID'
      : result.kind === 'unsupported' ? 'UNSUPPORTED'
        : result.kind === 'undecided' ? 'UNDECIDED'
          : 'FAILED';
  const expected = result.expected ?? description;
  const detail = result.kind === 'undecided'
    ? `   undecided: ${result.reason}.\n`
    : `   expected: ${formatQuadTerm(program, expected)}.\n`;
  return `quads: ${reason} ${label}${source.filename}:${source.line}\n` +
    `   ?- ${formatQuadTerm(program, quad.query)}.\n` + detail;
}

function formatQuadTerm(program, term) {
  return formatTermForWrite(term, new Env(), {
    quoted: true,
    operators: [...program.operators.values()],
  });
}
