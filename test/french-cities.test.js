import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { run } from '../language.js';

const source = readFileSync(new URL('../examples/french-cities.eye', import.meta.url), 'utf8');

test('French cities find the original Nantes starting cities and explain a road-by-road route', () => {
  const [cities, nantes, whyNantes, tours, whyTours, reverse] = run(source);
  assert.deepEqual(new Set(cities.split('\n')), new Set([
    'angers reaches nantes.', 'lemans reaches nantes.',
    'chartres reaches nantes.', 'paris reaches nantes.',
  ]));
  assert.equal(nantes, 'yes, paris reaches nantes.');
  assert.deepEqual([...whyNantes.matchAll(/(\w+) connects (\w+)\./g)].map(m => [m[1], m[2]]), [
    ['paris', 'chartres'], ['chartres', 'lemans'], ['lemans', 'angers'], ['angers', 'nantes'],
  ]);
  assert.equal(tours, 'yes, paris reaches tours.');
  assert.match(whyTours, /paris connects /);
  assert.match(whyTours, /(?:blois|lemans) connects tours\./);
  assert.equal(reverse, "I don't know whether nantes reaches paris.");
});

test('removing the road into Nantes blocks its routes while leaving Tours reachable', () => {
  const changed = source.replace('angers connects nantes.', '');
  assert.throws(() => run(changed), /Check failed: paris reaches nantes/);
  const [cities, nantes, , tours] = run(changed.replace(/^check that .+\.$/gm, ''));
  assert.equal(cities, "I don't know anyone or anything that fits that question yet.");
  assert.equal(nantes, "I don't know whether paris reaches nantes.");
  assert.equal(tours, 'yes, paris reaches tours.');
});
