import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { run } from '../language.js';

const source = readFileSync(new URL('../examples/gps.eye', import.meta.url), 'utf8');
const direct = '[drive-gent-brugge, drive-brugge-oostende]';
const alternative = '[drive-gent-kortrijk, drive-kortrijk-brugge, drive-brugge-oostende]';
const unknown = "I don't know anyone or anything that fits that question yet.";

function query(program, question) {
  // Changed inputs have their own expectations rather than the sample's checks.
  return run(`${program.replace(/^check that .+\.$/gm, '')}\n${question}`).at(-1);
}

test('GPS derives both routes, computes all four scores, recommends Brugge, and passes its ARC checks', () => {
  const answers = run(source);
  assert.deepEqual(new Set(answers[0].split('\n')), new Set([
    `the route of trip is ${direct}.`, `the route of trip is ${alternative}.`,
  ]));
  assert.deepEqual(new Set(answers[1].split('\n')), new Set([
    'direct is an available-route.', 'via-kortrijk is an available-route.',
  ]));
  assert.deepEqual(answers.slice(2, 12), [
    'the duration of direct is 2400.',
    'the cost of direct is 0.01.',
    'the belief of direct is 0.9408.',
    'the comfort of direct is 0.99.',
    'the duration of via-kortrijk is 4100.',
    'the cost of via-kortrijk is 0.018.',
    'the belief of via-kortrijk is 0.903168.',
    'the comfort of via-kortrijk is 0.9801.',
    'the recommended-route of trip is direct.',
    'the outcome of trip is "Gent → Brugge → Oostende".',
  ]);
  assert.equal(answers.slice(13).length, 19);
  assert.ok(answers.slice(13).every(answer => answer.startsWith('check passed:')));
});

test('the recommendation explanation includes both routes, road inputs, arithmetic, and all four comparisons', () => {
  const why = run(source)[12];
  for (const road of ['gent-brugge', 'gent-kortrijk', 'kortrijk-brugge', 'brugge-oostende']) {
    assert.match(why, new RegExp(`the road of \\[${road.replace('-', ', ')}\\] is drive-${road}\\.`));
  }
  for (const evidence of [
    '1500 plus 900 makes 2400.', '1600 plus 2500 makes 4100.',
    '0.006 plus 0.004 makes 0.01.', '0.96 times 0.98 makes 0.9408.',
    '0.99 times 0.99 makes 0.9801.',
    '2400 is less than 4100.', '0.01 is less than 0.018.',
    '0.9408 is greater than 0.903168.', '0.99 is greater than 0.9801.',
    'direct beats via-kortrijk.', 'the recommended-route of trip is direct.',
  ]) assert.ok(why.includes(evidence), evidence);
  assert.match(why, /because rule \d+ uses steps/);
  assert.match(why, /I checked these values/);
});

test('changed road scores recompute the recommendation rather than hardcoding the direct route', () => {
  const changed = source
    .replace('the duration of drive-gent-brugge is 1500.', 'the duration of drive-gent-brugge is 7000.')
    .replace('the cost of drive-gent-brugge is 0.006.', 'the cost of drive-gent-brugge is 0.03.')
    .replace('the belief of drive-gent-brugge is 0.96.', 'the belief of drive-gent-brugge is 0.5.')
    .replace('the comfort of drive-gent-brugge is 0.99.', 'the comfort of drive-gent-brugge is 0.5.');
  assert.equal(query(changed, 'what is the duration of direct?'), 'the duration of direct is 7900.');
  assert.equal(query(changed, 'what is the recommended-route of trip?'), 'the recommended-route of trip is via-kortrijk.');
  assert.equal(query(changed, 'what is the outcome of trip?'), 'the outcome of trip is "Gent → Kortrijk → Brugge → Oostende".');
  assert.throws(() => run(changed), /Check failed/);
});

test('each score must strictly improve; a tradeoff or tie gives no recommendation', () => {
  for (const [before, after] of [
    ['the duration of drive-gent-brugge is 1500.', 'the duration of drive-gent-brugge is 7000.'],
    ['the cost of drive-gent-brugge is 0.006.', 'the cost of drive-gent-brugge is 0.03.'],
    ['the belief of drive-gent-brugge is 0.96.', 'the belief of drive-gent-brugge is 0.5.'],
    ['the comfort of drive-gent-brugge is 0.99.', 'the comfort of drive-gent-brugge is 0.5.'],
    ['the duration of drive-gent-brugge is 1500.', 'the duration of drive-gent-brugge is 3200.'],
  ]) {
    assert.equal(query(source.replace(before, after), 'what is the recommended-route of trip?'), unknown);
  }
});

test('missing roads remove their routes even when names and scores remain supplied', () => {
  const changed = source.replace('the road of [gent, brugge] is drive-gent-brugge.', '');
  assert.equal(query(changed, 'what is the route of trip?'), `the route of trip is ${alternative}.`);
  assert.equal(query(changed, 'who is an available-route?'), 'via-kortrijk is an available-route.');
  assert.equal(query(changed, 'what is the duration of direct?'), unknown);
  assert.throws(() => run(changed), /Check failed: there are 2 available-routes/);
  const blocked = source.replace('the road of [brugge, oostende] is drive-brugge-oostende.', '');
  assert.equal(query(blocked, 'what is the route of trip?'), unknown);
  assert.equal(query(blocked, 'what is the recommended-route of trip?'), unknown);
});

test('the same route and score rules handle other endpoints and longer action lists', () => {
  const longer = source + `
    the road of [oostende, nieuwpoort] is drive-oostende-nieuwpoort.
    the duration of drive-oostende-nieuwpoort is 600.
    the cost of drive-oostende-nieuwpoort is 0.002.
    the belief of drive-oostende-nieuwpoort is 0.95.
    the comfort of drive-oostende-nieuwpoort is 0.9.
  `;
  assert.deepEqual(new Set(query(longer, 'what is the route of [gent, nieuwpoort]?').split('\n')), new Set([
    'the route of [gent, nieuwpoort] is [drive-gent-brugge, drive-brugge-oostende, drive-oostende-nieuwpoort].',
    'the route of [gent, nieuwpoort] is [drive-gent-kortrijk, drive-kortrijk-brugge, drive-brugge-oostende, drive-oostende-nieuwpoort].',
  ]));
  assert.equal(query(longer, 'what is the duration of [drive-gent-brugge, drive-brugge-oostende, drive-oostende-nieuwpoort]?'),
    'the duration of [drive-gent-brugge, drive-brugge-oostende, drive-oostende-nieuwpoort] is 3000.');
  assert.equal(query(source, 'what is the route of [oostende, gent]?'), unknown);
  const fromKortrijk = source.replace('the location of traveller is gent.', 'the location of traveller is kortrijk.');
  assert.equal(query(fromKortrijk, 'what is the route of trip?'),
    'the route of trip is [drive-kortrijk-brugge, drive-brugge-oostende].');
});
