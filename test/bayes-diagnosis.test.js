import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { infer, parse, run } from '../src/language.js';

const source = readFileSync(new URL('../examples/bayes-diagnosis.eye', import.meta.url), 'utf8');
const withoutChecks = source.replace(/^check that .+\.$/gm, '');
const diseaseList = '[covid19, influenza, allergic-rhinitis, bacterial-pneumonia]';
const evidenceList = '[[fever, present], [dry-cough, present], [loss-of-smell, present], [sneezing, absent], [short-breath, present]]';
const names = ['covid19', 'influenza', 'allergic-rhinitis', 'bacterial-pneumonia'];
const priors = [0.05, 0.03, 0.10, 0.01];
const probabilities = [
  [0.70, 0.65, 0.40, 0.15, 0.20],
  [0.80, 0.50, 0.05, 0.20, 0.10],
  [0.05, 0.15, 0.10, 0.80, 0.05],
  [0.70, 0.60, 0.02, 0.05, 0.60],
];

function property(facts, name, subject) {
  const term = Array.isArray(subject) ? { list: subject } : subject;
  const matches = facts.filter(({ goal }) => goal.relation === `property:${name}`
    && JSON.stringify(goal.terms[0]) === JSON.stringify(term));
  assert.equal(matches.length, 1, `${name} of ${JSON.stringify(subject)}`);
  return matches[0].goal.terms[1];
}

function close(actual, expected) {
  assert.ok(Number.isFinite(Number(actual)) && Math.abs(Number(actual) - expected) <= 1e-14,
    `expected ${expected}, received ${actual}`);
}

// Independently multiply left to right; the example uses recursive list rules.
function reference(observations, weights = priors, candidates = [0, 1, 2, 3]) {
  const scores = candidates.map(index => {
    let score = weights[index];
    for (const [symptom, present] of observations) {
      score *= present ? probabilities[index][symptom] : 1 - probabilities[index][symptom];
    }
    return score;
  });
  const total = scores.reduce((sum, score) => sum + score, 0);
  return { scores, total, posteriors: scores.map(score => score / total) };
}

function verify(program, observations, weights = priors, candidates = [0, 1, 2, 3], patient = 'case') {
  const facts = infer(parse(program));
  const expected = reference(observations, weights, candidates);
  const scores = property(facts, 'scores', patient).list;
  assert.equal(scores.length, candidates.length);
  scores.forEach((score, index) => close(score, expected.scores[index]));
  close(property(facts, 'evidence-total', patient), expected.total);
  candidates.forEach((candidate, index) => {
    close(property(facts, 'score', [names[candidate], patient]), expected.scores[index]);
    close(property(facts, 'posterior', [names[candidate], patient]), expected.posteriors[index]);
  });
  close(property(facts, 'posterior-total', patient), 1);
  return facts;
}

const observations = [[0, true], [1, true], [2, true], [3, false], [4, true]];

test('Bayes diagnosis computes all four weights and posteriors and passes its ARC checks', () => {
  verify(source, observations);
  const answers = run(source);
  assert.equal(answers.filter(answer => answer.startsWith('check passed:')).length, 3);
  assert.match(answers[2], /the posterior of \[covid19, case\] is 0\.941209/);
  close(property(infer(parse(source)), 'evidence-total', 'case'), 0.00164363);
});

test('changed symptoms and priors recompute the model rather than using stored results', () => {
  const changedEvidence = source.replace('[sneezing, absent]', '[sneezing, present]');
  verify(changedEvidence, observations.map(([symptom]) => [symptom, true]));
  assert.doesNotThrow(() => run(changedEvidence));
  const changedPrior = source.replace('the prior of influenza is 0.03.', 'the prior of influenza is 0.3.');
  verify(changedPrior, observations, [0.05, 0.3, 0.10, 0.01]);
  assert.doesNotThrow(() => run(changedPrior));
});

test('unobserved symptoms add no factor and an empty evidence list normalizes the priors', () => {
  for (const [evidence, observed] of [
    ['[]', []], ['[[sneezing, absent]]', [[3, false]]], ['[[sneezing, present]]', [[3, true]]],
  ]) {
    const program = source.replace(evidenceList, evidence);
    verify(program, observed);
    assert.doesNotThrow(() => run(program));
  }
});

test('each case normalizes only its own candidate diseases and symptom evidence', () => {
  const program = source + `
    other-case is a patient-case.
    the diseases of other-case is [allergic-rhinitis, influenza].
    the evidence of other-case is [[sneezing, present]].
    check that other-case is a normalized-case.
  `;
  verify(program, observations);
  const facts = verify(program, [[3, true]], priors, [2, 1], 'other-case');
  assert.ok(!facts.some(({ goal }) => goal.relation === 'property:posterior'
    && JSON.stringify(goal.terms[0]) === JSON.stringify({ list: ['covid19', 'other-case'] })));
  assert.doesNotThrow(() => run(program));
});

test('probability guards reject out-of-range priors and conditionals, including unused entries', () => {
  for (const value of [-0.01, 1.01]) {
    for (const program of [
      source.replace('the prior of covid19 is 0.05.', `the prior of covid19 is ${value}.`),
      source.replace('the probability of [covid19, fever] is 0.70.', `the probability of [covid19, fever] is ${value}.`),
      source + `\nthe prior of unused-disease is ${value}.`,
      source + `\nthe probability of [unused-disease, unused-symptom] is ${value}.`,
    ]) assert.throws(() => run(program), /Check failed: there are 0 invalid-probabilities/);
  }
  const endpoints = source
    .replace('the probability of [covid19, fever] is 0.70.', 'the probability of [covid19, fever] is 1.')
    .replace('the probability of [influenza, fever] is 0.80.', 'the probability of [influenza, fever] is 0.');
  assert.doesNotThrow(() => run(endpoints));
});

test('missing model data, empty candidate lists, and zero total cannot silently produce a posterior', () => {
  for (const program of [
    source.replace('the probability of [covid19, fever] is 0.70.', ''),
    source.replace('the prior of influenza is 0.03.', ''),
    source.replace(diseaseList, '[]'),
    source.replace(/the prior of ([a-z0-9-]+) is [\d.]+\./g, 'the prior of $1 is 0.'),
  ]) assert.throws(() => run(program), /Check failed: case is a normalizable-case/);
});

test('candidate and evidence ordering changes presentation but preserves disease probabilities', () => {
  const reversed = withoutChecks
    .replace(diseaseList, '[bacterial-pneumonia, allergic-rhinitis, influenza, covid19]')
    .replace(evidenceList, '[[short-breath, present], [sneezing, absent], [loss-of-smell, present], [dry-cough, present], [fever, present]]');
  verify(reversed, observations.slice().reverse(), priors, [3, 2, 1, 0]);
});

test('why traces normalization, every prior, and the complement for an observed absent symptom', () => {
  const explanation = run(source)[6];
  for (const name of names) assert.ok(explanation.includes(`the prior of ${name} is`), name);
  assert.match(explanation, /the evidence of case is \[\[fever, present\]/);
  assert.match(explanation, /the probability of \[bacterial-pneumonia, sneezing\] is 0\.05\./);
  assert.match(explanation, /1 minus 0\.05 makes 0\.95\./);
  assert.match(explanation, /divided by 0\.00164363 makes 0\.029130/);
  assert.match(explanation, /because rule/);
});
