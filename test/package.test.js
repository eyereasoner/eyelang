import test from 'node:test';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { access, lstat, mkdtemp, readFile, rm } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { fileURLToPath } from 'node:url';

const root = fileURLToPath(new URL('../', import.meta.url));

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
