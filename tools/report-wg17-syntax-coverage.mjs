#!/usr/bin/env node
// Render the traceability status for the public WG17 syntax corpus. This is a
// coverage ledger, not a claim that untraced cases fail or that traced cases
// are the only local tests exercising the same language rules.
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const packageRoot = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const manifestPath = path.join(packageRoot, 'test', 'conformance', 'wg17-syntax-coverage.json');
const statusPath = path.join(packageRoot, 'test', 'conformance', 'WG17-SYNTAX-STATUS.md');

export function readWg17SyntaxCoverage() {
  const manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf8'));
  const { firstId, lastId, deletedIds, activeCases } = manifest.upstream;
  const deleted = new Set(deletedIds);
  const activeIds = [];
  for (let id = firstId; id <= lastId; id++) if (!deleted.has(id)) activeIds.push(id);
  if (activeIds.length !== activeCases) {
    throw new Error(`WG17 active-case count is ${activeIds.length}, manifest says ${activeCases}`);
  }

  const active = new Set(activeIds);
  const covered = new Set();
  const evidenceEntries = [];
  for (const evidence of manifest.evidence) {
    if (!evidence.name || !evidence.path || !evidence.link ||
        (!Array.isArray(evidence.ids) && evidence.ids !== 'all-active')) {
      throw new Error('invalid WG17 evidence entry');
    }
    const evidenceIds = evidence.ids === 'all-active' ? activeIds : evidence.ids;
    const evidenceFilename = path.join(packageRoot, evidence.path);
    if (!fs.existsSync(evidenceFilename)) throw new Error(`missing WG17 evidence file ${evidence.path}`);
    const referenced = referencedWg17Ids(fs.readFileSync(evidenceFilename, 'utf8'));
    const withinEntry = new Set();
    for (const id of evidenceIds) {
      if (!Number.isInteger(id) || !active.has(id)) throw new Error(`invalid active WG17 id #${id}`);
      if (withinEntry.has(id)) throw new Error(`duplicate WG17 id #${id} in ${evidence.name}`);
      if (!referenced.has(id)) throw new Error(`WG17 id #${id} is not referenced by ${evidence.path}`);
      withinEntry.add(id);
      covered.add(id);
    }
    evidenceEntries.push({ ...evidence, ids: evidenceIds });
  }

  return {
    manifest,
    evidenceEntries,
    activeIds,
    coveredIds: activeIds.filter((id) => covered.has(id)),
    untracedIds: activeIds.filter((id) => !covered.has(id)),
  };
}

function referencedWg17Ids(source) {
  const ids = new Set();
  for (const match of source.matchAll(/#(\d+)(?:-(\d+))?/g)) {
    const first = Number(match[1]);
    const last = match[2] == null ? first : Number(match[2]);
    for (let id = first; id <= last; id++) ids.add(id);
  }
  for (const match of source.matchAll(/"id"\s*:\s*(\d+)/g)) ids.add(Number(match[1]));
  return ids;
}

export function renderWg17SyntaxStatus() {
  const { manifest, evidenceEntries, activeIds, coveredIds, untracedIds } = readWg17SyntaxCoverage();
  const percentage = (100 * coveredIds.length / activeIds.length).toFixed(1);
  const evidenceRows = evidenceEntries.map((evidence) =>
    `| [${evidence.name}](${evidence.link}) | ${evidence.ids.length} | ${formatRanges(evidence.ids)} |`);

  return `# WG17 syntax traceability status

Source: [Conformity Testing I: Syntax](${manifest.source})  
Upstream inventory checked: ${manifest.checkedOn}

This ledger counts an upstream case only when its WG17 identifier, query,
expected ISO disposition, and observed EyeProlog outcome are stored in the
offline executable matrix. Semantically similar parser tests are not inferred
as coverage.

## Current standing

| Measure | Count |
| --- | ---: |
| Active upstream cases | ${activeIds.length} |
| Executable EyeProlog dispositions | ${coveredIds.length} (${percentage}%) |
| Not yet traced one-by-one | ${untracedIds.length} |
| Deleted upstream identifiers | ${formatRanges(manifest.upstream.deletedIds)} |

The matrix runs in strict ISO stream-reader mode as part of \`npm test\`. The
three upstream \`waits\` cases are checked through EyeProlog's interactive input
hook; the other ${activeIds.length - 3} cases are checked for their exact stored
success output, bindings, failure, or ISO error category.

## Traceable evidence

| Executable evidence | Referenced IDs | WG17 cases |
| --- | ---: | --- |
${evidenceRows.join('\n')}

The evidence groups overlap. Their union is **${coveredIds.length}** active cases:
${formatRanges(coveredIds)}.

## Untraced upstream identifiers

${untracedIds.length === 0 ? 'None.' : `${formatRanges(untracedIds)}.`}

## Maintenance

1. Refresh the dated fixture when the upstream table changes.
2. Review any changed ISO expectation before updating an observed snapshot.
3. Keep this generated status page synchronized in the release gate.
`;
}

function formatRanges(ids) {
  const sorted = [...new Set(ids)].sort((left, right) => left - right);
  const ranges = [];
  for (let index = 0; index < sorted.length;) {
    const start = sorted[index];
    let end = start;
    while (index + 1 < sorted.length && sorted[index + 1] === end + 1) end = sorted[++index];
    ranges.push(start === end ? `#${start}` : `#${start}–#${end}`);
    index++;
  }
  return ranges.join(', ');
}

if (process.argv[1] != null && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  const rendered = renderWg17SyntaxStatus();
  if (process.argv.includes('--check')) {
    const current = fs.readFileSync(statusPath, 'utf8');
    if (current !== rendered) {
      process.stderr.write('WG17 syntax status is stale; run npm run report:wg17-syntax and update the file.\n');
      process.exitCode = 1;
    }
  } else {
    process.stdout.write(rendered);
  }
}
