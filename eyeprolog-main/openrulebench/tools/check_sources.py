#!/usr/bin/env python3
from pathlib import Path
import sys

root=Path(__file__).resolve().parents[1]
engines=("eyeprolog","trealla","scryer","swipl")
failed=False
for engine in engines:
    paths=sorted((root/engine).glob("*.pl"))
    if len(paths) != 14:
        print(f"{engine}: expected 14 .pl files, found {len(paths)}", file=sys.stderr); failed=True
    for path in paths:
        text=path.read_text(encoding="utf-8")
        if "%% goal:" not in text:
            print(f"{engine}/{path.name}: missing %% goal:", file=sys.stderr); failed=True
        if text.count("(") != text.count(")"):
            print(f"{engine}/{path.name}: unbalanced parentheses", file=sys.stderr); failed=True
        acc=[]
        for raw in text.splitlines():
            line=raw.split("%",1)[0].strip()
            if not line: continue
            acc.append(line)
            if line.endswith("."):
                acc=[]
        if acc:
            print(f"{engine}/{path.name}: unterminated statement near {acc[0][:60]}", file=sys.stderr); failed=True
    print(f"{engine}: {len(paths)} sources; lexical checks ok")
if failed: sys.exit(1)
