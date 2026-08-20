// ISO term-output formatting kept separate from the stable source renderer.
import {
  ATOM, COMPOUND, NUMBER, STRING, VAR,
  Env, deref, isCons, isEmptyList,
} from './term.js';

const graphicAtomCharacters = new Set('!#$&*+-./<=>?@^~\\'.split(''));
const dottedGraphicAtomCharacters = graphicAtomCharacters;
const compactInfixOperators = new Set([':', '..']);

function quotedControlEscape(ch) {
  if (ch === '\x00') return '\\0\\';
  if (ch === '\x07') return '\\a';
  if (ch === '\b') return '\\b';
  if (ch === '\r') return '\\r';
  if (ch === '\f') return '\\f';
  if (ch === '\t') return '\\t';
  if (ch === '\n') return '\\n';
  if (ch === '\v') return '\\v';
  const code = ch.codePointAt(0);
  // Other C0 controls and DEL have no ISO symbolic-control escape. Emit an
  // octal escape so quoted output remains valid read-back syntax instead of
  // leaking a raw control character into the output stream.
  if (code < 0x20 || code === 0x7f) return `\\${code.toString(8)}\\`;
  return null;
}

function atomNeedsQuotes(name) {
  if (!name) return true;
  if (name === '[]' || name === '{}') return false;
  // A lone full stop is the end token, not a graphic atom.  Longer
  // graphic tokens may contain dots and are valid unquoted writeq/1 output
  // (WG17 #371-373: ./*, .*, ...*).  Only a token beginning with /* would
  // be read as a bracketed comment and therefore still requires quoting.
  if (name === '.') return true;
  if (name.startsWith('/*')) return true;
  if (/^[a-z][A-Za-z0-9_]*$/.test(name)) return false;
  for (const ch of name) if (!graphicAtomCharacters.has(ch)) return true;
  return false;
}

function quoteAtom(name) {
  let out = "'";
  for (const ch of name) {
    if (ch === "'") out += "''";
    else if (ch === '\\') out += '\\\\';
    else out += quotedControlEscape(ch) ?? ch;
  }
  return out + "'";
}

function writeAtom(name) {
  return atomNeedsQuotes(name) ? quoteAtom(name) : name;
}

function isDottedGraphicAtom(name) {
  return name.includes('.') && [...name].some((ch) => ch !== '.') && !name.startsWith('/*') &&
    [...name].every((ch) => dottedGraphicAtomCharacters.has(ch));
}

function legacyVariableToIso(name) {
  if (name === '?') return '_';
  const tail = name.slice(1);
  if (!tail) return '_';
  if (tail[0] === '_') return tail;
  return tail[0].toUpperCase() + tail.slice(1);
}

function writeVariable(name) {
  name = String(name ?? '');
  if (/^\?(?:[A-Za-z_][A-Za-z0-9_]*)?$/.test(name)) return legacyVariableToIso(name);
  if (/^(?:_|[A-Z_][A-Za-z0-9_]*)$/.test(name)) return name;
  const sanitized = name.replace(/[^A-Za-z0-9_]/g, '_');
  if (!sanitized) return '_';
  return /^[A-Z_]/.test(sanitized) ? sanitized : `_${sanitized}`;
}

function writeString(value) {
  let out = '"';
  for (const ch of value) {
    if (ch === '"' || ch === '\\') out += `\\${ch}`;
    else out += quotedControlEscape(ch) ?? ch;
  }
  return out + '"';
}

function quotedListText(term, env, doubleQuotes) {
  if (doubleQuotes !== 'chars' && doubleQuotes !== 'codes') return null;
  const characters = [];
  let cursor = term;
  while (true) {
    cursor = deref(cursor, env);
    if (isEmptyList(cursor)) return characters.length === 0 ? null : characters.join('');
    if (!isCons(cursor)) return null;
    const item = deref(cursor.args[0], env);
    if (doubleQuotes === 'chars') {
      if (item.type !== ATOM || Array.from(item.name).length !== 1) return null;
      characters.push(item.name);
    } else {
      if (item.type !== NUMBER || !/^\d+$/.test(item.name)) return null;
      const code = BigInt(item.name);
      if (code < 0n || code > 0x10ffffn || (code >= 0xd800n && code <= 0xdfffn)) return null;
      characters.push(String.fromCodePoint(Number(code)));
    }
    cursor = cursor.args[1];
  }
}

function writeNumberedVariable(index) {
  if (!Number.isSafeInteger(index) || index < 0) return null;
  const letter = String.fromCharCode(65 + (index % 26));
  const suffix = Math.floor(index / 26);
  return suffix === 0 ? letter : `${letter}${suffix}`;
}

function operatorName(name) {
  if (name === '.' || name.startsWith('/*')) return quoteAtom(name);
  if (/^[a-z][A-Za-z0-9_]*$/.test(name)) return name;
  if (/^[!#$&*+\-./<=>?@^~\\;:]+$/.test(name)) return name;
  return quoteAtom(name);
}

function operatorTable(definitions) {
  const table = new Map();
  for (const definition of definitions ?? []) {
    if (!definition || definition.priority === 0) continue;
    const entries = table.get(definition.name) ?? [];
    entries.push(definition);
    table.set(definition.name, entries);
  }
  return table;
}

function chooseOperator(term, table) {
  const definitions = table.get(term.name) ?? [];
  if (term.arity === 1) {
    return definitions.find((definition) => definition.specifier === 'fx' || definition.specifier === 'fy') ??
      definitions.find((definition) => definition.specifier === 'xf' || definition.specifier === 'yf') ?? null;
  }
  if (term.arity === 2) {
    return definitions.find((definition) => ['xfx', 'xfy', 'yfx'].includes(definition.specifier)) ?? null;
  }
  return null;
}

function printableReadVariableNames(term, env, explicit) {
  const names = new Map(explicit);
  const used = new Set(names.values());
  const suffixes = new Map();
  const seenVariables = new Set();
  const seenTerms = new Set();
  const stack = [term];

  while (stack.length) {
    const current = deref(stack.pop(), env);
    if (current.type === VAR) {
      if (seenVariables.has(current.name)) continue;
      seenVariables.add(current.name);
      if (names.has(current.name) || current.displayName == null) continue;
      const base = writeVariable(current.displayName);
      let candidate = base;
      let suffix = suffixes.get(base) ?? 1;
      while (used.has(candidate)) candidate = `${base}_${suffix++}`;
      suffixes.set(base, suffix);
      names.set(current.name, candidate);
      used.add(candidate);
      continue;
    }
    if (current.type !== COMPOUND || seenTerms.has(current)) continue;
    seenTerms.add(current);
    for (let i = current.arity - 1; i >= 0; i--) stack.push(current.args[i]);
  }

  return names;
}

function generatedVariableName(index) {
  const letter = String.fromCharCode(65 + (index % 26));
  const suffix = Math.floor(index / 26);
  return suffix === 0 ? `_${letter}` : `_${letter}${suffix}`;
}

function printableGeneratedVariableNames(term, env, explicit) {
  const names = new Map(explicit);
  const used = new Set(names.values());
  const seenVariables = new Set();
  const seenTerms = new Set();
  const stack = [term];
  let generated = 0;

  while (stack.length) {
    const current = deref(stack.pop(), env);
    if (current.type === VAR) {
      if (seenVariables.has(current.name)) continue;
      seenVariables.add(current.name);
      if (names.has(current.name)) continue;
      let candidate;
      do candidate = generatedVariableName(generated++); while (used.has(candidate));
      names.set(current.name, candidate);
      used.add(candidate);
      continue;
    }
    if (current.type !== COMPOUND || seenTerms.has(current)) continue;
    seenTerms.add(current);
    for (let i = current.arity - 1; i >= 0; i--) stack.push(current.args[i]);
  }

  return names;
}

function format(term, env, options, table, maxPriority = 1200, context = 'term') {
  const resolved = deref(term, env);
  if (resolved.type === VAR) {
    return options.variableNames.get(resolved.name) ?? writeVariable(resolved.displayName ?? resolved.name);
  }
  if (resolved.type === STRING) return writeString(resolved.name);
  if (resolved.type === ATOM) {
    if (!options.quoted) return resolved.name;
    // Top-level bindings are already delimited by their answer punctuation.
    // Keep valid dotted graphic tokens readable there without weakening the
    // ISO writeq/1 policy tested by WG17 #308.
    if (options.dottedGraphicAtoms && isDottedGraphicAtom(resolved.name)) return resolved.name;
    // ISO 6.3.3.1 gives functional arguments and list elements a special
    // `arg` production: an atom that is a current operator is valid there
    // without quoting. Keep lexical exceptions such as `|` quoted.
    if (options.operatorAtomsAsArgs && context === 'argument' && table.has(resolved.name)) return operatorName(resolved.name);
    if (!options.ignoreOps && context !== 'argument' && table.has(resolved.name)) {
      // The predefined ?- atom is safe at the end of a written term and is a
      // graphic atom in ISO syntax. Do not add the legacy parentheses that
      // issue #35 reports for writeq(?-).
      if (resolved.name === '?-') return operatorName(resolved.name);
      const definitions = table.get(resolved.name);
      const requiresParentheses = definitions.some(({ specifier }) =>
        ['fx', 'fy', 'xfx', 'xfy', 'yfx'].includes(specifier));
      if (requiresParentheses) return `(${operatorName(resolved.name)})`;
    }
    return writeAtom(resolved.name);
  }
  if (resolved.type === NUMBER) return resolved.name;

  if (options.numbervars && resolved.type === COMPOUND && resolved.name === '$VAR' && resolved.arity === 1) {
    const index = deref(resolved.args[0], env);
    if (index.type === NUMBER && /^\d+$/.test(index.name)) {
      const name = writeNumberedVariable(Number(index.name));
      if (name != null) return name;
    }
  }

  if (!options.ignoreOps && isCons(resolved)) {
    const quotedText = quotedListText(resolved, env, options.doubleQuotes);
    if (quotedText != null) return writeString(quotedText);
    const parts = [];
    let cursor = resolved;
    while (true) {
      cursor = deref(cursor, env);
      const separator = options.compact ? ',' : ', ';
      if (isEmptyList(cursor)) return `[${parts.join(separator)}]`;
      if (!isCons(cursor)) {
        const tailSeparator = options.compact ? '|' : ' | ';
        return `[${parts.join(separator)}${tailSeparator}${format(cursor, env, options, table, 999, 'argument')}]`;
      }
      parts.push(format(cursor.args[0], env, options, table, 999, 'argument'));
      cursor = cursor.args[1];
    }
  }

  if (!options.ignoreOps && resolved.name === '{}' && resolved.arity === 1) {
    // A current operator atom is valid as the complete curly-bracket content,
    // just as it is in a functional argument or list element.
    return `{${format(resolved.args[0], env, options, table, 1200, 'argument')}}`;
  }

  if (!options.ignoreOps) {
    const definition = chooseOperator(resolved, table);
    if (definition) {
      const { priority, specifier } = definition;
      const token = operatorName(resolved.name);
      let text;
      if (specifier === 'fx' || specifier === 'fy') {
        const argumentPriority = specifier === 'fx' ? priority - 1 : priority;
        text = `${token} ${format(resolved.args[0], env, options, table, argumentPriority)}`;
      } else if (specifier === 'xf' || specifier === 'yf') {
        let argumentPriority = specifier === 'xf' ? priority - 1 : priority;
        const childDefinition = chooseOperator(deref(resolved.args[0], env), table);
        if (childDefinition?.priority === priority &&
            ['fx', 'fy', 'xfx', 'xfy', 'yfx'].includes(childDefinition.specifier)) {
          argumentPriority = priority - 1;
        }
        text = `${format(resolved.args[0], env, options, table, argumentPriority)} ${token}`;
      } else {
        let leftPriority = specifier === 'yfx' ? priority : priority - 1;
        const rightPriority = specifier === 'xfy' ? priority : priority - 1;
        const leftDefinition = chooseOperator(deref(resolved.args[0], env), table);
        if (leftDefinition?.priority === priority && ['fx', 'fy'].includes(leftDefinition.specifier)) {
          leftPriority = priority - 1;
        }
        const left = format(resolved.args[0], env, options, table, leftPriority);
        const right = format(resolved.args[1], env, options, table, rightPriority);
        text = resolved.name === ',' ? `${left}, ${right}`
          : compactInfixOperators.has(resolved.name) ? `${left}${token}${right}`
            : `${left} ${token} ${right}`;
      }
      return priority > maxPriority ? `(${text})` : text;
    }
  }

  const name = options.quoted ? writeAtom(resolved.name) : resolved.name;
  const args = resolved.args.map((arg) => format(arg, env, options, table, 999, 'argument'));
  return `${name}(${args.join(options.compact ? ',' : ', ')})`;
}

export function formatTermForWrite(term, env = new Env(), options = {}) {
  const explicitVariableNames = options.variableNames instanceof Map ? options.variableNames : new Map();
  const normalized = {
    quoted: options.quoted === true,
    ignoreOps: options.ignoreOps === true,
    numbervars: options.numbervars !== false,
    doubleQuotes: options.doubleQuotes,
    variableNames: options.generateVariableNames === true
      ? printableGeneratedVariableNames(term, env, explicitVariableNames)
      : printableReadVariableNames(term, env, explicitVariableNames),
    compact: options.compact === true,
    operatorAtomsAsArgs: options.operatorAtomsAsArgs === true,
    dottedGraphicAtoms: options.dottedGraphicAtoms === true,
  };
  const maxPriority = Number.isInteger(options.maxPriority)
    ? Math.max(0, Math.min(1200, options.maxPriority))
    : 1200;
  return format(term, env, normalized, operatorTable(options.operators), maxPriority);
}
