import { builtinRelations } from './builtins.js';
export const signature = term => `${term.name}/${term.args.length}`;

export function dependencies(body, closed = false) {
  return body.flatMap(goal => {
    if (goal.type === 'call' || goal.type === 'not') {
      return [{ name: signature(goal.term), closed: closed || goal.type === 'not' }];
    }
    if (goal.type === 'collect') return dependencies(goal.body, true);
    return [];
  });
}

export function analyze(rules) {
  const predicates = new Map();
  for (const rule of rules) {
    const name = signature(rule.head);
    if (builtinRelations.has(name)) throw new Error(`Cannot redefine built-in ${name}`);
    if (!predicates.has(name)) predicates.set(name, []);
    predicates.get(name).push(rule);
  }
  const edges = rules.flatMap(rule => dependencies(rule.body).map(dep => ({ from: signature(rule.head), ...dep })));
  const strata = new Map([...predicates.keys()].map(name => [name, 0]));
  for (const edge of edges) {
    if (!predicates.has(edge.name) && !builtinRelations.has(edge.name)) throw new Error(`Undefined relation ${edge.name}`);
  }
  for (let round = 0; round <= predicates.size; round++) {
    let changed = false;
    for (const edge of edges) {
      const level = (strata.get(edge.name) || 0) + Number(edge.closed);
      if (strata.get(edge.from) < level) { strata.set(edge.from, level); changed = true; }
    }
    if (!changed) return { predicates, strata };
  }
  throw new Error('Recursion through not or collect is not stratified');
}

export function checkQuery(body, program) {
  for (const dep of dependencies(body)) {
    if (!program.predicates.has(dep.name) && !builtinRelations.has(dep.name)) throw new Error(`Undefined relation ${dep.name}`);
  }
}
