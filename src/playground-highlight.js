const escapeHtml = text => text.replace(/[&<>]/g, character =>
  ({ '&': '&amp;', '<': '&lt;', '>': '&gt;' })[character]);

function literal(text, start) {
  const first = text[start];
  if (first === '%') {
    const end = text.indexOf('\n', start);
    return { kind: 'comment', end: end < 0 ? text.length : end };
  }
  if (text.startsWith('/*', start)) {
    const end = text.indexOf('*/', start + 2);
    return { kind: 'comment', end: end < 0 ? text.length : end + 2 };
  }
  let end = start + 1;
  while (end < text.length) {
    if (text[end] === '\\') { end = Math.min(end + 2, text.length); continue; }
    if (text[end++] === first) {
      if (text[end] === first) { end++; continue; }
      break;
    }
  }
  return { kind: first === '"' ? 'string' : 'atom', end };
}

// Recover multiline comment and quote state before coloring the visible range.
export function highlight(text, { start = 0, end = text.length, arc = false } = {}) {
  const html = [];
  let cursor = start;
  const paint = (kind, from, to) => {
    const content = escapeHtml(text.slice(from, Math.min(to, end)));
    if (content) html.push(kind ? '<span class="syntax-' + kind + '">' + content + '</span>' : content);
  };
  const delimiters = /[%'"]|\/\*/g;
  let match;
  while ((match = delimiters.exec(text)) && match.index < start) {
    const part = literal(text, match.index);
    if (part.end > start) {
      paint(part.kind, start, part.end);
      cursor = part.end;
      break;
    }
    delimiters.lastIndex = part.end;
  }
  const tokens = /[%'"]|\/\*|\d+(?:\.\d+)?(?:[eE][+-]?\d+)?|[A-Za-z_][A-Za-z0-9_]*|=\\=|\\==|=\.\.|=:=|@=<|@>=|:-|\?-|\\\+|\\=|==|=<|>=|\/\/|\*\*|<<|>>|\/\\|\\\/|@<|@>|[()[\],.|:?+*/^=<>\\-]/g;
  tokens.lastIndex = cursor;
  while (cursor < end && (match = tokens.exec(text)) && match.index < end) {
    const from = match.index;
    paint(null, cursor, from);
    if (arc && /^[ \t]*$/.test(text.slice(text.lastIndexOf('\n', from - 1) + 1, from))) {
      const newline = text.indexOf('\n', from);
      const lineEnd = newline < 0 ? text.length : newline;
      const line = text.slice(from, lineEnd);
      if (/^(No |Add a query |There is no |Ask a query )/.test(line)) {
        paint('note', from, lineEnd);
        cursor = tokens.lastIndex = lineEnd;
        continue;
      }
      const label = /^(check passed:)/.exec(line);
      if (label) {
        paint('label', from, from + label[0].length);
        cursor = tokens.lastIndex = from + label[0].length;
        continue;
      }
    }
    const word = match[0];
    let kind;
    let to = tokens.lastIndex;
    if (word === '%' || word === '/*' || word === "'" || word === '"') {
      const part = literal(text, from);
      kind = part.kind;
      to = part.end;
      if (arc && /^% (Answer|Reason|Check)$/.test(text.slice(from, to))) kind = 'section';
    } else if (/^\d/.test(word)) kind = 'number';
    else if (/^[A-Z_]/.test(word)) kind = 'variable';
    else if (/^[a-z]/.test(word)) {
      kind = ['is', 'div', 'rem', 'mod', 'xor'].includes(word) ? 'operator'
        : /^\s*\(/.test(text.slice(to)) ? 'predicate' : 'atom';
    } else kind = /^[()[\],.|:]$/.test(word) ? 'punctuation' : 'operator';
    paint(kind, from, to);
    cursor = tokens.lastIndex = to;
  }
  if (cursor < end) paint(null, cursor, end);
  return html.join('');
}
