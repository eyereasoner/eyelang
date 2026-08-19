#!/usr/bin/env node
// Offline, one-by-one execution of the 366 active WG17 syntax cases. The
// fixture is a dated snapshot of the public conformity-testing table, so the
// release gate does not depend on the network or another Prolog system.
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import {
  Env, Program, Solver, parseGoalText, run,
} from '../src/index.js';
import { TestReporter, isMainModule } from './test-style.mjs';

const testRoot = path.dirname(fileURLToPath(import.meta.url));
const fixturePath = path.join(testRoot, 'conformance', 'wg17-syntax-cases.json');

function runnerStage(index, maximum) {
  if (index > maximum) return `write('\\n<WG17-COMPLETE>')`;
  return `read_term(G${index}, [variable_names(V${index})]), ` +
    `(G${index} == end_of_file -> write('\\n<WG17-COMPLETE>') ; (` +
    `write('\\n<WG17-BEGIN-${index}>'), call(G${index}), ` +
    `write('<WG17-VARS>'), writeq(V${index}), write('<WG17-END>'), ` +
    `${runnerStage(index + 1, maximum)}))`;
}

function capturedStages(stdout) {
  const complete = stdout.indexOf('<WG17-COMPLETE>');
  if (complete < 0) return null;
  const captured = stdout.slice(0, complete);
  return [...captured.matchAll(/<WG17-BEGIN-(\d+)>([\s\S]*?)<WG17-VARS>([\s\S]*?)<WG17-END>/g)]
    .map((match) => ({ output: match[2], variables: match[3] }));
}

function executeFinite(item) {
  try {
    const result = run('', {
      isoStrict: true,
      goal: runnerStage(1, item.readCount),
      ioOptions: { input: `${item.input}\n` },
    });
    const stages = capturedStages(result.stdout);
    return stages == null ? { type: 'failure' } : { type: 'success', stages };
  } catch (error) {
    return { type: 'error', formal: error?.formal ?? null };
  }
}

function executeWait(item) {
  const program = Program.parse('', { isoStrict: true });
  const solver = new Solver(program, {
    isoStrict: true,
    ioOptions: { input: item.input },
  });
  const stream = solver.io.resolve('user_input');
  let requests = 0;
  stream.interactiveReadTerm = () => {
    requests++;
    return null;
  };
  const goal = parseGoalText('read_term(G, [])', {
    isoStrict: true,
    operatorDefinitions: [...program.operators.values()],
  });
  try {
    [...solver.solve([goal], new Env(), 0)];
  } catch (_) {
    // Returning null from the hook models EOF after EyeProlog has asked the
    // interactive source for the continuation that the upstream case awaits.
  }
  return requests === 1 ? { type: 'waits' } : { type: 'did_not_wait', requests };
}

function assertOutcome(item) {
  const actual = item.outcome.type === 'waits' ? executeWait(item) : executeFinite(item);
  if (JSON.stringify(actual) !== JSON.stringify(item.outcome)) {
    throw new Error(
      `WG17 #${item.id} (${item.expected})\n` +
      `expected ${JSON.stringify(item.outcome)}\n` +
      `actual   ${JSON.stringify(actual)}`,
    );
  }
}

export function runWg17Syntax(reporter = new TestReporter()) {
  const fixture = JSON.parse(fs.readFileSync(fixturePath, 'utf8'));
  if (fixture.cases.length !== 366) {
    throw new Error(`WG17 fixture has ${fixture.cases.length} cases instead of 366`);
  }
  const ids = new Set(fixture.cases.map(({ id }) => id));
  if (ids.size !== 366 || ids.has(20) || ids.has(273)) {
    throw new Error('WG17 fixture identifiers do not match the active upstream inventory');
  }

  reporter.section('WG17 syntax');
  for (const item of fixture.cases) reporter.test(`#${item.id}`, () => assertOutcome(item));
  reporter.sectionTotal('WG17 syntax');
}

if (isMainModule(import.meta.url)) {
  const reporter = new TestReporter();
  try {
    runWg17Syntax(reporter);
    reporter.totalLine();
  } catch (_) {
    process.exitCode = 1;
  }
}
