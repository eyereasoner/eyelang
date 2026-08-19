#!/usr/bin/env python3
from __future__ import annotations
import argparse, os, re, shutil, subprocess, sys, tempfile, time
from pathlib import Path

ROOT = Path(__file__).resolve().parent
TABLED = {'tc','sg','modsg','wordnet','wine'}
WFS = {'win_cycle','magicset'}
ORDER = ['join1','join2','joindup','lubm','mondial','dblp','tc','sg','wordnet','wine','modsg','win_tree','win_cycle','magicset']

def find_exe(engine: str):
    envname = {'eyeprolog':'EYEPROLOG','trealla':'TREALLA','scryer':'SCRYER','swipl':'SWIPL'}[engine]
    default = {'eyeprolog':'eyeprolog','trealla':'tpl','scryer':'scryer-prolog','swipl':'swipl'}[engine]
    val = os.environ.get(envname)
    if val:
        return [val]
    p = shutil.which(default)
    return [p] if p else None

def goal_for(path: Path):
    for line in path.read_text(encoding='utf-8').splitlines():
        if line.startswith('%% goal:'):
            return line.split(':',1)[1].strip()
    raise RuntimeError(f'no %% goal: in {path}')

def probe_tabling(cmd, engine, timeout):
    if engine == 'eyeprolog':
        return True, 'automatic positive tabling + finite-Datalog WFS/tnot'
    if engine == 'swipl':
        return True, 'built-in SLG tabling + WFS/tnot'
    src = ":- use_module(library(tabling)).\nprobe :- write('__ORB_TABLING_OK__'), nl.\n"
    with tempfile.NamedTemporaryFile('w', suffix='.pl', delete=False, encoding='utf-8') as f:
        f.write(src); name=f.name
    try:
        if engine == 'trealla':
            args = cmd + ['-q','-f','-g','probe,halt',name]
        else:
            args = cmd + ['-f','-g','probe,halt',name]
        try:
            cp = subprocess.run(args, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                                timeout=min(timeout,30) if timeout else 30)
        except Exception as e:
            return False, str(e)
        ok = cp.returncode == 0 and '__ORB_TABLING_OK__' in cp.stdout
        detail = (cp.stderr or cp.stdout).strip().replace('\n',' ')[:180]
        return ok, detail or ('available' if ok else 'not detected')
    finally:
        try: os.unlink(name)
        except OSError: pass

def run_one(engine, cmd, name, timeout):
    path = ROOT/engine/f'{name}.pl'
    goal = goal_for(path)
    if engine == 'eyeprolog':
        args = cmd + ['--goal', goal, str(path)]
    elif engine == 'trealla':
        args = cmd + ['-q','-f','-g', f'{goal},write(Count),nl,halt', str(path)]
    elif engine == 'scryer':
        args = cmd + ['-f','-g', f'{goal},write(Count),nl,halt', str(path)]
    else:
        # SWI: avoid user init files, load the benchmark as a script, run the goal, then halt.
        args = cmd + ['-q','-f','none','-s',str(path),'-g',f'{goal},write(Count),nl','-t','halt']
    t0=time.perf_counter()
    try:
        cp=subprocess.run(args, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                          timeout=timeout if timeout else None)
        sec=time.perf_counter()-t0
        status='ok' if cp.returncode==0 else f'failed({cp.returncode})'
        output=(cp.stdout.strip().replace('\t',' ') or cp.stderr.strip().replace('\t',' '))
        output=' '.join(output.splitlines())[:500]
        return sec,status,output
    except subprocess.TimeoutExpired as e:
        sec=time.perf_counter()-t0
        return sec,'timeout',f'timed out after {timeout}s'
    except Exception as e:
        sec=time.perf_counter()-t0
        return sec,'error',str(e)

def main():
    ap=argparse.ArgumentParser(description='Run the OpenRuleBench multi-engine Prolog adaptation.')
    ap.add_argument('engine', choices=['eyeprolog','trealla','scryer','swipl','all'])
    ap.add_argument('--only', help='comma-separated benchmark names')
    ap.add_argument('--timeout', type=float, default=300.0, help='per benchmark seconds; 0 disables timeout (default 300)')
    ap.add_argument('--unsafe-wfs', action='store_true', help='also try win_cycle and magicset on engines without WFS; EyeProlog WFS build and SWI use tnot/1 by default')
    args=ap.parse_args()
    engines=['eyeprolog','trealla','scryer','swipl'] if args.engine=='all' else [args.engine]
    wanted=ORDER if not args.only else [x.strip().removesuffix('.pl') for x in args.only.split(',') if x.strip()]
    print('engine\tbenchmark\tseconds\tstatus\toutput')
    for eng in engines:
        cmd=find_exe(eng)
        if not cmd:
            print(f'{eng}\t-\t0\tengine-not-found\tset '+{'eyeprolog':'EYEPROLOG','trealla':'TREALLA','scryer':'SCRYER','swipl':'SWIPL'}[eng])
            continue
        tab_ok,tab_note=probe_tabling(cmd,eng,args.timeout)
        for name in wanted:
            if name not in ORDER:
                print(f'{eng}\t{name}\t0\tunknown-benchmark\t')
                continue
            if name in WFS and eng not in ('eyeprolog','swipl') and not args.unsafe_wfs:
                print(f'{eng}\t{name}\t0\tskipped-wfs\trequires well-founded negation; EyeProlog(WFS build) and SWI run WFS variants')
                continue
            if eng in ('trealla','scryer','swipl') and name in TABLED and not tab_ok:
                print(f'{eng}\t{name}\t0\tskipped-no-tabling\t{tab_note}')
                continue
            sec,status,output=run_one(eng,cmd,name,args.timeout)
            print(f'{eng}\t{name}\t{sec:.6f}\t{status}\t{output}')

if __name__=='__main__':
    main()
