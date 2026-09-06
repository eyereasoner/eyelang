#!/usr/bin/env node
// Executable conformance status plus static corpus inventory.
// The WG17 row is run when this report is generated, so a syntax-conformance
// regression changes the public report even when the fixture inventory itself
// has not changed.
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { runWg17 } from './run-wg17.mjs';
import { listPrologFiles } from './test-support.mjs';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)));
const packageRoot = path.resolve(root, '..');
const conformanceRoot = path.join(root, 'conformance');

const KINDS = [
  { kind: 'cases', expectedKind: 'expected', expectedExt: '.pl', column: 'positive' },
  { kind: 'errors', expectedKind: 'expected-errors', expectedExt: '.txt', column: 'errors' },
  { kind: 'warnings', expectedKind: 'expected-warnings', expectedExt: '.pl', column: 'warnings' },
  { kind: 'proofs', expectedKind: 'expected-proofs', expectedExt: '.pl', column: 'proofs' },
];

export function buildConformanceReport({ wg17Suite = runWg17 } = {}) {
  const categories = new Map();
  const corpusIssues = [];

  for (const { kind, expectedKind, expectedExt, column } of KINDS) {
    const base = path.join(conformanceRoot, kind);
    if (!fs.existsSync(base)) continue;
    for (const file of listPrologFiles(base)) {
      const category = categoryOf(file);
      const counts = ensureCategory(categories, category);
      counts[column]++;
      counts.total++;

      const stem = file.slice(0, -3);
      const expected = path.join(conformanceRoot, expectedKind, `${stem}${expectedExt}`);
      if (!fs.existsSync(expected)) corpusIssues.push(`missing ${expectedKind}/${stem}${expectedExt}`);
      if (kind === 'warnings') {
        const expectedStderr = path.join(conformanceRoot, expectedKind, `${stem}.txt`);
        if (!fs.existsSync(expectedStderr)) corpusIssues.push(`missing ${expectedKind}/${stem}.txt`);
      }
    }
  }

  const rows = [...categories.entries()]
    .sort(([a], [b]) => a.localeCompare(b))
    .map(([category, counts]) => ({ category, ...counts }));
  const total = rows.reduce((acc, row) => ({
    positive: acc.positive + row.positive,
    errors: acc.errors + row.errors,
    warnings: acc.warnings + row.warnings,
    proofs: acc.proofs + row.proofs,
    total: acc.total + row.total,
  }), { positive: 0, errors: 0, warnings: 0, proofs: 0, total: 0 });

  const executable = [executeGate('WG17 syntax', wg17Suite)];
  const executionIssues = executable.flatMap((gate) => gate.failures.map((failure) =>
    `${gate.name}: ${failure.name}: ${failure.message}`));

  return {
    rows,
    total,
    executable,
    corpusIssues: corpusIssues.sort(),
    executionIssues,
    issues: [...corpusIssues.sort(), ...executionIssues],
  };
}

export function formatConformanceReport(report = buildConformanceReport()) {
  const wg17 = report.executable.find((gate) => gate.name === 'WG17 syntax');
  const wg17Total = wg17?.total ?? 0;
  const lines = [
    '# EyeProlog conformance report',
    '',
    'This report combines an executable external conformance gate with the file-based',
    'conformance corpus under `test/conformance/`. The executable result is measured',
    'when this report is generated; it is not inferred from fixture counts.',
    '',
  ];

  lines.push(
    '## Latest Neumerkel evidence',
    '',
    'See the tracked [latest Neumerkel conformity report](test/conformance/NEUMERKEL-LATEST.md).',
    '`npm test` fetches all seven TU Wien sources once and executes the discovered inventory.',
    'The release workflow then synchronizes this tracked report from those exact successful',
    'cached source bytes, avoiding a second live fetch and its race window.',
    '',
  );

  lines.push(
    '## Executable conformance status',
    '',
    '| Gate | Passed | Total | Status |',
    '|---|---:|---:|---|',
  );

  for (const gate of report.executable) {
    const status = gate.passed === gate.total ? 'pass' : 'fail';
    lines.push(`| ${gate.name} | ${gate.passed} | ${gate.total} | ${status} |`);
  }

  lines.push(
    '',
    `The WG17 syntax row executes the vendored ${wg17Total}-case conformity-testing matrix`,
    'against EyeProlog\'s strict ISO reader/writer. A behavior fix such as operator-token',
    'spelling therefore changes this report even when no corpus file is added or removed.',
    '',
    '## File-based corpus inventory',
    '',
    '| Category | Positive | Errors | Warnings | Proofs | Total |',
    '|---|---:|---:|---:|---:|---:|',
  );

  for (const row of report.rows) {
    lines.push(`| ${row.category} | ${row.positive} | ${row.errors} | ${row.warnings} | ${row.proofs} | ${row.total} |`);
  }
  lines.push(`| **Total** | **${report.total.positive}** | **${report.total.errors}** | **${report.total.warnings}** | **${report.total.proofs}** | **${report.total.total}** |`);

  lines.push(...knownDeviationSection());

  if (report.corpusIssues.length > 0) {
    lines.push('', '## Corpus issues', '');
    for (const issue of report.corpusIssues) lines.push(`- ${issue}`);
  }
  if (report.executionIssues.length > 0) {
    lines.push('', '## Executable conformance failures', '');
    for (const issue of report.executionIssues) lines.push(`- ${issue}`);
  }

  return `${lines.join('\n')}\n`;
}

// Deviations that are known, deliberate, and traceable to a specific clause.
// Keeping them in the generated report means they survive regeneration instead
// of living only in a commit message.
function knownDeviationSection() {
  return [
    '',
    '## Known deviations',
    '',
    'These are conscious departures from a standards clause, not open defects.',
    '',
    '### phrase/2-3 terminal-sequence type errors',
    '',
    'ISO/IEC TS 13211-3:2023, 8.18.1.4 c and d specify that a processor which',
    'checks the terminal-sequence arguments of `phrase/2-3` shall report',
    '`type_error(terminal_sequence, S)`. Error clause c is required for',
    '`phrase/2` and implementation defined for `phrase/3`.',
    '',
    'EyeProlog checks both arguments but reports `type_error(list, S)`.',
    'Ulrich Neumerkel\'s `phrase_quad.pl` corpus, which the release gate fetches',
    'live from TU Wien, accepts only `false` or `type_error(list, S)` for quads',
    '41 and 42, so the published TS and that corpus cannot both be satisfied.',
    'The corpus predates the TS. Changing the error term is a one-line edit in',
    '`phraseSolutions` (`src/iso.js`); it additionally requires relaxing quads',
    '41-42 of the Neumerkel gate.',
    '',
    'Note that TS 13211-3, 7.14.7.2 gives `phrase({true}, nonlist, S)` as an',
    'example which succeeds with `S = nonlist`, which is consistent with the TS',
    'permitting `phrase/3` to omit the check entirely. EyeProlog prefers the',
    'stricter diagnostic that the TS also explicitly allows.',
    '',
  ];
}

function executeGate(name, runSuite) {
  const failures = [];
  const reporter = {
    passed: 0,
    total: 0,
    section() {},
    sectionTotal() {},
    test(testName, run) {
      this.total++;
      try {
        run();
        this.passed++;
      } catch (error) {
        failures.push({
          name: testName,
          message: String(error?.message ?? error).split('\n', 1)[0],
        });
      }
    },
  };

  try {
    runSuite(reporter);
  } catch (error) {
    failures.push({ name: 'suite setup', message: String(error?.message ?? error).split('\n', 1)[0] });
  }
  return { name, passed: reporter.passed, total: reporter.total, failures };
}

function categoryOf(file) {
  const parts = file.split('/');
  return parts.length > 1 ? parts[0] : 'legacy-numbered';
}

function ensureCategory(categories, category) {
  let counts = categories.get(category);
  if (!counts) {
    counts = { positive: 0, errors: 0, warnings: 0, proofs: 0, total: 0 };
    categories.set(category, counts);
  }
  return counts;
}

if (process.argv[1] != null && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  const report = buildConformanceReport();
  const text = formatConformanceReport(report);
  const outputPath = process.argv[2] ?? null;
  if (outputPath == null) {
    process.stdout.write(text);
  } else {
    const resolved = path.resolve(packageRoot, outputPath);
    fs.mkdirSync(path.dirname(resolved), { recursive: true });
    fs.writeFileSync(resolved, text);
    process.stdout.write(`wrote ${path.relative(packageRoot, resolved)}\n`);
  }
  if (report.issues.length > 0) process.exit(1);
}
