import test from 'node:test';
import assert from 'node:assert/strict';
import { infer, parse, run } from '../src/language.js';

test('lists contain names, numbers, nested lists, and empty lists', () => {
  assert.deepEqual(run(`
    the items of milo is [red, 1, -0.5, [blue, 2], []].
    what is the items of milo?
  `), ['the items of milo is [red, 1, -0.5, [blue, 2], []].']);
  assert.equal(infer(parse(`
    the items of milo is [1, 2].
    the items of milo is [1 | [2 | []]].
  `)).length, 1);
});

test('head and tail patterns bind whole sublists and respect repeated variables', () => {
  assert.deepEqual(run(`
    the items of milo is [red, red, blue].
    the items of luna is [red, blue].
    the items of rex is [].
    the items of ada is red.
    if the items of ?x is [?a | ?b] then the rest of ?x is ?b.
    if the items of ?x is [?a, ?a | ?b] then ?x is a repeating-list.
    what is the rest of milo?
    what is the rest of luna?
    what is the rest of rex?
    who is a repeating-list?
  `), [
    'the rest of milo is [red, blue].', 'the rest of luna is [blue].',
    "I don't know anyone or anything that fits that question yet.",
    'milo is a repeating-list.',
  ]);
});

test('list patterns join earlier bindings to facts derived later and construct new lists', () => {
  assert.deepEqual(run(`
    milo chooses red. luna chooses blue.
    the color of ada is red. the color of ben is blue.
    if ?x chooses ?b and the score of [?a, ?b] is ?z
    then the winner of ?x is [?a, ?z].
    if the color of ?a is ?b then the score of [?a, ?b] is 7.
    what is the winner of milo?
    what is the winner of luna?
    what is the score of [ada, red]?
  `), [
    'the winner of milo is [ada, 7].', 'the winner of luna is [ben, 7].',
    'the score of [ada, red] is 7.',
  ]);
});

test('negation works with bound list values and explains their missing evidence', () => {
  const [answer, why] = run(`
    milo likes [1, 2]. luna likes [2, 3].
    [1, 2] needs rest.
    if ?x likes ?y and ?y does not need rest then ?x is a ready-player.
    who is a ready-player? why?
  `);
  assert.equal(answer, 'luna is a ready-player.');
  assert.match(why, /there is no evidence in this program that \[2, 3\] needs rest/);
  assert.throws(() => parse(`
    if milo likes ?a and not [?a, ?b] needs rest then milo is a ready-player.
  `), /Find \?b in an earlier positive clue/);
});

test('calculations inside lists use earlier inputs and retain their explanations', () => {
  const [answer, why] = run(`
    the value of milo is 3. the boxes of milo is [4].
    if the value of ?x is ?a and the boxes of ?x is [?a plus 1]
    then the result of ?x is [?a times 2, [?a | []]].
    what is the result of milo? why?
  `);
  assert.equal(answer, 'the result of milo is [6, [3]].');
  assert.match(why, /3 plus 1 makes 4\./);
  assert.match(why, /3 times 2 makes 6\./);
  assert.throws(() => parse('the result of milo is [1, [2 plus 3]].'), /Put calculations in a rule or question/);
  assert.throws(() => parse(`
    if the boxes of ?x is [?a plus 1] then ?x is a player.
  `), /Find \?a in an earlier clue/);
  assert.throws(() => parse(`
    if milo is a player then the result of milo is [?a].
  `), /Use \?a after if/);
});

test('query variables match list elements and repeated occurrences consistently', () => {
  assert.deepEqual(run(`
    milo likes [milo]. luna likes [milo].
    who likes [who]?
    who likes [what]?
    milo likes [what]?
  `), ['milo likes [milo].', 'milo likes [milo].\nluna likes [milo].', 'milo likes [milo].']);
});

test('ordinary and negative question shapes accept lists with spaces in either argument', () => {
  assert.deepEqual(run(`
    milo likes [red, blue]. [red, blue] needs rest. [red, blue] is a team.
    does milo like [red, blue]?
    does luna not like [red, blue]?
    what does [red, blue] need?
    is [red, blue] a team?
    is [red, blue] not a player?
    if milo likes ?a and ?a does not like [red, blue] then ?a is a ready-team.
    who is a ready-team?
  `), [
    'yes, milo likes [red, blue].',
    'yes, there is no evidence in this program that luna likes [red, blue].',
    '[red, blue] needs rest.', 'yes, [red, blue] is a team.',
    'yes, there is no evidence in this program that [red, blue] is a player.',
    '[red, blue] is a ready-team.',
  ]);
});

test('lists reject missing items, broken brackets, and tails that are not lists', () => {
  for (const value of ['[1,]', '[1', '[1 2]', '[1 | 2]', '[1 | milo]', '[| ?a]']) {
    assert.throws(() => parse(`the result of milo is ${value}.`), /Line 1:/);
  }
  assert.throws(() => run(`
    the rest of milo is 1.
    if the rest of ?x is ?a then the result of ?x is [2 | ?a].
  `), /must be another list/);
  assert.throws(() => parse('milo is a [cat].'), /one word for a kind/);
});
