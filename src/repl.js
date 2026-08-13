// Interactive top level for the eyeprolog command.
import fs from 'node:fs/promises';
import path from 'node:path';
import { createInterface } from 'node:readline';
import { formalErrorTerm } from './iso.js';

const ANSWER_HELP = `
SPACE, "n" or ";": next solution, if any
RETURN or ".": stop enumeration
"a": enumerate all solutions
"f": enumerate the next 5 solutions
"h": display this help message
"w": write terms without depth limit
"p": print terms with depth limit
`;

export async function runRepl(engine, options = {}) {
  const input = options.input ?? process.stdin;
  const output = options.output ?? process.stdout;
  const errorOutput = options.errorOutput ?? process.stderr;
  const reader = new LineReader(input, output);
  const sources = [];
  let state = makeState(engine, sources, output, options);
  let exitCode = 0;

  try {
    state.solver.runInitializations();
    while (true) {
      const text = await readQuery(reader);
      if (text == null) break;
      if (!text.trim()) continue;

      try {
        const goal = parseGoal(engine, state, text);
        if (!options.isoStrict && isUseModuleGoal(goal)) {
          sources.push({ text: `:- ${text}.\n`, filename: '<repl>' });
          state = makeState(engine, sources, output, options, state);
          state.solver.runInitializations();
          output.write('   true.\n');
          continue;
        }
        const consultFiles = options.isoStrict ? null : consultDesignations(engine, goal);
        if (consultFiles != null) {
          for (const filename of consultFiles) sources.push(await readSource(filename));
          state = makeState(engine, sources, output, options, state);
          state.solver.runInitializations();
          output.write('   true.\n');
          continue;
        }

        const flagsBefore = snapshotFlagValues(state.solver);
        try {
          await prepareInteractiveTermInput(state, goal, reader);
          const result = await solveQuery(engine, state, goal, reader, output);
          if (result?.halted) {
            exitCode = result.code;
            break;
          }
        } finally {
          rememberFlagOverrides(state, flagsBefore);
        }
      } catch (error) {
        if (error?.name === 'HaltSignal') {
          exitCode = error.code;
          break;
        }
        output.write(`   ${formatError(engine, state, error)}\n`);
      }
    }
  } catch (error) {
    errorOutput.write(`eyeprolog: ${error?.message ?? String(error)}\n`);
    exitCode = 1;
  } finally {
    reader.close();
  }

  return exitCode;
}

class LineReader {
  constructor(input, output) {
    this.input = input;
    this.output = output;
    this.terminal = Boolean(input.isTTY && output.isTTY && typeof input.setRawMode === 'function');
    this.history = [];
    this.currentPrompt = '?- ';
    this.open();
  }

  open() {
    this.readline = createInterface({
      input: this.input,
      output: this.output,
      terminal: Boolean(this.input.isTTY && this.output.isTTY),
      prompt: this.currentPrompt,
    });
    if (this.terminal && this.history.length > 0) {
      this.readline.history.push(...this.history);
    }
    this.lines = this.readline[Symbol.asyncIterator]();
  }

  async read(prompt) {
    this.currentPrompt = prompt;
    this.readline.setPrompt(prompt);
    this.output.write(prompt);
    const result = await this.lines.next();
    return result.done ? null : result.value;
  }

  async readControl(prompt) {
    if (!this.terminal) return this.read(prompt);
    this.output.write(prompt);
    this.history = [...this.readline.history];
    this.currentPrompt = '?- ';
    this.readline.close();
    this.readline = null;
    this.lines = null;
    this.input.setRawMode(true);
    this.input.resume();

    const control = await new Promise((resolve, reject) => {
      const cleanup = () => {
        this.input.off('data', onData);
        this.input.off('error', onError);
      };
      const onData = (data) => {
        cleanup();
        const text = String(data);
        resolve(text === '\x04' ? null : text[0] ?? null);
      };
      const onError = (error) => {
        cleanup();
        reject(error);
      };
      this.input.once('data', onData);
      this.input.once('error', onError);
    });

    this.input.setRawMode(false);
    this.open();
    return control;
  }

  close() {
    if (this.input.isRaw) this.input.setRawMode(false);
    this.readline?.close();
  }
}

function makeState(engine, sources, output, options = {}, previousState = null) {
  const strictIso = options.isoStrict === true;
  const program = engine.Program.parseSources(sources, { strictIso, sourceMetadata: strictIso });
  const solver = new engine.Solver(program, {
    registry: strictIso ? engine.getStrictIsoRegistry() : engine.getEyePrologRegistry(),
    isoStrict: strictIso,
    ioOptions: { write: (text) => output.write(String(text)) },
  });
  const flagOverrides = new Map(previousState?.flagOverrides ?? []);
  for (const [name, value] of flagOverrides) {
    const definition = solver.prologFlags.get(name);
    if (definition?.changeable && definition.allowed.includes(value)) {
      definition.value = engine.atom(value);
    }
  }
  return { program: solver.program, solver, strictIso, flagOverrides };
}

function snapshotFlagValues(solver) {
  return new Map([...solver.prologFlags].map(([name, definition]) => [name, definition.value?.name]));
}

function rememberFlagOverrides(state, before) {
  for (const [name, definition] of state.solver.prologFlags) {
    const value = definition.value?.name;
    if (before.get(name) !== value) state.flagOverrides.set(name, value);
  }
}

async function readQuery(reader) {
  let source = '';
  let prompt = '?- ';
  while (true) {
    const line = await reader.read(prompt);
    if (line == null) return source.trim() ? source : null;
    source += `${line}\n`;
    const end = terminalFullStop(source);
    if (end >= 0) return source.slice(0, end);
    prompt = '|    ';
  }
}

async function prepareInteractiveTermInput(state, goal, reader) {
  const stream = interactiveTermInputStream(state, goal);
  if (stream == null || terminalFullStop(String(stream.content).slice(stream.position)) >= 0) return;

  const text = await readInteractiveTerm(reader);
  if (text == null) return;
  stream.content += text;
  stream.pastEnd = false;
}

function interactiveTermInputStream(state, goal) {
  if (goal.type !== 'compound') return null;
  let reference = null;
  if (goal.name === 'read' && goal.arity === 1) {
    reference = state.solver.io.currentInput;
  } else if (goal.name === 'read' && goal.arity === 2) {
    reference = explicitInputReference(goal.args[0]);
  } else if (goal.name === 'read_term' && goal.arity === 2) {
    reference = state.solver.io.currentInput;
  } else if (goal.name === 'read_term' && goal.arity === 3) {
    reference = explicitInputReference(goal.args[0]);
  } else {
    return null;
  }

  const stream = reference == null ? null : state.solver.io.resolve(reference);
  return stream?.standard && stream.alias === 'user_input' && stream.mode === 'read' ? stream : null;
}

function explicitInputReference(term) {
  if (term.type === 'atom') return term.name;
  if (term.type === 'compound' && term.name === '$stream' && term.arity === 1 &&
      term.args[0].type === 'number' && /^\d+$/.test(term.args[0].name)) {
    return Number(term.args[0].name);
  }
  return null;
}

async function readInteractiveTerm(reader) {
  let source = '';
  let prompt = '|: ';
  while (true) {
    const line = await reader.read(prompt);
    if (line == null) return source.trim() ? source : null;
    source += `${line}\n`;
    const end = terminalFullStop(source);
    if (end >= 0) return source.slice(0, end + 1) + '\n';
    prompt = '|    ';
  }
}

function quotedEscapeEnd(source, index) {
  const escaped = source[index + 1] ?? '';
  if (!escaped) return index;

  // ISO 6.4.2.1 octal and hexadecimal escapes are terminated by a
  // backslash.  Consume that terminator as part of the escape so the REPL
  // scanner does not mistake it for an escape of the following quote.
  if (escaped === 'x') {
    let cursor = index + 2;
    while (/^[0-9A-Fa-f]$/.test(source[cursor] ?? '')) cursor++;
    return source[cursor] === '\\' ? cursor : Math.max(index + 1, cursor - 1);
  }
  if (/^[0-9]$/.test(escaped)) {
    let cursor = index + 1;
    // Scan all decimal digits here, including 8 and 9.  This scanner only
    // locates the end of a candidate quoted escape; the parser remains
    // authoritative and rejects non-octal digits.
    while (/^[0-9]$/.test(source[cursor] ?? '')) cursor++;
    return source[cursor] === '\\' ? cursor : Math.max(index + 1, cursor - 1);
  }

  // Meta escapes, symbolic control escapes, and continuation escapes consume
  // one character after the backslash.  The parser performs validity checks.
  return index + 1;
}

function terminalFullStop(source) {
  let quote = null;
  let lineComment = false;
  let blockComment = false;
  let depth = 0;

  for (let i = 0; i < source.length; i++) {
    const ch = source[i];
    const next = source[i + 1];
    if (lineComment) {
      if (ch === '\n') lineComment = false;
      continue;
    }
    if (blockComment) {
      if (ch === '*' && next === '/') {
        blockComment = false;
        i++;
      }
      continue;
    }
    if (quote != null) {
      if (ch === '\\') {
        i = quotedEscapeEnd(source, i);
      } else if (ch === quote) {
        if (next === quote) i++;
        else quote = null;
      }
      continue;
    }
    if (ch === '%') {
      lineComment = true;
      continue;
    }
    if (ch === '/' && next === '*') {
      blockComment = true;
      i++;
      continue;
    }
    if (ch === "'" || ch === '"' || ch === '`') {
      quote = ch;
      continue;
    }
    if ('([{'.includes(ch)) depth++;
    else if (')]}'.includes(ch)) depth = Math.max(0, depth - 1);
    else if (ch === '.' && depth === 0 && onlyLayoutAndComments(source.slice(i + 1))) return i;
  }
  return -1;
}

function onlyLayoutAndComments(source) {
  return source.replace(/\s|%[^\n]*(?:\n|$)|\/\*[\s\S]*?\*\//g, '').length === 0;
}

function parseGoal(engine, state, text) {
  const goal = engine.parseGoalText(text, {
    doubleQuotes: state.solver.prologFlags.get('double_quotes')?.value?.name ?? 'chars',
    operatorDefinitions: [...state.program.operators.values()],
    isoStrict: state.strictIso,
  });
  if (goal.type === 'var') throw new engine.PrologError('instantiation_error');
  if (goal.type !== 'atom' && goal.type !== 'compound') {
    throw new engine.PrologError('type_error(callable)', goal);
  }
  return goal;
}

function isUseModuleGoal(goal) {
  return goal.type === 'compound' && goal.name === 'use_module' && [1, 2].includes(goal.arity);
}

function consultDesignations(engine, goal) {
  if (goal.type === 'atom' && goal.name === '[]') return [];
  if (goal.type !== 'compound' || goal.name !== '.' || goal.arity !== 2) return null;
  const items = engine.properListItems(goal, new engine.Env());
  if (items == null) return null;
  return items.map((item) => {
    if (item.type === 'var') throw new engine.PrologError('instantiation_error');
    if (item.type !== 'atom') throw new engine.PrologError('type_error(atom)', item);
    return item.name;
  });
}

async function readSource(designation) {
  let filename = path.resolve(designation);
  try {
    await fs.access(filename);
  } catch (error) {
    if (path.extname(filename)) throw error;
    filename += '.pl';
  }
  return {
    text: await fs.readFile(filename, 'utf8'),
    filename: path.basename(filename),
    baseDir: path.dirname(filename),
  };
}

async function solveQuery(engine, state, goal, reader, output) {
  const variables = queryVariables(goal);
  const solver = state.solver;
  solver.solutionsSeen = 0;
  const solutions = solver.solve([goal], new engine.Env(), 0);
  let current = pullSolution(solver, solutions);
  if (current.error) {
    if (current.error?.name === 'HaltSignal') return { halted: true, code: current.error.code };
    throw current.error;
  }

  if (current.result.done) {
    output.write('   false.\n');
    return null;
  }

  let automatic = 0;
  let firstAnswer = true;
  while (!current.result.done) {
    const next = pullSolution(solver, solutions);
    output.write(current.output);
    output.write(`${firstAnswer ? '   ' : ''}${formatAnswer(engine, state, variables, current.result.value)}`);
    firstAnswer = false;
    if (!next.error && next.result.done) {
      output.write('.\n');
      return null;
    }

    if (automatic > 0 || automatic === Infinity) {
      if (automatic !== Infinity) automatic--;
      output.write('\n;  ');
    } else {
      while (true) {
        const controlLine = await reader.readControl('\n;  ');
        if (controlLine == null || controlLine === '' || controlLine === '\r' || controlLine === '\n' ||
            controlLine.trimStart().startsWith('.')) {
          if (typeof solutions.return === 'function') solutions.return();
          output.write('... .\n');
          return null;
        }
        const control = controlLine === ' ' ? ' ' : controlLine.trimStart()[0];
        if (control === ';' || control === 'n' || control === ' ') break;
        if (control === 'a') {
          automatic = Infinity;
          break;
        }
        if (control === 'f') {
          automatic = 4;
          break;
        }
        if (control === 'w' || control === 'p') {
          output.write(`${formatAnswer(engine, state, variables, current.result.value)}`);
          continue;
        }
        if (control === 'h') {
          output.write(ANSWER_HELP);
          continue;
        }
        output.write('Action? ');
      }
    }

    if (next.error) {
      output.write(next.output);
      if (next.error?.name === 'HaltSignal') return { halted: true, code: next.error.code };
      throw next.error;
    }
    current = next;
  }
  return null;
}

function pullSolution(solver, solutions) {
  const stream = solver.io.resolve('user_output');
  const originalWrite = stream?.write;
  let captured = '';
  if (stream) stream.write = (text) => { captured += String(text); };
  try {
    return { result: solutions.next(), output: captured };
  } catch (error) {
    return { error, output: captured };
  } finally {
    if (stream) stream.write = originalWrite;
  }
}

function queryVariables(goal) {
  const variables = [];
  const seen = new Set();
  const stack = [goal];
  while (stack.length) {
    const term = stack.pop();
    if (term.type === 'var') {
      if (!term.name.startsWith('__anon') && !seen.has(term.name)) {
        seen.add(term.name);
        variables.push(term);
      }
    } else {
      for (let i = term.args.length - 1; i >= 0; i--) stack.push(term.args[i]);
    }
  }
  return variables;
}

function formatAnswer(engine, state, variables, env) {
  const bindings = [];
  const queryVariableNames = new Set(variables.map((variable) => variable.name));
  const names = new Map(variables.map((variable) => [variable.name, variable.name]));
  const operators = [...state.program.operators.values()];
  // Answer substitutions are displayed as `Variable = Value`.  Format Value
  // in the right-operand context of the active infix `=/2` definition so an
  // operator term such as `a = b` is parenthesized rather than producing the
  // invalid `T = a = b`.  ISO does not standardize a top level, but the term
  // syntax used by the display must still respect the current operator table.
  const equality = operators.find((definition) =>
    definition.name === '=' && ['xfx', 'xfy', 'yfx'].includes(definition.specifier));
  const valueMaxPriority = equality == null
    ? 699
    : equality.specifier === 'xfy' ? equality.priority : equality.priority - 1;
  let generated = 0;

  for (const variable of variables) collectUnboundVariables(engine, variable, env, names, () => `_${letterName(generated++)}`);
  for (const variable of variables) {
    const value = engine.deref(variable, env);
    if (value.type === 'var' &&
        (value.name === variable.name || !queryVariableNames.has(value.name))) continue;
    bindings.push(`${variable.name} = ${engine.formatTermForWrite(value, env, {
      quoted: true,
      operators,
      variableNames: names,
      maxPriority: valueMaxPriority,
    })}`);
  }
  return bindings.length === 0 ? 'true' : bindings.join(', ');
}

function collectUnboundVariables(engine, term, env, names, nextName) {
  const stack = [term];
  const seen = new Set();
  while (stack.length) {
    const current = engine.deref(stack.pop(), env);
    if (current.type === 'var') {
      if (!seen.has(current.name)) {
        seen.add(current.name);
        if (!names.has(current.name)) names.set(current.name, nextName());
      }
    } else {
      for (let i = current.args.length - 1; i >= 0; i--) stack.push(current.args[i]);
    }
  }
}

function letterName(index) {
  const letter = String.fromCharCode(65 + (index % 26));
  const suffix = Math.floor(index / 26);
  return suffix === 0 ? letter : `${letter}${suffix}`;
}

function formatError(engine, state, error) {
  if (error?.name === 'PrologError') {
    const env = new engine.Env();
    const variableNames = new Map();
    let generated = 0;
    // ISO 7.12.1 represents processor errors as error(ErrorTerm, ImpDef).
    // Reuse the same conversion as catch/3 so uncaught errors at the top
    // level cannot lose the implementation-defined context or misplace a
    // culprit as the second argument of error/2.
    const term = formalErrorTerm(error);
    collectUnboundVariables(engine, term, env, variableNames, () => `_${letterName(generated++)}`);
    return `${engine.formatTermForWrite(term, env, {
      quoted: true,
      operators: [...state.program.operators.values()],
      variableNames,
    })}.`;
  }
  const message = error?.message ?? String(error);
  return message.endsWith('.') ? message : `${message}.`;
}
