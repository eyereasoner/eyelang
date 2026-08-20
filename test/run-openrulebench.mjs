#!/usr/bin/env node
// Fast structural checks for the generated multi-engine OpenRuleBench corpus.
// Full benchmark execution remains separate because it requires external
// Prolog implementations and is intentionally performance-oriented.
import path from 'node:path';
import process from 'node:process';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
import { TestReporter, isMainModule } from './test-style.mjs';

const packageRoot = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');

export function runOpenRuleBenchChecks(reporter = new TestReporter()) {
  reporter.section('OpenRuleBench source integrity');
  runChecker(
    reporter,
    'generated sources pass lexical checks',
    'openrulebench/tools/check_sources.mjs',
    'eyeprolog: 14 sources; lexical checks ok',
  );
  runChecker(
    reporter,
    'engine variants preserve table and WFS adaptations',
    'openrulebench/tools/check_multiengine.mjs',
    'OK: 14 benchmarks x 4 engines; table/WFS adaptations verified.',
  );
  reporter.sectionTotal('OpenRuleBench source-integrity');
}

function runChecker(reporter, name, relativeScript, expectedOutput) {
  reporter.test(name, () => {
    const result = spawnSync(process.execPath, [relativeScript], {
      cwd: packageRoot,
      encoding: 'utf8',
      timeout: 30000,
    });
    if (result.error) throw result.error;
    if (result.status !== 0) {
      throw new Error(
        `${relativeScript} exited with ${result.status}\n` +
        `${result.stdout ?? ''}${result.stderr ?? ''}`.trimEnd(),
      );
    }
    if (!String(result.stdout).includes(expectedOutput)) {
      throw new Error(`${relativeScript} did not report its expected summary\n${result.stdout ?? ''}`.trimEnd());
    }
  });
}

if (isMainModule(import.meta.url)) {
  const reporter = new TestReporter();
  try {
    runOpenRuleBenchChecks(reporter);
    reporter.totalLine();
  } catch (_) {
    process.exit(1);
  }
}
