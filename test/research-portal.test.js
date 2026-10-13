import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { run } from '../src/language.js';

const source = readFileSync(new URL('../examples/research-portal.eye', import.meta.url), 'utf8');
const unknown = "I don't know anyone or anything that fits that question yet.";
const baseline = 'ePrivacy Art. 5(3)';
const audience = 'GDPR Art. 88a(3)(c)';
const service = 'GDPR Art. 88a(3)(b)';
const device = 'GDPR Art. 88a(1)';
const signal = 'GDPR Art. 88b(1)-(2)';
const pause = 'GDPR Art. 88a(4)(c)';
const permit = ['permit', 'research'];
const awaitConsent = ['await-device-consent', 'research'];
const notify = (when, how = 'none') => ['notify', ['authority', when], ['people', how]];

function term(value) {
  if (Array.isArray(value)) return `[${value.map(term).join(', ')}]`;
  return typeof value === 'string' && value.includes(' ') ? JSON.stringify(value) : String(value);
}

function fact(property, subject, value) {
  return `the ${property} of ${term(subject)} is ${term(value)}.`;
}

function query(program, question) {
  // Modified scenarios have their own questions and expectations.
  return run(`${program.split('# Answer:')[0]}\n${question}`)[0];
}

function value(program, property, subject) {
  return query(program, `what is the ${property} of ${term(subject)}?`);
}

function process(program, id, index, replacement) {
  return program.replace(new RegExp(`(the process of ${id} is )\\[([^\\]]+)\\]\\.`), (_, prefix, fields) => {
    const profile = fields.split(', ');
    profile[index] = replacement;
    return `${prefix}[${profile.join(', ')}].`;
  });
}

// Independent expected decisions: shared policy denials plus each device-gate result.
const denials = {
  r2: ['not-permitted', [
    ['unmet', 'for-research', 'purpose', 'personalised-advertising', 'within', 'research-and-development'],
    ['unmet', 'under-consent', 'legal-basis', 'legitimate-interest', 'equal', 'consent'],
    ['unmet', 'consent-given', 'consent-status', 'consent-unknown', 'equal', 'consent-given'],
  ]],
  r3: ['prohibited-by', 'no-marketing'],
  r4: ['not-permitted', [['unmet', 'consent-given', 'consent-status', 'consent-withdrawn', 'equal', 'consent-given']]],
  r5: ['not-permitted', [
    ['unmet', 'pseudonymised', 'technical-measure', 'encryption', 'equal', 'pseudonymisation'],
    ['unmet', 'before-2027', 'date', 20270301, 'less-than', 20270101],
  ]],
  r6: ['prohibited-by', 'no-transfer-us'],
  r11: 'no-matching-permission',
};
const assessments = [
  ...['baseline', 'omnibus-proposal'].flatMap(book => Object.entries(denials).map(([id, reason]) =>
    fact('assessment', [book, id], [['deny-policy', reason], ['policy']]))),
  ...['r1', 'r7', 'r8', 'r9'].map(id => fact('assessment', ['baseline', id], [awaitConsent, ['policy', baseline]])),
  fact('assessment', ['baseline', 'r10'], [permit, ['policy', baseline]]),
  fact('assessment', ['omnibus-proposal', 'r1'], [permit, ['policy', audience]]),
  fact('assessment', ['omnibus-proposal', 'r10'], [permit, ['policy', service]]),
  fact('assessment', ['omnibus-proposal', 'r7'], [['deny-device', 'refused-by-signal'], ['policy', device, signal]]),
  fact('assessment', ['omnibus-proposal', 'r8'], [['deny-device', 'do-not-ask-again'], ['policy', device, pause]]),
  fact('assessment', ['omnibus-proposal', 'r9'], [awaitConsent, ['policy', device, pause]]),
];
const breachPlans = ['baseline', 'omnibus-proposal'].flatMap(book => ['b1', 'b2', 'b3'].map(id => {
  const authority = book === 'baseline'
    ? id === 'b1' ? 'none' : ['within-hours', 72]
    : id === 'b3' ? ['within-hours-via-single-entry-point', 96] : 'none';
  return fact('breach-plan', [book, id], [notify(authority, id === 'b3' ? 'without-undue-delay' : 'none'),
    'document-breach', [book === 'baseline' ? 'GDPR Art. 33(1)' : 'GDPR Art. 33(1) as amended',
      'GDPR Art. 34(1)', 'GDPR Art. 33(5)']]);
}));
const duties = [['baseline', 'r10'], ['omnibus-proposal', 'r1'], ['omnibus-proposal', 'r10']]
  .map(session => fact('planned-duty', session, ['delete', ['within-days', 90]]));
const conflicts = [fact('policy-conflict', 'r6', ['resolved-by', 'prohibit', 'no-transfer-us', ['overrides', 'research']])];
const changes = [
  fact('change', ['session', 'r1'], ['from', awaitConsent, 'to', permit]),
  fact('change', ['session', 'r7'], ['from', awaitConsent, 'to', ['deny-device', 'refused-by-signal']]),
  fact('change', ['session', 'r8'], ['from', awaitConsent, 'to', ['deny-device', 'do-not-ask-again']]),
  fact('change', ['breach', 'b2'], ['from', notify(['within-hours', 72]), 'to', notify('none')]),
  fact('change', ['breach', 'b3'], ['from', notify(['within-hours', 72], 'without-undue-delay'),
    'to', notify(['within-hours-via-single-entry-point', 96], 'without-undue-delay')]),
];

test('research portal derives all 37 complete outcomes and passes its ARC checks', () => {
  const answers = run(source);
  const expected = [assessments, breachPlans, duties, conflicts, changes];
  assert.equal(expected.flat().length, 37);
  for (let i = 0; i < expected.length; i++) {
    assert.deepEqual(new Set(answers[i].split('\n')), new Set(expected[i]));
    assert.equal(answers[i].split('\n').length, expected[i].length);
  }
  assert.equal(answers[5], fact('assessment', ['omnibus-proposal', 'r1'], [permit, ['policy', audience]]));
  assert.equal(answers.slice(7).length, 18);
  assert.ok(answers.slice(7).every(answer => answer.startsWith('check passed:')));
  const arc = run(source, { arc: true });
  assert.match(arc.join('\n'), /# Answer[\s\S]*# Reason[\s\S]*# Check/);
});

test('the reason for a permit includes both independent gates and their evidence', () => {
  const reason = query(source, 'why is the assessment of [omnibus-proposal, r1] equal to [[permit, research], [policy, "GDPR Art. 88a(3)(c)"]]?');
  for (const clue of [
    'the process of r1 is [hospital, partner-be, use, lab-results, academic-research, consent, consent-given, pseudonymisation, 20261115].',
    'the consent of [omnibus-proposal, own-audience-measurement] is [not-needed, "GDPR Art. 88a(3)(c)"].',
    'the policy-result of r1 is [permit, research].', 'the conflict-strategies of policy is [prohibit].',
    '20261115 is less than 20270101.',
  ]) assert.ok(reason.includes(clue), clue);
  assert.match(reason, /with \?rulebook = omnibus-proposal/);
});

test('device-consent exemptions cannot authorize withdrawn or unknown health-data consent', () => {
  for (const status of ['consent-withdrawn', 'consent-unknown']) {
    const changed = process(source, 'r1', 6, status);
    const reason = ['not-permitted', [['unmet', 'consent-given', 'consent-status', status, 'equal', 'consent-given']]];
    for (const book of ['baseline', 'omnibus-proposal']) {
      assert.equal(value(changed, 'assessment', [book, 'r1']), fact('assessment', [book, 'r1'], [['deny-policy', reason], ['policy']]));
      assert.equal(value(changed, 'planned-duty', [book, 'r1']), unknown);
    }
  }
});

test('refusal pauses use completed calendar months and asking never becomes permission', () => {
  for (const [months, outcome] of [[0, 'do-not-ask-again'], [5, 'do-not-ask-again'], [6, 'ask-for-consent'], [7, 'ask-for-consent']]) {
    const changed = source.replace('the session of r8 is [advertising, [refused, [completed-months, 5]]].',
      `the session of r8 is [advertising, [refused, [completed-months, ${months}]]].`);
    const decision = outcome === 'ask-for-consent' ? awaitConsent : ['deny-device', outcome];
    assert.equal(value(changed, 'assessment', ['omnibus-proposal', 'r8']),
      fact('assessment', ['omnibus-proposal', 'r8'], [decision, ['policy', device, pause]]));
    assert.equal(value(changed, 'assessment', ['baseline', 'r8']),
      fact('assessment', ['baseline', 'r8'], [awaitConsent, ['policy', baseline]]));
    assert.equal(value(changed, 'planned-duty', ['omnibus-proposal', 'r8']), unknown);
  }
  const negative = source.replace('[completed-months, 5]', '[completed-months, -1]');
  assert.equal(value(negative, 'assessment', ['omnibus-proposal', 'r8']), unknown);
  const media = source.replace('the media-service of portal is no.', 'the media-service of portal is yes.');
  assert.equal(value(media, 'assessment', ['omnibus-proposal', 'r7']), unknown);
});

test('research constraints use strict dates and retain every failure in declared order', () => {
  const before = process(source, 'r1', 8, '20261231');
  assert.equal(value(before, 'policy-result', 'r1'), fact('policy-result', 'r1', permit));
  for (const date of [20270101, 20270102]) {
    const changed = process(source, 'r1', 8, String(date));
    assert.equal(value(changed, 'policy-result', 'r1'), fact('policy-result', 'r1', ['deny',
      ['not-permitted', [['unmet', 'before-2027', 'date', date, 'less-than', 20270101]]]]));
  }
  const reordered = source.replace('[for-research, under-consent, consent-given, pseudonymised, before-2027]',
    '[consent-given, under-consent, for-research, pseudonymised, before-2027]');
  assert.equal(value(reordered, 'policy-result', 'r2'), fact('policy-result', 'r2', ['deny',
    ['not-permitted', [...denials.r2[1]].reverse()]]));
  const fixed = process(process(source, 'r5', 7, 'pseudonymisation'), 'r5', 8, '20261231');
  assert.equal(value(fixed, 'assessment', ['omnibus-proposal', 'r5']),
    fact('assessment', ['omnibus-proposal', 'r5'], [permit, ['policy', service]]));
});

test('purpose hierarchy, party membership, action, target, and controller determine policy matching', () => {
  const narrower = process(source, 'r1', 4, 'clinical-study').replace('# Answer:',
    'clinical-study has-broader-purpose academic-research.\n# Answer:');
  assert.equal(value(narrower, 'policy-result', 'r1'), fact('policy-result', 'r1', permit));
  const reflexive = process(process(source, 'r1', 1, 'consortium'), 'r1', 4, 'research-and-development');
  assert.equal(value(reflexive, 'policy-result', 'r1'), fact('policy-result', 'r1', permit));
  for (const [field, replacement] of [[1, 'outsider'], [2, 'share'], [3, 'other-data']]) {
    assert.equal(value(process(source, 'r1', field, replacement), 'policy-result', 'r1'),
      fact('policy-result', 'r1', ['deny', 'no-matching-permission']));
  }
  assert.equal(value(process(source, 'r1', 0, 'other-hospital'), 'policy-result', 'r1'), unknown);
});

test('a prohibition overrides permission and only final permits create deletion duties', () => {
  const withoutUS = source.replace('the prohibitions of policy is [no-marketing, no-transfer-us].',
    'the prohibitions of policy is [no-marketing].');
  assert.equal(value(withoutUS, 'policy-result', 'r6'), fact('policy-result', 'r6', permit));
  assert.equal(value(withoutUS, 'policy-conflict', 'r6'), unknown);
  assert.equal(value(withoutUS, 'planned-duty', ['omnibus-proposal', 'r6']),
    fact('planned-duty', ['omnibus-proposal', 'r6'], ['delete', ['within-days', 90]]));
  const changed = source.replace('the duty-days of deletion is 90.', 'the duty-days of deletion is 30.');
  assert.equal(value(changed, 'planned-duty', ['omnibus-proposal', 'r1']),
    fact('planned-duty', ['omnibus-proposal', 'r1'], ['delete', ['within-days', 30]]));
  const unsupported = source.replace('the conflict-strategies of policy is [prohibit].', 'the conflict-strategies of policy is [permit].');
  assert.equal(value(unsupported, 'assessment', ['omnibus-proposal', 'r1']), unknown);
});

test('breach plans are recalculated from risk, always document, and compare notifications rather than citations', () => {
  const lowRisk = source.replace('the breach of b3 is ["patient lab records exposed", high].',
    'the breach of b3 is ["patient lab records exposed", unlikely].');
  for (const book of ['baseline', 'omnibus-proposal']) {
    assert.equal(value(lowRisk, 'breach-plan', [book, 'b3']), fact('breach-plan', [book, 'b3'], [notify('none'),
      'document-breach', [book === 'baseline' ? 'GDPR Art. 33(1)' : 'GDPR Art. 33(1) as amended',
        'GDPR Art. 34(1)', 'GDPR Art. 33(5)']]));
  }
  assert.equal(value(lowRisk, 'change', ['breach', 'b3']), unknown);
  assert.equal(value(source, 'change', ['breach', 'b1']), unknown);
  assert.equal(value(source, 'change', ['session', 'r10']), unknown);
});

test('bundled assertions reject changed proposal outcomes and missing research agreements', () => {
  const shorterPause = source.replace('the refusal-pause of portal is 6.', 'the refusal-pause of portal is 5.');
  assert.throws(() => run(shorterPause), /Check failed: there are 5 changed-outcomes/);
  const missing = source.replace('policy is an agreement.', 'policy is a draft.');
  assert.throws(() => run(missing), /Check failed: there are 22 assessed-sessions/);
});
