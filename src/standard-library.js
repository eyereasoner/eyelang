// ISO/IEC 13211-2 module sources shipped with EyeProlog.
// The sources are registered here so library(Name) works in Node and browsers.
// Modules are loaded on demand by explicit use_module/1-2 or by the conservative
// source-level interop autoloader declared below.
import { PrologError, createDefaultRegistry, eyePrologLibraryBuiltins } from './iso.js';
import { clpzBuiltins } from './clpz.js';
import { fs, isNode, memoryStatistics } from './platform.js';
import { ATOM, VAR, atom, deref, numberTerm, unify } from './term.js';

const moduleFiles = Object.freeze({
  aggregate: 'aggregate.pl',
  clpz: 'clpz.pl',
  comparison: 'comparison.pl',
  dates: 'dates.pl',
  iso_ext: 'iso_ext.pl',
  lists: 'lists.pl',
  primes: 'primes.pl',
  prologue: 'prologue.pl',
  random: 'random.pl',
  strings: 'strings.pl',
  uuid: 'uuid.pl',
});

const cacheKey = isNode
  ? null
  : (new URL(import.meta.url).searchParams.get('playground') ?? '20260811c');

export const standardLibrarySources = new Map(await Promise.all(
  Object.entries(moduleFiles).map(async ([name, filename]) => [name, {
    filename: `src/lib/${filename}`,
    source: await loadSource(libraryUrl(filename)),
  }]),
));

async function loadSource(url) {
  if (isNode) return fs.readFileSync(url, 'utf8');
  const response = await fetch(url);
  if (!response.ok) throw new Error(`could not load Prolog module: ${response.status}`);
  return response.text();
}

function libraryUrl(filename) {
  const url = new URL(`./lib/${filename}`, import.meta.url);
  if (!isNode && cacheKey) url.searchParams.set('playground', cacheKey);
  return url;
}

export const eyePrologNativeLibraryIndicators = Object.freeze([
  'call_nth/2', 'freeze/2', 'countall/2',
  '#>/2', '#</2', '#>=/2', '#=</2', '#=/2', '#\\=/2', '#\\/1',
  '#<==>/2', '#==>/2', '#<==/2', '#\\//2', '#\\/2', '#/\\/2',
  'in/2', 'ins/2', 'all_different/1', 'all_distinct/1', 'nvalue/2', 'sum/3',
  'scalar_product/4', 'tuples_in/2', 'labeling/2', 'label/1',
  'indomain/1', 'lex_chain/1', 'serialized/2', 'global_cardinality/2',
  'global_cardinality/3', 'circuit/1', 'chain/2', 'element/3', 'zcompare/3',
  'fd_var/1', 'fd_inf/2', 'fd_sup/2', 'fd_size/2', 'fd_dom/2',
]);
export const eyePrologPortableLibraryIndicators = Object.freeze([
  'sumall/3', 'aggregate_min/5', 'aggregate_max/5',
  'lt/2', 'gt/2', 'le/2', 'ge/2', 'difference/3',
  'maplist/2', 'maplist/3', 'maplist/4', 'maplist/5',
  'maplist/6', 'maplist/7', 'maplist/8', 'between/3',
  'smallest_divisor_from/3', 'random/3', 'matches/3', 'split/3',
  'replace/4', 'lowercase/2', 'uppercase/2', 'trim/2', 'number_string/2',
  'atom_string/2', 'term_string/2', 'append/2', 'append/3', 'string_concat/3', 'contains/2',
  'matches/2', 'join/3', 'substring/4', 'member/2', 'memberchk/2', 'select/3', 'last/2', 'same_length/2',
  'nth0/3', 'nth0/4', 'nth1/3', 'nth1/4', 'set_nth0/4', 'take/3', 'drop/3', 'slice/4', 'reverse/2',
  'length/2', 'sum_list/2', 'min_list/2', 'max_list/2', 'list_to_set/2',
  'succ/2', 'foldl/4', 'foldl/5', 'foldl/6',
  'forall/2', 'cfor/3', 'findall/4', 'variant/2', 'uuid/3',
]);
export const eyePrologLibraryIndicators = Object.freeze([
  ...eyePrologPortableLibraryIndicators,
  ...eyePrologNativeLibraryIndicators,
]);


// Conservative cross-implementation profile.  These predicate indicators are
// intentionally limited to interfaces that EyeProlog wants to keep source-
// compatible with the Trealla/Scryer ecosystem.  The value is the canonical
// EyeProlog library used when an otherwise undefined call is autoloaded.
//
// This is deliberately separate from eyePrologPortableLibraryIndicators:
// "portable" there means implemented in Prolog rather than as a host builtin;
// this table means interoperable source-level API.
export const eyePrologInteropAutoload = Object.freeze({
  'member/2': 'lists',
  'memberchk/2': 'lists',
  'select/3': 'lists',
  'append/2': 'lists',
  'append/3': 'lists',
  'last/2': 'lists',
  'same_length/2': 'lists',
  'nth0/3': 'lists',
  'nth0/4': 'lists',
  'nth1/3': 'lists',
  'nth1/4': 'lists',
  'reverse/2': 'lists',
  'length/2': 'lists',
  'maplist/2': 'lists',
  'maplist/3': 'lists',
  'maplist/4': 'lists',
  'maplist/5': 'lists',
  'maplist/6': 'lists',
  'maplist/7': 'lists',
  'maplist/8': 'lists',
  'foldl/4': 'lists',
  'foldl/5': 'lists',
  'foldl/6': 'lists',
  'sum_list/2': 'lists',
  'list_to_set/2': 'lists',
  // Trealla and Scryer expose between/3 without an EyeProlog-style
  // library(prologue) dependency.  EyeProlog keeps its implementation in the
  // Prologue module but autoloads it so portable source need not name that
  // implementation-specific library.
  'between/3': 'prologue',
});

export const eyePrologInteropLibraryIndicators = Object.freeze(
  Object.keys(eyePrologInteropAutoload),
);

// Libraries whose *name* is part of the current interop profile.  A program
// may freely use_module(library(lists)); predicates in that module which are
// outside eyePrologInteropLibraryIndicators are still diagnosed when used.
export const eyePrologInteropLibraryModules = Object.freeze(['lists']);

function runtimeStatistics(solver) {
  return { ...solver.stats, ...memoryStatistics() };
}

function* statisticsBuiltin({ solver, env }) {
  const stream = solver.io.resolve(solver.io.currentOutput);
  if (stream?.type !== 'text') throw new PrologError('permission_error(output, binary_stream)');
  solver.io.writeUnit(stream, 'eyeprolog stats:\n');
  for (const [key, value] of Object.entries(runtimeStatistics(solver))) {
    solver.io.writeUnit(stream, `  ${key}: ${value}\n`);
  }
  yield env;
}

function* statisticsValueBuiltin({ solver, goal, env }) {
  const snapshot = runtimeStatistics(solver);
  const key = deref(goal.args[0], env);
  const entries = key.type === VAR
    ? Object.entries(snapshot)
    : key.type === ATOM && Object.hasOwn(snapshot, key.name)
      ? [[key.name, snapshot[key.name]]]
      : null;

  if (entries == null) {
    if (key.type !== ATOM) throw new PrologError('type_error(atom)', key);
    return;
  }

  for (const [name, value] of entries) {
    const next = env.clone();
    if (unify(goal.args[0], atom(name), next) && unify(goal.args[1], numberTerm(value), next)) yield next;
  }
}

export function createEyePrologRegistry() {
  const registry = createDefaultRegistry();
  registry.add('statistics', 0, statisticsBuiltin, { deterministic: true });
  registry.add('statistics', 2, statisticsValueBuiltin);
  eyePrologLibraryBuiltins.register(registry);
  clpzBuiltins.register(registry);
  registry.eyePrologLibrary = true;
  return registry;
}

let registry = null;
export function getEyePrologRegistry() {
  if (registry == null) registry = createEyePrologRegistry();
  return registry;
}
