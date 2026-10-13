// Sentences describe binary relations between values.
// Every new fact keeps its first reason, including any arithmetic it used.
const word = /^[\p{L}][\p{L}\p{N}_-]*$/u;
const integer = /^-?\d+$/;
const numeric = /^-?\d+(?:\.\d+)?(?:e[+-]?\d+)?$/;
const namedVariable = /^\?[\p{L}][\p{L}\p{N}_-]*$/u;
const questionWords = new Set(['who', 'what']);
const reserved = new Set(['if', 'then', 'and', 'is', 'a', 'an', 'why', 'does', 'plus', 'minus', 'not']);

function real(value) {
  const result = Number(value);
  if (!Number.isFinite(result)) throw new Error('This calculation needs a finite real number; check its inputs.');
  return result;
}

const finite = value => String(real(value));

// Separators only act outside quoted text, lists, and parentheses.
function splitOutside(text, separator) {
  const pieces = [];
  let start = 0;
  let depth = 0;
  let quoted = false;
  for (let i = 0; i < text.length; i++) {
    if (quoted) {
      if (text[i] === '\\') i++;
      else if (text[i] === '"') quoted = false;
      continue;
    }
    if (text[i] === '"') { quoted = true; continue; }
    if (depth === 0 && text.startsWith(separator, i)) {
      pieces.push(text.slice(start, i));
      i += separator.length - 1;
      start = i + 1;
      continue;
    }
    if ('[('.includes(text[i])) depth++;
    if ('])'.includes(text[i])) depth--;
  }
  pieces.push(text.slice(start));
  return pieces;
}

function normalize(text) {
  return text.trim().replace(/"(?:\\.|[^"\\])*"|[^"]+/g,
    piece => piece.startsWith('"') ? piece : piece.toLowerCase().replace(/\s+/g, ' '));
}

function simpleTerm(text, mode) {
  if (integer.test(text)) return BigInt(text).toString();
  if (numeric.test(text)) return finite(Number(text));
  if (namedVariable.test(text)) {
    if (mode !== 'rule' && mode !== 'question') throw new Error(`Use ${text} in a rule or a question; facts give values directly.`);
    return { variable: text };
  }
  if (!word.test(text) || reserved.has(text)) {
    throw new Error(`Use one word for a name or kind, such as milo or animal; I found "${text}".`);
  }
  if (questionWords.has(text)) {
    if (mode !== 'question') throw new Error('Use who and what in a question ending with ?');
    return { variable: text };
  }
  return text;
}

const unaryMath = new Map([
  ['square root', Math.sqrt], ['absolute value', Math.abs],
  ['natural log', Math.log], ['exponential', Math.exp],
  ['sine', Math.sin], ['cosine', Math.cos],
  ['arc sine', Math.asin], ['arc cosine', Math.acos],
]);
const unaryPrefixes = [...unaryMath.keys()].map(operation => ({ operation, words: `${operation} of`.split(' ') }));
const binaryOperators = [
  { words: ['plus'], precedence: 1 }, { words: ['minus'], precedence: 1 },
  { words: ['times'], precedence: 2 }, { words: ['divided', 'by'], precedence: 2 },
  { words: ['to', 'the', 'power', 'of'], precedence: 3, rightAssociative: true },
];

function term(text, mode) {
  if (!/[ ()\[\]|,"]/.test(text)) return simpleTerm(text, mode);
  const tokens = text.match(/"(?:\\.|[^"\\])*"|[()[\]|,"]|[^\s()[\]|,"]+/g) ?? [];
  let position = 0;
  const starts = words => words.every((word, index) => tokens[position + index] === word);
  function atom() {
    if (tokens[position] === '[') {
      position++;
      const items = [];
      if (tokens[position] === ']') {
        position++;
        return { list: items };
      }
      while (position < tokens.length) {
        items.push(expression(0));
        if (tokens[position] === ']') {
          position++;
          return { list: items };
        }
        if (tokens[position] === '|') {
          position++;
          const tail = expression(0);
          if (!tail.variable && !tail.list) throw new Error('The part after | must be a list or a placeholder for a list.');
          if (tokens[position++] !== ']') throw new Error('Close a list with ].');
          return list(items, tail);
        }
        if (tokens[position++] !== ',') throw new Error('Separate list items with commas and close the list with ].');
      }
      throw new Error('Close a list with ].');
    }
    if (tokens[position] === '(') {
      position++;
      const value = expression(0);
      if (tokens[position++] !== ')') throw new Error('Close a calculation with ).');
      return value;
    }
    for (const { operation, words } of unaryPrefixes) {
      if (!starts(words)) continue;
      position += words.length;
      return { operation, left: expression(4) };
    }
    if (starts(['angle', 'of'])) {
      position += 2;
      const left = expression(0);
      if (tokens[position++] !== 'with') throw new Error('Write an angle as "angle of real with imaginary".');
      return { operation: 'angle', left, right: expression(4) };
    }
    const token = tokens[position++];
    if (!token || [')', ']', '|', ','].includes(token)) throw new Error('Give each calculation or list its values.');
    if (token.startsWith('"')) return { text: JSON.parse(token) };
    return simpleTerm(token, mode);
  }
  function expression(minimum) {
    let left = atom();
    while (position < tokens.length) {
      const operator = binaryOperators.find(candidate => starts(candidate.words));
      if (!operator || operator.precedence < minimum) break;
      position += operator.words.length;
      const right = expression(operator.precedence + (operator.rightAssociative ? 0 : 1));
      left = { operation: operator.words.join(' '), left, right };
    }
    return left;
  }
  const value = expression(0);
  if (position !== tokens.length) throw new Error(`I couldn't read the calculation "${text}".`);
  return value;
}

function list(items, tail) {
  if (tail?.list) return list([...items, ...tail.list], tail.tail);
  if (tail !== undefined && !tail.variable) throw new Error('The part after | must be another list.');
  return tail === undefined ? { list: items } : { list: items, tail };
}

function sentenceWords(text) {
  return splitOutside(text, ' ');
}

function sentence(text, mode) {
  const sides = text.startsWith('the ') ? splitOutside(text, ' is ') : [];
  const property = sides.length === 2 ? /^the (\S+) of (.+)$/.exec(sides[0]) : null;
  if (property && word.test(property[1]) && !reserved.has(property[1]) &&
      !questionWords.has(property[1])) {
    return { relation: `property:${property[1]}`, terms: [term(property[2], mode), term(sides[1], mode)] };
  }
  const parts = sentenceWords(text);
  if (parts.length === 4 && parts[1] === 'is' && ['a', 'an'].includes(parts[2])) {
    const kind = term(parts[3], mode);
    if (kind.list || kind.text !== undefined) throw new Error('Use one word for a kind, such as animal.');
    return { relation: 'is a', terms: [term(parts[0], mode), kind] };
  }
  if (parts.length === 3 && word.test(parts[1]) && !reserved.has(parts[1]) &&
      !questionWords.has(parts[1])) {
    return { relation: parts[1], terms: [term(parts[0], mode), term(parts[2], mode)] };
  }
  throw new Error(`I couldn't read "${text}". Try "milo is a cat" or "milo likes luna".`);
}

function variables(goal) {
  return goal.terms.flatMap(termVariables);
}

function termVariables(value) {
  if (value === undefined) return [];
  if (typeof value === 'string') return [];
  if (value.text !== undefined) return [];
  if (value.variable) return [value.variable];
  if (value.list) return [...value.list.flatMap(termVariables), ...termVariables(value.tail)];
  return [...termVariables(value.left), ...termVariables(value.right)];
}

function arithmeticVariables(goal) {
  function inputs(value) {
    if (value === undefined) return [];
    if (value.operation) return termVariables(value);
    return value.list ? [...value.list.flatMap(inputs), ...inputs(value.tail)] : [];
  }
  return goal.terms.flatMap(inputs);
}

function hasCalculation(value) {
  return Boolean(value.operation || value.list?.some(hasCalculation) || (value.tail && hasCalculation(value.tail)));
}

function calculate(value, bindings, calculations = null) {
  if (typeof value === 'string') return value;
  if (value.text !== undefined) return value;
  if (value.variable) {
    const resolved = dereference(value, bindings);
    return resolved.variable ? undefined : calculate(resolved, bindings, calculations);
  }
  if (value.list) return list(value.list.map(t => calculate(t, bindings, calculations)),
    value.tail === undefined ? undefined : calculate(value.tail, bindings, calculations));
  const left = calculate(value.left, bindings, calculations);
  if (left === undefined) throw new Error('Find a number before using it in a calculation.');
  if (!numeric.test(left)) throw new Error(`I can only use numbers with ${value.operation}; I found ${sayTerm(left)}.`);
  if (unaryMath.has(value.operation)) {
    const result = finite(unaryMath.get(value.operation)(real(left)));
    calculations?.push(`${value.operation} of ${left} makes ${result}.`);
    return result;
  }
  const right = calculate(value.right, bindings, calculations);
  if (right === undefined) {
    throw new Error('Find a number before using it in a calculation.');
  }
  if (!numeric.test(right)) {
    throw new Error(`I can only use numbers with ${value.operation}; I found ${sayTerm(right)}.`);
  }
  const exact = integer.test(left) && integer.test(right);
  const a = exact ? BigInt(left) : real(left);
  const b = exact ? BigInt(right) : real(right);
  let answer;
  switch (value.operation) {
    case 'plus': answer = a + b; break;
    case 'minus': answer = a - b; break;
    case 'times': answer = a * b; break;
    case 'divided by':
      if (b === 0n || b === 0) throw new Error('I cannot divide by zero.');
      answer = exact && a % b === 0n ? a / b : real(a) / real(b);
      break;
    case 'to the power of':
      answer = exact && b >= 0n ? a ** b : real(a) ** real(b);
      break;
    case 'angle': {
      const angle = Math.atan2(real(b), real(a));
      const turn = 2 * Math.PI;
      answer = angle < 0 ? (angle + turn) % turn : angle;
      break;
    }
    default: throw new Error(`Unknown calculation: ${value.operation}.`);
  }
  const result = typeof answer === 'bigint' ? answer.toString() : finite(answer);
  calculations?.push(value.operation === 'angle'
    ? `angle of ${left} with ${right} makes ${result}.`
    : `${left} ${value.operation} ${right} makes ${result}.`);
  return result;
}

function thirdPerson(verb) {
  if (verb === 'have') return 'has';
  if (/[^aeiou]y$/.test(verb)) return `${verb.slice(0, -1)}ies`;
  return verb + (/(s|sh|ch|x|z|o)$/.test(verb) ? 'es' : 's');
}

function plural(noun) {
  const irregular = { person: 'people', child: 'children', mouse: 'mice', sheep: 'sheep', fish: 'fish' };
  return irregular[noun] ?? thirdPerson(noun);
}

function clue(text) {
  if (text.startsWith('not ')) return { ...clue(text.slice(4)), negated: true };
  for (const operator of ['less than', 'at most', 'greater than', 'at least', 'equal to', 'contains']) {
    const separator = operator === 'contains' ? ' contains the text ' : ` is ${operator} `;
    if (!text.includes(separator)) continue;
    const sides = splitOutside(text, separator);
    if (sides.length === 2) return { relation: `compare:${operator}`, terms: sides.map(side => term(side, 'rule')) };
  }
  const parts = sentenceWords(text);
  const kind = parts.length === 5 && parts[1] === 'is' && parts[2] === 'not' && ['a', 'an'].includes(parts[3]);
  const action = parts.length === 5 && parts[1] === 'does' && parts[2] === 'not';
  if (kind) return { ...sentence(`${parts[0]} is ${parts[3]} ${parts[4]}`, 'rule'), negated: true };
  if (action) return { ...sentence(`${parts[0]} ${thirdPerson(parts[3])} ${parts[4]}`, 'rule'), negated: true };
  return sentence(text, 'rule');
}

function question(text) {
  if (text === 'why') return { why: true, previous: true };
  const why = text.startsWith('why ');
  if (why) text = text.slice(4);
  const count = /^how many (\S+) are there$/.exec(text);
  const aggregate = /^what is the (total|smallest|largest) of all (\S+)$/.exec(text);
  if (count) return { aggregate: { operation: 'count', label: count[1] }, why };
  if (aggregate) return { aggregate: { operation: aggregate[1], label: aggregate[2] }, why };
  // Questions put "is" first, while ordinary sentences put the name first.
  const parts = sentenceWords(text);
  const is = parts.length === 4 && parts[0] === 'is' && ['a', 'an'].includes(parts[2]);
  const does = parts.length === 4 && parts[0] === 'does';
  const object = parts.length === 4 && (questionWords.has(parts[0]) || namedVariable.test(parts[0])) && parts[1] === 'does';
  const property = /^what is the (\S+) of (.+)$/.exec(text);
  const equality = splitOutside(text, ' equal to ');
  const propertyTest = equality.length === 2 ? /^is the (\S+) of (.+)$/.exec(equality[0]) : null;
  if (propertyTest) propertyTest.push(equality[1]);
  const notKind = parts.length === 5 && parts[0] === 'is' && parts[2] === 'not' && ['a', 'an'].includes(parts[3]);
  const notAction = parts.length === 5 && parts[0] === 'does' && parts[2] === 'not';
  const negated = Boolean(notKind || notAction);
  if (notKind) text = `${parts[1]} is ${parts[3]} ${parts[4]}`;
  else if (notAction) text = `${parts[1]} ${thirdPerson(parts[3])} ${parts[4]}`;
  else if (property) text = `the ${property[1]} of ${property[2]} is what`;
  else if (propertyTest) text = `the ${propertyTest[1]} of ${propertyTest[2]} is ${propertyTest[3]}`;
  else if (is) text = `${parts[1]} is ${parts[2]} ${parts[3]}`;
  else if (does) text = `${parts[1]} ${thirdPerson(parts[2])} ${parts[3]}`;
  else if (object) text = `${parts[2]} ${thirdPerson(parts[3])} ${parts[0]}`;
  const goal = sentence(text, 'question');
  if (!(notKind || notAction || property || propertyTest || is || does || object) && !variables(goal).length) {
    throw new Error('Start a question with who, what, is, does, or why is.');
  }
  if (arithmeticVariables(goal).length) throw new Error('Use known numbers in a question with a calculation.');
  if (negated && variables(goal).length) throw new Error('Name the things in a not question; use an earlier rule clue to choose them otherwise.');
  if (why && variables(goal).length) {
    throw new Error('For a why question, name the things you mean, such as "why is milo an animal?".');
  }
  return { goal: negated ? { ...goal, negated: true } : goal, why };
}

function check(text) {
  const count = /^there (are|is) (\d+) (\S+)$/.exec(text);
  const aggregate = /^the (total|smallest|largest) of all (\S+) is (-?\d+)$/.exec(text);
  if (count) return { aggregate: { operation: 'count', label: count[1] === 'is' ? plural(count[3]) : count[3] }, expected: BigInt(count[2]).toString() };
  if (aggregate) return { aggregate: { operation: aggregate[1], label: aggregate[2] }, expected: BigInt(aggregate[3]).toString() };
  const goal = clue(text);
  if (variables(goal).length) throw new Error('Name the things in a check; a check cannot introduce variables.');
  return { goal };
}

export function parse(source) {
  const program = { facts: [], rules: [], questions: [], checks: [] };
  // Comments occupy their original lines so errors still point to the program.
  const text = source.replace(/"(?:\\.|[^"\\])*"|#[^\n]*/g, piece => piece.startsWith('#') ? '' : piece);
  let start = 0;
  let quoted = false;
  function problem(message, offset) {
    const line = text.slice(0, offset).split('\n').length;
    return new Error(`Line ${line}: ${message}`);
  }
  for (let i = 0; i < text.length; i++) {
    if (text[i] === '"') { quoted = !quoted; continue; }
    if (quoted) { if (text[i] === '\\') i++; continue; }
    const punctuation = text[i];
    if (punctuation !== '.' && punctuation !== '?') continue;
    // A question mark starts a variable only at a token boundary before a letter.
    if (punctuation === '?' && (i === 0 || /[\s(\[|,.?]/u.test(text[i - 1])) &&
        /^\?\p{L}/u.test(text.slice(i))) continue;
    if (punctuation === '.' && /\d/.test(text[i - 1] ?? '') && /\d/.test(text[i + 1] ?? '')) continue;
    const raw = text.slice(start, i);
    const offset = start + raw.search(/\S/);
    const body = normalize(raw);
    start = i + 1;
    try {
      if (!body) throw new Error('Put a sentence before the punctuation.');
      if (body.startsWith('check that ')) {
        if (punctuation !== '.') throw new Error('Finish a check with .');
        const assertion = body.slice(11);
        program.checks.push({ ...check(assertion), text: assertion, line: text.slice(0, offset).split('\n').length });
      } else if (punctuation === '?') program.questions.push(question(body));
      else if (body.startsWith('if ') || splitOutside(body, ' if ').length > 1) {
        const backward = !body.startsWith('if ');
        const sides = splitOutside(backward ? body : body.slice(3), backward ? ' if ' : ' then ');
        if (sides.length !== 2) throw new Error('Use if clues then answer, or answer if clues.');
        const premises = splitOutside(sides[backward ? 1 : 0], ' and ').map(clue);
        const conclusion = sentence(sides[backward ? 0 : 1], 'rule');
        // A backward call can supply variables in ordinary head positions.
        // Variables inside a calculation must still come from the clues.
        const inputs = value => typeof value === 'string' || value.text !== undefined || value.operation ? []
          : value.variable ? [value.variable] : [...value.list.flatMap(inputs), ...(value.tail ? inputs(value.tail) : [])];
        const bound = new Set(backward ? conclusion.terms.flatMap(inputs) : []);
        for (const premise of premises) {
          for (const name of arithmeticVariables(premise)) {
            if (!bound.has(name)) throw new Error(`Find ${name} in an earlier clue before using it in a calculation.`);
          }
          for (const name of variables(premise)) {
            if (premise.relation.startsWith('compare:') && !bound.has(name)) throw new Error(`Find ${name} in an earlier clue before comparing values.`);
            if (premise.negated && !bound.has(name)) throw new Error(`Find ${name} in an earlier positive clue before using not.`);
            if (!premise.negated && !premise.relation.startsWith('compare:')) bound.add(name);
          }
        }
        for (const name of variables(conclusion)) {
          if (!bound.has(name)) throw new Error(backward
            ? `Find ${name} in a clue before using it in the answer.`
            : `Use ${name} after if before using it after then.`);
        }
        program.rules.push({ premises, conclusion, text: `${body}.`, ...(backward ? { backward: true } : {}) });
      } else {
        const range = /^every number from (-?\d+) to (-?\d+) is (a|an) (\S+)$/.exec(body);
        if (range) {
          const first = BigInt(range[1]);
          const last = BigInt(range[2]);
          if (first > last) throw new Error('Start a number range with the smaller number.');
          const shape = sentence(`0 is ${range[3]} ${range[4]}`, 'fact');
          for (let number = first; number <= last; number++) {
            program.facts.push({ relation: shape.relation, terms: [number.toString(), shape.terms[1]] });
          }
        } else {
          const fact = sentence(body, 'fact');
          if (fact.terms.some(hasCalculation)) throw new Error('Put calculations in a rule or question; facts give numbers directly.');
          program.facts.push(fact);
        }
      }
    } catch (error) {
      throw problem(error.message, Math.max(0, offset));
    }
  }
  if (text.slice(start).trim()) {
    throw problem('Finish a fact or rule with . and a question with ?', start + text.slice(start).search(/\S/));
  }
  return program;
}

const key = goal => JSON.stringify([goal.relation, ...goal.terms]);

function sameTerm(left, right) {
  return left === right || (typeof left !== 'string' && typeof right !== 'string' && JSON.stringify(left) === JSON.stringify(right));
}

function dereference(value, bindings) {
  while (value?.variable && bindings.has(value.variable)) value = bindings.get(value.variable);
  return value;
}

// Unify a backward head with a call, including open lists and shared variables.
// Calculations constrain the eventual answer; they never solve inputs backwards.
function unify(left, right, bindings) {
  left = dereference(left, bindings);
  right = dereference(right, bindings);
  if (sameTerm(left, right)) return true;
  if (left.operation || right.operation) return true;
  if (left.variable || right.variable) {
    const variable = left.variable ? left : right;
    const value = left.variable ? right : left;
    const pending = [value];
    while (pending.length) {
      const part = dereference(pending.pop(), bindings);
      if (part.variable === variable.variable) return false;
      if (part.list) pending.push(...part.list, ...(part.tail ? [part.tail] : []));
    }
    bindings.set(variable.variable, value);
    return true;
  }
  if (!left.list || !right.list) return false;
  const common = Math.min(left.list.length, right.list.length);
  for (let index = 0; index < common; index++) {
    if (!unify(left.list[index], right.list[index], bindings)) return false;
  }
  if (left.list.length > common) return right.tail !== undefined &&
    unify(list(left.list.slice(common), left.tail), right.tail, bindings);
  if (right.list.length > common) return left.tail !== undefined &&
    unify(left.tail, list(right.list.slice(common), right.tail), bindings);
  return unify(left.tail ?? { list: [] }, right.tail ?? { list: [] }, bindings);
}

function callKey(goal) {
  const names = new Map();
  function canonical(value) {
    if (typeof value === 'string' || value.text !== undefined) return value;
    if (value.variable) {
      if (!names.has(value.variable)) names.set(value.variable, `?${names.size}`);
      return { variable: names.get(value.variable) };
    }
    return list(value.list.map(canonical), value.tail === undefined ? undefined : canonical(value.tail));
  }
  return { relation: goal.relation, terms: goal.terms.map(canonical) };
}

function matchTerm(wanted, actual, bindings, calculations) {
  if (typeof wanted === 'string' || wanted.text !== undefined || wanted.operation) return sameTerm(calculate(wanted, bindings, calculations), actual);
  if (wanted.variable) {
    const resolved = dereference(wanted, bindings);
    if (!resolved.variable) return matchTerm(resolved, actual, bindings, calculations);
    bindings.set(resolved.variable, actual);
    return true;
  }
  if (!actual.list || wanted.list.length > actual.list.length) return false;
  for (let i = 0; i < wanted.list.length; i++) {
    if (!matchTerm(wanted.list[i], actual.list[i], bindings, calculations)) return false;
  }
  if (wanted.tail === undefined) return wanted.list.length === actual.list.length;
  return matchTerm(wanted.tail, { list: actual.list.slice(wanted.list.length) }, bindings, calculations);
}

function match(pattern, fact, bindings, calculations = null) {
  if (pattern.relation !== fact.relation) return null;
  const next = new Map(bindings);
  for (let i = 0; i < pattern.terms.length; i++) {
    if (!matchTerm(pattern.terms[i], fact.terms[i], next, calculations)) return null;
  }
  return next;
}

function specialize(value, bindings, calculations) {
  if (typeof value === 'string') return value;
  if (value.text !== undefined) return value;
  if (value.variable) {
    const resolved = dereference(value, bindings);
    return resolved.variable ? resolved : specialize(resolved, bindings, calculations);
  }
  if (value.list) return list(value.list.map(t => specialize(t, bindings, calculations)),
    value.tail === undefined ? undefined : specialize(value.tail, bindings, calculations));
  return calculate(value, bindings, calculations);
}

function ground(value) {
  if (typeof value === 'string') return true;
  if (value.text !== undefined) return true;
  if (value.variable) return false;
  return value.list.every(ground) && (value.tail === undefined || ground(value.tail));
}

function substitute(goal, bindings, calculations) {
  return { relation: goal.relation, terms: goal.terms.map(t => calculate(t, bindings, calculations)) };
}

function absence(goal) {
  return { goal: { ...goal, negated: true }, rule: null, premises: [], absence: true };
}

function compare(goal) {
  const [left, right] = goal.terms;
  const operator = goal.relation.slice(8);
  if (operator === 'contains') {
    if (left.text === undefined || right.text === undefined) throw new Error('Use quoted text on both sides of contains the text.');
    return left.text.toLowerCase().includes(right.text.toLowerCase());
  }
  const numbers = typeof left === 'string' && typeof right === 'string' && numeric.test(left) && numeric.test(right);
  if (operator === 'equal to' && !numbers) return sameTerm(left, right);
  let a;
  let b;
  if (numbers) {
    a = integer.test(left) ? BigInt(left) : real(left);
    b = integer.test(right) ? BigInt(right) : real(right);
  } else if (left.text !== undefined && right.text !== undefined) {
    a = left.text;
    b = right.text;
  } else throw new Error('Compare two numbers or two quoted texts.');
  switch (operator) {
    case 'less than': return a < b;
    case 'at most': return a <= b;
    case 'greater than': return a > b;
    case 'at least': return a >= b;
    case 'equal to': return a <= b && a >= b;
    default: throw new Error(`Unknown comparison: ${operator}.`);
  }
}

function ruleLayers(rules) {
  if (!rules.some(rule => rule.premises.some(p => p.negated))) return [rules];
  // Complete every producer before testing its absence. Kind constants are
  // separate predicates, so cat and sleepy-cat can live in different layers.
  function canProduce(head, premise) {
    if (head.relation !== premise.relation) return false;
    return head.relation !== 'is a' || typeof head.terms[1] !== 'string' ||
      typeof premise.terms[1] !== 'string' || head.terms[1] === premise.terms[1];
  }
  const levels = rules.map(() => 0);
  for (let pass = 0; pass < rules.length; pass++) {
    let changed = false;
    for (let target = 0; target < rules.length; target++) {
      for (const premise of rules[target].premises) {
        for (let source = 0; source < rules.length; source++) {
          if (!canProduce(rules[source].conclusion, premise)) continue;
          const required = levels[source] + (premise.negated ? 1 : 0);
          if (levels[target] < required) { levels[target] = required; changed = true; }
        }
      }
    }
    if (!changed) {
      return [...new Set(levels)].sort((a, b) => a - b).map(level => rules.filter((_, index) => levels[index] === level));
    }
  }
  throw new Error('These rules form a loop through not. A not clue must refer to rules that can finish first.');
}

export function infer(program) {
  const layers = ruleLayers(program.rules);
  const levels = new Map(layers.flatMap((rules, level) => rules.map(rule => [rule, level])));
  const definitions = new Map();
  for (const rule of program.rules) if (rule.backward) {
    if (!definitions.has(rule.conclusion.relation)) definitions.set(rule.conclusion.relation, []);
    definitions.get(rule.conclusion.relation).push(rule);
  }
  const tables = new Map();
  const facts = new Map();
  const absences = new Map();
  // Each binary relation has four indexes: both arguments, either one, or none.
  // A rule prefix subscribes to its next clue and sees each matching fact once.
  const known = new Map();
  const waiting = new Map();
  const queues = layers.map(() => []);
  const cursors = layers.map(() => 0);
  let nextLevel = queues.length;
  function enqueue(work, level) {
    queues[level].push(work);
    nextLevel = Math.min(nextLevel, level);
  }
  function bucket(index, relation, pattern) {
    if (!index.has(relation)) index.set(relation, new Map());
    const keys = index.get(relation);
    const id = JSON.stringify(pattern);
    if (!keys.has(id)) keys.set(id, []);
    return keys.get(id);
  }
  function add(goal, reason) {
    if (goal.relation === 'is a' && typeof goal.terms[1] !== 'string') throw new Error('Use one word for a kind, such as animal.');
    const id = key(goal);
    if (facts.has(id)) return false;
    const record = { goal, ...reason };
    facts.set(id, record);
    const [left, right] = goal.terms;
    for (const pattern of [[left, right], [left, null], [null, right], [null, null]]) {
      bucket(known, goal.relation, pattern).push(record);
      for (const subscription of bucket(waiting, goal.relation, pattern)) {
        enqueue({ subscription, record }, levels.get(subscription.rule));
      }
    }
    return true;
  }
  function demand(request) {
    const rules = definitions.get(request.relation);
    if (!rules) return;
    const goal = callKey(request);
    const id = key(goal);
    if (tables.has(id)) return;
    // Calls that differ only in placeholder spelling share this table. Their
    // consumers suspend on the fact indexes and resume for each new answer.
    const table = { goal };
    tables.set(id, table);
    for (const rule of rules) {
      const bindings = new Map();
      if (rule.conclusion.terms.every((head, index) => unify(head, goal.terms[index], bindings))) {
        enqueue({ start: { rule, partial: { bindings, premises: [], calculations: [], table } } }, levels.get(rule));
      }
    }
  }
  function requireInputs(premise, bindings) {
    const required = premise.negated || premise.relation.startsWith('compare:') ? variables(premise) : arithmeticVariables(premise);
    for (const name of required) {
      if (!ground(specialize({ variable: name }, bindings))) {
        throw new Error(`Give ${name} a value in the question or an earlier clue before using this rule: ${premise.relation.startsWith('compare:') ? 'a comparison needs known values' : 'this clue needs known inputs'}.`);
      }
    }
  }
  function advance(rule, position, partial) {
    if (position === rule.premises.length) {
      const calculations = [...partial.calculations];
      for (const name of rule.backward ? variables(rule.conclusion) : []) {
        if (!ground(specialize({ variable: name }, partial.bindings))) {
          throw new Error(`Give ${name} a value in the question or an earlier clue; an answer must be ground.`);
        }
      }
      const conclusion = substitute(rule.conclusion, partial.bindings, calculations);
      if (partial.table && !match(partial.table.goal, conclusion, new Map())) return;
      add(conclusion, { rule, premises: partial.premises, calculations, bindings: partial.bindings });
      return;
    }
    const calculations = [...partial.calculations];
    const premise = rule.premises[position];
    if (rule.backward) requireInputs(premise, partial.bindings);
    const goal = { relation: premise.relation,
      terms: premise.terms.map(t => specialize(t, partial.bindings, calculations)) };
    if (premise.relation.startsWith('compare:')) {
      if (compare(goal) !== Boolean(premise.negated)) {
        const evidence = { goal: { ...goal, ...(premise.negated ? { negated: true } : {}) },
          rule: null, premises: [], comparison: true };
        enqueue({ resume: { rule, position: position + 1, partial: {
          ...partial, calculations, premises: [...partial.premises, evidence],
        } } }, levels.get(rule));
      }
      return;
    }
    demand(goal);
    if (premise.negated) {
      // Backward producers may just have been requested. A lower-stratum
      // queue must reach its fixed point before this absence is tested.
      enqueue({ negative: { rule, position, partial: { ...partial, calculations }, goal } }, levels.get(rule));
      return;
    }
    const pattern = goal.terms.map(t => ground(t) ? t : null);
    const subscription = { rule, position, goal, partial: { ...partial, calculations } };
    bucket(waiting, goal.relation, pattern).push(subscription);
    for (const record of bucket(known, goal.relation, pattern)) enqueue({ subscription, record }, levels.get(rule));
  }
  for (const fact of program.facts) add(fact, { rule: null, premises: [] });
  function requestAssertion(assertion) {
    if (!definitions.size) return;
    if (assertion.goal && !assertion.goal.relation.startsWith('compare:')) {
      demand({ relation: assertion.goal.relation, terms: assertion.goal.terms.map(t => specialize(t, new Map())) });
    }
    if (!assertion.aggregate) return;
    const { operation, label } = assertion.aggregate;
    if (operation === 'count') {
      const kinds = new Set([...program.facts, ...program.rules.map(rule => rule.conclusion)]
        .filter(goal => goal.relation === 'is a' && typeof goal.terms[1] === 'string' && plural(goal.terms[1]) === label)
        .map(goal => goal.terms[1]));
      for (const kind of kinds) demand({ relation: 'is a', terms: [{ variable: 'who' }, kind] });
      if (program.rules.some(rule => rule.backward && rule.conclusion.relation === 'is a' && typeof rule.conclusion.terms[1] !== 'string')) {
        demand({ relation: 'is a', terms: [{ variable: 'who' }, { variable: 'what' }] });
      }
    } else {
      for (const relation of definitions.keys()) if (relation.startsWith('property:') && plural(relation.slice(9)) === label) {
        demand({ relation, terms: [{ variable: 'who' }, { variable: 'what' }] });
      }
    }
  }
  for (const assertion of [...program.questions, ...program.checks]) requestAssertion(assertion);
  // Arithmetic and list construction can create new values indefinitely.
  // Their rules must bound the work or reach a stopping configuration.
  for (const layer of layers) {
    for (const rule of layer) if (!rule.backward) advance(rule, 0, { bindings: new Map(), premises: [], calculations: [] });
  }
  while (nextLevel < queues.length) {
    const level = nextLevel;
    const queue = queues[level];
    if (cursors[level] === queue.length) { nextLevel++; continue; }
    const work = queue[cursors[level]];
    queue[cursors[level]++] = null; // Release processed work without recursive JS calls.
    if (work.start) {
      advance(work.start.rule, 0, work.start.partial);
      continue;
    }
    if (work.negative) {
      const { rule, position, partial, goal } = work.negative;
      if (bucket(known, goal.relation, goal.terms).length === 0) {
        const id = key(goal);
        if (!absences.has(id)) absences.set(id, absence(goal));
        advance(rule, position + 1, { ...partial, premises: [...partial.premises, absences.get(id)] });
      }
      continue;
    }
    if (work.resume) {
      const { rule, position, partial } = work.resume;
      advance(rule, position, partial);
      continue;
    }
    const { subscription, record } = work;
    const { rule, position, goal, partial } = subscription;
    const bindings = match(goal, record.goal, partial.bindings);
    if (bindings) advance(rule, position + 1, {
      ...partial, bindings, premises: [...partial.premises, record], calculations: partial.calculations,
    });
  }
  return [...facts.values()];
}

function sayTerm(value) {
  if (typeof value === 'string') return value;
  if (value.text !== undefined) return JSON.stringify(value.text);
  if (value.variable) return value.variable;
  const items = value.list.map(sayTerm).join(', ');
  return `[${items}${value.tail === undefined ? '' : ` | ${sayTerm(value.tail)}`}]`;
}

export function say(goal) {
  if (goal.relation === 'answer') return goal.text;
  if (goal.relation.startsWith('compare:')) {
    const [left, right] = goal.terms.map(sayTerm);
    const operator = goal.relation.slice(8);
    return operator === 'contains'
      ? `${left} ${goal.negated ? 'does not contain' : 'contains'} the text ${right}`
      : `${left} is${goal.negated ? ' not' : ''} ${operator} ${right}`;
  }
  if (goal.negated) return `there is no evidence in this program that ${say({ ...goal, negated: false })}`;
  const [first, second] = goal.terms.map(sayTerm);
  if (goal.relation.startsWith('property:')) {
    return `the ${goal.relation.slice(9)} of ${first} is ${second}`;
  }
  if (goal.relation === 'is a') {
    // Choose the article by the first letter, without pronunciation analysis.
    const article = /^[aeiou]/.test(second) ? 'an' : 'a';
    return `${first} is ${article} ${second}`;
  }
  return `${first} ${goal.relation} ${second}`;
}

function aggregateAnswer(aggregate, facts) {
  const { operation, label } = aggregate;
  let premises;
  let value;
  let text;
  let detail;
  if (operation === 'count') {
    const matches = facts.filter(record => record.goal.relation === 'is a' && plural(record.goal.terms[1]) === label);
    premises = [...new Map(matches.map(record => [record.goal.terms[0], record])).values()];
    value = String(premises.length);
    const name = value === '1' ? premises[0].goal.terms[1] : label;
    text = `there ${value === '1' ? 'is' : 'are'} ${value} ${name}`;
    detail = `I counted all matching names in the completed program: ${value}.`;
  } else {
    premises = facts.filter(record => record.goal.relation.startsWith('property:') &&
      plural(record.goal.relation.slice(9)) === label);
    if (!premises.length && operation !== 'total') return null;
    const values = premises.map(record => {
      const value = record.goal.terms[1];
      if (!integer.test(value)) throw new Error(`I can only find the ${operation} of whole numbers; I found ${value}.`);
      return BigInt(value);
    });
    if (operation === 'total') value = values.reduce((a, b) => a + b, 0n).toString();
    else value = values.reduce((a, b) => operation === 'smallest' ? (a < b ? a : b) : (a > b ? a : b)).toString();
    text = `the ${operation} of all ${label} is ${value}`;
    detail = operation === 'total' ? `I added all ${values.length} matching values in the completed program.`
      : `I compared all ${values.length} matching values in the completed program.`;
  }
  return { goal: { relation: 'answer', terms: [], text }, rule: null, premises, aggregate: { detail, value } };
}

function otherReason(record, steps = null) {
  if (record.comparison) return 'I checked these values.';
  if (record.absence) return 'I checked the completed program and found no matching fact.';
  if (record.aggregate) {
    const uses = steps && record.premises.length ? ` I used steps ${record.premises.map(p => steps.get(p)).join(', ')}.` : '';
    return record.aggregate.detail + uses;
  }
  return 'you told me this.';
}

function appliedRule(record) {
  // Replace variable tokens without touching quoted text or inserted values.
  return record.rule.text.replace(/"(?:\\.|[^"\\])*"|\?[\p{L}][\p{L}\p{N}_-]*/gu,
    token => namedVariable.test(token) ? sayTerm(calculate({ variable: token }, record.bindings)) : token);
}

function appliedBindings(record) {
  return [...record.bindings].filter(([name]) => namedVariable.test(name))
    .map(([name]) => `${name} = ${sayTerm(calculate({ variable: name }, record.bindings))}`).join(', ');
}

function explainTree(record) {
  const lines = [];
  const pending = [{ record, depth: 0 }];
  while (pending.length) {
    const { record: current, depth } = pending.pop();
    const indent = '  '.repeat(depth);
    lines.push(`${indent}${say(current.goal)}.`);
    if (!current.rule) lines.push(`${indent}  ${otherReason(current)}`);
    else {
      lines.push(`${indent}  because ${appliedRule(current)}`);
      for (const calculation of current.calculations ?? []) lines.push(`${indent}  ${calculation}`);
    }
    for (let i = current.premises.length - 1; i >= 0; i--) {
      pending.push({ record: current.premises[i], depth: depth + 1 });
    }
  }
  return lines.join('\n');
}

function explain(roots) {
  // Walk the proof graph without recursion. Shared premises get one numbered
  // step, rather than an exponentially expanding tree of repeated reasons.
  const seen = new Set();
  const records = [];
  const pending = roots.slice().reverse().map(record => ({ record, depth: 0, finish: false }));
  let shared = false;
  let deepest = 0;
  while (pending.length) {
    const frame = pending.pop();
    if (frame.finish) {
      records.push(frame.record);
      continue;
    }
    if (seen.has(frame.record)) {
      shared = true;
      continue;
    }
    seen.add(frame.record);
    deepest = Math.max(deepest, frame.depth);
    pending.push({ ...frame, finish: true });
    for (let i = frame.record.premises.length - 1; i >= 0; i--) {
      pending.push({ record: frame.record.premises[i], depth: frame.depth + 1, finish: false });
    }
  }
  // Preserve the short indented format for small explanations with no sharing.
  if (roots.length === 1 && !shared && deepest <= 16) return explainTree(roots[0]);
  const rules = new Map();
  for (const record of records) if (record.rule && !rules.has(record.rule)) rules.set(record.rule, rules.size + 1);
  const steps = new Map(records.map((record, index) => [record, index + 1]));
  const lines = ['Here is why. Each step is shown once.'];
  for (const [rule, number] of rules) lines.push(`rule ${number}: ${rule.text}`);
  for (const record of records) {
    lines.push(`step ${steps.get(record)}: ${say(record.goal)}.`);
    if (!record.rule) lines.push(`  ${otherReason(record, steps)}`);
    else {
      lines.push(`  because rule ${rules.get(record.rule)} uses steps ${record.premises.map(p => steps.get(p)).join(', ')}.`);
      const bindings = appliedBindings(record);
      if (bindings) lines.push(`  with ${bindings}.`);
      for (const calculation of record.calculations ?? []) lines.push(`  ${calculation}`);
    }
  }
  lines.push(`That explains ${roots.length === 1 ? 'step' : 'steps'} ${roots.map(record => steps.get(record)).join(', ')}.`);
  return lines.join('\n');
}

export function run(source, { arc = false } = {}) {
  const program = parse(source);
  const facts = infer(program);
  let previous = null;
  const answers = program.questions.map(({ goal, why, aggregate, previous: followup }) => {
    if (followup) {
      if (previous === null) return 'Ask a question first, then ask why.';
      return previous.length ? explain(previous) : "I don't have an answer to explain yet.";
    }
    if (aggregate) {
      const answer = aggregateAnswer(aggregate, facts);
      previous = answer ? [answer] : [];
      if (!answer) return `I don't know any ${aggregate.label} yet.`;
      return why ? explain([answer]) : `${say(answer.goal)}.`;
    }
    let found = facts.filter(record => match(goal, record.goal, new Map()));
    if (goal.negated) {
      if (found.length) {
        previous = found;
        return why ? explain([found[0]]) : `no, the program shows that ${say({ ...goal, negated: false })}.`;
      }
      found = [absence(goal)];
      previous = found;
      return why ? explain(found) : `yes, ${say(goal)}.`;
    }
    previous = found;
    if (variables(goal).length) {
      return found.length ? found.map(record => `${say(record.goal)}.`).join('\n')
        : "I don't know anyone or anything that fits that question yet.";
    }
    if (!found.length) return `I don't know whether ${say(goal)}.`;
    return why ? explain([found[0]]) : `yes, ${say(goal)}.`;
  });
  for (const assertion of program.checks) {
    try {
      let passed;
      if (assertion.aggregate) {
        passed = aggregateAnswer(assertion.aggregate, facts)?.aggregate.value === assertion.expected;
      } else {
        const goal = substitute(assertion.goal, new Map());
        const holds = goal.relation.startsWith('compare:') ? compare(goal)
          : facts.some(record => match(goal, record.goal, new Map()));
        passed = assertion.goal.negated ? !holds : holds;
      }
      if (!passed) throw new Error(`Check failed: ${assertion.text}.`);
      answers.push(`check passed: ${assertion.text}.`);
    } catch (error) {
      throw new Error(`Line ${assertion.line}: ${error.message}`);
    }
  }
  if (!arc) return answers;
  const sections = [[], [], answers.slice(program.questions.length)];
  program.questions.forEach((question, index) => sections[question.why ? 1 : 0].push(answers[index]));
  const empty = [
    'Add a question ending with ? to ask about your program.',
    'No explanation was requested. Add why? after a question.',
    'No checks were requested.',
  ];
  return ['Answer', 'Reason', 'Check'].map((label, index) => {
    return `# ${label}\n${sections[index].join('\n\n') || empty[index]}`;
  });
}
