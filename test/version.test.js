import test from 'node:test';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { cp, mkdir, mkdtemp, readFile, rm, writeFile } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { syncVersion } from '../scripts/sync-version.js';

const root = fileURLToPath(new URL('../', import.meta.url));
const read = (directory, file) => readFile(join(directory, file), 'utf8');

async function fixture(t) {
  const directory = await mkdtemp(join(tmpdir(), 'eyeon-version-'));
  t.after(() => rm(directory, { recursive: true, force: true }));
  for (const folder of ['src', 'scripts']) await mkdir(join(directory, folder));
  for (const file of ['package.json', 'eyeon.js', 'src/language.js', 'scripts/sync-version.js', 'SPEC.md', 'playground.html']) {
    await cp(join(root, file), join(directory, file));
  }
  return directory;
}

async function assertVersions(directory) {
  const { version } = JSON.parse(await read(directory, 'package.json'));
  assert.ok((await read(directory, 'SPEC.md')).includes(`Language version: ${version}\n`));
  assert.ok((await read(directory, 'playground.html')).includes(`<span id="version">v${version}</span>`));
  for (const flag of ['-v', '--version']) {
    const result = spawnSync(process.execPath, [join(directory, 'eyeon.js'), flag], { cwd: tmpdir(), encoding: 'utf8' });
    assert.equal(result.status, 0, result.stderr || result.error?.message);
    assert.equal(result.stdout, `eyeon ${version}\n`);
    assert.equal(result.stderr, '');
  }
}

test('the CLI, specification, and playground show the package version', async () => {
  await assertVersions(root);
  const help = spawnSync(process.execPath, [join(root, 'eyeon.js'), '--help'], { encoding: 'utf8' });
  assert.equal(help.status, 0);
  assert.match(help.stdout, /-v, --version/);
});

test('npm version patch synchronizes every displayed version through the release lifecycle hook', async t => {
  const directory = await fixture(t);
  const before = JSON.parse(await read(directory, 'package.json')).version.split('.').map(Number);
  const result = spawnSync('npm', ['version', 'patch', '--no-git-tag-version'], {
    cwd: directory, encoding: 'utf8', env: { ...process.env, npm_config_cache: join(directory, '.npm-cache') },
  });
  assert.equal(result.status, 0, result.stderr || result.error?.message);
  const version = JSON.parse(await read(directory, 'package.json')).version;
  assert.equal(version, `${before[0]}.${before[1]}.${before[2] + 1}`);
  await assertVersions(directory);
});

test('version synchronization reports missing markers before changing documentation', async t => {
  const directory = await fixture(t);
  const spec = await read(directory, 'SPEC.md');
  await writeFile(join(directory, 'playground.html'), '<html>missing version</html>');
  await writeFile(join(directory, 'package.json'), JSON.stringify({ version: '1.2.3' }));
  await assert.rejects(syncVersion(directory), /Expected one version marker in playground.html/);
  assert.equal(await read(directory, 'SPEC.md'), spec);
});
