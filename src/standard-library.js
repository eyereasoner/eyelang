// Prolog library modules shipped with EyeProlog and loaded through its documented module compatibility surface.
// The sources are registered here so library(Name) works in Node and browsers.
// Modules are loaded on demand by explicit use_module/1-2 or by the generic
// source-level autoloader generated from every bundled module/2 export list.
import { PrologError, createDefaultRegistry, eyePrologLibraryBuiltins } from './iso.js';
import { attsBuiltins } from './atts.js';
import { expansionBuiltins } from './expansion-builtins.js';
import { scryerCompatibilityBuiltins } from './scryer-compat.js';
import { registerCleanupBuiltins } from './cleanup.js';
import { fs, isNode, memoryStatistics } from './platform.js';
import { ATOM, VAR, atom, deref, numberTerm, unify } from './term.js';
import { eyePrologAmbiguousLibraryAutoload, eyePrologLibraryAutoload, eyePrologLibraryAutoloadModules } from './library-autoload-index.js';

export { eyePrologAmbiguousLibraryAutoload, eyePrologLibraryAutoload, eyePrologLibraryAutoloadModules };

const moduleFiles = Object.freeze({
  aggregate: 'aggregate.pl',
  arithmetic: 'arithmetic.pl',
  assoc: 'assoc.pl',
  atts: 'atts.pl',
  between: 'between.pl',
  charsio: 'charsio.pl',
  clpb: 'clpb.pl',
  clpz: 'clpz.pl',
  comparison: 'comparison.pl',
  dates: 'dates.pl',
  dcgs: 'dcgs.pl',
  debug: 'debug.pl',
  dif: 'dif.pl',
  error: 'error.pl',
  format: 'format.pl',
  freeze: 'freeze.pl',
  gensym: 'gensym.pl',
  iso_ext: 'iso_ext.pl',
  lambda: 'lambda.pl',
  lists: 'lists.pl',
  ordsets: 'ordsets.pl',
  pairs: 'pairs.pl',
  pio: 'pio.pl',
  primes: 'primes.pl',
  prologue: 'prologue.pl',
  random: 'random.pl',
  reif: 'reif.pl',
  si: 'si.pl',
  strings: 'strings.pl',
  terms: 'terms.pl',
  tabling: 'tabling.pl',
  time: 'time.pl',
  ugraphs: 'ugraphs.pl',
  uuid: 'uuid.pl',
  when: 'when.pl',
});

const cacheKey = isNode
  ? null
  : (new URL(import.meta.url).searchParams.get('playground') ?? '20260825a');

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
  'call_nth/2', 'freeze/2', 'dif/2', 'countall/2', 'time/1',
  'put_atts/2', 'get_atts/2', 'put_attr/3', 'get_attr/3', 'del_attr/2', 'term_attributed_variables/2', 'call_residue_vars/2',
  '#>/2', '#</2', '#>=/2', '#=</2', '#=/2', '#\\=/2', '#\\/1',
  '#<==>/2', '#==>/2', '#<==/2', '#\\//2', '#\\/2', '#/\\/2',
  'in/2', 'ins/2', 'all_different/1', 'all_distinct/1', 'nvalue/2', 'sum/3',
  'scalar_product/4', 'tuples_in/2', 'labeling/2', 'label/1',
  'indomain/1', 'lex_chain/1', 'serialized/2', 'global_cardinality/2',
  'global_cardinality/3', 'circuit/1', 'cumulative/1', 'cumulative/2',
  'disjoint2/1', 'automaton/3', 'automaton/8', 'chain/2', 'element/3', 'zcompare/3',
  'fd_var/1', 'fd_inf/2', 'fd_sup/2', 'fd_size/2', 'fd_dom/2',
  'clpz_t/2', '#=/3', '#</3',
  'random/1',
]);
export const eyePrologPortableLibraryIndicators = Object.freeze([
  'sumall/3', 'aggregate_min/5', 'aggregate_max/5',
  'lsb/2', 'msb/2', 'popcount/2',
  'empty_assoc/1', 'assoc_to_list/2', 'get_assoc/3', 'put_assoc/4',
  'assoc_to_keys/2', 'assoc_to_values/2', 'del_assoc/4', 'del_max_assoc/4',
  'del_min_assoc/4', 'gen_assoc/3', 'get_assoc/5', 'is_assoc/1',
  'list_to_assoc/2', 'map_assoc/2', 'map_assoc/3', 'max_assoc/3',
  'min_assoc/3', 'ord_list_to_assoc/2',
  'between/3', 'gen_int/1', 'gen_nat/1', 'numlist/2', 'numlist/3', 'repeat/1',
  'char_type/2', 'get_line_to_chars/3', 'get_n_chars/3', 'get_single_char/1',
  'sat/1', 'taut/2', 'labeling/1', 'sat_count/2', 'random_labeling/2', 'weighted_maximum/3',
  'lt/2', 'gt/2', 'le/2', 'ge/2',
  'difference/3',
  'seq/3', 'seqq/3',
  'debug/1', 'debug/3', 'nodebug/1', 'bb_get/2', 'bb_put/2', 'bb_b_put/2', 'bb_global_get/2',
  '*/1', '$/1', '$-/1',
  'must_be/2', 'can_be/2', 'instantiation_error/0', 'instantiation_error/1',
  'domain_error/2', 'domain_error/3', 'type_error/2', 'type_error/3',
  'representation_error/1', 'resource_error/1', 'call_with_error_context/2',
  'format_/4', 'format/2', 'format/3', 'portray_clause_/3',
  'portray_clause/1', 'portray_clause/2', 'listing/1',
  'gensym/2', 'reset_gensym/1',
  'forall/2', 'succ/2', 'cfor/3', 'findall/4', 'variant/2', '.../2',
  '^/3', '^/4', '^/5', '^/6', '^/7', '^/8', '^/9', '^/10',
  '\\/1', '\\/2', '\\/3', '\\/4', '\\/5', '\\/6', '\\/7', '\\/8',
  '+\\/2', '+\\/3', '+\\/4', '+\\/5', '+\\/6', '+\\/7', '+\\/8', '+\\/9',
  'member/2', 'memberchk/2', 'select/3', 'append/2', 'append/3', 'last/2', 'same_length/2',
  'nth0/3', 'nth0/4', 'nth1/3', 'nth1/4', 'set_nth0/4', 'take/3', 'drop/3', 'slice/4', 'reverse/2',
  'length/2', 'maplist/2', 'maplist/3', 'maplist/4', 'maplist/5',
  'maplist/6', 'maplist/7', 'maplist/8', 'foldl/4', 'foldl/5', 'foldl/6',
  'sum_list/2', 'min_list/2', 'max_list/2', 'list_to_set/2',
  'transpose/2', 'list_max/2', 'list_min/2', 'permutation/2',
  'is_ordset/1', 'list_to_ord_set/2', 'ord_add_element/3', 'ord_del_element/3',
  'ord_disjoint/2', 'ord_empty/1', 'ord_intersect/2', 'ord_intersect/3',
  'ord_intersection/2', 'ord_intersection/3', 'ord_intersection/4',
  'ord_memberchk/2', 'ord_selectchk/3', 'ord_seteq/2', 'ord_subset/2',
  'ord_subtract/3', 'ord_symdiff/3', 'ord_union/2', 'ord_union/3', 'ord_union/4',
  'pairs_keys_values/3', 'pairs_keys/2', 'pairs_values/2',
  'group_pairs_by_key/2', 'map_list_to_pairs/3',
  'phrase_from_file/2', 'phrase_from_file/3', 'phrase_to_file/2',
  'phrase_to_file/3', 'phrase_to_stream/2',
  'smallest_divisor_from/3',
  'maybe/0', 'random/3', 'random_integer/3', 'set_random/1',
  ',/3', ';/3', '=/3', 'cond_t/3', 'dif/3', 'if_/3', 'memberd_t/3',
  'tfilter/3', 'tmember/2', 'tmember_t/3', 'tpartition/4',
  'atom_si/1', 'integer_si/1', 'atomic_si/1', 'list_si/1', 'character_si/1',
  'term_si/1', 'chars_si/1', 'dif_si/2', 'not_si/1', 'when_si/2',
  'matches/3', 'split/3', 'replace/4', 'lowercase/2', 'uppercase/2', 'trim/2',
  'number_string/2', 'atom_string/2', 'term_string/2', 'string_concat/3',
  'contains/2', 'matches/2', 'join/3', 'substring/4',
  'numbervars/3', 'copy_term_nat/2',
  'start_tabling/2', 'abolish_all_tables/0',
  'current_time/1', 'format_time/4',
  'add_edges/3', 'add_vertices/3', 'complement/2', 'compose/3', 'connect_ugraph/3',
  'del_edges/3', 'del_vertices/3', 'edges/2', 'neighbors/3', 'neighbours/3',
  'reachable/3', 'top_sort/2', 'top_sort/3', 'transitive_closure/2',
  'transpose_ugraph/2', 'ugraph_union/3', 'vertices/2', 'vertices_edges_to_ugraph/3',
  'uuid/3', 'uuid_string/2', 'uuidv4/1', 'uuidv4_string/1',
  'when/2',
]);
export const eyePrologLibraryIndicators = Object.freeze([
  ...eyePrologPortableLibraryIndicators,
  ...eyePrologNativeLibraryIndicators,
]);


// Conservative cross-implementation profile metadata. These predicate indicators
// are intentionally limited to interfaces that EyeProlog wants to keep source-
// compatible with the Trealla/Scryer ecosystem. The complete runtime autoload
// index is generated separately from every bundled module/2 export; this smaller
// map is retained as the canonical interoperability subset used by diagnostics
// and public metadata.
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
  // call_nth/2 is available in both Trealla and Scryer.  EyeProlog exposes
  // it from library(iso_ext), matching the explicit Scryer import while still
  // allowing Trealla-style unqualified source to use the same autoload entry.
  'call_nth/2': 'iso_ext',
  // Scryer exposes call_residue_vars/2 from library(atts); autoload it for
  // constraint-test source that uses the predicate without an explicit import.
  'call_residue_vars/2': 'atts',
  // Trealla exposes time/1 as a meta timing predicate and library(iso_ext)
  // supplies ... //0. Autoload both so UWN's DCG hand-off benchmark runs
  // unchanged while their implementations remain outside the ISO core.
  'time/1': 'iso_ext',
  '.../2': 'iso_ext',
  // Scryer provides library(between), while Trealla exposes the relation as a
  // system predicate. Keep EyeProlog's canonical portable owner in the
  // specialized module; library(prologue) re-exports it for compatibility.
  'between/3': 'between',
});

const eyePrologSharedLibraryIndicators = [
  'lsb/2', 'msb/2', 'popcount/2',
  'empty_assoc/1', 'assoc_to_keys/2', 'assoc_to_list/2', 'assoc_to_values/2',
  'del_assoc/4', 'del_max_assoc/4', 'del_min_assoc/4', 'gen_assoc/3',
  'get_assoc/3', 'get_assoc/5', 'is_assoc/1', 'list_to_assoc/2',
  'map_assoc/2', 'map_assoc/3', 'max_assoc/3', 'min_assoc/3',
  'ord_list_to_assoc/2', 'put_assoc/4',
  'char_type/2', 'get_line_to_chars/3', 'get_n_chars/3', 'get_single_char/1',
  'sat/1', 'taut/2', 'labeling/1', 'sat_count/2', 'random_labeling/2', 'weighted_maximum/3',
  '#>/2', '#</2', '#>=/2', '#=</2', '#=/2', '#\\=/2', '#\\/1',
  '#<==>/2', '#==>/2', '#<==/2', '#\\//2', '#\\/2', '#/\\/2',
  'in/2', 'ins/2', 'all_different/1', 'all_distinct/1', 'nvalue/2', 'sum/3',
  'scalar_product/4', 'tuples_in/2', 'labeling/2', 'label/1', 'indomain/1',
  'lex_chain/1', 'serialized/2', 'global_cardinality/2', 'global_cardinality/3',
  'circuit/1', 'cumulative/1', 'cumulative/2', 'disjoint2/1', 'automaton/3',
  'automaton/8', 'chain/2', 'element/3', 'zcompare/3', 'fd_var/1', 'fd_inf/2',
  'fd_sup/2', 'fd_size/2', 'fd_dom/2', 'clpz_t/2', '#=/3', '#</3',
  '*/1', '$/1', '$-/1', 'dif/2',
  'format_/4', 'format/2', 'format/3', 'portray_clause_/3',
  'portray_clause/1', 'portray_clause/2', 'listing/1',
  'gensym/2', 'reset_gensym/1',
  'transpose/2', 'list_max/2', 'list_min/2', 'permutation/2',
  'is_ordset/1', 'list_to_ord_set/2', 'ord_add_element/3', 'ord_del_element/3',
  'ord_disjoint/2', 'ord_empty/1', 'ord_intersect/2', 'ord_intersect/3',
  'ord_intersection/2', 'ord_intersection/3', 'ord_intersection/4',
  'ord_memberchk/2', 'ord_selectchk/3', 'ord_seteq/2', 'ord_subset/2',
  'ord_subtract/3', 'ord_symdiff/3', 'ord_union/2', 'ord_union/3', 'ord_union/4',
  'phrase_from_file/2', 'phrase_from_file/3', 'phrase_to_file/2',
  'phrase_to_file/3', 'phrase_to_stream/2',
  'maybe/0', 'random/1', 'random_integer/3', 'set_random/1',
  ',/3', ';/3', '=/3', 'cond_t/3', 'dif/3', 'if_/3', 'memberd_t/3',
  'tfilter/3', 'tmember/2', 'tmember_t/3', 'tpartition/4',
  'start_tabling/2', 'abolish_all_tables/0', 'current_time/1', 'format_time/4',
  'add_edges/3', 'add_vertices/3', 'complement/2', 'compose/3', 'connect_ugraph/3',
  'del_edges/3', 'del_vertices/3', 'edges/2', 'neighbors/3', 'neighbours/3',
  'reachable/3', 'top_sort/2', 'top_sort/3', 'transitive_closure/2',
  'transpose_ugraph/2', 'ugraph_union/3', 'vertices/2', 'vertices_edges_to_ugraph/3',
  'uuid_string/2', 'uuidv4/1', 'uuidv4_string/1', 'when/2',
];

export const eyePrologInteropLibraryIndicators = Object.freeze([
  ...new Set([...Object.keys(eyePrologInteropAutoload), ...eyePrologSharedLibraryIndicators]),
]);

// Libraries whose *name* is part of the current interop profile.  A program
// may freely use_module/1 with these common module names; predicates in those
// modules outside eyePrologInteropLibraryIndicators are still diagnosed when used.
export const eyePrologInteropLibraryModules = Object.freeze([
  'arithmetic', 'assoc', 'atts', 'charsio', 'clpb', 'clpz', 'debug', 'dif',
  'format', 'freeze', 'gensym', 'iso_ext', 'lambda', 'lists', 'ordsets', 'pio',
  'random', 'reif', 'tabling', 'time', 'ugraphs', 'uuid', 'when',
]);

function* tabledNegationBuiltin({ solver, goal, env }) {
  yield* solver.solveTabledNegation(goal.args[0], env);
}

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

function statisticsValueBuiltin(context) {
  const state = { pending: false };
  const iterator = statisticsValueSolutions(context, state);
  iterator.hasPendingAlternatives = () => state.pending;
  return iterator;
}

function* statisticsValueSolutions({ solver, goal, env }, state) {
  const snapshot = runtimeStatistics(solver);
  const key = deref(goal.args[0], env);
  const entries = key.type === VAR
    ? Object.entries(snapshot)
    : key.type === ATOM && Object.hasOwn(snapshot, key.name)
      ? [[key.name, snapshot[key.name]]]
      : null;

  if (entries == null) {
    if (key.type !== ATOM) throw new PrologError('type_error(atom)', key);
    throw new PrologError('domain_error(statistics_key)', key);
  }

  for (let index = 0; index < entries.length; index++) {
    const [name, value] = entries[index];
    const next = env.clone();
    if (unify(goal.args[0], atom(name), next) && unify(goal.args[1], numberTerm(value), next)) {
      state.pending = index + 1 < entries.length;
      yield next;
    }
  }
  state.pending = false;
}

export function createEyePrologRegistry() {
  const registry = createDefaultRegistry();
  registry.add('statistics', 0, statisticsBuiltin, { deterministic: true });
  registry.add('statistics', 2, statisticsValueBuiltin);
  registry.add('tnot', 1, tabledNegationBuiltin, { deterministic: true });
  registerCleanupBuiltins(registry);
  eyePrologLibraryBuiltins.register(registry);
  attsBuiltins.register(registry);
  expansionBuiltins.register(registry);
  scryerCompatibilityBuiltins.register(registry);
  registry.eyePrologLibrary = true;
  return registry;
}

let registry = null;
export function getEyePrologRegistry() {
  if (registry == null) registry = createEyePrologRegistry();
  return registry;
}
