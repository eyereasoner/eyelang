// Lightweight lexical helpers shared by the interactive and ISO stream
// readers. These locate token boundaries only; parser.js remains responsible
// for accepting or rejecting the token itself.

const graphicTokenCharacters = new Set('#$&*+-./<=>?@^~\\:');

export function continuesGraphicToken(source, index) {
  return index > 0 && graphicTokenCharacters.has(source[index - 1]);
}

export function isTerminatingFullStop(source, index) {
  if (source[index] !== '.') return false;
  const next = source[index + 1] ?? '';
  // At a line boundary, after a single-line comment marker, or at end of
  // input, the dot is the read-term end char. Before horizontal layout it is
  // instead part of an already-started graphic token: `./*. .` is the atom
  // `./*.` followed by its separate end char. A directly following /* also
  // stays in the current graphic token; bracketed comments are recognized
  // only when /* begins a token.
  if (next === '' || next === '%' || next === '\n' || next === '\r') return true;
  if (/^[\u0009\u000b\u000c\u0020]$/.test(next)) return !continuesGraphicToken(source, index);
  return false;
}

export function quotedEscapeEnd(source, index) {
  const escaped = source[index + 1] ?? '';
  if (!escaped) return index;

  if (escaped === '\n') return index + 1;
  if (escaped === '\r' && source[index + 2] === '\n') return index + 2;

  if (escaped === 'x') {
    let cursor = index + 2;
    while (/^[0-9A-Fa-f]$/.test(source[cursor] ?? '')) cursor++;
    return source[cursor] === '\\' ? cursor : Math.max(index + 1, cursor - 1);
  }
  if (/^[0-9]$/.test(escaped)) {
    let cursor = index + 1;
    // Include 8 and 9 while finding the boundary. The parser rejects them as
    // non-octal rather than letting the reader split the malformed token.
    while (/^[0-9]$/.test(source[cursor] ?? '')) cursor++;
    return source[cursor] === '\\' ? cursor : Math.max(index + 1, cursor - 1);
  }

  return index + 1;
}

export function characterCodeConstantEnd(source, apostropheIndex) {
  if (source[apostropheIndex] !== "'" || source[apostropheIndex - 1] !== '0') return null;
  // The 0 must begin a numeric token. In particular, do not reinterpret the
  // apostrophe in an identifier such as a0'x as character-code notation.
  if (/[A-Za-z0-9_]/.test(source[apostropheIndex - 2] ?? '')) return null;

  const characterIndex = apostropheIndex + 1;
  const character = source[characterIndex] ?? '';
  if (!character) return apostropheIndex;
  // `0''` is two tokens (0 and the empty atom), and `0'\\\n...'
  // likewise starts a quoted atom containing a continuation. Only `0'''`
  // denotes the character-code constant for an apostrophe.
  if (character === "'" && source[characterIndex + 1] !== "'") return null;
  if (character === '\\' && ['\n', '\r'].includes(source[characterIndex + 1])) return null;
  if (character === '\\') return quotedEscapeEnd(source, characterIndex);

  // An apostrophe character is doubled in 0''' exactly as it is in a quoted
  // atom. Consume both so neither one opens a quoted-token scan state.
  if (character === "'" && source[characterIndex + 1] === "'") return characterIndex + 1;

  const firstCode = character.charCodeAt(0);
  if (firstCode >= 0xd800 && firstCode <= 0xdbff) {
    const secondCode = source.charCodeAt(characterIndex + 1);
    if (secondCode >= 0xdc00 && secondCode <= 0xdfff) return characterIndex + 1;
  }
  return characterIndex;
}
