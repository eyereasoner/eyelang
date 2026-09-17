import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import { run } from '../index.js';
import { array } from '../src/terms.js';
import { exampleSource, examplesDirectory } from '../tools/example-sources.js';

const manifest = JSON.parse(fs.readFileSync(new URL('suite.json', examplesDirectory), 'utf8'));

function verifySudoku(givens, grid) {
  const values = term => array(term).map(row => array(row).map(cell => Number(cell.value)));
  const puzzle = values(givens), solution = values(grid);
  const digits = '123456789';
  const canonical = unit => [...unit].sort().join('');

  assert.equal(solution.length, 9);
  for (let row = 0; row < 9; row++) {
    assert.equal(solution[row].length, 9);
    assert.equal(canonical(solution[row]), digits);
    for (let column = 0; column < 9; column++) {
      if (puzzle[row][column] !== 0) assert.equal(solution[row][column], puzzle[row][column]);
    }
  }
  for (let column = 0; column < 9; column++) {
    assert.equal(canonical(solution.map(row => row[column])), digits);
  }
  for (let boxRow = 0; boxRow < 3; boxRow++) {
    for (let boxColumn = 0; boxColumn < 3; boxColumn++) {
      const box = [];
      for (let row = boxRow * 3; row < boxRow * 3 + 3; row++) {
        for (let column = boxColumn * 3; column < boxColumn * 3 + 3; column++) box.push(solution[row][column]);
      }
      assert.equal(canonical(box), digits);
    }
  }
}

test('the suite manifest accounts for every example exactly once', () => {
  const files = fs.readdirSync(examplesDirectory).filter(name => name.endsWith('.eye')).sort();
  assert.equal(new Set(manifest.examples.map(entry => entry.file)).size, manifest.examples.length);
  assert.deepEqual(manifest.examples.map(entry => entry.file).sort(), files);
});

for (const entry of manifest.examples) {
  test(`example ${entry.file} executes its questions`, () => {
    const source = exampleSource(entry.file);
    if (entry.expectedError) {
      assert.throws(() => run(source), error => error.message.includes(entry.expectedError));
      return;
    }
    const result = run(source);
    assert.equal(result.status, 'complete');
    assert.ok(result.queries.length > 0, `${entry.file} has no acceptance query`);
    assert.ok(result.queries.some(query => query.answers.length > 0), `${entry.file} has no successful acceptance query`);
  });
}

for (const depth of [10, 100, 1000, 10000, 100000]) {
  test(`deep taxonomy ${depth} preserves spine and side-branch subsumption`, () => {
    const source = fs.readFileSync(new URL(`deep-taxonomy-${depth}.eye`, examplesDirectory), 'utf8');
    const result = run(source);
    assert.equal(result.queries.length, 12);
    assert.deepEqual(result.queries.map(query => query.answers.length), Array(12).fill(1));
  });
}

test('Sudoku solves AI Escargot at runtime and satisfies every constraint', () => {
  const source = fs.readFileSync(new URL('sudoku.eye', examplesDirectory), 'utf8');
  const { givens, grid } = run(source).queries[0].answers[0].bindings;
  verifySudoku(givens, grid);
});

test('Sudoku engine solves an unrelated 9x9 puzzle', () => {
  const puzzle = '[[5,3,0,0,7,0,0,0,0],[6,0,0,1,9,5,0,0,0],[0,9,8,0,0,0,0,6,0],[8,0,0,0,6,0,0,0,3],[4,0,0,8,0,3,0,0,1],[7,0,0,0,2,0,0,0,6],[0,6,0,0,0,0,2,8,0],[0,0,0,4,1,9,0,0,5],[0,0,0,0,8,0,0,7,9]]';
  const answer = run(`puzzle(${puzzle}). ask puzzle(?givens), sudoku(?givens, ?grid).`).queries[0].answers;
  assert.equal(answer.length, 1);
  verifySudoku(answer[0].bindings.givens, answer[0].bindings.grid);
});
