#!/usr/bin/env node
import process from 'node:process';
import { runStandalone } from './test-style.mjs';
import { runNeumerkel } from './run-neumerkel.mjs';
import { runConformance } from './run-conformance.mjs';
import { runIsoStrict } from './run-iso-strict.mjs';
import { runWg17 } from './run-wg17.mjs';

const offline = process.argv.includes('--offline');

await runStandalone(async (reporter) => {
  if (!offline) await runNeumerkel(reporter);
  runConformance(reporter);
  runIsoStrict(reporter);
  runWg17(reporter);
});
