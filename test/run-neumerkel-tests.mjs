#!/usr/bin/env node
import { NEUMERKEL_SOURCES, formatNeumerkelMarkdown, materializeSyntaxCases, parseCleanupCases, parseDifCases } from './neumerkel.mjs';
import { TestReporter, isMainModule, runStandalone } from './test-style.mjs';

function syntaxHtml(count = 101) {
  const rows = [];
  for (let id = 1; id <= count; id++) {
    const query = id === 2 ? '/**/ writeq(a).' : id === 1 ? 'op(9,fy,x).' : 'true.';
    const expected = id === 2 ? 'a' : 'succeeds';
    rows.push(`<tr><td>${id}<td>${query}<td>${expected}`);
  }
  return `<table>${rows.join('')}</table>`;
}

export function runNeumerkelHarnessTests(reporter = new TestReporter()) {
  reporter.section('Neumerkel harness');

  reporter.test('live manifest tracks exactly seven upstream suite sources', () => {
    if (NEUMERKEL_SOURCES.length !== 7) throw new Error(`expected 7 sources, got ${NEUMERKEL_SOURCES.length}`);
    const keys = new Set(NEUMERKEL_SOURCES.map(({ key }) => key));
    if (keys.size !== 7) throw new Error('Neumerkel source keys are not unique');
  });

  reporter.test('syntax inventory is discovered dynamically and reconstructs /**/ setup', () => {
    const cases = materializeSyntaxCases(syntaxHtml());
    if (cases.length !== 101) throw new Error(`expected 101 cases, got ${cases.length}`);
    if (!cases[1].input.includes('op(9,fy,x)')) throw new Error('/**/ setup was not reconstructed');
  });

  reporter.test('dif table discovery uses upstream row ids and answer descriptions', () => {
    const cases = parseDifCases('<table><tr><td>1<td>?- dif(1,2).<td>true<tr><td>2<td>?- dif(X,X).<td>false</table>');
    if (cases.length !== 2 || cases[0].expected !== 'succeeds' || cases[1].expected !== 'fails') {
      throw new Error(`unexpected dif parse ${JSON.stringify(cases)}`);
    }
  });

  reporter.test('tracked Markdown report records dynamic counts without volatile metadata', () => {
    const summary = {
      syntax: { passed: 366, total: 366 },
      number_chars: { passed: 78, total: 78 },
      variable_names: { passed: 75, total: 75 },
      dif: { passed: 26, total: 26 },
      length: { passed: 37, total: 37 },
      phrase: { passed: 58, total: 58 },
      cleanup: { passed: 25, total: 25 },
    };
    const text = formatNeumerkelMarkdown({
      summary,
      manifest: { fetchedAt: '2026-09-03T12:00:00.000Z', sources: [{ etag: '"volatile-tag"' }] },
    });
    if (!text.includes('**665/665**')) throw new Error('Markdown total is not derived from suite counts');
    if (!text.includes('| setup_call_cleanup/3 | 25 | 25 |')) throw new Error('cleanup row missing');
    if (!text.includes('https://www.complang.tuwien.ac.at/ulrich/iso-prolog/conformity_testing')) throw new Error('upstream source link missing');
    if (text.includes('2026-09-03T12:00:00.000Z') || text.includes('volatile-tag')) {
      throw new Error('tracked Markdown must exclude volatile fetch metadata');
    }
  });

  reporter.test('cleanup discovery follows the reference one-line example protocol', () => {
    const html = `<pre>
setup_call_cleanup(fail,_,_).
   Fails.
setup_call_cleanup(open(f,read,S),true,close(S)).
   Succeeds.
catch(setup_call_cleanup(true,throw(x),true),E,true).
   Succeeds.
catch(
  setup_call_cleanup(true,throw(x),true),
  E,true).
   Succeeds.
</pre>`;
    const cases = parseCleanupCases(html);
    if (cases.length !== 2) throw new Error(`expected 2 executable one-line non-file cases, got ${cases.length}`);
    if (cases[0].expected !== 'fails' || cases[1].expected !== 'succeeds') throw new Error('cleanup classification mismatch');
  });

  reporter.sectionTotal('Neumerkel harness');
}

if (isMainModule(import.meta.url)) await runStandalone(runNeumerkelHarnessTests);
