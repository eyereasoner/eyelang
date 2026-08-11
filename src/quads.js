// Embedded quad tests: a query followed by one or more answer descriptions.
// The syntax follows the portable "queries using answer descriptions" format
// used by Trealla and the ISO Prolog working examples linked from issue #1.
import {
  ATOM, COMPOUND, VAR, Env, atom, compound, copyResolved, deref,
  flattenConjunction, properListItems, termIsGround,
  unify, variable,
} from './term.js';
import { parseGoalText } from './parser.js';
import { Program } from './program.js';
import { Solver } from './solver.js';
import { getEyePrologRegistry } from './standard-library.js';
import { formatTermForWrite } from './write.js';

export function runQuads(source, options = {}) {
  const program = source instanceof Program
    ? source
    : Program.parse(source, { ...options, sourceMetadata: true });
  const quads = program.quads ?? [];
  if (quads.length === 0) {
    return { stdout: 'quads: nothing to run.\n', total: 0, passed: 0, failed: 0, results: [] };
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
    const result = checkQuad(program, quad, options);
    results.push(result);
    if (!result.ok) lines.push(formatFailure(program, quad, result));
  }
  const passed = results.filter((result) => result.ok).length;
  const failed = results.length - passed;
  lines.push(`quads: ${results.length} run, ${passed} passed, ${failed} failed.\n`);
  return { stdout: lines.join(''), total: results.length, passed, failed, results };
}

function checkQuad(program, quad, options) {
  if (quad.id != null && !termIsGround(quad.id, new Env())) {
    return { ok: false, kind: 'bad_identifier', expected: quad.id };
  }
  for (const description of quad.answers) {
    const checked = checkDescription(program, quad, description, options);
    if (!checked.ok) return checked;
  }
  return { ok: true };
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
  for (const alternative of ordered) {
    const checked = checkAlternative(program, quad, alternative, options);
    if (checked.ok) return checked;
    if (checked.kind === 'unsupported') unsupported ??= checked;
  }
  return unsupported ?? { ok: false, kind: 'failed', expected: description };
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
    const matches = actual.inputPosition === input.length && matchLeaf(quad.query, leaf, actual, 0);
    return { ok: leaf.unexpected ? !matches : matches };
  }

  let position = 0;
  for (const leaf of leaves) {
    if (leaf.more && !leaf.hasExpectation) return { ok: true };
    const matches = matchLeaf(quad.query, leaf, actual, position);
    if (leaf.unexpected ? matches : !matches) return { ok: false };
    if (leaf.more) return { ok: true };
    if (!leaf.unexpected && (leaf.false || leaf.error != null)) {
      return { ok: position === leaves.length - 1 };
    }
    position++;
  }

  const ended = position >= actual.solutions.length && actual.error == null;
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
      const text = characterText(item.args[0]);
      if (text == null || leaf.output != null) leaf.malformed ??= item;
      else leaf.output = text;
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
    maxInferences: options.detectLoops ? (options.loopMaxInferences ?? 10000) : options.maxInferences,
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
  return {
    solutions,
    error,
    tailOutput,
    inputPosition,
    loops: solver.depthLimitExceeded || solver.inferenceLimitExceeded,
  };
}

function matchLeaf(query, leaf, actual, position) {
  if (leaf.loops) return actual.loops;
  if (leaf.false) {
    return position >= actual.solutions.length && actual.error == null && outputMatches(leaf.output, actual.tailOutput);
  }
  if (leaf.error != null) {
    return position === actual.solutions.length && actual.error != null &&
      errorMatches(leaf.error, actual.error.term) && outputMatches(leaf.output, actual.error.output);
  }
  const solution = actual.solutions[position];
  if (!solution || !outputMatches(leaf.output, solution.output)) return false;
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

function patternVariant(pattern, patternEnv, actual, actualEnv, pairs = new Map(), reverse = new Map()) {
  pattern = deref(pattern, patternEnv);
  actual = deref(actual, actualEnv);
  if (pattern.type === ATOM && pattern.name === '...') return true;
  if (pattern.type === VAR || actual.type === VAR) {
    if (pattern.type !== VAR || actual.type !== VAR) return false;
    const paired = pairs.get(pattern.name);
    const reversed = reverse.get(actual.name);
    if (paired != null || reversed != null) return paired === actual.name && reversed === pattern.name;
    pairs.set(pattern.name, actual.name);
    reverse.set(actual.name, pattern.name);
    return true;
  }
  if (pattern.type !== actual.type || pattern.name !== actual.name || pattern.arity !== actual.arity) return false;
  for (let index = 0; index < pattern.arity; index++) {
    if (!patternVariant(pattern.args[index], patternEnv, actual.args[index], actualEnv, pairs, reverse)) return false;
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

function errorMatches(expected, actual) {
  if (expected.type === COMPOUND && expected.name === 'throw' && expected.arity === 1 &&
      actual.type === COMPOUND && actual.name === '$quad_thrown' && actual.arity === 1) {
    return patternVariant(expected.args[0], new Env(), actual.args[0], new Env());
  }
  if (actual.type !== COMPOUND || actual.name !== 'error' || actual.arity !== 2) return false;
  if (expected.type === COMPOUND && expected.name === 'error' && expected.arity === 2) {
    return patternVariant(expected, new Env(), actual, new Env());
  }
  return patternVariant(expected, new Env(), actual.args[0], new Env());
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

function outputMatches(expected, actual) {
  return expected == null || expected === actual;
}

function splitOperator(term, name) {
  if (term.type === COMPOUND && term.name === name && term.arity === 2) {
    return [term.args[0], ...splitOperator(term.args[1], name)];
  }
  return [term];
}

function formatFailure(program, quad, result) {
  const source = quad.source ?? { filename: '<input>', line: 1 };
  const label = quad.id == null ? '' : `${formatQuadTerm(program, quad.id)}, `;
  const reason = result.kind === 'malformed' ? 'MALFORMED'
    : result.kind === 'bad_identifier' ? 'BAD_ID'
      : result.kind === 'unsupported' ? 'UNSUPPORTED'
        : 'FAILED';
  const expected = result.expected ?? quad.answers[0];
  return `quads: ${reason} ${label}${source.filename}:${source.line}\n` +
    `   ?- ${formatQuadTerm(program, quad.query)}.\n` +
    `   expected: ${formatQuadTerm(program, expected)}.\n`;
}

function formatQuadTerm(program, term) {
  return formatTermForWrite(term, new Env(), {
    quoted: true,
    operators: [...program.operators.values()],
  });
}
