import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { run } from '../src/language.js';

const source = readFileSync(new URL('../examples/delfour.eye', import.meta.url), 'utf8');
const unknown = "I don't know anyone or anything that fits that question yet.";

function query(program, question) {
  // Changed cases are queried separately from the bundled sample expectations.
  return run(`${program.replace(/^check that .+\.$/gm, '')}\n${question}`).at(-1);
}

test('Delfour derives authorization, the same-shelf alternative, the banner, and ten successful checks', () => {
  const answers = run(source);
  assert.equal(answers.length, 26);
  assert.deepEqual(answers.slice(0, 18), [
    'the case-name of delfour is "delfour".',
    'yes, delfour is a low-sugar-case.',
    'the derived-need of [delfour, sugar-insight] is low-sugar.',
    'the outcome of delfour is "Allowed".',
    'the target of delfour is sugar-insight.',
    'the metric of sugar-insight is "sugar_g_per_serving".',
    'the threshold-display of sugar-insight is "10.0".',
    'the scope of delfour is ["self-scanner", "pick_up_scanner"].',
    'the retailer of sugar-insight is "Delfour".',
    'the expires of sugar-insight is "2025-10-05T22:33:48.907185+00:00".',
    'the scanned-name of delfour is "Classic Tea Biscuits".',
    'the alternative-name of delfour is "Low-Sugar Tea Biscuits".',
    'the banner-alternative of delfour is "Low-Sugar Tea Biscuits".',
    'the headline of delfour is "Track sugar per serving while you scan".',
    'the note of delfour is "High sugar".',
    'the algorithm of scanner-signature is "HMAC-SHA256".',
    'the audit-entries of delfour is 1.', 'the files-written of delfour is 6.',
  ]);
  const names = ['trusted-signature', 'matching-hash', 'minimal-payload', 'complete-scope',
    'authorization', 'high-sugar', 'lower-sugar', 'duty-timing', 'marketing-prohibited', 'expected-file-count'];
  assert.deepEqual(new Set(answers[18].split('\n')), new Set(names.map(name => `[delfour, ${name}] is a passed-check.`)));
  assert.equal(answers[19], 'yes, delfour is a checked-case.');
  assert.match(answers[20], /trusted-precomputed-input/);
  assert.ok(answers.slice(21).every(answer => answer.startsWith('check passed:')));
});

test('expiry is inclusive and an expired authorization cannot produce a shopping banner', () => {
  const boundary = source.replace('2025-10-05T20:35:48.907163+00:00', '2025-10-05T22:33:48.907185+00:00');
  assert.equal(query(boundary, 'what is the outcome of delfour?'), 'the outcome of delfour is "Allowed".');
  const expired = source.replace('2025-10-05T20:35:48.907163+00:00', '2025-10-05T22:33:48.907186+00:00');
  assert.equal(query(expired, 'what is the outcome of delfour?'), unknown);
  assert.equal(query(expired, 'what is the headline of delfour?'), unknown);
  assert.equal(query(expired, 'is delfour a checked-case?'), "I don't know whether delfour is a checked-case.");
});

test('the high-sugar threshold is inclusive and is recalculated from changed values', () => {
  assert.equal(query(source.replace('the threshold of sugar-insight is 10.', 'the threshold of sugar-insight is 12.'),
    'what is the note of delfour?'), 'the note of delfour is "High sugar".');
  assert.equal(query(source.replace('the threshold of sugar-insight is 10.', 'the threshold of sugar-insight is 12.1.'),
    'what is the note of delfour?'), unknown);
});

test('the minimum-sugar alternative stays on the same shelf and retains tied minima', () => {
  const extra = `
    the name of lighter is "Lighter Biscuits". the sugar of lighter is 2.5. the category of lighter is biscuits.
    the name of lightest is "Lightest Biscuits". the sugar of lightest is 2. the category of lightest is biscuits.
    the name of chocolate is "Even Lower Chocolate". the sugar of chocolate is 1. the category of chocolate is chocolate.
  `;
  assert.equal(query(source + extra, 'what is the alternative-name of delfour?'), 'the alternative-name of delfour is "Lightest Biscuits".');
  const tied = source + 'the name of twin is "Other Low-Sugar Biscuits". the sugar of twin is 3. the category of twin is biscuits.';
  assert.deepEqual(new Set(query(tied, 'what is the alternative-name of delfour?').split('\n')), new Set([
    'the alternative-name of delfour is "Low-Sugar Tea Biscuits".',
    'the alternative-name of delfour is "Other Low-Sugar Biscuits".',
  ]));
  const changed = source.replace('the scanned-product of delfour is prod-bis-001.', 'the scanned-product of delfour is prod-choc-050.');
  assert.equal(query(changed, 'what is the alternative-name of delfour?'), 'the alternative-name of delfour is "85% Dark Chocolate".');
});

test('hash, trusted-input declaration, minimization, scope, duty timing, and file-count checks can fail', () => {
  const changes = [
    ['matching-hash', source.replace(/(the payload-hash of scanner-signature is )"[^"]+"/, '$1"different"')],
    ['trusted-signature', source.replace('the verification-mode of scanner-signature is trusted-precomputed-input.', 'the verification-mode of scanner-signature is unverified.')],
    ['minimal-payload', source.replace('the payload-text of sugar-insight is "', 'the payload-text of sugar-insight is "MEDICAL ')],
    ['complete-scope', source.replace('the event of sugar-insight is "pick_up_scanner".', '')],
    ['duty-timing', source.replace('2025-10-05T20:37:48.907163+00:00', '2025-10-05T23:37:48.907163+00:00')],
    ['expected-file-count', source.replace('the files-written of delfour is 6.', 'the files-written of delfour is 5.')],
  ];
  for (const [check, changed] of changes) {
    assert.equal(query(changed, `is [delfour, ${check}] a passed-check?`), `I don't know whether [delfour, ${check}] is a passed-check.`);
    assert.equal(query(changed, 'is delfour a checked-case?'), "I don't know whether delfour is a checked-case.");
  }
});

test('a second case cannot borrow permissions or prohibitions from another policy', () => {
  const second = `
    the envelope of other-case is other-envelope.
    the insight of other-envelope is sugar-insight.
    the policy of other-envelope is other-policy.
    the request-action of other-case is use.
    the request-purpose of other-case is shopping-assist.
    the authorization-time of other-case is "2025-10-05T20:35:48.907163+00:00".
    the permission of [other-policy, distribute, sugar-insight] is marketing.
  `;
  assert.equal(query(source + second, 'what is the outcome of other-case?'), unknown);
  assert.equal(query(source + second, 'what is the outcome of delfour?'), 'the outcome of delfour is "Allowed".');
  assert.equal(query(source + second + 'the permission of [other-policy, use, sugar-insight] is shopping-assist.',
    'what is the outcome of other-case?'), 'the outcome of other-case is "Allowed".');
  assert.equal(query(source + second, 'is [other-case, marketing-prohibited] a passed-check?'),
    "I don't know whether [other-case, marketing-prohibited] is a passed-check.");
});

test('the complete explanation includes comparisons and the declared trust without inventing cryptographic work', () => {
  const why = query(source, 'why is delfour a checked-case?');
  assert.match(why, /the verification-mode of scanner-signature is trusted-precomputed-input/);
  assert.match(why, /12 is at least 10/);
  assert.match(why, /3 is less than 12/);
  assert.match(why, /does not contain the text "medical"/);
  assert.match(why, /"2025-10-05T20:35:48.907163\+00:00" is at most "2025-10-05T22:33:48.907185\+00:00"/);
  assert.match(why, /I checked these values/);
  assert.doesNotMatch(why, /the hmac of scanner-signature/);
});
