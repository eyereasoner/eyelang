// ISO/IEC 13211-2 module sources shipped with EyeProlog.
// The sources are registered here so library(Name) works in Node and browsers;
// unlike the former autoloader, no clauses are added unless use_module/1 or
// use_module/2 requests their module.
import { createDefaultRegistry } from './iso.js';
import { fs, isNode } from './platform.js';

const moduleFiles = Object.freeze({
  eyeprolog: 'eyeprolog.pl',
  lists: 'lists.pl',
});

const cacheKey = isNode
  ? null
  : (new URL(import.meta.url).searchParams.get('playground') ?? '20260809a');

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

export const eyePrologNativeLibraryIndicators = Object.freeze([]);
export const eyePrologPortableLibraryIndicators = Object.freeze([
  'uuid/3', 'difference/3', 'maplist/3', 'lt/2', 'gt/2', 'le/2', 'ge/2',
  'between/3', 'smallest_divisor_from/3', 'random/3', 'matches/3', 'split/3',
  'replace/4', 'lowercase/2', 'uppercase/2', 'trim/2', 'number_string/2',
  'atom_string/2', 'term_string/2', 'append/3', 'string_concat/3', 'contains/2',
  'matches/2', 'join/3', 'substring/4', 'member/2', 'select/3', 'last/2',
  'nth0/3', 'nth1/3', 'set_nth0/4', 'take/3', 'drop/3', 'slice/4', 'reverse/2',
  'length/2', 'sum_list/2', 'min_list/2', 'max_list/2', 'list_to_set/2',
  'countall/2', 'sumall/3', 'aggregate_min/5', 'aggregate_max/5',
]);
export const eyePrologLibraryIndicators = Object.freeze([...eyePrologPortableLibraryIndicators]);

export function createEyePrologRegistry() {
  const registry = createDefaultRegistry();
  registry.eyePrologLibrary = true;
  return registry;
}

let registry = null;
export function getEyePrologRegistry() {
  if (registry == null) registry = createEyePrologRegistry();
  return registry;
}
