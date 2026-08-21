// Compact clause representation and clause-index selection.
// This module contains the performance-sensitive indexing machinery so Program
// construction/analysis can stay separate from runtime candidate selection.
import {
  ATOM, COMPOUND, VAR, atom, compound, deref, isScalar, numberTerm, variable,
} from './term.js';
import { numberValueKey } from './number-value.js';

const EMPTY_CLAUSE_BODY = Object.freeze([]);

export function modulePredicateKey(module, name, arity) {
  return module === 'user' ? `${name}/${arity}` : `${module}:${name}/${arity}`;
}

export class CompactBinaryClause {
  constructor(headName, head0Type, head0Name, head1Type, head1Name,
      bodyName, body0Type, body0Name, body1Type, body1Name) {
    this.compactBinary = true;
    this.headName = headName;
    this.head0Type = head0Type;
    this.head0Name = head0Name;
    this.head1Type = head1Type;
    this.head1Name = head1Name;
    this.bodyName = bodyName;
    this.body0Type = body0Type;
    this.body0Name = body0Name;
    this.body1Type = body1Type;
    this.body1Name = body1Name;
  }

  get head() {
    if (!this._head) {
      this._head = compound(this.headName, [
        compactTerm(this.head0Type, this.head0Name),
        compactTerm(this.head1Type, this.head1Name),
      ]);
    }
    return this._head;
  }

  get body() {
    if (this.bodyName == null) return EMPTY_CLAUSE_BODY;
    if (!this._body) {
      this._body = [compound(this.bodyName, [
        compactTerm(this.body0Type, this.body0Name),
        compactTerm(this.body1Type, this.body1Name),
      ])];
    }
    return this._body;
  }
}

function compactTerm(type, name) {
  if (type === VAR) return variable(name);
  if (type === 'number') return numberTerm(name);
  return atom(name);
}

export function isCompactBinaryClause(clause) {
  return clause?.compactBinary === true;
}

export function compactHeadArgType(clause, index) {
  return index === 0 ? clause.head0Type : clause.head1Type;
}

export function compactHeadArgName(clause, index) {
  return index === 0 ? clause.head0Name : clause.head1Name;
}

export function compactBodyArgType(clause, index) {
  return index === 0 ? clause.body0Type : clause.body1Type;
}

export function compactBodyArgName(clause, index) {
  return index === 0 ? clause.body0Name : clause.body1Name;
}

export function clauseBodyLength(clause) {
  return isCompactBinaryClause(clause) ? (clause.bodyName == null ? 0 : 1) : clause.body.length;
}


export function clauseHasCut(clause) {
  return !isCompactBinaryClause(clause) && clause.body.some(termContainsCut);
}

export function termContainsCut(term) {
  if (term.type === ATOM) return term.name === '!';
  return term.type === COMPOUND && term.args.some(termContainsCut);
}

export function termHasNoVariables(term) {
  if (!term || term.type === 'var') return false;
  return !term.args?.some((arg) => !termHasNoVariables(arg));
}

// These defaults mirror SWI-Prolog's JITI admission policy: small predicates
// stay linear, a hash must promise a useful speedup, variable-heavy positions
// are rejected, and a multi-argument hash must substantially beat singles.
const DEMAND_INDEX_MIN_CLAUSES = 10;
const INDEX_MIN_SPEEDUP = 1.5;
const INDEX_MAX_VAR_FRACTION = 0.1;
const MULTI_INDEX_MIN_SPEEDUP_RATIO = 3;

export function makeArgumentIndex() {
  return {
    atomBuckets: new Map(),
    stringBuckets: new Map(),
    numberBuckets: new Map(),
    fallback: [],
    sawScalar: false,
  };
}

function scalarBuckets(index, term) {
  if (term.type === ATOM) return index.atomBuckets;
  if (term.type === 'string') return index.stringBuckets;
  return index.numberBuckets;
}

function argumentBucket(index, term) {
  return scalarBuckets(index, term).get(scalarBucketKey(term.type, term.name)) ?? null;
}

function addArgumentBucket(index, term, clause) {
  addClauseBucket(scalarBuckets(index, term), scalarBucketKey(term.type, term.name), clause);
}

function scalarIndexKey(term) {
  return `${term.type}\u0000${scalarBucketKey(term.type, term.name)}`;
}

function scalarBucketKey(type, name) {
  return type === 'number' ? numberValueKey(name) : name;
}

function addClauseBucket(buckets, key, clause) {
  const existing = buckets.get(key);
  if (existing == null) buckets.set(key, clause);
  else if (Array.isArray(existing)) existing.push(clause);
  else buckets.set(key, [existing, clause]);
}

function clauseCollectionLength(clauses) {
  return clauses == null ? 0 : Array.isArray(clauses) ? clauses.length : 1;
}

function clauseCollectionAt(clauses, index) {
  return Array.isArray(clauses) ? clauses[index] : index === 0 ? clauses : undefined;
}

function compactScalarBuckets(index, type) {
  if (type === ATOM) return index.atomBuckets;
  if (type === 'number') return index.numberBuckets;
  return index.stringBuckets;
}

export function indexCompactOne(index, type, name, clause, clauses = null, clausePosition = -1) {
  if (type !== VAR) {
    if (!index.sawScalar) {
      index.sawScalar = true;
      if (clauses && clausePosition > 0) index.fallback = clauses.slice(0, clausePosition);
    }
    addClauseBucket(compactScalarBuckets(index, type), scalarBucketKey(type, name), clause);
  } else if (index.sawScalar) {
    index.fallback.push(clause);
  }
}

export function indexOne(index, arg, clause, clauses = null, clausePosition = -1) {
  if (isScalar(arg)) {
    if (!index.sawScalar) {
      index.sawScalar = true;
      if (clauses && clausePosition > 0) index.fallback = clauses.slice(0, clausePosition);
    }
    addArgumentBucket(index, arg, clause);
  } else if (index.sawScalar) {
    index.fallback.push(clause);
  }
}

function indexFallback(index, group) {
  return index.sawScalar ? index.fallback : group.clauses;
}

export function rebuildGroupIndexes(group) {
  group.argIndexes = Array.from({ length: group.arity }, makeArgumentIndex);
  group.demandIndexes.clear();
  group.rejectedDemandIndexes.clear();
  group.scalarFactsOnly = true;
  group.hasCut = false;
  for (let clausePosition = 0; clausePosition < group.clauses.length; clausePosition++) {
    const clause = group.clauses[clausePosition];
    if (isCompactBinaryClause(clause)) {
      clause.groundHead = clause.head0Type !== VAR && clause.head1Type !== VAR;
      clause.scalarHead = clause.groundHead;
      if (clause.bodyName != null || !clause.scalarHead) group.scalarFactsOnly = false;
      indexCompactOne(group.argIndexes[0], clause.head0Type, clause.head0Name, clause, group.clauses, clausePosition);
      indexCompactOne(group.argIndexes[1], clause.head1Type, clause.head1Name, clause, group.clauses, clausePosition);
      continue;
    }
    clause.groundHead = termHasNoVariables(clause.head);
    clause.scalarHead = clause.head.type === COMPOUND && clause.head.args.every(isScalar);
    if (clauseHasCut(clause)) group.hasCut = true;
    if (clause.body.length !== 0 || !clause.scalarHead) group.scalarFactsOnly = false;
    for (let i = 0; i < group.arity; i++) indexOne(group.argIndexes[i], clause.head.args[i], clause, group.clauses, clausePosition);
  }
}

function demandIndexKey(positions) {
  return positions.join(',');
}

function demandValueKey(values) {
  // Unification distinguishes atoms, strings, and numbers even when their
  // lexical spellings are identical. Include the scalar type in every key so
  // indexes never merge semantically distinct candidates.
  if (values.length === 1) return scalarIndexKey(values[0]);
  return values.map((value) => {
    const key = scalarIndexKey(value);
    return `${key.length}:${key}`;
  }).join('');
}

function buildDemandIndex(group, positions) {
  const index = { positions, buckets: new Map(), fallback: [] };
  for (const clause of group.clauses) {
    if (isCompactBinaryClause(clause)) {
      const values = positions.map((position) => compactTerm(
        compactHeadArgType(clause, position), compactHeadArgName(clause, position)));
      if (!values.every(isScalar)) {
        index.fallback.push(clause);
        continue;
      }
      addClauseBucket(index.buckets, demandValueKey(values), clause);
      continue;
    }
    const values = positions.map((position) => clause.head.args[position]);
    if (!values.every(isScalar)) {
      index.fallback.push(clause);
      continue;
    }
    const key = demandValueKey(values);
    addClauseBucket(index.buckets, key, clause);
  }
  return index;
}

function mergeClausesInSourceOrder(primary, fallback) {
  const primaryLength = clauseCollectionLength(primary);
  if (fallback.length === 0) return primary;
  if (primaryLength === 0) return fallback;
  const merged = [];
  let left = 0;
  let right = 0;
  while (left < primaryLength && right < fallback.length) {
    const primaryClause = clauseCollectionAt(primary, left);
    if (primaryClause.index < fallback[right].index) {
      merged.push(primaryClause);
      left++;
    } else {
      merged.push(fallback[right++]);
    }
  }
  while (left < primaryLength) merged.push(clauseCollectionAt(primary, left++));
  while (right < fallback.length) merged.push(fallback[right++]);
  return merged;
}


export function selectGroundClauseCandidates(group, goal) {
  if (goal.type !== COMPOUND || group.clauses.length < DEMAND_INDEX_MIN_CLAUSES) return group.clauses;
  let bestPrimary = null;
  let bestFallback = null;
  let bestLength = group.clauses.length;
  for (let i = 0; i < goal.arity; i++) {
    const value = goal.args[i];
    if (!isScalar(value)) continue;
    const index = group.argIndexes[i];
    const fallback = indexFallback(index, group);
    if (fallback.length / group.clauses.length > INDEX_MAX_VAR_FRACTION) continue;
    const primary = argumentBucket(index, value);
    const length = clauseCollectionLength(primary) + fallback.length;
    if (group.clauses.length / Math.max(1, length) < INDEX_MIN_SPEEDUP) continue;
    if (length < bestLength) {
      bestPrimary = primary;
      bestFallback = fallback;
      bestLength = length;
    }
  }
  if (bestFallback == null) return group.clauses;
  if (bestFallback.length === 0) return bestPrimary;
  if (clauseCollectionLength(bestPrimary) === 0) return bestFallback;
  return mergeClausesInSourceOrder(bestPrimary, bestFallback);
}

export function selectClauseCandidates(group, goal, env) {
  if (goal.type !== COMPOUND || group.clauses.length < DEMAND_INDEX_MIN_CLAUSES) {
    return { primary: group.clauses, fallback: [] };
  }
  const positions = [];
  const values = [];
  for (let i = 0; i < goal.arity; i++) {
    const arg = deref(goal.args[i], env);
    if (!isScalar(arg)) continue;
    positions.push(i);
    values.push(arg);
  }
  if (positions.length === 0) return { primary: group.clauses, fallback: [] };

  return selectClauseCandidatesForValues(group, positions, values);
}

// The scalar-fact join already has dereferenced local values. Keeping this
// entry point separate avoids manufacturing an Env facade and dereferencing
// every argument again in its inner loop.
export function selectClauseCandidatesForValues(group, positions, values) {
  if (group.clauses.length < DEMAND_INDEX_MIN_CLAUSES || positions.length === 0) {
    return { primary: group.clauses, fallback: [] };
  }

  let bestParts = null;
  let bestLength = group.clauses.length;
  // Any-argument indexes are the eagerly built stable base. A wide index is
  // constructed only when none of them reduces the choice set to a small scan.
  for (let i = 0; i < positions.length; i++) {
    const index = group.argIndexes[positions[i]];
    const fallback = indexFallback(index, group);
    const parts = { primary: argumentBucket(index, values[i]), fallback };
    const length = clauseCollectionLength(parts.primary) + parts.fallback.length;
    if (fallback.length / group.clauses.length > INDEX_MAX_VAR_FRACTION) continue;
    if (group.clauses.length / Math.max(1, length) < INDEX_MIN_SPEEDUP) continue;
    if (length < bestLength) {
      bestParts = parts;
      bestLength = length;
    }
  }
  const wideKey = demandIndexKey(positions);
  if (positions.length > 1 && bestLength > 1 && !group.rejectedDemandIndexes.has(wideKey)) {
    const hadWideIndex = group.demandIndexes.has(wideKey);
    const parts = demandCandidateParts(group, positions, values);
    const length = clauseCollectionLength(parts.primary) + parts.fallback.length;
    const variableFraction = parts.fallback.length / group.clauses.length;
    const speedup = group.clauses.length / Math.max(1, length);
    const improvement = bestLength / Math.max(1, length);
    if (variableFraction <= INDEX_MAX_VAR_FRACTION
        && speedup >= INDEX_MIN_SPEEDUP
        && improvement >= MULTI_INDEX_MIN_SPEEDUP_RATIO) {
      bestParts = parts;
      bestLength = length;
    } else {
      if (!hadWideIndex) {
        group.demandIndexes.delete(wideKey);
        group.rejectedDemandIndexes.add(wideKey);
      }
    }
  }
  // An exact scalar index normally has no variable-head fallback. Reuse its
  // bucket directly instead of allocating a one-element merged array on every
  // lookup (notably in long deterministic ground chains).
  const best = !bestParts ? group.clauses
    : bestParts.fallback.length === 0 ? bestParts.primary
      : clauseCollectionLength(bestParts.primary) === 0 ? bestParts.fallback
        : mergeClausesInSourceOrder(bestParts.primary, bestParts.fallback);
  return { primary: best, fallback: [] };
}

function demandCandidateParts(group, positions, values) {
  const indexKey = demandIndexKey(positions);
  let index = group.demandIndexes.get(indexKey);
  if (!index) {
    index = buildDemandIndex(group, positions);
    group.demandIndexes.set(indexKey, index);
  }
  const bucket = index.buckets.get(demandValueKey(values)) ?? null;
  return { primary: bucket, fallback: index.fallback };
}
