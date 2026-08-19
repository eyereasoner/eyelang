// Depth-first EyeProlog solver with builtin dispatch, memoization, and guarded recursion handling.
// Most semantic decisions still flow through unification; optimizations only select candidates earlier.
import {
  COMPOUND, NUMBER, VAR, Env, compactListLength, compactVariableList, compound, cons, copyResolved, deref, emptyList,
  flattenConjunction, freshTerm, isCons, isDecimalInteger, isEmptyList,
  numberTerm, numberTextFromDouble, termIsGround, termToString, unify, variable, variantTerms,
} from './term.js';
import { numberValueKey, sameNumberValue } from './number-value.js';
import { PrologError, getStrictIsoRegistry } from './iso.js';
import { getEyePrologRegistry } from './standard-library.js';
import { selectClauseCandidates, selectClauseCandidatesForValues, selectGroundClauseCandidates } from './program.js';
import { StreamManager } from './io.js';
import { clpzStateConsistent } from './clpz.js';
import { hardHeapLimit, softHeapLimit, usedHeapSize } from './platform.js';
import { evaluateWfs, relationForGroup, truthOfGroundGoal } from './wfs.js';
import { evaluatePositiveDatalog, relationForDatalogGroup, datalogCandidateIndexes } from './datalog.js';

let freshCounter = 0;
const DEFAULT_INNER_TABLE_SCOPE_LIMIT = 1024;

function qualifyTerm(term, module) {
  if (!term || (term.type !== COMPOUND && term.type !== 'atom')) return term;
  term.module = module;
  for (const arg of term.args) qualifyTerm(arg, module);
  return term;
}

export function nextFreshId() {
  return ++freshCounter;
}

function raiseOccursCheckError(left, right, env) {
  // occurs_check=error is an implementation-specific STO diagnostic.  Report
  // the unrepresentable cyclic result through the standard error envelope.
  // Keep the implementation-defined context empty for stable, portable output.
  const error = new PrologError('representation_error(term)');
  error.contextTerm = emptyList();
  throw error;
}

export class Solver {
  constructor(program, options = {}) {
    this.program = program;
    this.isoStrict = options.isoStrict === true || program.strictIso === true;
    // A strict processor mode must not silently admit host-registered
    // implementation-specific predicates.  Use the Part 1 + corrigenda
    // registry even when an embedder supplied the normal EyeProlog registry.
    this.registry = this.isoStrict ? getStrictIsoRegistry() : (options.registry ?? getEyePrologRegistry());
    this.mutableProgram = program.mutable === true;
    this.programRevision = this.program.revision ?? 0;
    this.maxDepth = options.maxDepth ?? 100000;
    this.depthLimitExceeded = false;
    this.maxInferences = options.maxInferences ?? Infinity;
    this.inferences = 0;
    this.inferenceLimitExceeded = false;
    this.maxMemoryBytes = options.maxMemoryBytes ?? softHeapLimit();
    this.memoryRecovery = options.memoryRecovery ?? {
      active: false,
      reservationBytes: 0,
      checks: 0,
    };
    this.nextMemoryCheck = 0;
    // Do not impose an implicit answer cap. Infinite and very large searches are
    // part of normal Prolog semantics; callers that need a resource bound can
    // still supply solutionLimit explicitly.
    this.solutionLimit = options.solutionLimit ?? Infinity;
    this.solutionsSeen = 0;
    // Meta-call fast path: a caller may bypass automatic tabling only for
    // recursion proven to consume a list tail on every recursive step.
    this.skipListTailTabling = options.skipListTailTabling === true;
    this.prologFlags = options.prologFlags ?? defaultPrologFlags('error', this.isoStrict);
    if (this.isoStrict) {
      for (const name of [...this.prologFlags.keys()]) {
        if (!ISO_CORE_FLAG_NAMES.has(name)) this.prologFlags.delete(name);
      }
    }
    this.occursCheckHandler = (left, right, env) => {
      if (this.prologFlags.get('occurs_check')?.value?.name === 'error') {
        raiseOccursCheckError(left, right, env);
      }
    };
    this.charConversions = options.charConversions ?? new Map();
    if (!options.prologFlags) {
      if (['chars', 'codes', 'atom'].includes(program.doubleQuotes)) {
        this.prologFlags.get('double_quotes').value = compound(program.doubleQuotes, []);
      }
      for (const [flag, value] of program.prologFlagDirectives ?? []) {
        if (flag.type === 'var' || value.type === 'var') throw new PrologError('instantiation_error');
        if (flag.type !== 'atom') throw new PrologError('type_error(atom)', flag);
        const definition = this.prologFlags.get(flag.name);
        if (!definition) throw new PrologError('domain_error(prolog_flag)', flag);
        if (value.type !== 'atom' || !definition.allowed.includes(value.name)) {
          throw new PrologError('domain_error(flag_value)', compound('+', [flag, value]));
        }
        if (!definition.changeable) throw new PrologError('permission_error(modify, flag)', flag);
        definition.value = value;
      }
    }
    if (!options.charConversions) {
      for (const [input, output] of program.charConversionDirectives ?? []) {
        if (input.type === 'atom' && output.type === 'atom' &&
            Array.from(input.name).length === 1 && Array.from(output.name).length === 1) {
          if (input.name === output.name) this.charConversions.delete(input.name);
          else this.charConversions.set(input.name, output.name);
        }
      }
    }
    this.io = options.io ?? new StreamManager(options.ioOptions);
    this.solveStacks = [];
    this.active = [];
    this.cutEpoch = 0;
    this.memo = new Map();
    this.subsumptiveMemo = new Map();
    this.wfsModels = new Map();
    this.datalogModels = new Map();
    this.tableCoordinator = null;
    this.groundChainSuccess = new Set();
    this.compactChainSuccess = new Map();
    // Bounded table caches for isolated meta-call domains such as phrase/2-3.
    // They deliberately do not share the caller's general memo: a stream of
    // distinct meta-call inputs must not turn completed table variants into
    // process-lifetime roots.
    this.innerTableScopes = options.innerTableScopes ?? new Map();
    this.stats = {
      completed_goal_lists: 0,
      solve_goals_calls: 0,
      solve_one_goal_calls: 0,
      unify_calls: 0,
      max_depth: 0,
      max_goal_count: 0,
      deterministic_builtin_successes: 0,
      deterministic_builtin_failures: 0,
      table_fixpoint_rounds: 0,
      datalog_evaluations: 0,
      datalog_rule_firings: 0,
      datalog_facts_derived: 0,
      wfs_fixpoint_rounds: 0,
      wfs_undefined_answers: 0,
    };
  }

  cloneForInnerGoal(solutionLimit = this.solutionLimit, options = {}) {
    const solver = new Solver(this.program, {
      registry: this.registry,
      maxDepth: this.maxDepth,
      maxInferences: this.maxInferences,
      maxMemoryBytes: this.maxMemoryBytes,
      memoryRecovery: this.memoryRecovery,
      solutionLimit,
      isoStrict: this.isoStrict,
      prologFlags: this.prologFlags,
      charConversions: this.charConversions,
      io: this.io,
      innerTableScopes: this.innerTableScopes,
      skipListTailTabling: options.skipListTailTabling ?? this.skipListTailTabling,
    });
    if (options.tableScope != null) {
      const scope = this.innerTableScope(options.tableScope, options.tableScopeSignature ?? null);
      solver.memo = scope.memo;
      solver.subsumptiveMemo = scope.subsumptiveMemo;
    } else {
      solver.memo = this.memo;
      solver.subsumptiveMemo = this.subsumptiveMemo;
    }
    solver.wfsModels = this.wfsModels;
    solver.datalogModels = this.datalogModels;
    solver.groundChainSuccess = this.groundChainSuccess;
    solver.compactChainSuccess = this.compactChainSuccess;
    return solver;
  }

  innerTableScope(name, signature = null) {
    let scope = this.innerTableScopes.get(name);
    if (scope == null) {
      scope = { memo: new Map(), subsumptiveMemo: new Map(), signature };
      this.innerTableScopes.set(name, scope);
      return scope;
    }
    if (signature == null || scope.signature === signature) return scope;

    // Keep at most one completed invocation variant for isolated meta-call
    // domains. Reusing the same phrase/2-3 call remains fast, while a stream of
    // distinct inputs releases the previous table as one unit instead of
    // churning thousands of individual memo entries. A nested meta-call must
    // not invalidate an active fixed point, so it receives a temporary scope.
    for (const entry of scope.memo.values()) {
      if (entry?.computing === true) {
        return { memo: new Map(), subsumptiveMemo: new Map(), signature };
      }
    }
    scope.memo.clear();
    scope.subsumptiveMemo.clear();
    scope.signature = signature;
    return scope;
  }

  innerTableSignature(terms, env, prefix = '') {
    const variables = new Map();
    return prefix + terms.map((term) => canonicalTermKey(term, env, variables)).join('|');
  }

  trimInnerTableScope(name, limit = DEFAULT_INNER_TABLE_SCOPE_LIMIT) {
    const scope = this.innerTableScopes.get(name);
    if (scope == null || scope.memo.size <= limit) return;
    // Map iteration is insertion ordered. Delete completed entries directly by
    // key as we encounter them so a steady stream of distinct meta-call inputs
    // pays O(evictions), not an O(cache-size) rescan for every phrase/2 call.
    // Active fixed-point entries are skipped and can only make the cache
    // temporarily exceed its soft bound.
    for (const [key, entry] of scope.memo) {
      if (scope.memo.size <= limit) break;
      if (entry?.complete !== true || entry?.computing === true) continue;
      scope.memo.delete(key);
      if (scope.subsumptiveMemo.size !== 0) {
        for (const [broadKey, broadEntry] of scope.subsumptiveMemo) {
          if (broadEntry === entry) scope.subsumptiveMemo.delete(broadKey);
        }
      }
    }
  }

  syncProgramRevision() {
    if (!this.mutableProgram) {
      if (this.program.mutable !== true) return;
      this.mutableProgram = true;
    }
    const revision = this.program.revision ?? 0;
    if (revision === this.programRevision) return;
    this.programRevision = revision;
    this.memo.clear();
    this.subsumptiveMemo.clear();
    this.wfsModels.clear();
    this.datalogModels.clear();
    this.tableCoordinator = null;
    this.groundChainSuccess.clear();
    this.compactChainSuccess.clear();
    for (const scope of this.innerTableScopes.values()) {
      scope.memo.clear();
      scope.subsumptiveMemo.clear();
    }
  }

  absorbStatsFrom(child) {
    if (!child || child === this || !child.stats) return;
    this.depthLimitExceeded ||= child.depthLimitExceeded;
    this.inferenceLimitExceeded ||= child.inferenceLimitExceeded;
    for (const [key, value] of Object.entries(child.stats)) {
      if (key === 'max_depth' || key === 'max_goal_count') {
        this.stats[key] = Math.max(this.stats[key] ?? 0, value ?? 0);
      } else {
        this.stats[key] = (this.stats[key] ?? 0) + (value ?? 0);
      }
    }
  }

  runInitializations() {
    for (const goal of this.program.initializations ?? []) {
      let succeeded = false;
      for (const _ of this.solve([goal], new Env(), 0)) {
        succeeded = true;
        break;
      }
      if (!succeeded) throw new PrologError('initialization_error');
    }
  }

  *solve(goals, env = new Env(), depth = 0) {
    if (!Array.isArray(goals)) goals = [goals];
    env.setOccursCheckHandler(this.occursCheckHandler);

    const savedActive = this.active;
    let registeredStack = null;
    try {
      const stack = [{ kind: 'goals', goals, env, depth, active: savedActive.slice() }];
      registeredStack = stack;
      this.solveStacks.push(stack);
      while (stack.length) {
      this.inferences++;
      this.checkMemoryLimit();
      if (this.inferences > this.maxInferences) {
        this.inferenceLimitExceeded = true;
        break;
      }
      const frame = stack.pop();
      this.syncProgramRevision();
      if (frame.kind === 'resumeBuiltin') {
        if (this.solutionsSeen >= this.solutionLimit) continue;
        const result = frame.iterator.next();
        if (result.done) continue;
        stack.push(frame);
        stack.push({
          kind: 'goals',
          goals: frame.goals,
          env: result.value,
          depth: frame.depth,
          active: frame.active,
        });
        continue;
      }
      if (frame.kind === 'completeTableFixpointRound') {
        if (frame.revision !== this.programRevision) continue;
        frame.entry.computing = false;
        const answerCount = frame.entry.answers.length;
        if (this.tableCoordinator?.cycleSeen && answerCount > frame.answerCountBefore) {
          scheduleTableFixpointRound(stack, this, frame);
        } else {
          for (const entry of this.tableCoordinator?.entries ?? [frame.entry]) {
            entry.computing = false;
            entry.complete = true;
          }
          this.tableCoordinator = null;
          pushMemoAnswerFrames(stack, frame.entry, frame.goal, frame.rest, frame.env, frame.depth, frame.active, this);
        }
        continue;
      }
      if (frame.kind === 'completeMemo') {
        if (frame.revision !== this.programRevision) continue;
        frame.entry.computing = false;
        frame.entry.complete = true;
        continue;
      }

      goals = frame.goals;
      env = frame.env;
      env.setOccursCheckHandler(this.occursCheckHandler);
      depth = frame.depth;
      let active = frame.active;

      while (true) {
        this.inferences++;
        this.checkMemoryLimit();
        if (this.inferences > this.maxInferences) {
          this.inferenceLimitExceeded = true;
          stack.length = 0;
          break;
        }
        this.syncProgramRevision();
        this.stats.solve_goals_calls++;
        this.stats.max_depth = Math.max(this.stats.max_depth, depth);
        this.stats.max_goal_count = Math.max(this.stats.max_goal_count, goals.length);
        if (depth > this.maxDepth) {
          this.depthLimitExceeded = true;
          break;
        }
        if (this.solutionsSeen >= this.solutionLimit) break;

        const readyDelays = env.takeReadyDelays();
        if (readyDelays.length > 0) {
          const awakened = readyDelays.map(({ goal, module }) => {
            const delayed = copyResolved(goal, env);
            qualifyTerm(delayed, module);
            return delayed;
          });
          goals = [...awakened, ...goals];
        }

        if (goals.length === 0) {
          if (!clpzStateConsistent(env)) break;
          this.solutionsSeen++;
          this.stats.completed_goal_lists++;
          this.active = active;
          yield env;
          break;
        }

        const first = goals[0];
        if (first?.kind === 'releaseActive') {
          active = active.slice(0, -1);
          goals = goals.slice(1);
          continue;
        }
        if (first?.kind === 'memoStore') {
          if (first.revision === this.programRevision) rememberMemoAnswer(first.entry, first.goal, env);
          if (goals.length === 1) break;
          goals = goals.slice(1);
          continue;
        }

        // EyeProlog normally solves left-to-right, but ready deterministic builtins can
        // be run early as pure filters. Stop at internal sentinels so rule-body
        // active guards are released before the caller's remaining goals are seen.
        const selectedIndex = selectReadyDeterministicBuiltin(goals, env, this.registry);
        const goal = deref(goals[selectedIndex], env);
        const rest = selectedIndex === 0 ? goals.slice(1) : [...goals.slice(0, selectedIndex), ...goals.slice(selectedIndex + 1)];
        if (goal.type === 'atom' && goal.name === '!' && goal.arity === 0) {
          const marker = active[active.length - 1] ?? null;
          if (marker) marker.cutEpoch = (marker.cutEpoch ?? 0) + 1;
          else this.cutEpoch++;
          for (const solveStack of this.solveStacks) {
            for (let i = solveStack.length - 1; i >= 0; i--) {
              if (marker == null || solveStack[i].active?.includes(marker)) solveStack.splice(i, 1);
            }
          }
          goals = rest;
          depth++;
          continue;
        }
        if (goal.type === COMPOUND && goal.name === ',' && goal.arity === 2) {
          goals = [...flattenConjunction(goal), ...rest];
          depth++;
          continue;
        }
        if (goal.type === COMPOUND && goal.name === ':' && goal.arity === 2) {
          const module = deref(goal.args[0], env);
          if (module.type === 'var') throw new PrologError('instantiation_error');
          if (module.type !== 'atom') throw new PrologError('type_error(atom)', module);
          const qualified = deref(goal.args[1], env);
          if (qualified.type !== COMPOUND && qualified.type !== 'atom') {
            throw new PrologError('type_error(callable)', qualified);
          }
          qualifyTerm(qualified, module.name);
          goals = [qualified, ...rest];
          depth++;
          continue;
        }

        if (goal.type === 'var') throw new PrologError('instantiation_error');
        const callable = goal.type === COMPOUND || goal.type === 'atom';
        if (!callable) throw new PrologError('type_error(callable)', goal);

        if (selectedIndex === 0) {
          const fused = findallLengthFusion(this, goal, rest, env);
          if (fused != null) {
            const firstResult = fused.iterator.next();
            if (firstResult.done) break;
            goals = fused.rest;
            env = firstResult.value;
            depth++;
            continue;
          }
        }

        const def = callable ? this.registry.get(goal.name, goal.arity) : null;
        this.active = active;
        if (def && builtinIsReadyOrAuthoritative(def, this, goal, env)) {
          const iterator = def.handler({ solver: this, goal, env });
          const firstResult = iterator.next();
          if (def.deterministic) {
            if (!firstResult.done) this.stats.deterministic_builtin_successes++;
            else this.stats.deterministic_builtin_failures++;
          }
          if (firstResult.done) break;
          if (!def.deterministic) {
            stack.push({
              kind: 'resumeBuiltin',
              iterator,
              goals: rest,
              depth: depth + 1,
              active,
            });
          }
          goals = rest;
          env = firstResult.value;
          depth++;
          continue;
        }

        this.stats.solve_one_goal_calls++;
        const group = this.program.findGroup(goal.name, goal.arity, goal.module ?? 'user');
        if (!group) {
          if (goal.name === '-->' && goal.arity === 2) {
            throw new PrologError(
              'existence_error(procedure)',
              compound('/', [compound('-->', []), numberTerm(2)]),
            );
          }
          if (this.prologFlags.get('unknown')?.value?.name === 'error') {
            throw new PrologError(
              'existence_error(procedure)',
              compound('/', [compound(goal.name, []), numberTerm(goal.arity)]),
            );
          }
          break;
        }
        qualifyMetaArguments(goal, group);

        if (group.datalogLeastModel === true && !termIsGround(goal, env)) {
          const model = this.datalogModelFor(group);
          const relation = relationForDatalogGroup(model, group);
          const iterator = datalogAnswerSolutions(this, relation, goal, env);
          const firstResult = iterator.next();
          if (firstResult.done) break;
          stack.push({
            kind: 'resumeBuiltin',
            iterator,
            goals: rest,
            depth: depth + 1,
            active,
          });
          goals = rest;
          env = firstResult.value;
          depth++;
          continue;
        }

        if (group.wfsDatalog === true) {
          const model = this.wfsModelFor(group);
          pushWfsAnswerFrames(stack, model, group, goal, rest, env, depth, active, this);
          break;
        }

        const memberIterator = bundledMemberIterator(this, group, goal, env);
        if (memberIterator != null) {
          const firstResult = memberIterator.next();
          if (firstResult.done) break;
          stack.push({
            kind: 'resumeBuiltin',
            iterator: memberIterator,
            goals: rest,
            depth: depth + 1,
            active,
          });
          goals = rest;
          env = firstResult.value;
          depth++;
          continue;
        }

        const lengthIterator = bundledLengthIterator(this, group, goal, env);
        if (lengthIterator != null) {
          const firstResult = lengthIterator.next();
          if (firstResult.done) break;
          stack.push({
            kind: 'resumeBuiltin',
            iterator: lengthIterator,
            goals: rest,
            depth: depth + 1,
            active,
          });
          goals = rest;
          env = firstResult.value;
          depth++;
          continue;
        }

        if (group.tabled && !(this.skipListTailTabling && group.listTailRecursive)) {
          const key = memoKey(goal, env, group);
          if (key.hasBound) {
            const mapKey = `${group.module}:${goal.name}/${goal.arity}:${key.text}`;
            const broadKey = `${group.module}:${goal.name}/${goal.arity}`;
            let entry = null;
            let usingBroadTable = false;
            if (group.tableAllVariants) {
              entry = this.subsumptiveMemo.get(broadKey) ?? null;
              usingBroadTable = entry != null;
              if (!entry && isMostGeneralTableGoal(goal, env)) {
                entry = makeMemoEntry(goal.arity);
                this.subsumptiveMemo.set(broadKey, entry);
                this.memo.set(mapKey, entry);
                usingBroadTable = true;
              }
            }
            if (!entry) {
              entry = this.memo.get(mapKey);
              if (!entry) {
                entry = makeMemoEntry(goal.arity);
                this.memo.set(mapKey, entry);
              }
            }
            if (this.tableCoordinator) this.tableCoordinator.entries.add(entry);
            if (entry.complete) {
              pushMemoAnswerFrames(stack, entry, goal, rest, env, depth, active, this);
              break;
            }
            if (!entry.computing) {
              if (!this.tableCoordinator) {
                this.tableCoordinator = { entry, cycleSeen: false, entries: new Set([entry]) };
                scheduleTableFixpointRound(stack, this, { entry, group, goal, rest, env, depth, active });
              } else {
                entry.computing = true;
                stack.push({ kind: 'completeMemo', entry, revision: this.programRevision });
                pushUserGoalUncachedFrames(stack, this, group, goal, [{ kind: 'memoStore', entry, goal, revision: this.programRevision }, ...rest], env, depth, active);
              }
              break;
            }
            if (this.tableCoordinator && (usingBroadTable || activeVariantIn(goal, env, active))) {
              this.tableCoordinator.cycleSeen = true;
            }
            pushMemoAnswerFrames(stack, entry, goal, rest, env, depth, active, this);
            break;
          }
        }

        if (!group.tabled && tryPushScalarFactRunFrames(stack, this, [goal, ...rest], env, depth, active)) break;
        pushUserGoalUncachedFrames(stack, this, group, goal, rest, env, depth, active);
        break;
      }
      }
    } catch (error) {
      const normalized = normalizeHostResourceError(error);
      if (normalized instanceof PrologError && normalized.formal === 'resource_error(memory)') {
        // Unwinding makes query-local terms unreachable, but hosts are free to
        // postpone collection. Give the shared solver family bounded breathing
        // room on its next query so a GC can observe those released references.
        if (!this.memoryRecovery.active) {
          this.memoryRecovery.active = true;
          this.memoryRecovery.reservationBytes = 1024 * 1024;
          this.memoryRecovery.checks = 16;
        }
      }
      throw normalized;
    } finally {
      const stackIndex = this.solveStacks.indexOf(registeredStack);
      if (stackIndex >= 0) this.solveStacks.splice(stackIndex, 1);
      this.active = savedActive;
    }
  }

  fastCountGoal(goal, env) {
    return fastCountPureGoal(this, goal, env);
  }

  fastGroundGoalTruth(goal, env) {
    return fastGroundPureGoalTruth(this, goal, env);
  }

  datalogModelFor(group) {
    let model = this.datalogModels.get(group);
    if (model) return model;
    model = evaluatePositiveDatalog(this.program, group);
    this.stats.datalog_evaluations++;
    this.stats.datalog_rule_firings += model.ruleFirings;
    this.stats.datalog_facts_derived += model.derivedFacts;
    for (const member of model.groups) {
      if (!this.datalogModels.has(member)) this.datalogModels.set(member, model);
    }
    this.datalogModels.set(group, model);
    return model;
  }

  wfsModelFor(group) {
    let model = this.wfsModels.get(group);
    if (model) return model;
    model = evaluateWfs(this.program, group);
    this.stats.wfs_fixpoint_rounds += model.rounds;
    this.wfsModels.set(group, model);
    return model;
  }

  *solveWfsGoal(group, goal, rest, env, depth) {
    const model = this.wfsModelFor(group);
    const relation = relationForGroup(model, group, 'upper');
    const lower = relationForGroup(model, group, 'lower');
    if (!relation) return;
    for (const row of relation.rows) {
      const next = env.clone();
      let ok = true;
      for (let i = 0; i < goal.arity; i++) {
        this.stats.unify_calls++;
        if (!unify(goal.args[i], row[i], next)) { ok = false; break; }
      }
      if (!ok) continue;
      if (!lower?.has(row)) this.stats.wfs_undefined_answers++;
      yield* this.solve(rest, next, depth + 1);
      if (this.solutionsSeen >= this.solutionLimit) return;
    }
  }

  *solveTabledNegation(argument, env) {
    const invoked = copyResolved(argument, env);
    if (invoked.type === VAR) throw new PrologError('instantiation_error');
    if (invoked.type !== COMPOUND && invoked.type !== 'atom') {
      throw new PrologError('type_error(callable)', invoked);
    }
    if (!termIsGround(invoked)) throw new PrologError('instantiation_error');
    const group = this.program.findGroup(invoked.name, invoked.arity, invoked.module ?? 'user');
    if (group?.wfsDatalog === true) {
      const model = this.wfsModelFor(group);
      const truth = truthOfGroundGoal(model, invoked);
      if (truth === 'true') return;
      if (truth === 'undefined') this.stats.wfs_undefined_answers++;
      yield env;
      return;
    }

    // Outside an unstratified WFS component, a ground tabled negation has the
    // ordinary two-valued result after the positive goal is evaluated.
    const child = this.cloneForInnerGoal(1);
    for (const _ of child.solve([invoked], env.clone(), 0)) {
      this.absorbStatsFrom(child);
      return;
    }
    this.absorbStatsFrom(child);
    yield env;
  }

  activeVariant(goal, env) {
    return activeVariantIn(goal, env, this.active);
  }

  checkMemoryLimit(force = false) {
    if (!force && this.inferences < this.nextMemoryCheck) return;
    this.nextMemoryCheck = this.inferences + 256;
    if (!Number.isFinite(this.maxMemoryBytes)) return;
    const used = usedHeapSize();
    if (used != null && used < this.maxMemoryBytes) this.finishMemoryRecovery();
    if (used != null && used >= this.currentMemoryLimit()) {
      if (this.memoryRecovery.active && this.memoryRecovery.checks > 0) {
        this.memoryRecovery.checks--;
        return;
      }
      throw new PrologError('resource_error(memory)');
    }
  }

  checkMemoryReservation(bytes) {
    if (!Number.isFinite(this.maxMemoryBytes) || !Number.isFinite(bytes) || bytes <= 0) return;
    const used = usedHeapSize();
    if (used != null && used < this.maxMemoryBytes) this.finishMemoryRecovery();
    if (used != null && bytes > Math.max(0, this.currentMemoryLimit() - used)) {
      if (this.memoryRecovery.active && bytes <= this.memoryRecovery.reservationBytes) {
        this.memoryRecovery.reservationBytes -= bytes;
        return;
      }
      throw new PrologError('resource_error(memory)');
    }
  }

  currentMemoryLimit() {
    if (!this.memoryRecovery.active) return this.maxMemoryBytes;
    // Retain at least five percent of the actual host ceiling for error
    // construction and unwinding. For an embedder-supplied lower soft limit,
    // cap the temporary recovery window as well.
    const hostSafetyLimit = hardHeapLimit() * 0.95;
    const recoveryAllowance = Math.max(8 * 1024 * 1024, this.maxMemoryBytes * 0.125);
    return Math.min(hostSafetyLimit, this.maxMemoryBytes + recoveryAllowance);
  }

  finishMemoryRecovery() {
    this.memoryRecovery.active = false;
    this.memoryRecovery.reservationBytes = 0;
    this.memoryRecovery.checks = 0;
  }

  *solveUserGoal(goal, rest, env, depth) {
    this.stats.solve_one_goal_calls++;
    if (depth > this.maxDepth) {
      this.depthLimitExceeded = true;
      return;
    }
    if (this.solutionsSeen >= this.solutionLimit) return;
    if (goal.type !== COMPOUND && goal.type !== 'atom') return;
    const group = this.program.findGroup(goal.name, goal.arity, goal.module ?? 'user');
    if (!group) return;
    qualifyMetaArguments(goal, group);
    if (group.datalogLeastModel === true && !termIsGround(goal, env)) {
      yield* this.solveDatalogGoal(group, goal, rest, env, depth);
      return;
    }
    if (group.wfsDatalog === true) {
      yield* this.solveWfsGoal(group, goal, rest, env, depth);
      return;
    }
    if (group.tabled) {
      yield* this.solveMemoizedGoal(group, goal, rest, env, depth);
      return;
    }
    yield* this.solveUserGoalUncached(group, goal, rest, env, depth);
  }

  *solveDatalogGoal(group, goal, rest, env, depth) {
    const model = this.datalogModelFor(group);
    const relation = relationForDatalogGroup(model, group);
    for (const next of datalogAnswerSolutions(this, relation, goal, env)) {
      yield* this.solve(rest, next, depth + 1);
      if (this.solutionsSeen >= this.solutionLimit) return;
    }
  }

  *solveMemoizedGoal(group, goal, rest, env, depth) {
    yield* this.solve([goal, ...rest], env, depth);
  }

  *solveUserGoalUncached(group, goal, rest, env, depth) {
    if (group.recursive && !group.cutRecursive && !group.linearNumeric && this.activeVariant(goal, env)) return;
    // Program indexes provide candidate clauses, but every candidate is still
    // freshened and unified below. The index is a performance hint, not a
    // semantic shortcut.
    const candidates = selectClauseCandidates(group, goal, env);
    for (const pass of [candidates.primary, candidates.fallback]) {
      for (let candidateIndex = 0; candidateIndex < clauseCandidateLength(pass); candidateIndex++) {
        const clause = clauseCandidateAt(pass, candidateIndex);
        if (clause.body.length === 0 && clause.scalarHead) {
          const next = matchScalarFact(goal, clause.head, env);
          if (!next) continue;
          this.stats.unify_calls++;
          yield* this.solve(rest, next, depth + 1);
          if (this.solutionsSeen >= this.solutionLimit) return;
          continue;
        }
        if (headCannotMatch(goal, clause.head, env)) continue;
        const id = nextFreshId();
        const freshVariables = new Map();
        const freshHead = freshTerm(clause.head, id, freshVariables);
        const freshBody = clause.body.map((term) => freshTerm(term, id, freshVariables));
        const next = env.clone();
        this.stats.unify_calls++;
        if (!unify(goal, freshHead, next)) continue;
        if (freshBody.length === 0) {
          yield* this.solve(rest, next, depth + 1);
        } else if (!groupNeedsActiveFrame(group)) {
          for (const bodyEnv of this.solve(freshBody, next, depth + 1)) {
            if (this.solutionsSeen > 0) this.solutionsSeen--;
            yield* this.solve(rest, bodyEnv, depth + 1);
            if (this.solutionsSeen >= this.solutionLimit) break;
          }
        } else {
          yield* this.solveRuleBodyThenRest(goal, env, freshBody, rest, next, depth);
        }
        if (this.solutionsSeen >= this.solutionLimit) return;
      }
    }
  }
  *solveRuleBodyThenRest(goal, goalEnv, body, rest, env, depth) {
    // Match the C engine's active-call lifetime: the active guard protects
    // expansion of the current rule body, but it must be released before
    // the caller's remaining goals are solved. Keeping the goal active
    // through rest goals over-prunes valid transitive/recursive derivations.
    this.active.push({ goal, env: goalEnv });
    for (const bodyEnv of this.solve(body, env, depth + 1)) {
      if (this.solutionsSeen > 0) this.solutionsSeen--;
      this.active.pop();
      yield* this.solve(rest, bodyEnv, depth + 1);
      this.active.push({ goal, env: goalEnv });
      if (this.solutionsSeen >= this.solutionLimit) break;
    }
    this.active.pop();
  }

}

function normalizeHostResourceError(error) {
  if (error?.name !== 'RangeError') return error;
  const message = String(error?.message ?? '');
  // V8 reports exhausted Map/Set capacity as a host RangeError.  ISO 7.12.2 h
  // requires processor resource exhaustion to surface as resource_error/1,
  // with the resource atom implementation dependent.  A finite host capacity
  // ceiling is reported as `memory`; reserve `finite_memory` for the separate
  // convention where no finite amount of memory can complete the computation.
  if (/^(?:Map|Set) maximum size exceeded$/.test(message)) {
    return new PrologError('resource_error(memory)');
  }
  return error;
}

function qualifyMetaArguments(goal, group) {
  const callerModule = goal.module ?? 'user';
  for (const index of group.metaArgumentPositions ?? []) {
    const argument = goal.args[index];
    if (argument && (argument.type === COMPOUND || argument.type === 'atom')) {
      qualifyTerm(argument, callerModule);
    }
  }
}

const ISO_CORE_FLAG_NAMES = new Set([
  'bounded', 'integer_rounding_function', 'char_conversion', 'debug',
  'max_integer', 'min_integer', 'max_arity', 'unknown', 'double_quotes',
]);

function defaultPrologFlags(unknown = 'error', strictIso = false) {
  const flags = new Map([
    ['bounded', { value: compound('false', []), allowed: ['false'], changeable: false }],
    ['integer_rounding_function', { value: compound('toward_zero', []), allowed: ['toward_zero'], changeable: false }],
    ['char_conversion', { value: compound('on', []), allowed: ['on', 'off'], changeable: true }],
    ['debug', { value: compound('off', []), allowed: ['on', 'off'], changeable: true }],
    ['max_integer', { value: compound('unbounded', []), allowed: ['unbounded'], changeable: false }],
    ['min_integer', { value: compound('unbounded', []), allowed: ['unbounded'], changeable: false }],
    ['max_arity', { value: compound('unbounded', []), allowed: ['unbounded'], changeable: false }],
    ['unknown', { value: compound(unknown, []), allowed: ['error', 'fail', 'warning'], changeable: true }],
    ['double_quotes', { value: compound('chars', []), allowed: ['chars', 'codes', 'atom'], changeable: true }],
    ['occurs_check', { value: compound('true', []), allowed: ['true', 'error'], changeable: true }],
  ]);
  if (strictIso) flags.delete('occurs_check');
  return flags;
}


function makeMemoEntry(arity = 0) {
  return {
    computing: false,
    complete: false,
    answers: [],
    answerKeys: new Set(),
    answerIndexes: Array.from({ length: arity }, () => new Map()),
    answerVariableFallbacks: Array.from({ length: arity }, () => []),
  };
}

function memoAnswerScalarKey(term) {
  if (term?.type !== 'atom' && term?.type !== 'string' && term?.type !== 'number') return null;
  return `${term.type}\u0000${term.type === 'number' ? numberValueKey(term.name) : term.name}`;
}

function isMostGeneralTableGoal(goal, env) {
  const seen = new Set();
  for (const arg of goal.args) {
    const value = derefForLocal(arg, env);
    if (value.type !== 'var' || seen.has(value.name)) return false;
    seen.add(value.name);
  }
  return true;
}

function scheduleTableFixpointRound(stack, solver, frame) {
  solver.stats.table_fixpoint_rounds++;
  solver.tableCoordinator.cycleSeen = false;
  for (const entry of solver.tableCoordinator.entries) {
    entry.computing = false;
    entry.complete = false;
  }
  frame.entry.computing = true;
  const nextFrame = {
    kind: 'completeTableFixpointRound',
    revision: solver.programRevision,
    entry: frame.entry,
    group: frame.group,
    goal: frame.goal,
    rest: frame.rest,
    env: frame.env,
    depth: frame.depth,
    active: frame.active,
    answerCountBefore: frame.entry.answers.length,
  };
  stack.push(nextFrame);
  pushUserGoalUncachedFrames(
    stack,
    solver,
    frame.group,
    frame.goal,
    [{ kind: 'memoStore', entry: frame.entry, goal: frame.goal, revision: solver.programRevision }],
    frame.env,
    frame.depth,
    frame.active,
  );
}


function pushMemoAnswerFrames(stack, entry, goal, rest, env, depth, active, solver) {
  let selected = null;
  for (let position = 0; position < goal.arity; position++) {
    const value = derefForLocal(goal.args[position], env);
    const key = memoAnswerScalarKey(value);
    if (key == null) continue;
    const bucket = entry.answerIndexes[position]?.get(key) ?? [];
    const fallback = entry.answerVariableFallbacks[position] ?? [];
    const candidateLength = bucket.length + fallback.length;
    if (selected == null || candidateLength < selected.length) {
      selected = { bucket, fallback, length: candidateLength };
    }
  }
  const replay = (answerIndex) => {
    const storedArgs = entry.answers[answerIndex];
    const answerArgs = storedArgs.every((arg) => termIsGround(arg))
      ? storedArgs
      : freshTerm(compound('$memo_answer', storedArgs), nextFreshId()).args;
    const next = env.clone();
    let ok = true;
    for (let i = 0; i < goal.arity; i++) {
      solver.stats.unify_calls++;
      if (!unify(goal.args[i], answerArgs[i], next)) { ok = false; break; }
    }
    if (ok) stack.push({ kind: 'goals', goals: rest, env: next, depth: depth + 1, active });
  };
  if (selected != null) {
    for (let i = selected.fallback.length - 1; i >= 0; i--) replay(selected.fallback[i]);
    for (let i = selected.bucket.length - 1; i >= 0; i--) replay(selected.bucket[i]);
    return;
  }
  for (let answerIndex = entry.answers.length - 1; answerIndex >= 0; answerIndex--) replay(answerIndex);
}

function pushUserGoalUncachedFrames(stack, solver, group, goal, rest, env, depth, active) {
  if (group.recursive && !group.cutRecursive && !group.linearNumeric && activeVariantIn(goal, env, active)) return;
  if (group.fastPi && pushFastPiFrames(stack, goal, rest, env, depth, active)) return;
  if (tryPushGroundScalarRuleFrame(stack, solver, group, goal, rest, env, depth, active)) return;
  if (tryPushGroundChainFrames(stack, solver, group, goal, rest, env, depth, active)) return;
  const candidates = selectClauseCandidates(group, goal, env);
  const frames = [];
  const invocation = { goal, env };
  // Active frames serve two purposes: they delimit cut and detect variants in
  // recursive user predicates. Cut-free, non-recursive library helpers need
  // neither. Copying their full active stack at every recursive step made
  // otherwise linear relations such as length/2 retain O(depth^2) references.
  const guarded = groupNeedsActiveFrame(group);
  const release = guarded ? [{ kind: 'releaseActive' }] : [];
  const nextActive = guarded ? [...active, invocation] : active;
  for (const pass of [candidates.primary, candidates.fallback]) {
    for (let candidateIndex = 0; candidateIndex < clauseCandidateLength(pass); candidateIndex++) {
      const clause = clauseCandidateAt(pass, candidateIndex);
      if (clause.body.length === 0 && clause.scalarHead) {
        const next = matchScalarFact(goal, clause.head, env);
        if (next) {
          solver.stats.unify_calls++;
          frames.push({
            kind: 'goals',
            goals: [...release, ...rest],
            env: next,
            depth: depth + 1,
            active: nextActive,
          });
        }
        continue;
      }
      if (headCannotMatch(goal, clause.head, env)) continue;
      const id = nextFreshId();
      const freshVariables = new Map();
      const freshHead = freshTerm(clause.head, id, freshVariables);
      const freshBody = clause.body.map((term) => freshTerm(term, id, freshVariables));
      const next = env.clone();
      solver.stats.unify_calls++;
      if (!unify(goal, freshHead, next)) continue;
      if (freshBody.length === 0) {
        frames.push({
          kind: 'goals',
          goals: [...release, ...rest],
          env: next,
          depth: depth + 1,
          active: nextActive,
        });
      } else {
        frames.push({
          kind: 'goals',
          goals: [...freshBody, ...release, ...rest],
          env: next,
          depth: depth + 1,
          active: nextActive,
        });
      }
    }
  }
  for (let i = frames.length - 1; i >= 0; i--) stack.push(frames[i]);
}

function groupNeedsActiveFrame(group) {
  // A direct recursive call that consumes the tail of a matched list cannot
  // revisit an earlier finite-tree call. It needs neither a cycle guard nor an
  // O(depth) copy of the active-call stack at every element.
  if (group.listTailRecursive === true && group.hasCut !== true) return false;
  // User code may observe the surrounding control context through later cuts,
  // so only apply this planning shortcut to the fixed bundled-library graph.
  if (group.bundledLibrary !== true) return true;
  // A frame is also required above a cut-bearing callee. The disjunction
  // builtin uses the caller marker to distinguish a callee-local cut from a
  // cut in its own branch. null means dependency analysis was intentionally
  // disabled (strict mode or a newly mutated group), so remain conservative.
  return group.cutReachable !== false || (group.recursive && !group.linearNumeric);
}

function* datalogAnswerSolutions(solver, relation, goal, env) {
  if (!relation) return;
  const candidates = datalogCandidateIndexes(
    relation,
    goal.args ?? [],
    env,
    derefForLocal,
    memoAnswerScalarKey,
  );
  const visit = function* (rowIndex) {
    const row = relation.rows[rowIndex];
    const next = env.clone();
    for (let i = 0; i < goal.arity; i++) {
      solver.stats.unify_calls++;
      if (!unify(goal.args[i], row[i], next)) return;
    }
    yield next;
  };
  if (candidates == null) {
    for (let rowIndex = 0; rowIndex < relation.rows.length; rowIndex++) yield* visit(rowIndex);
    return;
  }
  for (const rowIndex of candidates) yield* visit(rowIndex);
}

function pushWfsAnswerFrames(stack, model, group, goal, rest, env, depth, active, solver) {
  const relation = relationForGroup(model, group, 'upper');
  const lower = relationForGroup(model, group, 'lower');
  if (!relation) return;
  for (let rowIndex = relation.rows.length - 1; rowIndex >= 0; rowIndex--) {
    const row = relation.rows[rowIndex];
    const next = env.clone();
    let ok = true;
    for (let i = 0; i < goal.arity; i++) {
      solver.stats.unify_calls++;
      if (!unify(goal.args[i], row[i], next)) { ok = false; break; }
    }
    if (!ok) continue;
    if (!lower?.has(row)) solver.stats.wfs_undefined_answers++;
    stack.push({ kind: 'goals', goals: rest, env: next, depth: depth + 1, active });
  }
}

function bundledMemberIterator(solver, group, goal, env) {
  if (solver.registry.eyePrologLibrary !== true ||
      !['lists', 'prologue'].includes(group.module) || group.name !== 'member' || group.arity !== 2 ||
      group.bundledLibrary !== true || group.clauses.length !== 2) {
    return null;
  }

  // Keep the relational/open-list cases in ordinary Prolog.  When the second
  // argument is already a finite list, however, the canonical two-clause
  // member/2 definition is exactly a left-to-right scan and can avoid clause
  // freshening and recursive solver frames for every element.
  let cursor = deref(goal.args[1], env);
  while (isCons(cursor)) cursor = deref(cursor.args[1], env);
  if (!isEmptyList(cursor)) return null;
  return bundledMemberSolutions(solver, goal, env);
}

function* bundledMemberSolutions(solver, goal, env) {
  let cursor = deref(goal.args[1], env);
  while (isCons(cursor)) {
    const next = env.clone();
    solver.stats.unify_calls++;
    if (unify(goal.args[0], cursor.args[0], next)) yield next;
    cursor = deref(cursor.args[1], env);
  }
}

function bundledLengthIterator(solver, group, goal, env) {
  if (solver.registry.eyePrologLibrary !== true ||
      !['lists', 'prologue'].includes(group.module) || group.name !== 'length' || group.arity !== 2 ||
      group.bundledLibrary !== true || group.clauses.length !== 2) {
    return null;
  }

  // Delayed and constrained variables need the ordinary solver's wake-up
  // points. The fast path is deliberately limited to plain finite-tree terms.
  if (env._clpz != null) return null;
  const length = deref(goal.args[1], env);
  if (length.type === VAR && env._delays?.has(length.name)) return null;

  let cursor = deref(goal.args[0], env);
  // findall/3 can return an internal compact proper-list spine.  Its length is
  // already known; do not expand millions of lazy cons cells merely to decide
  // whether the bundled length/2 fast path is applicable.
  if (compactListLength(cursor) == null) {
    while (isCons(cursor)) {
      cursor = deref(cursor.args[1], env);
    }
    if (cursor.type === VAR) {
      if (env._delays?.has(cursor.name)) return null;
      if (length.type === VAR && cursor.name === length.name) return null;
    }
  }
  return bundledLengthSolutions(solver, goal, env);
}

function* bundledLengthSolutions(solver, goal, env) {
  const requestedLength = deref(goal.args[1], env);
  if (requestedLength.type !== VAR) {
    if (requestedLength.type !== NUMBER || !isDecimalInteger(requestedLength.name)) {
      throw new PrologError('type_error(integer)', requestedLength);
    }
    const length = BigInt(requestedLength.name);
    if (length < 0n) throw new PrologError('domain_error(not_less_than_zero)', requestedLength);
    yield* fixedLengthSolutions(solver, goal.args[0], length, env);
    return;
  }

  yield* generatedLengthSolutions(solver, goal.args[0], goal.args[1], env);
}

function* fixedLengthSolutions(solver, list, length, env) {
  let cursor = deref(list, env);
  const compactLength = compactListLength(cursor);
  if (compactLength != null) {
    if (compactLength === length) yield env;
    return;
  }
  let remaining = length;
  let steps = 0n;
  while (isCons(cursor)) {
    if (remaining === 0n) return;
    remaining--;
    cursor = deref(cursor.args[1], env);
    lengthAllocationCheckpoint(solver, ++steps);
  }
  if (isEmptyList(cursor)) {
    if (remaining === 0n) yield env;
    return;
  }
  if (cursor.type !== VAR) return;

  // A source-level anonymous variable occurs nowhere else, so materializing
  // its list cannot affect any subsequent goal or answer substitution.
  if (isAnonymousVariable(cursor)) {
    yield env;
    return;
  }

  if (remaining > BigInt(Number.MAX_SAFE_INTEGER)) throw new PrologError('resource_error(memory)');
  const id = nextFreshId();
  // Keep an unobserved fixed-length list as one compact skeleton. Unification,
  // list predicates, and readback expand it one cell at a time if its elements
  // are actually inspected.
  solver.checkMemoryReservation(256);
  const suffix = compactVariableList(remaining, `__length${id}_`);
  const next = env.clone();
  solver.stats.unify_calls++;
  // cursor is dereferenced and the compact skeleton contains only freshly
  // generated variables, so this binding cannot create a cycle. Binding it
  // directly avoids traversing and expanding the new skeleton for an occurs
  // check whose result is known by construction.
  next.bind(cursor.name, suffix);
  yield next;
}

function* generatedLengthSolutions(solver, list, length, env) {
  let cursor = deref(list, env);
  const compactLength = compactListLength(cursor);
  if (compactLength != null) {
    const next = bindGeneratedLength(solver, length, compactLength, env);
    if (next != null) yield next;
    return;
  }
  let count = 0n;
  let steps = 0n;
  while (isCons(cursor)) {
    count++;
    cursor = deref(cursor.args[1], env);
    lengthAllocationCheckpoint(solver, ++steps);
  }
  if (isEmptyList(cursor)) {
    const next = bindGeneratedLength(solver, length, count, env);
    if (next != null) yield next;
    return;
  }
  if (cursor.type !== VAR) return;

  if (isAnonymousVariable(cursor)) {
    for (let value = count; ; value++) {
      const next = bindGeneratedLength(solver, length, value, env);
      if (next != null) yield next;
    }
  }

  const id = nextFreshId();
  let suffix = emptyList();
  for (let extra = 0n; ; extra++) {
    const next = env.clone();
    solver.stats.unify_calls++;
    if (unify(cursor, suffix, next)) {
      const answer = bindGeneratedLength(solver, length, count + extra, next);
      if (answer != null) yield answer;
    }
    suffix = cons(variable(`__length${id}_${extra}`), suffix);
    lengthAllocationCheckpoint(solver, ++steps);
  }
}

function bindGeneratedLength(solver, length, value, env) {
  const next = env.clone();
  solver.stats.unify_calls++;
  return unify(length, numberTerm(value), next) ? next : null;
}

function isAnonymousVariable(term) {
  return term.type === VAR && term.name.startsWith('__anon');
}

function lengthAllocationCheckpoint(solver, steps) {
  if ((steps & 255n) === 0n) solver.checkMemoryLimit(true);
}

function pushFastPiFrames(stack, goal, rest, env, depth, active) {
  const values = goal.args.map((arg) => deref(arg, env));
  if ([0, 1, 2, 4].some((index) => values[index].type !== 'number')) return false;
  let a = Number(values[0].name);
  const b = Number(values[1].name);
  let sum = Number(values[2].name);
  let sign = Number(values[4].name);
  if (![a, b, sum, sign].every(Number.isFinite) || a > b) return true;
  while (a < b) {
    sum += sign / (2 * a * (2 * a + 1) * (2 * a + 2));
    a += 1;
    sign = -sign;
  }
  const next = env.clone();
  if (!unify(goal.args[3], numberTerm(numberTextFromDouble(sum)), next)) return true;
  stack.push({ kind: 'goals', goals: rest, env: next, depth: depth + 1, active });
  return true;
}



function fastGroundPureGoalTruth(solver, goal, env = new Env(), visiting = new Set()) {
  if (!termIsGround(goal, env)) return null;
  const resolved = copyResolved(goal, env);
  if (resolved.type !== COMPOUND && resolved.type !== 'atom') return null;
  const group = solver.program.findGroup(resolved.name, resolved.arity, resolved.module ?? 'user');
  if (!group || group.hasCut || group.wfsDatalog) return null;

  if (group.datalogLeastModel === true) {
    const model = solver.datalogModelFor(group);
    const relation = relationForDatalogGroup(model, group);
    return relation?.has(resolved.args ?? []) ?? false;
  }

  if (group.scalarFactsOnly) {
    const candidates = selectGroundClauseCandidates(group, resolved);
    for (let index = 0; index < clauseCandidateLength(candidates); index++) {
      const clause = clauseCandidateAt(candidates, index);
      if (matchGroundClause(resolved, clause)?.done) return true;
    }
    return false;
  }

  if (group.recursive || group.tabled) return null;
  const key = `${group.module}:${group.name}/${group.arity}`;
  if (visiting.has(key)) return null;
  const nextVisiting = new Set(visiting);
  nextVisiting.add(key);

  const candidates = selectGroundClauseCandidates(group, resolved);
  for (let candidateIndex = 0; candidateIndex < clauseCandidateLength(candidates); candidateIndex++) {
    const clause = clauseCandidateAt(candidates, candidateIndex);
    const bindings = new Map();
    let headMatches = true;
    for (let i = 0; i < resolved.arity; i++) {
      const pattern = clause.head.args[i];
      const value = resolved.args[i];
      if (pattern.type === 'var') {
        const previous = bindings.get(pattern.name);
        if (previous == null) bindings.set(pattern.name, value);
        else if (!sameGroundTerm(previous, value)) { headMatches = false; break; }
      } else if (isScalarTerm(pattern)) {
        if (!sameScalarTerm(pattern, value)) { headMatches = false; break; }
      } else {
        return null;
      }
    }
    if (!headMatches) continue;

    let clauseTrue = true;
    for (const body of clause.body) {
      if (body.type !== COMPOUND && body.type !== 'atom') return null;
      const args = [];
      for (const arg of body.args ?? []) {
        if (arg.type === 'var') {
          const value = bindings.get(arg.name);
          if (value == null) return null;
          args.push(value);
        } else if (isScalarTerm(arg)) {
          args.push(arg);
        } else {
          return null;
        }
      }
      const bodyGoal = body.type === 'atom' ? body : compound(body.name, args);
      if (body.module != null) bodyGoal.module = body.module;
      const truth = fastGroundPureGoalTruth(solver, bodyGoal, new Env(), nextVisiting);
      if (truth == null) return null;
      if (!truth) { clauseTrue = false; break; }
    }
    if (clauseTrue) return true;
  }
  return false;
}

function termReferencesResolvedVariable(term, variableName, env) {
  const pending = [term];
  const seen = new Set();
  while (pending.length > 0) {
    const value = derefForLocal(pending.pop(), env);
    if (value.type === 'var') {
      if (value.name === variableName) return true;
      continue;
    }
    if (value.type !== COMPOUND || seen.has(value)) continue;
    seen.add(value);
    for (const arg of value.args) pending.push(arg);
  }
  return false;
}

function envHasObservableAliasTo(variableName, env) {
  for (let state = env?._state; state != null; state = state.parent) {
    if (state.bindingName != null && state.bindingName !== variableName &&
        termReferencesResolvedVariable(state.bindingValue, variableName, env)) return true;
    if (state.bindings) {
      for (const [name, value] of state.bindings) {
        if (name !== variableName && termReferencesResolvedVariable(value, variableName, env)) return true;
      }
    }
  }
  return false;
}

function* fusedFindallLengthSolutions(solver, innerGoal, countArg, env) {
  const invoked = copyResolved(innerGoal, env);
  if (invoked.type !== COMPOUND && invoked.type !== 'atom') return;
  let count = fastCountPureGoal(solver, invoked, env);
  if (count != null) {
    // findall/3's existing collector intentionally carries a ten-million
    // solution safety cap. Preserve that observable bound in the fused path.
    if (count > 10000000n) count = 10000000n;
  } else {
    const child = solver.cloneForInnerGoal(10000000);
    count = 0n;
    try {
      for (const _ of child.solve([invoked], env.clone(), 0)) count++;
    } finally {
      solver.absorbStatsFrom(child);
    }
  }
  const next = env.clone();
  if (unify(countArg, numberTerm(count), next)) yield next;
}

function findallLengthFusion(solver, goal, rest, env) {
  if (goal.type !== COMPOUND || goal.name !== 'findall' || goal.arity !== 3 || rest.length === 0) return null;
  const bag = derefForLocal(goal.args[2], env);
  if (bag.type !== 'var') return null;

  const lengthGoal = derefForLocal(rest[0], env);
  if (lengthGoal.type !== COMPOUND || lengthGoal.name !== 'length' || lengthGoal.arity !== 2) return null;
  const lengthGroup = solver.program.findGroup('length', 2, lengthGoal.module ?? 'user');
  if (!lengthGroup || lengthGroup.bundledLibrary !== true ||
      !['lists', 'prologue'].includes(lengthGroup.module)) return null;
  const lengthList = derefForLocal(lengthGoal.args[0], env);
  const countArg = derefForLocal(lengthGoal.args[1], env);
  if (lengthList.type !== 'var' || lengthList.name !== bag.name || countArg.type !== 'var') return null;
  if (envHasObservableAliasTo(bag.name, env)) return null;

  // The bag may be elided only when no other part of the computation can
  // observe it.  In particular, sharing it with Template or Goal changes
  // findall/3's variable-scoping behavior and must stay on the ordinary path.
  if (termReferencesResolvedVariable(goal.args[0], bag.name, env) ||
      termReferencesResolvedVariable(goal.args[1], bag.name, env) ||
      termReferencesResolvedVariable(lengthGoal.args[1], bag.name, env)) return null;
  for (let i = 1; i < rest.length; i++) {
    if (termReferencesResolvedVariable(rest[i], bag.name, env)) return null;
  }

  return {
    iterator: fusedFindallLengthSolutions(solver, goal.args[1], lengthGoal.args[1], env),
    rest: rest.slice(1),
  };
}

function countPlanTermIsFlat(term) {
  return term?.type === 'var' || isScalarTerm(term);
}

function expandPureCountGoal(solver, goal, callerModule, visiting, budget) {
  if ((goal.type !== COMPOUND && goal.type !== 'atom') ||
      !(goal.args ?? []).every(countPlanTermIsFlat)) return null;
  const group = solver.program.findGroup(goal.name, goal.arity, goal.module ?? callerModule ?? 'user');
  if (!group || group.hasCut || group.recursive || group.tabled || group.wfsDatalog || group.datalogLeastModel) return null;
  if (group.scalarFactsOnly) return [{ equalities: [], leaves: [{ goal, group }] }];

  const key = `${group.module}:${group.name}/${group.arity}`;
  if (visiting.has(key)) return null;
  const nextVisiting = new Set(visiting);
  nextVisiting.add(key);
  const out = [];

  for (const clause of group.clauses) {
    if (budget.remaining-- <= 0) return null;
    const id = nextFreshId();
    const variables = new Map();
    const head = freshTerm(clause.head, `count${id}`, variables);
    const body = clause.body.map((term) => freshTerm(term, `count${id}`, variables));
    if (!(head.args ?? []).every(countPlanTermIsFlat)) return null;
    let branches = [{
      equalities: (goal.args ?? []).map((arg, index) => [arg, head.args[index]]),
      leaves: [],
    }];

    for (const bodyGoal of body) {
      const expanded = expandPureCountGoal(solver, bodyGoal, group.module, nextVisiting, budget);
      if (expanded == null) return null;
      const combined = [];
      for (const left of branches) {
        for (const right of expanded) {
          combined.push({
            equalities: [...left.equalities, ...right.equalities],
            leaves: [...left.leaves, ...right.leaves],
          });
          if (combined.length > 4096) return null;
        }
      }
      branches = combined;
    }
    out.push(...branches);
    if (out.length > 4096) return null;
  }
  return out;
}

function countPlanDeref(term, env, bindings) {
  let current = term;
  const seen = new Set();
  while (current?.type === 'var') {
    if (seen.has(current.name)) break;
    seen.add(current.name);
    const local = bindings.get(current.name);
    if (local !== undefined) {
      current = local;
      continue;
    }
    const outer = env.get(current.name);
    if (outer !== undefined) {
      current = outer;
      continue;
    }
    break;
  }
  return current;
}

function countPlanUnify(left, right, env, bindings, trail) {
  const a = countPlanDeref(left, env, bindings);
  const b = countPlanDeref(right, env, bindings);
  if (a.type === 'var') {
    if (b.type === 'var' && a.name === b.name) return true;
    bindings.set(a.name, b);
    trail.push(a.name);
    return true;
  }
  if (b.type === 'var') {
    bindings.set(b.name, a);
    trail.push(b.name);
    return true;
  }
  return sameScalarTerm(a, b);
}

function undoCountBindings(bindings, trail, start) {
  for (let i = trail.length - 1; i >= start; i--) bindings.delete(trail[i]);
  trail.length = start;
}

function countLeafCandidateParts(leaf, env, bindings) {
  const positions = [];
  const values = [];
  for (let i = 0; i < leaf.goal.arity; i++) {
    const value = countPlanDeref(leaf.goal.args[i], env, bindings);
    if (!isScalarTerm(value)) continue;
    positions.push(i);
    values.push(value);
  }
  return selectClauseCandidatesForValues(leaf.group, positions, values);
}

function countCandidateTotal(parts) {
  return clauseCandidateLength(parts.primary) + clauseCandidateLength(parts.fallback);
}

function fastCountBranch(branch, env) {
  const bindings = new Map();
  const trail = [];
  for (const [left, right] of branch.equalities) {
    if (!countPlanUnify(left, right, env, bindings, trail)) return 0n;
  }

  let numberCount = 0;
  let bigCount = null;
  const increment = () => {
    if (bigCount != null) {
      bigCount++;
    } else if (numberCount < Number.MAX_SAFE_INTEGER) {
      numberCount++;
    } else {
      bigCount = BigInt(numberCount) + 1n;
    }
  };

  const remaining = branch.leaves.map((_, index) => index);
  const visit = (active) => {
    if (active.length === 0) {
      increment();
      return;
    }

    let bestPosition = 0;
    let bestParts = null;
    let bestLength = Infinity;
    for (let position = 0; position < active.length; position++) {
      const leaf = branch.leaves[active[position]];
      const parts = countLeafCandidateParts(leaf, env, bindings);
      const length = countCandidateTotal(parts);
      if (length < bestLength) {
        bestLength = length;
        bestPosition = position;
        bestParts = parts;
        if (length === 0) return;
      }
    }

    const leafIndex = active[bestPosition];
    const leaf = branch.leaves[leafIndex];
    const nextActive = active.length === 1
      ? []
      : [...active.slice(0, bestPosition), ...active.slice(bestPosition + 1)];
    for (const pass of [bestParts.primary, bestParts.fallback]) {
      for (let candidateIndex = 0; candidateIndex < clauseCandidateLength(pass); candidateIndex++) {
        const clause = clauseCandidateAt(pass, candidateIndex);
        const start = trail.length;
        let ok = true;
        for (let i = 0; i < leaf.goal.arity; i++) {
          if (!countPlanUnify(leaf.goal.args[i], clause.head.args[i], env, bindings, trail)) {
            ok = false;
            break;
          }
        }
        if (ok) visit(nextActive);
        undoCountBindings(bindings, trail, start);
      }
    }
  };

  visit(remaining);
  return bigCount ?? BigInt(numberCount);
}

function fastCountPureGoal(solver, goal, env) {
  if (solver.isoStrict || solver.solutionLimit !== Infinity || solver.maxInferences !== Infinity ||
      env._clpz != null || (env._delays != null && env._delays.size !== 0)) return null;
  const budget = { remaining: 8192 };
  const branches = expandPureCountGoal(solver, goal, goal.module ?? 'user', new Set(), budget);
  if (branches == null) return null;
  let count = 0n;
  for (const branch of branches) count += fastCountBranch(branch, env);
  return count;
}

function tryPushScalarFactRunFrames(stack, solver, goals, env, depth, active) {
  // Consecutive scalar-fact lookups are common in data-heavy joins.  Short
  // joins are fastest when their continuation frames are materialized locally;
  // wide joins can explode combinatorially, so they are streamed lazily.
  let runLength = 0;
  const groups = [];
  while (runLength < goals.length) {
    const goal = goals[runLength];
    if (!goal || goal.kind === 'releaseActive' || goal.kind === 'memoStore') break;
    if (goal.type !== COMPOUND) break;
    const def = solver.registry.get(goal.name, goal.arity);
    if (def) break;
    const group = solver.program.findGroup(goal.name, goal.arity, goal.module ?? 'user');
    if (!group || group.tabled || !group.scalarFactsOnly) break;
    groups.push(group);
    runLength++;
  }
  if (runLength < 2) return false;

  const runGoals = goals.slice(0, runLength);
  const rest = goals.slice(runLength);
  if (runLength >= 4) {
    pushStreamingScalarFactRun(stack, solver, runGoals, groups, rest, env, depth, active);
    return true;
  }

  const localStack = [{ index: 0, names: [], values: [], depth }];
  const frames = [];
  const frameLimit = 100000;
  while (localStack.length) {
    const state = localStack.pop();
    solver.stats.max_depth = Math.max(solver.stats.max_depth, state.depth);
    if (state.index === runLength) {
      const next = env.clone();
      for (let i = 0; i < state.names.length; i++) next.bind(state.names[i], state.values[i]);
      frames.push({ kind: 'goals', goals: rest, env: next, depth: state.depth, active });
      if (frames.length > frameLimit) {
        // Do not repeat the old bug of abandoning the optimization and then
        // re-solving through the generic engine.  Restart this rare oversized
        // short join as a streaming local join instead.
        pushStreamingScalarFactRun(stack, solver, runGoals, groups, rest, env, depth, active);
        return true;
      }
      continue;
    }

    const goal = runGoals[state.index];
    if (activeMightContain(goal, active) && activeVariantIn(goal, envWithLocal(env, state.names, state.values), active)) continue;
    solver.stats.solve_one_goal_calls++;
    const candidates = selectScalarFactCandidates(groups[state.index], goal, env, state.names, state.values);
    const nextStates = [];
    for (const pass of [candidates.primary, candidates.fallback]) {
      for (let candidateIndex = 0; candidateIndex < clauseCandidateLength(pass); candidateIndex++) {
        const clause = clauseCandidateAt(pass, candidateIndex);
        const match = matchScalarFactLocal(goal, clause.head, env, state.names, state.values);
        if (!match) continue;
        solver.stats.unify_calls++;
        nextStates.push({ index: state.index + 1, names: match.names, values: match.values, depth: state.depth + 1 });
      }
    }
    for (let i = nextStates.length - 1; i >= 0; i--) localStack.push(nextStates[i]);
    if (solver.solutionsSeen >= solver.solutionLimit) break;
  }

  for (let i = frames.length - 1; i >= 0; i--) stack.push(frames[i]);
  return true;
}

function pushStreamingScalarFactRun(stack, solver, runGoals, groups, rest, env, depth, active) {
  const iterator = scalarFactRunSolutions(solver, runGoals, groups, env, depth, active);
  const first = iterator.next();
  if (first.done) return;
  stack.push({
    kind: 'resumeBuiltin',
    iterator,
    goals: rest,
    depth: depth + runGoals.length,
    active,
  });
  stack.push({
    kind: 'goals',
    goals: rest,
    env: first.value,
    depth: depth + runGoals.length,
    active,
  });
}

function* scalarFactRunSolutions(solver, goals, groups, env, depth, active) {
  const localStack = [{ index: 0, names: [], values: [] }];
  while (localStack.length) {
    const state = localStack.pop();
    solver.stats.max_depth = Math.max(solver.stats.max_depth, depth + state.index);
    if (state.index === goals.length) {
      const next = env.clone();
      for (let i = 0; i < state.names.length; i++) next.bind(state.names[i], state.values[i]);
      yield next;
      continue;
    }

    const goal = goals[state.index];
    if (activeMightContain(goal, active) && activeVariantIn(goal, envWithLocal(env, state.names, state.values), active)) continue;
    solver.stats.solve_one_goal_calls++;
    const candidates = selectScalarFactCandidates(groups[state.index], goal, env, state.names, state.values);
    const nextStates = [];
    for (const pass of [candidates.primary, candidates.fallback]) {
      for (let candidateIndex = 0; candidateIndex < clauseCandidateLength(pass); candidateIndex++) {
        const clause = clauseCandidateAt(pass, candidateIndex);
        const match = matchScalarFactLocal(goal, clause.head, env, state.names, state.values);
        if (!match) continue;
        solver.stats.unify_calls++;
        nextStates.push({ index: state.index + 1, names: match.names, values: match.values });
      }
    }
    for (let i = nextStates.length - 1; i >= 0; i--) localStack.push(nextStates[i]);
    if (solver.solutionsSeen >= solver.solutionLimit) return;
  }
}


function activeMightContain(goal, active) {
  if (active.length === 0 || goal.type !== COMPOUND) return false;
  for (const entry of active) {
    const activeGoal = entry.goal;
    if (activeGoal?.type === COMPOUND && activeGoal.name === goal.name && activeGoal.arity === goal.arity) return true;
  }
  return false;
}

function envWithLocal(env, names, values) {
  if (names.length === 0) return env;
  return {
    has(name) { return names.includes(name) || env.has(name); },
    get(name) {
      const index = names.indexOf(name);
      return index >= 0 ? values[index] : env.get(name);
    },
  };
}

function selectScalarFactCandidates(group, goal, env, names, values) {
  const positions = [];
  const boundValues = [];
  for (let i = 0; i < goal.arity; i++) {
    const arg = derefScalarMatch(goal.args[i], env, names, values);
    if (!isScalarTerm(arg)) continue;
    positions.push(i);
    boundValues.push(arg);
  }
  return selectClauseCandidatesForValues(group, positions, boundValues);
}

function matchScalarFactLocal(goal, head, env, names, values) {
  if (goal.type !== COMPOUND || head.type !== COMPOUND) return null;
  if (goal.name !== head.name || goal.arity !== head.arity) return null;

  let nextNames = names;
  let nextValues = values;
  for (let i = 0; i < goal.arity; i++) {
    const factArg = head.args[i];
    const arg = derefScalarMatch(goal.args[i], env, nextNames, nextValues);
    if (arg.type === 'var') {
      if (nextNames === names) {
        nextNames = names.slice();
        nextValues = values.slice();
      }
      nextNames.push(arg.name);
      nextValues.push(factArg);
      continue;
    }
    if (!sameScalarTerm(arg, factArg)) return null;
  }
  return { names: nextNames, values: nextValues };
}

function matchScalarFact(goal, head, env) {
  // A scalar ground fact has no variables to freshen and no compound structure
  // to traverse. Match the goal arguments directly and clone only after the
  // candidate has succeeded.
  if (goal.type !== COMPOUND || head.type !== COMPOUND) return null;
  if (goal.name !== head.name || goal.arity !== head.arity) return null;

  const names = [];
  const values = [];
  for (let i = 0; i < goal.arity; i++) {
    const factArg = head.args[i];
    let arg = derefScalarMatch(goal.args[i], env, names, values);
    if (arg.type === 'var') {
      names.push(arg.name);
      values.push(factArg);
      continue;
    }
    if (!sameScalarTerm(arg, factArg)) return null;
  }

  const next = env.clone();
  for (let i = 0; i < names.length; i++) next.bind(names[i], values[i]);
  return next;
}

function derefScalarMatch(term, env, names, values) {
  let current = term;
  for (let guard = 0; current?.type === 'var' && guard < 128; guard++) {
    const localIndex = names.indexOf(current.name);
    if (localIndex >= 0) current = values[localIndex];
    else if (env.has(current.name)) current = env.get(current.name);
    else break;
  }
  return current;
}

function scalarSetContainer() {
  return { atom: new Set(), string: new Set(), number: new Set() };
}

function compactChainCacheFor(solver, group, first) {
  let groupCache = solver.compactChainSuccess.get(group);
  if (!groupCache) {
    groupCache = { atom: new Map(), string: new Map(), number: new Map() };
    solver.compactChainSuccess.set(group, groupCache);
  }
  const byFirstName = groupCache[first.type];
  let cache = byFirstName.get(first.name);
  if (!cache) {
    cache = scalarSetContainer();
    byFirstName.set(first.name, cache);
  }
  return cache;
}

function rememberCompactChainSuccess(cache, seen) {
  for (const type of ['atom', 'string', 'number']) {
    let index = 0;
    const values = seen[type];
    const last = values.size - 1;
    for (const name of values) {
      if ((index & 63) === 0 || index === last) cache[type].add(name);
      index++;
    }
  }
}

function compactIndexBucket(index, type, name) {
  if (type === 'atom') return index.atomBuckets.get(name) ?? null;
  if (type === 'string') return index.stringBuckets.get(name) ?? null;
  if (type === 'number') return index.numberBuckets.get(name) ?? null;
  return null;
}

function tryPushCompactBinaryChainFrames(stack, solver, group, goal, rest, env, depth, active) {
  if (active.length !== 0 || goal.type !== COMPOUND || goal.arity !== 2) return false;
  const resolved = copyResolved(goal, env);
  const first = resolved.args[0];
  let secondType = resolved.args[1]?.type;
  let secondName = resolved.args[1]?.name;
  if (!isScalarTerm(first) || !['atom', 'string', 'number'].includes(secondType)) return false;

  const index = group.argIndexes[1];
  if (!index?.sawScalar || index.fallback.length !== 0) return false;
  const cache = compactChainCacheFor(solver, group, first);
  const seen = scalarSetContainer();
  let currentDepth = depth;

  while (true) {
    if (solver.solutionsSeen >= solver.solutionLimit) return true;
    solver.stats.max_depth = Math.max(solver.stats.max_depth, currentDepth);
    const seenSet = seen[secondType];
    if (!seenSet || seenSet.has(secondName)) return true;
    if (cache[secondType].has(secondName)) {
      rememberCompactChainSuccess(cache, seen);
      stack.push({ kind: 'goals', goals: rest, env, depth: depth + 1, active });
      return true;
    }
    seenSet.add(secondName);

    const candidates = compactIndexBucket(index, secondType, secondName);
    if (clauseCandidateLength(candidates) !== 1) return false;
    const clause = clauseCandidateAt(candidates, 0);
    if (clause?.compactBinary !== true || clause.headName !== group.name) return false;
    if (clause.head1Type !== secondType || clause.head1Name !== secondName) return true;
    if (clause.head0Type !== 'var' &&
        (clause.head0Type !== first.type || clause.head0Name !== first.name)) return true;

    if (clause.bodyName == null) {
      rememberCompactChainSuccess(cache, seen);
      stack.push({ kind: 'goals', goals: rest, env, depth: depth + 1, active });
      return true;
    }
    if (clause.bodyName !== group.name || clause.head0Type !== 'var' ||
        clause.body0Type !== 'var' || clause.body0Name !== clause.head0Name ||
        !['atom', 'string', 'number'].includes(clause.body1Type)) return false;

    secondType = clause.body1Type;
    secondName = clause.body1Name;
    currentDepth++;
  }
}

function tryPushGroundScalarRuleFrame(stack, solver, group, goal, rest, env, depth, active) {
  // A fully-ground call to a single flat rule can be checked without freshening
  // the rule or allocating an Env for every body literal.  This is especially
  // valuable for data-validation joins such as rb(A,B,C,D,E) in ORB Join2.
  if (!termIsGround(goal, env) || group.clauses.length !== 1) return false;
  const clause = group.clauses[0];
  if (clause?.compactBinary === true || clause.body.length < 2 || clause.head.type !== COMPOUND) return false;
  if (clause.head.name !== goal.name || clause.head.arity !== goal.arity) return false;

  const bindings = new Map();
  const resolvedGoal = copyResolved(goal, env);
  for (let i = 0; i < clause.head.arity; i++) {
    const pattern = clause.head.args[i];
    const value = resolvedGoal.args[i];
    if (pattern.type === 'var') {
      const previous = bindings.get(pattern.name);
      if (previous == null) bindings.set(pattern.name, value);
      else if (!sameGroundTerm(previous, value)) return true;
    } else if (isScalarTerm(pattern)) {
      if (!sameGroundTerm(pattern, value)) return true;
    } else {
      return false;
    }
  }

  for (const body of clause.body) {
    if (body.type !== COMPOUND) return false;
    const args = [];
    for (const arg of body.args) {
      if (arg.type === 'var') {
        const value = bindings.get(arg.name);
        if (value == null) return false;
        args.push(value);
      } else if (isScalarTerm(arg)) {
        args.push(arg);
      } else {
        return false;
      }
    }
    const bodyGroup = solver.program.findGroup(body.name, body.arity, body.module ?? group.module);
    if (!bodyGroup || bodyGroup.tabled || !bodyGroup.scalarFactsOnly) return false;
    const bodyGoal = compound(body.name, args);
    const candidates = selectGroundClauseCandidates(bodyGroup, bodyGoal);
    let matches = 0;
    for (let candidateIndex = 0; candidateIndex < clauseCandidateLength(candidates); candidateIndex++) {
      const fact = clauseCandidateAt(candidates, candidateIndex);
      const matched = matchGroundClause(bodyGoal, fact);
      if (matched?.done) {
        matches++;
        if (matches > 1) return false; // Preserve duplicate-proof semantics.
      }
    }
    if (matches === 0) return true;
  }

  stack.push({ kind: 'goals', goals: rest, env, depth: depth + 1, active });
  return true;
}

function tryPushGroundChainFrames(stack, solver, group, goal, rest, env, depth, active) {
  if (tryPushCompactBinaryChainFrames(stack, solver, group, goal, rest, env, depth, active)) return true;
  // Compress deterministic ground single-goal chains such as deep taxonomy
  // proofs: a(ind, n100000) -> a(ind, n99999) -> ... -> a(ind, n0).
  // This is a search-control optimization only. It fires only while each step
  // has exactly one matching clause and a single ground body goal; otherwise the
  // normal clause path below remains authoritative.
  if (!termIsGround(goal, env)) return false;

  const baseEnv = env;
  let currentGroup = group;
  let currentGoal = copyResolved(goal, env);
  let currentDepth = depth;
  const currentEnv = new Env();
  const seen = new Set();

  while (true) {
    // The compressed path is iterative and protected by `seen`, so it does not
    // consume JavaScript recursion depth the way the ordinary solver path does.
    // Keep recording the logical depth for diagnostics, but do not cut off long
    // finite taxonomy chains with the recursive maxDepth guard.
    if (solver.solutionsSeen >= solver.solutionLimit) return true;
    solver.stats.max_depth = Math.max(solver.stats.max_depth, currentDepth);
    const key = groundChainKey(currentGoal);
    if (seen.has(key)) return true;
    if (activeVariantIn(currentGoal, currentEnv, active)) return true;
    if (solver.groundChainSuccess.has(key)) {
      rememberGroundChainSuccess(solver, seen);
      stack.push({ kind: 'goals', goals: rest, env: baseEnv, depth: depth + 1, active });
      return true;
    }
    seen.add(key);

    const candidates = selectGroundClauseCandidates(currentGroup, currentGoal);
    const matches = [];
    for (const pass of [candidates]) {
      for (let candidateIndex = 0; candidateIndex < clauseCandidateLength(pass); candidateIndex++) {
        const clause = clauseCandidateAt(pass, candidateIndex);
        if (headCannotMatch(currentGoal, clause.head, currentEnv)) continue;
        const match = matchGroundClause(currentGoal, clause);
        if (match === undefined) return false;
        if (match === null) continue;
        matches.push(match);
        if (matches.length > 1) return false;
      }
    }

    if (matches.length !== 1) return false;
    const match = matches[0];
    if (match.done) {
      rememberGroundChainSuccess(solver, seen);
      stack.push({ kind: 'goals', goals: rest, env: baseEnv, depth: depth + 1, active });
      return true;
    }
    const resolvedNextGoal = match.nextGoal;
    const nextGroup = solver.program.findGroup(resolvedNextGoal.name, resolvedNextGoal.arity, resolvedNextGoal.module ?? 'user');
    if (!nextGroup) return false;

    currentGoal = resolvedNextGoal;
    currentGroup = nextGroup;
    currentDepth++;
  }
}





function clauseCandidateLength(candidate) {
  return candidate == null ? 0 : Array.isArray(candidate) ? candidate.length : 1;
}

function clauseCandidateAt(candidate, index) {
  return Array.isArray(candidate) ? candidate[index] : index === 0 ? candidate : undefined;
}

function matchGroundClause(goal, clause) {
  if (clause.head.type !== COMPOUND || goal.type !== COMPOUND) return undefined;
  if (clause.head.name !== goal.name || clause.head.arity !== goal.arity) return null;
  if (goal.arity === 2) return matchGroundBinaryClause(goal, clause);

  const names = [];
  const values = [];
  for (let i = 0; i < goal.arity; i++) {
    const headArg = clause.head.args[i];
    const goalArg = goal.args[i];
    if (headArg.type === 'var') {
      let index = names.indexOf(headArg.name);
      if (index < 0) {
        names.push(headArg.name);
        values.push(goalArg);
      } else if (!sameGroundTerm(values[index], goalArg)) {
        return null;
      }
    } else if (isScalarTerm(headArg)) {
      if (!sameGroundTerm(headArg, goalArg)) return null;
    } else {
      return undefined;
    }
  }

  if (clause.body.length === 0) return { done: true };
  if (clause.body.length !== 1) return undefined;
  const bodyGoal = clause.body[0];
  if (bodyGoal.type !== COMPOUND) return undefined;
  const args = [];
  for (const arg of bodyGoal.args) {
    if (arg.type === 'var') {
      const index = names.indexOf(arg.name);
      if (index < 0) return undefined;
      args.push(values[index]);
    } else if (isScalarTerm(arg)) {
      args.push(arg);
    } else {
      return undefined;
    }
  }
  return { nextGoal: compound(bodyGoal.name, args) };
}

function matchGroundBinaryClause(goal, clause) {
  const headArgs = clause.head.args;
  const goalArgs = goal.args;
  for (let i = 0; i < 2; i++) {
    const headArg = headArgs[i];
    if (headArg.type === 'var') {
      for (let j = 0; j < i; j++) {
        if (headArgs[j].type === 'var' && headArgs[j].name === headArg.name &&
            !sameGroundTerm(goalArgs[j], goalArgs[i])) return null;
      }
    } else if (isScalarTerm(headArg)) {
      if (!sameGroundTerm(headArg, goalArgs[i])) return null;
    } else {
      return undefined;
    }
  }

  if (clause.body.length === 0) return { done: true };
  if (clause.body.length !== 1) return undefined;
  const bodyGoal = clause.body[0];
  if (bodyGoal.type !== COMPOUND) return undefined;
  const bodyArgs = new Array(bodyGoal.arity);
  for (let i = 0; i < bodyGoal.arity; i++) {
    const arg = bodyGoal.args[i];
    if (arg.type === 'var') {
      let found = false;
      for (let j = 0; j < 2; j++) {
        if (headArgs[j].type === 'var' && headArgs[j].name === arg.name) {
          bodyArgs[i] = goalArgs[j];
          found = true;
          break;
        }
      }
      if (!found) return undefined;
    } else if (isScalarTerm(arg)) {
      bodyArgs[i] = arg;
    } else {
      return undefined;
    }
  }
  return { nextGoal: compound(bodyGoal.name, bodyArgs) };
}

function isScalarTerm(term) {
  return term && (term.type === 'atom' || term.type === 'string' || term.type === 'number');
}

function sameScalarTerm(left, right) {
  return isScalarTerm(left) && isScalarTerm(right) && left.type === right.type &&
    (left.type === 'number' ? sameNumberValue(left.name, right.name) : left.name === right.name);
}

function sameGroundTerm(left, right) {
  if (left?.type !== right?.type) return false;
  if (left?.type === 'number' ? !sameNumberValue(left.name, right.name) : left?.name !== right?.name) return false;
  const arity = left.args?.length ?? 0;
  if (arity !== (right.args?.length ?? 0)) return false;
  for (let i = 0; i < arity; i++) if (!sameGroundTerm(left.args[i], right.args[i])) return false;
  return true;
}

function groundChainKey(term) {
  if (term?.type === COMPOUND) {
    let out = `${term.name}/${term.arity}`;
    for (let i = 0; i < term.arity; i++) out += `${groundChainKey(term.args[i])}`;
    return out;
  }
  return `${term?.type ?? ''}:${term?.name ?? ''}`;
}

function rememberGroundChainSuccess(solver, seen) {
  // Cache a sparse set of checkpoints. This preserves fast reuse of long
  // deterministic chains without retaining every intermediate goal.
  let index = 0;
  const last = seen.size - 1;
  for (const key of seen) {
    if ((index & 63) === 0 || index === last) solver.groundChainSuccess.add(key);
    index++;
  }
}

function rememberMemoAnswer(entry, goal, env) {
  const variables = new Map();
  const answerKeys = [];
  const answerArgs = goal.args.map((arg) => {
    const answer = copyResolvedWithKey(arg, env, variables);
    answerKeys.push(answer.key);
    return answer.term;
  });
  const key = answerKeys.join('\x1f');
  if (entry.answerKeys.has(key)) return;
  entry.answerKeys.add(key);
  const answerIndex = entry.answers.length;
  entry.answers.push(answerArgs);
  for (let position = 0; position < answerArgs.length; position++) {
    const value = answerArgs[position];
    const scalarKey = memoAnswerScalarKey(value);
    if (scalarKey != null) {
      const index = entry.answerIndexes[position];
      let bucket = index.get(scalarKey);
      if (bucket == null) index.set(scalarKey, bucket = []);
      bucket.push(answerIndex);
    } else if (value.type === 'var') {
      entry.answerVariableFallbacks[position].push(answerIndex);
    }
  }
}

function activeVariantIn(goal, env, active) {
  if (active.length === 0) return false;
  let goalShape = null;
  for (const entry of active) {
    const candidate = entry.goal;
    // Variant calls must have the same predicate indicator. Avoid walking
    // large matrix/list arguments for every unrelated active predicate.
    if (candidate?.type !== goal.type || candidate?.name !== goal.name ||
        candidate?.arity !== goal.arity) continue;
    goalShape ??= variantShape(goal, env);
    entry.variantShape ??= variantShape(candidate, entry.env);
    if (goalShape !== entry.variantShape) continue;
    if (variantTerms(goal, env, candidate, entry.env)) return true;
  }
  return false;
}

function variantShape(term, env) {
  if (term?.type !== COMPOUND) return '0';
  return term.args.map((arg) => variantArgumentSize(arg, env)).join(',');
}

const rawProperListLengths = new WeakMap();

function rawProperListLength(term) {
  const compactLength = compactListLength(term);
  if (compactLength != null) return compactLength;
  if (!isCons(term)) return null;
  const cells = [];
  const seen = new WeakSet();
  let cursor = term;
  let suffixLength = 0;
  while (isCons(cursor)) {
    const cached = rawProperListLengths.get(cursor);
    if (cached != null) {
      suffixLength = cached;
      break;
    }
    if (seen.has(cursor)) return null;
    seen.add(cursor);
    cells.push(cursor);
    // Only cache the raw spine. A variable tail may resolve differently in
    // separate environments and therefore needs the general shape walk.
    cursor = cursor.args[1];
  }
  if (!isEmptyList(cursor) && rawProperListLengths.get(cursor) == null) return null;
  for (let index = cells.length - 1; index >= 0; index--) {
    rawProperListLengths.set(cells[index], ++suffixLength);
  }
  return rawProperListLengths.get(term) ?? suffixLength;
}

function variantArgumentSize(term, env) {
  const resolved = derefForLocal(term, env);
  const listLength = rawProperListLength(resolved);
  if (listLength != null) return `list:${listLength}`;
  const pending = [{ term, exit: false }];
  const ancestors = new WeakSet();
  let size = 0;
  while (pending.length > 0) {
    const item = pending.pop();
    if (item.exit) {
      ancestors.delete(item.term);
      continue;
    }
    const current = derefForLocal(item.term, env);
    size++;
    if (current?.type === COMPOUND) {
      // Finite terms get an exact size, which cheaply distinguishes successive
      // tails of a long list. Keep cyclic terms conservative so the exact
      // variant check remains authoritative.
      if (ancestors.has(current)) return '*';
      ancestors.add(current);
      pending.push({ term: current, exit: true });
      for (let index = current.arity - 1; index >= 0; index--) {
        pending.push({ term: current.args[index], exit: false });
      }
    }
  }
  return size;
}


function builtinIsReadyOrAuthoritative(def, solver, goal, env) {
  if (typeof def.shouldUse === 'function' && !def.shouldUse({ solver, goal, env })) return false;
  if (typeof def.ready !== 'function') return true;
  if (def.ready(goal, env)) return true;
  return !def.fallbackWhenNotReady;
}

function selectReadyDeterministicBuiltin(goals, env, registry) {
  for (let i = 0; i < goals.length; i++) {
    const goal = goals[i];
    if (goal?.kind === 'releaseActive' || goal?.kind === 'memoStore') return 0;
    if (goal.type !== COMPOUND && goal.type !== 'atom') continue;
    const def = registry.get(goal.name, goal.arity);
    if (!def?.deterministic || typeof def.ready !== 'function') continue;
    if (typeof def.shouldUse === 'function') continue;
    if (def.ready(goal, env)) return i;
  }
  return 0;
}

function headCannotMatch(goal, head, env) {
  if (goal.type !== COMPOUND || head.type !== COMPOUND) return false;
  if (goal.name !== head.name || goal.arity !== head.arity) return true;
  for (let i = 0; i < goal.arity; i++) {
    const a = goal.args[i];
    const b = head.args[i];
    // Keep this only as a cheap scalar rejection. unify() remains authoritative.
    const da = derefForLocal(a, env);
    if (isScalarTerm(da) && isScalarTerm(b) && !sameScalarTerm(da, b)) return true;
  }
  return false;
}

function derefForLocal(term, env) {
  let current = term;
  while (current.type === 'var') {
    const next = env.get(current.name);
    if (next === undefined) break;
    current = next;
  }
  return current;
}

function memoKey(goal, env, group = null) {
  const required = group?.tableInputPositions ?? [];
  const ground = goal.args.map((arg) => termIsGround(arg, env));
  const hasBound = group?.tableAllVariants === true || (required.length > 0
    ? required.some((index) => ground[index])
    : ground.some(Boolean));
  if (!hasBound) return { hasBound: false, text: '' };

  const variables = new Map();
  const parts = goal.args.map((arg) => canonicalTermKey(arg, env, variables));
  return { hasBound, text: parts.join('|') };
}

function canonicalTermKey(term, env, variables) {
  // Memo keys are needed before deciding whether a recursive call is tabled.
  // Build them iteratively: a perfectly ordinary bound list can be deeper than
  // JavaScript's native call stack even though the solver itself is iterative.
  const key = [];
  const pending = [{ kind: 'term', term }];
  while (pending.length > 0) {
    const item = pending.pop();
    if (item.kind === 'text') {
      key.push(item.text);
      continue;
    }
    const value = derefForLocal(item.term, env);
    if (value.type === 'var') {
      let id = variables.get(value.name);
      if (id == null) {
        id = variables.size;
        variables.set(value.name, id);
      }
      key.push(`var:${id}`);
      continue;
    }
    if (!value.args?.length) {
      key.push(`${value.type}:${value.name}`);
      continue;
    }
    key.push(`${value.type}:${value.name}(`);
    pending.push({ kind: 'text', text: ')' });
    for (let index = value.args.length - 1; index >= 0; index--) {
      if (index < value.args.length - 1) pending.push({ kind: 'text', text: ',' });
      pending.push({ kind: 'term', term: value.args[index] });
    }
  }
  return key.join('');
}

function copyResolvedWithKey(term, env, variables) {
  const value = derefForLocal(term, env);
  if (value.type === 'var') {
    let id = variables.get(value.name);
    if (id == null) {
      id = variables.size;
      variables.set(value.name, id);
    }
    return { term: termModuleCache.variable(value.name), key: `var:${id}` };
  }
  if (!value.args?.length) {
    // Atomic terms are immutable in the solver.  Share them across table
    // answers instead of allocating a fresh host object for every cell of a
    // large closure such as tc/2.
    return { term: value, key: `${value.type}:${value.name}` };
  }
  const children = value.args.map((arg) => copyResolvedWithKey(arg, env, variables));
  return {
    term: termModuleCache.compound(value.name, children.map((child) => child.term)),
    key: `${value.type}:${value.name}(${children.map((child) => child.key).join(',')})`,
  };
}

// Avoid circular import surprises in older Node loaders.
import * as termModuleCache from './term.js';
