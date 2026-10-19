import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { infer, parse, renderProof, checkProof } from '../src/language.js';

const definition = readFileSync(new URL('../examples/list-collection.pl', import.meta.url), 'utf8').split('% Answer and Reason')[0];
const bag = terms => terms.map(term => JSON.stringify(term)).sort();

test('order pick lists match independently grouped line facts, including equal projections and empty orders', () => {
  for (const extra of ['', '\nline(alpha,4,bolts,4). line(empty,1,tape,20).', '\nline(beta,2,washers,12). line(beta,2,washers,12).']) {
    const program = parse(definition + extra + '\n?- pick_list(Order, Items). ?- bulk_list(Order, Items).');
    const records = infer(program);
    const lines = [...new Map(program.facts.filter(fact => fact.relation === 'predicate:line/4')
      .map(fact => [JSON.stringify(fact.terms), fact.terms])).values()];
    const orders = program.facts.filter(fact => fact.relation === 'predicate:order/1').map(fact => fact.terms[0].atom);
    for (const [relation, bulk] of [['pick_list', false], ['bulk_list', true]]) {
      const actual = records.filter(record => record.goal.relation === `predicate:${relation}/2`);
      assert.equal(actual.length, orders.length);
      for (const order of orders) {
        const expected = lines.filter(([id, , , quantity]) => id.atom === order && (!bulk || BigInt(quantity) >= 10n))
          .map(([, , product, quantity]) => ({ functor: 'item', args: [product, quantity] }));
        const matches = actual.filter(record => record.goal.terms[0].atom === order);
        assert.equal(matches.length, 1);
        assert.deepEqual(bag(matches[0].goal.terms[1].list), bag(expected));
      }
    }
    const proof = renderProof(program, records);
    const report = checkProof(program, proof);
    assert.equal(report.valid, true, JSON.stringify(report.failures));
    assert.ok(report.trusted.every(obligation => obligation.reason === 'collection_completeness'));
  }
});
