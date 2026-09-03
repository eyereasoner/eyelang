#!/usr/bin/env node
import fs from 'node:fs';
import path from 'node:path';
import process from 'node:process';
import { executeNeumerkel } from './neumerkel.mjs';
import { isMainModule, nowMs, runStandalone } from './test-style.mjs';

function parseArgs(argv) {
  const options = {
    mode: 'live',
    sourceDir: process.env.EYEPROLOG_NEUMERKEL_SOURCE_DIR ?? null,
    updateReport: false,
    verifyReport: true,
  };
  for (let index = 0; index < argv.length; index++) {
    const arg = argv[index];
    if (arg === '--cached') options.mode = 'cached';
    else if (arg === '--update-report') options.updateReport = true;
    else if (arg === '--no-verify-report') options.verifyReport = false;
    else if (arg === '--source-dir') {
      if (argv[index + 1] == null) throw new Error('--source-dir requires a directory');
      options.sourceDir = path.resolve(argv[++index]);
    } else if (arg === '--help' || arg === '-h') options.help = true;
    else throw new Error(`unknown option ${arg}`);
  }
  return options;
}

function printHelp() {
  process.stdout.write(
    'Usage: npm run test:neumerkel -- [--cached] [--source-dir DIR] [--update-report] [--no-verify-report]\n\n' +
    'Default: fetch all seven current Neumerkel conformity sources live, run the\n' +
    'discovered cases, and verify test/conformance/NEUMERKEL-LATEST.md matches\n' +
    'the successful upstream result. --update-report refreshes that tracked file.\n' +
    '--cached is for offline reproduction only; it is never the release gate.\n',
  );
}

export async function runNeumerkel(reporter, options = {}) {
  const effective = { verifyReport: true, updateReport: false, ...options };
  if (effective.sourceDir == null && process.env.EYEPROLOG_NEUMERKEL_SOURCE_DIR) {
    effective.sourceDir = path.resolve(process.env.EYEPROLOG_NEUMERKEL_SOURCE_DIR);
  }
  const result = await executeNeumerkel({ reporter: quietNeumerkelReporter(reporter), ...effective });
  const relativeReportPath = path.relative(process.cwd(), result.reportPath);

  if (effective.updateReport) {
    fs.mkdirSync(path.dirname(result.reportPath), { recursive: true });
    fs.writeFileSync(result.reportPath, result.reportText);
    reporter.stdout.write(`Updated Neumerkel report: ${relativeReportPath}\n`);
  } else if (effective.verifyReport !== false) {
    const committed = fs.existsSync(result.reportPath) ? fs.readFileSync(result.reportPath, 'utf8') : null;
    if (committed !== result.reportText) {
      throw new Error(
        `tracked Neumerkel report is stale: ${relativeReportPath}\n` +
        'Run npm run conformance:update:neumerkel and commit the updated report.',
      );
    }
    reporter.stdout.write(`Neumerkel report: ${relativeReportPath}\n`);
  } else {
    reporter.stdout.write(`Neumerkel report verification skipped (${relativeReportPath})\n`);
  }
  return result;
}

function quietNeumerkelReporter(reporter) {
  return {
    section(name) {
      reporter.section(name);
    },
    sectionTotal(label, elapsedMs = null) {
      reporter.sectionTotal(label, elapsedMs);
    },
    test(name, run) {
      reporter.total++;
      const nr = String(reporter.total).padStart(3, '0');
      const startedAt = nowMs();
      try {
        run();
        reporter.ok++;
      } catch (error) {
        const ms = nowMs() - startedAt;
        reporter.stderr.write(`FAIL ${nr} ${name} (${ms} ms)\n`);
        reporter.stderr.write(`${error?.stack ?? String(error)}\n`);
        throw error;
      }
    },
  };
}

if (isMainModule(import.meta.url)) {
  const options = parseArgs(process.argv.slice(2));
  if (options.help) printHelp();
  else await runStandalone((reporter) => runNeumerkel(reporter, options));
}
