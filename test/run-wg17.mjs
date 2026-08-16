#!/usr/bin/env node
// Aggregate all vendored WG17 conformity suites behind one stable entry point.
// The current upstream conformity table is syntax-focused; additional WG17
// suites can be added here without changing npm/CI commands.
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
      goal: runnerStage(1, item.readCount ?? 16),
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

function canonicalUpstreamExpected(expected) {
  return String(expected)
    .replace(/[²³°]/g, '')
    .replace(/\u00a0/g, ' ')
    .replace(/[ \t\n]+/g, ' ')
    .trim();
}

function observableOutput(actual) {
  if (actual.type !== 'success') return null;
  return actual.stages.map(({ output }) => output).join('');
}

export function matchesUpstreamExpectation(expectedText, actual) {
  const expected = canonicalUpstreamExpected(expectedText);

  if (/^waits$/i.test(expected)) return actual.type === 'waits';
  if (/^succeeds(?:\b|$)/i.test(expected)) return actual.type === 'success';
  if (/^fails(?:\b|$)/i.test(expected)) return actual.type === 'failure';

  if (/^syntax\s*err\.?$/i.test(expected)) {
    return actual.type === 'error' && /^syntax_error\(/.test(actual.formal ?? '');
  }
  if (/^repr\.\s*err\.?$/i.test(expected)) {
    return actual.type === 'error' && /^representation_error\(/.test(actual.formal ?? '');
  }
  if (/^syntax\/repr\.\s*err\.?$/i.test(expected)) {
    return actual.type === 'error' &&
      /^(?:syntax_error|representation_error)\(/.test(actual.formal ?? '');
  }
  if (/^syntax\s*err\.\/waits$/i.test(expected)) {
    return actual.type === 'waits' ||
      (actual.type === 'error' && /^syntax_error\(/.test(actual.formal ?? ''));
  }

  // Most new WG17 rows are observable write/read examples.  For those, the
  // Codex cell itself is the expected output, so no hand-written local
  // outcome is needed before the case can be executed.
  const output = observableOutput(actual);
  if (output != null && canonicalUpstreamExpected(output) === expected) return true;

  return false;
}

function usesWaitMatcher(expectedText) {
  const expected = canonicalUpstreamExpected(expectedText);
  return /^waits$/i.test(expected);
}

function compactTestText(value, maximum) {
  const text = String(value ?? '')
    .replace(/\r/g, '\\r')
    .replace(/\n/g, '\\n')
    .replace(/\t/g, '\\t')
    .replace(/[ ]+/g, ' ')
    .trim();
  if (text.length <= maximum) return text;
  return `${text.slice(0, maximum - 1)}…`;
}

export function wg17TestDescription(item) {
  const query = compactTestText(item.query ?? item.input, 56);
  const expected = compactTestText(item.expected, 28);
  return `#${item.id} ${query} -> ${expected}`;
}

function assertOutcome(item) {
  if (item.outcome != null) {
    const actual = item.outcome.type === 'waits' ? executeWait(item) : executeFinite(item);
    if (JSON.stringify(actual) !== JSON.stringify(item.outcome)) {
      throw new Error(
        `WG17 #${item.id} (${item.expected})\n` +
        `expected ${JSON.stringify(item.outcome)}\n` +
        `actual   ${JSON.stringify(actual)}`,
      );
    }
    return;
  }

  const actual = usesWaitMatcher(item.expected) ? executeWait(item) : executeFinite(item);
  if (!matchesUpstreamExpectation(item.expected, actual)) {
    throw new Error(
      `WG17 #${item.id} (${item.expected})\n` +
      `upstream expectation did not match\n` +
      `actual ${JSON.stringify(actual)}`,
    );
  }
}

function readWg17SyntaxFixture() {
  const fixture = JSON.parse(fs.readFileSync(fixturePath, 'utf8'));
  if (!Array.isArray(fixture.cases) || fixture.cases.length === 0) {
    throw new Error('WG17 syntax fixture has no cases');
  }
  const ids = new Set();
  for (const item of fixture.cases) {
    if (!Number.isInteger(item.id) || ids.has(item.id)) {
      throw new Error(`invalid or duplicate WG17 syntax id #${item.id}`);
    }
    ids.add(item.id);
  }
  return fixture;
}

function runWg17Syntax(reporter = new TestReporter()) {
  const fixture = readWg17SyntaxFixture();

  reporter.section('WG17 syntax');
  for (const item of fixture.cases) {
    reporter.test(wg17TestDescription(item), () => assertOutcome(item));
  }
  reporter.sectionTotal('WG17 syntax');
}

const suites = [runWg17Syntax];

export function runWg17(reporter = new TestReporter()) {
  for (const runSuite of suites) runSuite(reporter);
}

if (isMainModule(import.meta.url)) {
  const reporter = new TestReporter();
  try {
    runWg17(reporter);
    reporter.totalLine();
  } catch (error) {
    process.stderr.write(`${error?.stack ?? error}\n`);
    process.exitCode = 1;
  }
}
