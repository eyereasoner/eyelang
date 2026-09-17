import { atom, struct, scalar, list, format } from './terms.js';

const node = (name, ...args) => struct(name, args);
const integer = value => scalar(BigInt(value));
const location = value => value ? node('at', integer(value.line), integer(value.column)) : atom('internal');
const bindings = values => list(Object.entries(values).map(([name, value]) => node('binding', scalar(name), value)));

/** Check-only output follows the same syntax contract as evaluated output. */
export function formatCheck(result) {
  const facts = [node('checked', node('rules', integer(result.rules)), node('queries', integer(result.queries)))];
  for (const [name, level] of Object.entries(result.strata)) facts.push(node('stratum', scalar(name), integer(level)));
  return `${facts.map(fact => `${format(fact)}.`).join('\n')}\n`;
}

function expression(value) {
  switch (value.type) {
    case 'value': return node('value', value.term);
    case 'unary': return node('unary', scalar('-'), expression(value.arg));
    case 'binary': return node('binary', scalar(value.op), expression(value.left), expression(value.right));
    case 'function': return node('function', scalar(value.name), list(value.args.map(expression)));
    default: throw new Error(`Cannot serialize expression ${value.type}`);
  }
}

function goals(body) {
  return list(body.map(goal => {
    switch (goal.type) {
      case 'call': return node('call', goal.term);
      case 'not': return node('absent', goal.term);
      case 'compare': return node('compare', scalar(goal.op), goal.left, goal.right);
      case 'let': return node('calculate', goal.target, expression(goal.expression));
      case 'collect': return node('collect', goal.target, goal.template, goals(goal.body));
      default: throw new Error(`Cannot serialize goal ${goal.type}`);
    }
  }));
}

function premise(value) {
  switch (value.kind) {
    case 'answer': return node('uses', integer(value.proof), value.callTerm);
    case 'builtin': return node('builtin', value.callTerm);
    case 'not': return node('absent', value.callTerm, atom('complete'));
    case 'collect': return node('collected', value.valueTerm, value.template, goals(value.body), list(value.proofs.map(integer)), atom('complete'));
    case 'let': return node('calculated', value.valueTerm, expression(value.expression));
    case 'compare': return node('compared', scalar(value.op), value.leftTerm, value.rightTerm);
    default: throw new Error(`Cannot serialize premise ${value.kind}`);
  }
}

/** Serialize a completed run as an Eyelit program containing ordinary facts.
 * Each statement has its own variable scope; format the entire fact at once
 * so shared and independent residual variables retain their identities.
 */
export function formatResult(result, { proof = false } = {}) {
  if (result.status !== 'complete') throw new Error('Only complete results can be serialized');
  const lines = ['# Eyelit result format 1'];
  const emit = term => lines.push(`${format(term)}.`);
  result.queries.forEach((query, index) => {
    const id = integer(index + 1);
    emit(node('query', id, location(query.location), goals(query.body),
      list(query.variables.map(variable => node('binding', scalar(variable.name), variable)))));
    emit(node('result', id, atom('complete'), integer(query.answers.length)));
    for (const answer of query.answers) {
      const values = bindings(answer.bindings);
      emit(node('answer', id, values));
      if (proof) emit(node('why', id, values, integer(answer.proof)));
    }
  });
  if (proof) {
    for (const entry of result.proofs) {
      // The internal $query symbol is not source syntax. Its result is a
      // projected tuple, represented explicitly as solution([...]) in data.
      const conclusion = entry.rule === 'query' ? node('solution', list(entry.conclusionTerm.args)) : entry.conclusionTerm;
      const source = entry.rule === 'query' ? atom('query') : node('rule', integer(entry.rule), location(entry.location));
      emit(node('proof', integer(entry.id), conclusion, source, list(entry.premises.map(premise))));
    }
  }
  return `${lines.join('\n')}\n`;
}
