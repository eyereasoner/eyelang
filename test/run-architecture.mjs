#!/usr/bin/env node
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { TestReporter, isMainModule, runStandalone } from './test-style.mjs';

const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..', 'src');

export function runArchitecture(reporter = new TestReporter()) {
  reporter.section('Source architecture');
  reporter.test('src JavaScript import graph is acyclic', () => {
    const graph = importGraph(ROOT);
    const cycle = findCycle(graph);
    if (cycle != null) throw new Error(`source import cycle: ${cycle.join(' -> ')}`);
  });
  reporter.test('DCG expansion does not depend on the ISO registry facade', () => {
    const source = fs.readFileSync(path.join(ROOT, 'dcg.js'), 'utf8');
    if (/from\s+['"]\.\/iso\.js['"]/.test(source)) {
      throw new Error('dcg.js must import shared error types from errors.js, not iso.js');
    }
  });
  reporter.sectionTotal('source architecture');
}

function sourceFiles(root) {
  const files = [];
  const visit = (dir) => {
    for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
      const full = path.join(dir, entry.name);
      if (entry.isDirectory()) visit(full);
      else if (entry.isFile() && entry.name.endsWith('.js')) files.push(full);
    }
  };
  visit(root);
  return files;
}

function importGraph(root) {
  const files = sourceFiles(root);
  const known = new Set(files.map((file) => path.resolve(file)));
  const graph = new Map(files.map((file) => [path.resolve(file), []]));
  const pattern = /(?:from\s+|import\s*\()(['"])(\.[^'"]+)\1/g;
  for (const file of files) {
    const source = fs.readFileSync(file, 'utf8');
    for (const match of source.matchAll(pattern)) {
      let target = path.resolve(path.dirname(file), match[2]);
      if (!path.extname(target)) target += '.js';
      if (known.has(target)) graph.get(path.resolve(file)).push(target);
    }
  }
  return graph;
}

function findCycle(graph) {
  const state = new Map();
  const stack = [];
  const visit = (node) => {
    state.set(node, 1);
    stack.push(node);
    for (const next of graph.get(node) ?? []) {
      if (state.get(next) === 1) {
        const start = stack.indexOf(next);
        return [...stack.slice(start), next].map((file) => path.relative(ROOT, file));
      }
      if (state.get(next) !== 2) {
        const cycle = visit(next);
        if (cycle != null) return cycle;
      }
    }
    stack.pop();
    state.set(node, 2);
    return null;
  };
  for (const node of graph.keys()) {
    if (state.has(node)) continue;
    const cycle = visit(node);
    if (cycle != null) return cycle;
  }
  return null;
}

if (isMainModule(import.meta.url)) await runStandalone(runArchitecture);
