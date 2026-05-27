#!/usr/bin/env node
// Unified test runner used by `npm test`.
// Running all suites in one process keeps the numbering continuous and avoids
// npm's intermediate script banners between conformance, regression, and examples.
import { TestReporter } from './test-style.js';
import { runConformance } from './run-conformance.js';
import { runRegression } from './run-regression.js';
import { runExamples } from './run-examples.js';

const reporter = new TestReporter();

try {
  runConformance(reporter);
  runRegression(reporter);
  runExamples(reporter);
  reporter.totalLine();
  process.exit(0);
} catch (_) {
  process.exit(1);
}
