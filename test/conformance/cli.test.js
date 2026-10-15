import test from 'node:test';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { mkdtempSync, rmSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { fileURLToPath } from 'node:url';

const cli = fileURLToPath(new URL('../../eyelang.js', import.meta.url));
function invoke(args, input) {
  const result = spawnSync(process.execPath, [cli,...args], {input,encoding:'utf8',timeout:10000});
  assert.ifError(result.error);
  assert.equal(result.signal,null);
  return result;
}
for (const flag of ['-h','--help','-v','--version']) {
  test(`CLI ${flag} succeeds`, () => {
    const result=invoke([flag]);
    assert.equal(result.status,0);
    assert.ok(result.stdout.length);
    assert.equal(result.stderr,'');
  });
}
for (const args of [[],['one.pl','two.pl']]) {
  test(`CLI rejects argument count ${args.length}`,()=>assert.notEqual(invoke(args).status,0));
}

test('CLI reads UTF-8 .pl files and stdin identically, with standard ARC comments',t=>{
  const directory=mkdtempSync(join(tmpdir(),'eyelang-prolog-'));
  t.after(()=>rmSync(directory,{recursive:true,force:true}));
  const path=join(directory,'café.pl');
  const source="person('élodie'). ?- person(X). ?- why. :- assertion(person('élodie')).";
  writeFileSync(path,source);
  const file=invoke([path]); const stdin=invoke(['-'],source);
  assert.equal(file.status,0); assert.equal(file.stdout,stdin.stdout);
  assert.equal(file.stderr,'');
  assert.match(file.stdout,/X = 'élodie'\./);
  assert.deepEqual([...file.stdout.matchAll(/^% (Answer|Reason|Check)$/gm)].map(match=>match[1]),['Answer','Reason','Check']);
  assert.match(file.stdout,/you told me this/);
});

test('CLI query failure succeeds and missing paths fail',()=>{
  const missing=invoke(['-'],'?- missing.');
  assert.equal(missing.status,0); assert.match(missing.stdout,/false\./);
  const file=invoke(['/missing-conformance-program.pl']);
  assert.notEqual(file.status,0); assert.match(file.stderr,/couldn't find the program/);
});
for (const [id,source,error] of [
  ['syntax','p(a). ?- p(X).\nwrong syntax.',/Line 2:/],
  ['unfinished','p(a).\nq(b)',/Line 2:/],
  ['check','p(a). ?- p(X). ?- why.\n:- assertion(missing).',/Line 2: Check failed/],
  ['check-arithmetic','p(a). ?- p(X).\n:- assertion(X is 1\/0).',/Line 2:.*divide by zero/],
  ['runtime','p(X) :- X is 1/0. ?- p(X).',/divide by zero/],
  ['cycle',String.raw`p(a) :- \+ p(a). ?- p(a).`,/cycle through negation/],
]) {
  test(`CLI ${id} error emits no partial transcript`,()=>{
    const result=invoke(['-'],source);
    assert.notEqual(result.status,0); assert.equal(result.stdout,''); assert.match(result.stderr,error);
  });
}
