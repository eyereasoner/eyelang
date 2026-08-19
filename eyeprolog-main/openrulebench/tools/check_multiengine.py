#!/usr/bin/env python3
from pathlib import Path
import re, sys
ROOT=Path(__file__).resolve().parents[1]
ENGINES=('eyeprolog','trealla','scryer','swipl')
TABLED={'tc.pl':1,'sg.pl':1,'modsg.pl':2,'wordnet.pl':3,'wine.pl':225}
WFS={'win_cycle.pl','magicset.pl'}
SWI_WFS_TABLES={'win_cycle.pl':1,'magicset.pl':3}
base=sorted(p.name for p in (ROOT/'eyeprolog').glob('*.pl'))
errors=[]
for eng in ENGINES:
    names=sorted(p.name for p in (ROOT/eng).glob('*.pl'))
    if names!=base: errors.append(f'{eng}: file set differs')
    for name in names:
        text=(ROOT/eng/name).read_text(encoding='utf-8')
        if not re.search(r'^%% goal:\s*.+$',text,re.M): errors.append(f'{eng}/{name}: no goal')
        if text.count('(') != text.count(')'): errors.append(f'{eng}/{name}: paren imbalance')
        n=len(re.findall(r'^:- table ',text,re.M))
        if eng in ('trealla','scryer'):
            expected=TABLED.get(name,0)
        elif eng=='swipl':
            expected=TABLED.get(name,SWI_WFS_TABLES.get(name,0))
        else:
            expected=0
        if n!=expected: errors.append(f'{eng}/{name}: table directives={n}, expected={expected}')
        if name in WFS:
            if eng in ('eyeprolog','swipl'):
                if 'tnot(' not in text: errors.append(f'{eng}/{name}: missing tnot/1 WFS adaptation')
                if '\\+' in '\n'.join(line for line in text.splitlines() if not line.lstrip().startswith('%')):
                    errors.append(f'{eng}/{name}: still contains negation-as-failure')
            elif n:
                errors.append(f'{eng}/{name}: WFS file should not be fake-tabled')
if errors:
    print('\n'.join(errors)); sys.exit(1)
print(f'OK: {len(base)} benchmarks x {len(ENGINES)} engines; table/WFS adaptations verified.')
