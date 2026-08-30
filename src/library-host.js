// Host adapters for portable library predicates that need runtime services.
//
// Public APIs stay in src/lib/*.pl.  This module only bridges those Prolog
// wrappers to parsing/writing, filesystem, environment, process and timing
// facilities that cannot be expressed portably in pure Prolog.

import { createParserOperatorState, parseTermText } from './parser.js';
import { BufferCtor, fs, isNode } from './platform.js';
import {
  ATOM, COMPOUND, NUMBER, VAR, atom, compound, copyResolved, deref,
  listFromItems, numberTerm, properListItems, unify, variable,
} from './term.js';
import { PrologError } from './errors.js';
import { formatTermForWrite } from './write.js';

let spawnSync = null;
if (isNode) ({ spawnSync } = await import('node:child_process'));

let readFresh = 0;

function requireNode(resource) {
  if (!isNode || fs == null) throw new PrologError(`resource_error(${resource})`);
}

function characterListText(term, env) {
  const value = deref(term, env);
  if (value.type === VAR) throw new PrologError('instantiation_error');
  const items = properListItems(value, env);
  if (items == null) throw new PrologError('type_error(list)', copyResolved(value, env));
  let text = '';
  for (const itemTerm of items) {
    const item = deref(itemTerm, env);
    if (item.type === VAR) throw new PrologError('instantiation_error');
    if (item.type !== ATOM || Array.from(item.name).length !== 1) {
      throw new PrologError('type_error(character)', copyResolved(item, env));
    }
    text += item.name;
  }
  return text;
}

function chars(text) {
  return listFromItems(Array.from(String(text), atom));
}

function listOfChars(values) {
  return listFromItems(values.map((value) => chars(value)));
}

function activeCharConverter(solver) {
  if (solver.prologFlags.get('char_conversion')?.value?.name !== 'on' || solver.charConversions.size === 0) {
    return null;
  }
  return (character) => solver.charConversions.get(character) ?? character;
}

function convertTextCharacters(text, solver) {
  const convert = activeCharConverter(solver);
  if (convert == null) return text;
  let result = '', quote = null;
  for (let i = 0; i < text.length; i++) {
    const ch = text[i], next = text[i + 1];
    if (quote != null) {
      result += ch;
      if (ch === '\\') {
        if (i + 1 < text.length) result += text[++i];
      } else if (ch === quote && next === quote) {
        result += text[++i];
      } else if (ch === quote) {
        quote = null;
      }
      continue;
    }
    if (ch === "'" || ch === '"') {
      quote = ch;
      result += ch;
    } else {
      result += convert(ch);
    }
  }
  return result;
}

function scopeReadTerm(term) {
  const scope = ++readFresh;
  const bySourceName = new Map();
  const variables = [];
  const copy = (item) => {
    if (item.type === VAR) {
      let record = bySourceName.get(item.name);
      if (record == null) {
        const scoped = variable(`\u0000chars:${scope}:${variables.length}`);
        scoped.displayName = item.name;
        record = {
          sourceName: item.name,
          term: scoped,
          count: 0,
          anonymous: item.name.startsWith('__anon'),
        };
        bySourceName.set(item.name, record);
        variables.push(record);
      }
      record.count++;
      return record.term;
    }
    if (item.type !== COMPOUND) return item;
    return compound(item.name, item.args.map(copy));
  };
  return { term: copy(term), variables };
}

function readTextTerm(text, solver) {
  const converted = convertTextCharacters(text, solver);
  try {
    const operatorState = createParserOperatorState(solver.program.operators.values(), false);
    const parsed = parseTermText(converted, {
      operatorState,
      isoStrict: solver.isoStrict,
      doubleQuotes: solver.prologFlags.get('double_quotes')?.value?.name ?? 'chars',
      readTermEnd: converted.endsWith('.') ? converted.length - 1 : undefined,
    });
    return scopeReadTerm(parsed);
  } catch (error) {
    if (error instanceof PrologError) throw error;
    throw new PrologError('syntax_error(read_term)');
  }
}

function requireOptionList(term, env, kind) {
  const value = deref(term, env);
  if (value.type === VAR) throw new PrologError('instantiation_error');
  const options = properListItems(value, env);
  if (options == null) throw new PrologError('type_error(list)', copyResolved(value, env));
  for (const optionTerm of options) {
    if (deref(optionTerm, env).type === VAR) throw new PrologError('instantiation_error');
  }
  return options.map((option) => deref(option, env));
}

function* readFromCharsBuiltin({ solver, goal, env }) {
  const text = characterListText(goal.args[0], env);
  const { term } = readTextTerm(text, solver);
  const next = env.clone();
  if (unify(goal.args[1], term, next)) yield next;
}

function* readTermFromCharsBuiltin({ solver, goal, env }) {
  const text = characterListText(goal.args[0], env);
  const options = requireOptionList(goal.args[2], env, 'read');
  for (const option of options) {
    if (option.type !== COMPOUND || option.arity !== 1 ||
        !['variables', 'variable_names', 'singletons'].includes(option.name)) {
      throw new PrologError('domain_error(read_option)', copyResolved(option, env));
    }
  }
  const { term, variables } = readTextTerm(text, solver);
  const next = env.clone();
  if (!unify(goal.args[1], term, next)) return;
  for (const option of options) {
    const value = option.name === 'variables'
      ? listFromItems(variables.map((item) => item.term))
      : option.name === 'variable_names'
        ? listFromItems(variables
          .filter((item) => !item.anonymous)
          .map((item) => compound('=', [atom(item.sourceName), item.term])))
        : listFromItems(variables
          .filter((item) => !item.anonymous && item.count === 1)
          .map((item) => compound('=', [atom(item.sourceName), item.term])));
    if (!unify(option.args[0], value, next)) return;
  }
  yield next;
}

function optionBoolean(term, env, option) {
  const value = deref(term, env);
  if (value.type === VAR) throw new PrologError('instantiation_error');
  if (value.type !== ATOM || !['true', 'false'].includes(value.name)) {
    throw new PrologError('domain_error(write_option)', copyResolved(option, env));
  }
  return value.name === 'true';
}

function variableNamesOption(term, env, option) {
  const value = deref(term, env);
  if (value.type === VAR) throw new PrologError('instantiation_error');
  const items = properListItems(value, env);
  if (items == null) throw new PrologError('domain_error(write_option)', copyResolved(option, env));
  const names = new Map();
  for (const itemTerm of items) {
    const item = deref(itemTerm, env);
    if (item.type !== COMPOUND || item.name !== '=' || item.arity !== 2) {
      throw new PrologError('domain_error(write_option)', copyResolved(option, env));
    }
    const name = deref(item.args[0], env);
    const target = deref(item.args[1], env);
    if (name.type === VAR) throw new PrologError('instantiation_error');
    if (name.type !== ATOM) throw new PrologError('domain_error(write_option)', copyResolved(option, env));
    if (target.type === VAR && !names.has(target.name)) names.set(target.name, name.name);
  }
  return names;
}

function writeOptions(term, env, solver) {
  const options = requireOptionList(term, env, 'write');
  const result = {
    quoted: false,
    ignoreOps: false,
    numbervars: false,
    variableNames: new Map(),
    compact: true,
    minimalOperatorSpacing: true,
    operatorAtomsAsArgs: true,
    doubleQuotes: null,
  };
  for (const option of options) {
    if (option.type !== COMPOUND || option.arity !== 1) {
      throw new PrologError('domain_error(write_option)', copyResolved(option, env));
    }
    if (option.name === 'quoted') result.quoted = optionBoolean(option.args[0], env, option);
    else if (option.name === 'ignore_ops') result.ignoreOps = optionBoolean(option.args[0], env, option);
    else if (option.name === 'numbervars') result.numbervars = optionBoolean(option.args[0], env, option);
    else if (option.name === 'variable_names') result.variableNames = variableNamesOption(option.args[0], env, option);
    else if (option.name === 'double_quotes' && !solver.isoStrict) result.doubleQuotes = optionBoolean(option.args[0], env, option);
    else throw new PrologError('domain_error(write_option)', copyResolved(option, env));
  }
  return result;
}

function* writeTermToCharsBuiltin({ solver, goal, env }) {
  if (deref(goal.args[2], env).type !== VAR) {
    throw new PrologError('uninstantiation_error', copyResolved(goal.args[2], env));
  }
  const options = writeOptions(goal.args[1], env, solver);
  const text = formatTermForWrite(goal.args[0], env, {
    ...options,
    generateVariableNames: true,
    variableNameState: solver.writeVariableState,
    operators: solver.program.operators.values(),
  });
  const next = env.clone();
  if (unify(goal.args[2], chars(text), next)) yield next;
}

function base64Options(term, env) {
  const options = requireOptionList(term, env, 'base64');
  let padding = true, charset = 'standard';
  for (const option of options) {
    if (option.type !== COMPOUND || option.arity !== 1) {
      throw new PrologError('domain_error(base64_option)', copyResolved(option, env));
    }
    const value = deref(option.args[0], env);
    if (value.type === VAR) throw new PrologError('instantiation_error');
    if (option.name === 'padding') {
      if (value.type !== ATOM || !['true', 'false'].includes(value.name)) {
        throw new PrologError('domain_error(boolean)', copyResolved(value, env));
      }
      padding = value.name === 'true';
    } else if (option.name === 'charset') {
      if (value.type !== ATOM || !['standard', 'url'].includes(value.name)) {
        throw new PrologError('domain_error(charset)', copyResolved(value, env));
      }
      charset = value.name;
    } else {
      throw new PrologError('domain_error(base64_option)', copyResolved(option, env));
    }
  }
  return { padding, charset };
}

function base64Encode(text, charset, padding) {
  const bytes = [];
  for (const ch of Array.from(text)) {
    const code = ch.codePointAt(0);
    if (code > 255) throw new PrologError('domain_error(octet_character)', numberTerm(code));
    bytes.push(code);
  }
  let encoded;
  if (BufferCtor != null) encoded = BufferCtor.from(bytes).toString('base64');
  else if (typeof btoa === 'function') encoded = btoa(String.fromCharCode(...bytes));
  else throw new PrologError('resource_error(base64)');
  if (charset === 'url') encoded = encoded.replace(/\+/g, '-').replace(/\//g, '_');
  if (!padding) encoded = encoded.replace(/=+$/, '');
  return encoded;
}

function base64Decode(text, charset) {
  let encoded = text;
  if (charset === 'url') encoded = encoded.replace(/-/g, '+').replace(/_/g, '/');
  if (!/^[A-Za-z0-9+/]*={0,2}$/.test(encoded) || encoded.length % 4 === 1) {
    throw new PrologError('domain_error(base64)', chars(text));
  }
  encoded += '='.repeat((4 - encoded.length % 4) % 4);
  let bytes;
  if (BufferCtor != null) bytes = [...BufferCtor.from(encoded, 'base64')];
  else if (typeof atob === 'function') bytes = [...atob(encoded)].map((ch) => ch.charCodeAt(0));
  else throw new PrologError('resource_error(base64)');
  return String.fromCharCode(...bytes);
}

function* charsBase64Builtin({ goal, env }) {
  const source = deref(goal.args[0], env);
  const encoded = deref(goal.args[1], env);
  if (source.type === VAR && encoded.type === VAR) throw new PrologError('instantiation_error');
  const { padding, charset } = base64Options(goal.args[2], env);
  const next = env.clone();
  if (source.type !== VAR) {
    const text = characterListText(goal.args[0], env);
    if (unify(goal.args[1], chars(base64Encode(text, charset, padding)), next)) yield next;
    return;
  }
  const text = characterListText(goal.args[1], env);
  if (unify(goal.args[0], chars(base64Decode(text, charset)), next)) yield next;
}

function gcdBigInt(a, b) {
  a = a < 0n ? -a : a;
  b = b < 0n ? -b : b;
  while (b !== 0n) [a, b] = [b, a % b];
  return a;
}

function approximateRational(value, tolerance = 1e-6) {
  if (!Number.isFinite(value)) throw new PrologError('type_error(number)', numberTerm(String(value)));
  if (Number.isInteger(value) && Number.isSafeInteger(value)) return [BigInt(value), 1n];
  const sign = value < 0 ? -1n : 1n;
  const target = Math.abs(value);
  let x = target;
  let hPrev2 = 0, hPrev1 = 1, kPrev2 = 1, kPrev1 = 0;
  for (let i = 0; i < 64; i++) {
    const a = Math.floor(x);
    const h = a * hPrev1 + hPrev2;
    const k = a * kPrev1 + kPrev2;
    if (!Number.isSafeInteger(h) || !Number.isSafeInteger(k) || k === 0) break;
    if (Math.abs(target - h / k) <= tolerance) {
      const n = sign * BigInt(h), d = BigInt(k), g = gcdBigInt(n, d);
      return [n / g, d / g];
    }
    const fraction = x - a;
    if (fraction === 0) {
      const n = sign * BigInt(h), d = BigInt(k), g = gcdBigInt(n, d);
      return [n / g, d / g];
    }
    [hPrev2, hPrev1] = [hPrev1, h];
    [kPrev2, kPrev1] = [kPrev1, k];
    x = 1 / fraction;
  }
  // Exact decimal-token fallback for very large continued fractions.
  const text = target.toString();
  const match = /^(\d+)(?:\.(\d*))?(?:e([+-]?\d+))?$/i.exec(text);
  if (!match) throw new PrologError('representation_error(rational)');
  const fractionDigits = match[2] ?? '';
  const exponent = Number(match[3] ?? 0);
  let numerator = BigInt(match[1] + fractionDigits);
  let denominator = 10n ** BigInt(fractionDigits.length);
  if (exponent > 0) numerator *= 10n ** BigInt(exponent);
  else if (exponent < 0) denominator *= 10n ** BigInt(-exponent);
  numerator *= sign;
  const g = gcdBigInt(numerator, denominator);
  return [numerator / g, denominator / g];
}

function rationalParts(term, env) {
  const value = deref(term, env);
  if (value.type === VAR) throw new PrologError('instantiation_error');
  if (value.type === NUMBER) {
    if (/^-?\d+$/.test(value.name)) return [BigInt(value.name), 1n];
    return approximateRational(Number(value.name));
  }
  if (value.type === COMPOUND && value.name === 'rdiv' && value.arity === 2) {
    const numerator = deref(value.args[0], env), denominator = deref(value.args[1], env);
    if (numerator.type !== NUMBER || denominator.type !== NUMBER ||
        !/^-?\d+$/.test(numerator.name) || !/^-?\d+$/.test(denominator.name)) {
      throw new PrologError('type_error(rational)', copyResolved(value, env));
    }
    let n = BigInt(numerator.name), d = BigInt(denominator.name);
    if (d === 0n) throw new PrologError('evaluation_error(zero_divisor)');
    if (d < 0n) { n = -n; d = -d; }
    const g = gcdBigInt(n, d);
    return [n / g, d / g];
  }
  throw new PrologError('type_error(number)', copyResolved(value, env));
}

function* numberToRationalBuiltin({ goal, env }) {
  const [numerator, denominator] = rationalParts(goal.args[0], env);
  const rational = denominator === 1n
    ? numberTerm(numerator.toString())
    : compound('rdiv', [numberTerm(numerator.toString()), numberTerm(denominator.toString())]);
  const next = env.clone();
  if (unify(goal.args[1], rational, next)) yield next;
}

function* rationalPartsBuiltin({ goal, env }) {
  const [numerator, denominator] = rationalParts(goal.args[0], env);
  const next = env.clone();
  if (unify(goal.args[1], numberTerm(numerator.toString()), next) &&
      unify(goal.args[2], numberTerm(denominator.toString()), next)) yield next;
}

function* sleepBuiltin({ goal, env }) {
  const value = deref(goal.args[0], env);
  if (value.type === VAR) throw new PrologError('instantiation_error');
  if (value.type !== NUMBER) throw new PrologError('type_error(number)', copyResolved(value, env));
  const seconds = Number(value.name);
  if (!Number.isFinite(seconds)) throw new PrologError('type_error(number)', copyResolved(value, env));
  if (seconds < 0) throw new PrologError('domain_error(not_less_than_zero)', copyResolved(value, env));
  const milliseconds = Math.ceil(seconds * 1000);
  if (milliseconds > 0) {
    if (typeof SharedArrayBuffer === 'function' && typeof Atomics?.wait === 'function') {
      Atomics.wait(new Int32Array(new SharedArrayBuffer(4)), 0, 0, milliseconds);
    } else {
      const end = Date.now() + milliseconds;
      while (Date.now() < end) {} // Last-resort worker-compatible fallback.
    }
  }
  yield env;
}

function nodePath(term, env) {
  requireNode('filesystem');
  return characterListText(term, env);
}

function systemError(error, operation, culprit = null) {
  if (error?.code === 'ENOENT') return new PrologError(`existence_error(${operation})`, culprit);
  if (error?.code === 'EEXIST') return new PrologError(`permission_error(create, ${operation})`, culprit);
  if (error?.code === 'ENOTEMPTY') return new PrologError(`permission_error(delete, ${operation})`, culprit);
  if (error?.code === 'EACCES' || error?.code === 'EPERM') return new PrologError(`permission_error(access, ${operation})`, culprit);
  return new PrologError('resource_error(system_error)', culprit);
}

function* directoryFilesBuiltin({ goal, env }) {
  const directory = nodePath(goal.args[0], env);
  let entries;
  try { entries = ['.', '..', ...fs.readdirSync(directory)]; }
  catch (error) { throw systemError(error, 'directory', copyResolved(goal.args[0], env)); }
  const next = env.clone();
  if (unify(goal.args[1], listOfChars(entries), next)) yield next;
}

function* deleteFileBuiltin({ goal, env }) {
  const file = nodePath(goal.args[0], env);
  try { fs.unlinkSync(file); }
  catch (error) { throw systemError(error, 'file', copyResolved(goal.args[0], env)); }
  yield env;
}

function* renameFileBuiltin({ goal, env }) {
  const from = nodePath(goal.args[0], env), to = nodePath(goal.args[1], env);
  try { fs.renameSync(from, to); }
  catch (error) { throw systemError(error, 'file', copyResolved(goal.args[0], env)); }
  yield env;
}

function* makeDirectoryBuiltin({ goal, env }) {
  const directory = nodePath(goal.args[0], env);
  try { fs.mkdirSync(directory); }
  catch (error) { throw systemError(error, 'directory', copyResolved(goal.args[0], env)); }
  yield env;
}

function* makeDirectoryPathBuiltin({ goal, env }) {
  const directory = nodePath(goal.args[0], env);
  try { fs.mkdirSync(directory, { recursive: true }); }
  catch (error) { throw systemError(error, 'directory', copyResolved(goal.args[0], env)); }
  yield env;
}

function* workingDirectoryBuiltin({ goal, env }) {
  requireNode('filesystem');
  const old = process.cwd();
  const requested = deref(goal.args[1], env);
  const next = env.clone();
  if (!unify(goal.args[0], chars(old), next)) return;
  if (requested.type === VAR) {
    if (unify(goal.args[1], chars(old), next)) yield next;
    return;
  }
  const directory = characterListText(goal.args[1], env);
  try { process.chdir(directory); }
  catch (error) { throw systemError(error, 'directory', copyResolved(goal.args[1], env)); }
  yield next;
}

function environmentKey(term, env) {
  requireNode('operating_system');
  const key = characterListText(term, env);
  if (!key || key.includes('=') || key.includes('\0')) {
    throw new PrologError('domain_error(env_var)', copyResolved(term, env));
  }
  return key;
}

function* getenvBuiltin({ goal, env }) {
  const key = environmentKey(goal.args[0], env);
  const value = process.env[key];
  if (value == null) return;
  const next = env.clone();
  if (unify(goal.args[1], chars(value), next)) yield next;
}

function* setenvBuiltin({ goal, env }) {
  const key = environmentKey(goal.args[0], env);
  const value = characterListText(goal.args[1], env);
  if (value.includes('\0')) throw new PrologError('domain_error(env_var_value)', copyResolved(goal.args[1], env));
  process.env[key] = value;
  yield env;
}

function* unsetenvBuiltin({ goal, env }) {
  const key = environmentKey(goal.args[0], env);
  delete process.env[key];
  yield env;
}

function* shellBuiltin({ solver, goal, env }) {
  requireNode('process');
  if (spawnSync == null) throw new PrologError('resource_error(process)');
  const command = characterListText(goal.args[0], env);
  const result = spawnSync(command, { shell: true, encoding: 'utf8' });
  if (result.error) throw new PrologError('resource_error(process)');
  if (result.stdout) solver.io.writeUnit(solver.io.resolve(solver.io.currentOutput), result.stdout);
  if (result.stderr) solver.io.writeUnit(solver.io.resolve('user_error'), result.stderr);
  const status = Number.isInteger(result.status) ? result.status : 1;
  const next = env.clone();
  if (unify(goal.args[1], numberTerm(status), next)) yield next;
}

function* pidBuiltin({ goal, env }) {
  requireNode('operating_system');
  const next = env.clone();
  if (unify(goal.args[0], numberTerm(process.pid), next)) yield next;
}

function processArguments() {
  requireNode('operating_system');
  return process.argv.map(String);
}

function* rawArgvBuiltin({ goal, env }) {
  const next = env.clone();
  if (unify(goal.args[0], listOfChars(processArguments()), next)) yield next;
}

function* argvBuiltin({ goal, env }) {
  const raw = processArguments();
  const separator = raw.indexOf('--');
  const args = separator < 0 ? [] : raw.slice(separator + 1);
  const next = env.clone();
  if (unify(goal.args[0], listOfChars(args), next)) yield next;
}

export const libraryHostBuiltins = {
  register(registry) {
    registry.add('eyeprolog__read_from_chars', 2, readFromCharsBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__read_term_from_chars', 3, readTermFromCharsBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__write_term_to_chars', 3, writeTermToCharsBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__chars_base64', 3, charsBase64Builtin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__number_to_rational', 2, numberToRationalBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__rational_numerator_denominator', 3, rationalPartsBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__sleep', 1, sleepBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__directory_files', 2, directoryFilesBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__delete_file', 1, deleteFileBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__rename_file', 2, renameFileBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__make_directory', 1, makeDirectoryBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__make_directory_path', 1, makeDirectoryPathBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__working_directory', 2, workingDirectoryBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__getenv', 2, getenvBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__setenv', 2, setenvBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__unsetenv', 1, unsetenvBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__shell', 2, shellBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__pid', 1, pidBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__raw_argv', 1, rawArgvBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__argv', 1, argvBuiltin, { deterministic: true, eyePrologLibrary: true });
  },
};
