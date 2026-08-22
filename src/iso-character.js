// ISO/IEC 13211-1 processor-character-set choices used by --iso-strict.
//
// EyeProlog's strict Part 1 profile deliberately chooses a finite PCS so every
// accepted character has one documented lexical classification and one stable
// collating-sequence integer. Normal mode keeps the broader Unicode surface as
// an implementation-specific extension.

export class CharacterRepresentationError extends Error {
  constructor(formal = 'representation_error(character)') {
    super(`error(${formal})`);
    this.name = 'CharacterRepresentationError';
    this.formal = formal;
  }
}

// Strict PCS: the 128 ASCII characters U+0000..U+007F. Printable ASCII
// carries the Part 1 lexical classes; the remaining C0 controls plus DEL are
// implementation-defined extended layout characters. This lets every ISO
// octal/hexadecimal character escape in the ASCII range denote a PCS member.
// The collating-sequence integer is the Unicode/ASCII code point.
export function isStrictIsoPcsCodePoint(code) {
  return Number.isInteger(code) && code >= 0 && code <= 0x7f;
}

export function isStrictIsoPcsCharacter(character) {
  if (typeof character !== 'string' || Array.from(character).length !== 1) return false;
  return isStrictIsoPcsCodePoint(character.codePointAt(0));
}

export function strictIsoCollatingInteger(character) {
  return isStrictIsoPcsCharacter(character) ? character.codePointAt(0) : null;
}

export function assertStrictIsoPcsCharacter(character, formal = 'representation_error(character)') {
  if (!isStrictIsoPcsCharacter(character)) throw new CharacterRepresentationError(formal);
  return character;
}
