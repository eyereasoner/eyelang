import test from 'node:test';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { access, cp, lstat, mkdir, mkdtemp, readFile, rm, writeFile } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { syncVersion } from '../scripts/sync-version.js';

const root = fileURLToPath(new URL('../', import.meta.url));

// Package installation, publisher identity, and CLI.

test('the npm package preserves its publisher identity and installs a working CLI', async t => {
  const directory = await mkdtemp(join(tmpdir(), 'eyeon-package-'));
  t.after(() => rm(directory, { recursive: true, force: true }));
  const env = { ...process.env, npm_config_cache: join(directory, 'cache') };
  const install = spawnSync('npm', [
    'install', '--install-links', '--offline', '--ignore-scripts', '--no-audit', '--no-fund', '--no-package-lock', root,
  ], { cwd: directory, env, encoding: 'utf8' });
  assert.ifError(install.error);
  assert.equal(install.status, 0, install.stderr || install.error?.message);
  const installed = join(directory, 'node_modules', 'eyeon');
  assert.equal((await lstat(installed)).isSymbolicLink(), false);
  const pkg = JSON.parse(await readFile(join(installed, 'package.json'), 'utf8'));
  assert.deepEqual(pkg.repository, {
    type: 'git',
    url: 'git+https://github.com/eyereasoner/eyeon.git',
  });
  assert.deepEqual(pkg.bin, { eyeon: 'eyeon.js' });
  await access(join(directory, 'node_modules', '.bin', process.platform === 'win32' ? 'eyeon.cmd' : 'eyeon'));

  const cli = join(installed, pkg.bin.eyeon);
  const version = spawnSync(process.execPath, [cli, '--version'], { cwd: directory, encoding: 'utf8' });
  assert.ifError(version.error);
  assert.equal(version.status, 0, version.stderr || version.error?.message);
  assert.equal(version.stdout, `eyeon ${pkg.version}\n`);

  const program = await readFile(join(root, 'examples', 'socrates.pl'), 'utf8');
  const answer = spawnSync(process.execPath, [cli, '-'], { cwd: directory, input: program, encoding: 'utf8' });
  assert.ifError(answer.error);
  assert.equal(answer.status, 0, answer.stderr || answer.error?.message);
  assert.match(answer.stdout, /mortal\(socrates\)/);
});

// Version synchronization and release lifecycle.

const read = (directory, file) => readFile(join(directory, file), 'utf8');

async function versionFixture(t) {
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
  const directory = await versionFixture(t);
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
  const directory = await versionFixture(t);
  const spec = await read(directory, 'SPEC.md');
  await writeFile(join(directory, 'playground.html'), '<html>missing version</html>');
  await writeFile(join(directory, 'package.json'), JSON.stringify({ version: '1.2.3' }));
  await assert.rejects(syncVersion(directory), /Expected one version marker in playground.html/);
  assert.equal(await read(directory, 'SPEC.md'), spec);
});
