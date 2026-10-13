import test from 'node:test';
import assert from 'node:assert/strict';
import { parse, run } from '../src/language.js';

test('named variables express the Socrates join and short reasons show actual values', () => {
  const output = run(`
    socrates is a human. human implies mortal.
    if ?person is a ?kind and ?kind implies ?superkind then ?person is a ?superkind.
    who is a mortal? why?
    check that socrates is a mortal.
  `);
  assert.equal(output[0], 'socrates is a mortal.');
  assert.match(output[1], /because if socrates is a human and human implies mortal then socrates is a mortal/);
  assert.doesNotMatch(output[1], /\?(person|kind|superkind)/);
});

test('named variables are local to each rule, including the reported mixed-direction example', () => {
  const source = `
    socrates is a human. human implies mortal.
    if ?person is a thing and ?kind implies ?result then ?person is a ?result.
    ?kind is a thing if ?kind is a ?type.
    who is a mortal? why?
  `;
  const output = run(source);
  assert.equal(output[0], 'socrates is a mortal.');
  assert.match(output[1], /if socrates is a thing and human implies mortal then socrates is a mortal/);
  assert.match(output[1], /because socrates is a thing if socrates is a human/);
  assert.doesNotMatch(output[1], /\?(person|kind|type|result)/);
  const broad = run(source + 'milo is a cat.')[0];
  assert.match(broad, /milo is a mortal/);
  const joined = run(source.replace('?person is a thing', '?person is a ?kind') + 'milo is a cat.')[0];
  assert.equal(joined, 'socrates is a mortal.');
});

test('variable names have no fixed list or sixteen-variable limit', () => {
  const names = Array.from({ length: 40 }, (_, index) => `?value${index}`);
  const values = names.map((_, index) => index + 1);
  const reversed = values.slice().reverse().join(', ');
  const output = run(`
    the values of sample is [${values.join(', ')}].
    if the values of sample is [${names.join(', ')}]
    then the reversed of sample is [${names.slice().reverse().join(', ')}].
    what is the reversed of sample?
    check that the reversed of sample is [${reversed}].
  `);
  assert.equal(output[0], `the reversed of sample is [${reversed}].`);
  assert.equal(output[1], `check passed: the reversed of sample is [${reversed}].`);
});

test('named variables bind names, quoted text, lists, integers, and real values', () => {
  const values = ['ada', '"Ada Lovelace"', '[red, blue]', '17', '[]', '-3', '0.5', '9007199254740993'];
  const names = ['?person', '?name', '?colors', '?age', '?empty', '?negative', '?fraction', '?large'];
  assert.deepEqual(run(`
    the values of sample is [${values.join(', ')}].
    if the values of sample is [${names.join(', ')}]
    then the reversed of sample is [${names.slice().reverse().join(', ')}].
    what is the reversed of sample?
  `), [`the reversed of sample is [${values.slice().reverse().join(', ')}].`]);
});

test('named variables support recursive backward rules, open lists, and calculated heads', () => {
  const output = run(`
    the length of [] is 0.
    the length of [?item | ?rest] is ?count plus 1 if the length of ?rest is ?count.
    what is the length of [red, blue, green]? why?
    check that the length of [red, blue, green] is 3.
  `);
  assert.equal(output[0], 'the length of [red, blue, green] is 3.');
  assert.match(output[1], /2 plus 1/);
  assert.match(output[1], /2 plus 1 makes 3/);
  assert.doesNotMatch(output[1], /\?(item|rest|count|0)/);
});

test('repeated variables enforce equality and separate applications keep separate bindings', () => {
  const output = run(`
    the values of sample is [7, 7]. the values of other is [7, 8].
    the value of red is 2. the value of blue is 3.
    if the values of ?pair is [?value, ?value] then ?pair is a repeated-pair.
    the result of ?item is ?value plus 1 if the value of ?item is ?value.
    who is a repeated-pair?
    what is the result of red? why?
    what is the result of blue? why?
  `);
  assert.equal(output[0], 'sample is a repeated-pair.');
  assert.match(output[2], /the result of red is 2 plus 1/);
  assert.match(output[4], /the result of blue is 3 plus 1/);
});

test('named queries work in sentence, verb-object, and property forms with final question marks', () => {
  assert.deepEqual(run(`
    ada likes ben. cara likes ben. the score of ada is 7.
    ?person likes ben?
    ?friend does ada like?
    the score of ?person is ?score?
    does ?person like ben?
  `), ['ada likes ben.\ncara likes ben.', 'ada likes ben.', 'the score of ada is 7.', 'ada likes ben.\ncara likes ben.']);
  const compact = parse('ada is a person.?person is a person??person is a friend if ?person is a person.');
  assert.equal(compact.facts.length, 1);
  assert.equal(compact.questions.length, 1);
  assert.equal(compact.rules.length, 1);
});

test('variable identifiers normalize case and support Unicode, digits, underscores, and hyphens', () => {
  assert.deepEqual(run(`
    the birthday of pat is [1944, 8, 21].
    if the birthday of ?Person is [?birth-year, ?maand2, ?dag_3] then the year of ?person is ?birth-year.
    if the year of ?persoon is ?𝑦 then the result of ?persoon is ?𝑦.
    what is the result of pat?
  `), ['the result of pat is 1944.']);
});

test('named variables retain negation, comparison, and aggregation behavior', () => {
  assert.deepEqual(run(`
    the score of ada is 3. the score of ben is 4. ben is a blocked-player.
    ?person is an eligible-player if the score of ?person is ?score and ?person is not a blocked-player.
    the doubled-score of ?person is ?score times 2 if the score of ?person is ?score.
    how many eligible-players are there?
    what is the total of all doubled-scores?
  `), ['there is 1 eligible-player.', 'the total of all doubled-scores is 14.']);
});

test('named variables obey groundness, relation-name, and safety requirements', () => {
  assert.throws(() => parse('?person is a cat.'), /facts give values/);
  assert.throws(() => parse('check that ?person is a cat.'), /cannot introduce variables/);
  assert.throws(() => parse('if milo is a cat then ?person is a friend.'), /Use \?person after if/);
  assert.throws(() => parse('if ?score is greater than 0 then milo is a friend.'), /Find \?score in an earlier clue/);
  assert.throws(() => parse('if milo is not a ?kind then milo is a friend.'), /before using not/);
  assert.throws(() => parse('if milo is a cat then the score of milo is ?value plus 1.'), /Use \?value after if/);
  assert.throws(() => parse('the ?property of milo is 1.'), /couldn't read/);
  assert.throws(() => parse('milo ?verb luna.'), /couldn't read/);
  assert.throws(() => parse('is ?person not a cat?'), /Name the things/);
  assert.throws(() => parse('why is ?person a cat?'), /name the things/);
  assert.throws(() => parse('the score of milo is ?value plus 1?'), /known numbers/);
  for (const name of ['?1person', '?_person', '?-person']) assert.throws(() => parse(`if ${name} is a cat then milo is a friend.`), /Line 1:/);
});

test('ordinal words and former aliases are ordinary names, without a hidden variable convention', () => {
  const names = 'first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth thirteenth fourteenth fifteenth sixteenth someone something number'.split(' ');
  assert.deepEqual(run(`${names.map(name => `${name} is a name.`).join('\n')} who is a name?`),
    [names.map(name => `${name} is a name.`).join('\n')]);
  assert.deepEqual(run('first likes second. if first likes ?person then ?person is a friend. who is a friend?'), ['second is a friend.']);
});

test('quoted variable spellings and punctuation remain text and are not substituted in reasons', () => {
  const output = run(`
    the label of ada is "?person asks why? # first".
    if the label of ?person is "?person asks why? # first" then ?person is a labelled-person.
    who is a labelled-person? why?
  `);
  assert.equal(output[0], 'ada is a labelled-person.');
  assert.match(output[1], /because if the label of ada is "\?person asks why\? # first" then ada is a labelled-person/);
  assert.throws(() => parse('# note\n\nif ?value is greater than 0 then milo is a friend.'), /Line 3:/);
});

test('numbered explanations show local bindings for each shared rule application', () => {
  const output = run(`
    ada is a human. ben is a human. human implies mortal.
    if ?person is a ?kind and ?kind implies ?superkind then ?person is a ?superkind.
    who is a mortal? why?
  `)[1];
  assert.match(output, /rule 1: if \?person is a \?kind/);
  assert.match(output, /with \?person = ada, \?kind = human, \?superkind = mortal\./);
  assert.match(output, /with \?person = ben, \?kind = human, \?superkind = mortal\./);
  assert.doesNotMatch(output, /\?0/);
});
