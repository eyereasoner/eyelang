#!/usr/bin/env bash
set -euo pipefail
ROOT=$(cd "$(dirname "$0")/.." && pwd)
cd "$ROOT"
BIN=${EYELOG_BIN:-"./bin/eyelog"}
GREEN=''
DIM=''
RED=''
RESET=''
if [ -t 1 ]; then
  GREEN=$'\033[32m'; DIM=$'\033[2m'; RED=$'\033[31m'; RESET=$'\033[0m'
fi

ACCEPT=0
suites=()
profiles=()
add_unique(){
  local item=$1; shift
  local -n arr=$1
  local x
  for x in "${arr[@]}"; do
    [ "$x" = "$item" ] && return 0
  done
  arr+=("$item")
}
usage(){
  cat >&2 <<USAGE
usage: ./test/run.sh [--accept] [conformance|api|examples] [core|extension]

With no suite argument, runs Conformance, API, then Examples.
Profile arguments core and extension select conformance profiles.
USAGE
}
for arg in "$@"; do
  case "$arg" in
    --accept)
      ACCEPT=1
      ;;
    conformance|api|examples)
      add_unique "$arg" suites
      ;;
    core|extension)
      add_unique conformance suites
      add_unique "$arg" profiles
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "test: unknown suite or option: $arg" >&2
      usage
      exit 1
      ;;
  esac
done
if [ ${#suites[@]} -eq 0 ]; then
  if [ "$ACCEPT" -eq 1 ]; then
    suites=(conformance)
  else
    suites=(conformance api examples)
  fi
fi
if [ ${#profiles[@]} -eq 0 ]; then
  profiles=(core extension)
fi
if [ ! -x "$BIN" ]; then
  echo "test: missing executable: $BIN" >&2
  echo "build it first, or set EYELOG_BIN=/path/to/eyelog" >&2
  exit 1
fi

ok=0
total=0
grand_start=$(date +%s%3N)
section_ok0=0
section_total0=0
section_start=0
section_name=''
TEST_TMPDIR=$(mktemp -d "${TMPDIR:-/tmp}/eyelog-test.XXXXXX")
export TEST_TMPDIR
trap 'rm -rf "$TEST_TMPDIR"' EXIT
TEST_OUT="$TEST_TMPDIR/out"
TEST_ERR="$TEST_TMPDIR/err"
TEST_ACTUAL="$TEST_TMPDIR/actual"

section_begin(){
  section_name=$1
  section_ok0=$ok
  section_total0=$total
  section_start=$(date +%s%3N)
  printf '\n== %s\n' "$section_name"
}
section_end(){
  local end ms section_ok section_total label
  end=$(date +%s%3N)
  ms=$((end-section_start))
  section_ok=$((ok-section_ok0))
  section_total=$((total-section_total0))
  label=$(printf '%s' "$section_name" | tr '[:upper:]' '[:lower:]')
  printf '\n== %s subtotal\n%bOK%b %s/%s %s tests passed %b(%s ms)%b\n' \
    "$section_name" "$GREEN" "$RESET" "$section_ok" "$section_total" "$label" "$DIM" "$ms" "$RESET"
}
run(){
  total=$((total+1)); nr=$(printf '%03d' "$total"); name=$1; shift
  t0=$(date +%s%3N)
  if "$@" > "$TEST_OUT" 2> "$TEST_ERR"; then
    t1=$(date +%s%3N); ms=$((t1-t0)); ok=$((ok+1))
    printf '%s %bOK%b %b%s%b %b(%s ms)%b\n' "$nr" "$GREEN" "$RESET" "$GREEN" "$name" "$RESET" "$DIM" "$ms" "$RESET"
  else
    printf '%s %bFAIL%b %s\n' "$nr" "$RED" "$RESET" "$name"
    cat "$TEST_ERR"; cat "$TEST_OUT"; exit 1
  fi
}
compare_example(){
  f=$1; b=$(basename "$f" .pl)
  "$BIN" "$f" > "$TEST_ACTUAL"
  diff -u "examples/output/$b.pl" "$TEST_ACTUAL"
}
run_conformance_case(){
  case_file=$1
  rel=${case_file#"$ROOT/conformance/cases/"}
  base=${case_file%.pl}
  expected="$ROOT/conformance/expected/${rel%.pl}.out"
  name=${rel%.pl}
  total=$((total+1)); nr=$(printf '%03d' "$total")
  out="$TEST_TMPDIR/conformance.out"
  err="$TEST_TMPDIR/conformance.err"
  diff_file="$TEST_TMPDIR/conformance.diff"
  cmd=("$BIN")
  [ -f "$base.explain" ] && cmd+=(--explain)
  if [ -f "$base.query" ]; then
    query=$(cat "$base.query")
    cmd+=(--query "$query")
  fi
  cmd+=("$case_file")
  t0=$(date +%s%3N)
  if "${cmd[@]}" > "$out" 2> "$err"; then
    t1=$(date +%s%3N); ms=$((t1-t0))
    if [ "$ACCEPT" -eq 1 ]; then
      mkdir -p "$(dirname "$expected")"
      cp "$out" "$expected"
      ok=$((ok+1))
      printf '%s %bACCEPT%b %b%s%b %b(%s ms)%b\n' "$nr" "$DIM" "$RESET" "$DIM" "$name" "$RESET" "$DIM" "$ms" "$RESET"
    elif [ -f "$expected" ] && diff -u "$expected" "$out" > "$diff_file"; then
      ok=$((ok+1))
      printf '%s %bOK%b %b%s%b %b(%s ms)%b\n' "$nr" "$GREEN" "$RESET" "$GREEN" "$name" "$RESET" "$DIM" "$ms" "$RESET"
    else
      printf '%s %bFAIL%b %s\n' "$nr" "$RED" "$RESET" "$name" >&2
      if [ -s "$err" ]; then
        echo '--- stderr ---' >&2
        cat "$err" >&2
      fi
      if [ ! -f "$expected" ]; then
        echo "missing expected file: $expected" >&2
        echo '--- actual stdout ---' >&2
        cat "$out" >&2
      else
        cat "$diff_file" >&2
      fi
      exit 1
    fi
  else
    printf '%s %bFAIL%b %s\n' "$nr" "$RED" "$RESET" "$name" >&2
    echo '--- stderr ---' >&2
    cat "$err" >&2
    echo '--- stdout ---' >&2
    cat "$out" >&2
    exit 1
  fi
}
run_conformance(){
  local profile case_dir case_file
  section_begin Conformance
  for profile in "${profiles[@]}"; do
    case_dir="$ROOT/conformance/cases/$profile"
    [ -d "$case_dir" ] || { echo "test: unknown conformance profile: $profile" >&2; exit 1; }
    while IFS= read -r -d '' case_file; do
      run_conformance_case "$case_file"
    done < <(find "$case_dir" -type f -name '*.pl' -print0 | sort -z)
  done
  section_end
}
run_api(){
  section_begin API
  run 'version flag' bash -c '"$0" --version | grep -q "^eyelog $(cat VERSION)$"' "$BIN"
  run 'help mentions derived binary materialization' bash -c '"$0" --help | grep -Fq "materializing new binary derivations"' "$BIN"
  run 'short version flag' bash -c '"$0" -v | grep -q "^eyelog $(cat VERSION)$"' "$BIN"
  run 'short help flag' bash -c '"$0" -h | grep -Fq "usage: eyelog" && "$0" -h | grep -Fq -- "--query GOAL"' "$BIN"
  run 'missing input prints usage and exits 2' bash -c '"$0" > "$TEST_TMPDIR/no-input.out" 2> "$TEST_TMPDIR/no-input.err"; status=$?; [ "$status" = 2 ] && grep -Fq "usage: eyelog" "$TEST_TMPDIR/no-input.err"' "$BIN"
  run 'missing query reports an error' bash -c '"$0" --query > "$TEST_TMPDIR/missing-query.out" 2> "$TEST_TMPDIR/missing-query.err"; status=$?; [ "$status" = 1 ] && grep -Fq "missing query after --query" "$TEST_TMPDIR/missing-query.err"' "$BIN"
  run 'query ancestor' bash -c '"$0" --query "ancestor(pat, X)" examples/ancestor.pl | grep -q "ancestor(pat, emma)."' "$BIN"
  run 'default excludes facts and prints derived binary consequences' bash -c 'printf "parent(pat, jan).\nparent(jan, emma).\nancestor(X, Y) :- parent(X, Y).\nancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).\n" > "$TEST_TMPDIR/anc.pl" && "$0" "$TEST_TMPDIR/anc.pl" | grep -Fq "ancestor(pat, emma)." && ! "$0" "$TEST_TMPDIR/anc.pl" | grep -Fq "parent(pat, jan)."' "$BIN"
  run 'query with no answers emits empty output' bash -c 'printf "known(alice).\n" > "$TEST_TMPDIR/no-answer.pl" && "$0" --query "known(bob)" "$TEST_TMPDIR/no-answer.pl" > "$TEST_TMPDIR/no-answer.out" && [ ! -s "$TEST_TMPDIR/no-answer.out" ]' "$BIN"
  run 'default output deduplicates derived consequences' bash -c 'printf "seed(a).\nans(a, ok) :- seed(a).\nans(a, ok) :- seed(a).\n" > "$TEST_TMPDIR/dedup.pl" && [ "$("$0" "$TEST_TMPDIR/dedup.pl" | grep -c "^ans(a, ok)\.$")" = 1 ]' "$BIN"
  run 'default output is binary unless materialized' bash -c 'printf "seed(a).\nunary(a) :- seed(a).\nbinary(a, ok) :- seed(a).\nternary(a, b, c) :- seed(a).\n" > "$TEST_TMPDIR/binary-default.pl" && "$0" "$TEST_TMPDIR/binary-default.pl" > "$TEST_TMPDIR/binary-default.out" && grep -Fq "binary(a, ok)." "$TEST_TMPDIR/binary-default.out" && ! grep -Fq "unary(a)." "$TEST_TMPDIR/binary-default.out" && ! grep -Fq "ternary(a, b, c)." "$TEST_TMPDIR/binary-default.out"' "$BIN"
  run 'materialize declarations focus default output' bash -c 'printf "materialize(answer, 2).\nseed(a).\nhelper(X, y) :- seed(X).\nanswer(X, ok) :- helper(X, y).\n" > "$TEST_TMPDIR/materialize.pl" && "$0" "$TEST_TMPDIR/materialize.pl" | grep -Fq "answer(a, ok)." && ! "$0" "$TEST_TMPDIR/materialize.pl" | grep -Fq "helper(a, y)."' "$BIN"
  run 'materialize declarations allow non-binary arities' bash -c 'printf "materialize(unary, 1).\nmaterialize(ternary, 3).\nseed(a).\nunary(a) :- seed(a).\nbinary(a, ok) :- seed(a).\nternary(a, b, c) :- seed(a).\n" > "$TEST_TMPDIR/materialize-arities.pl" && "$0" "$TEST_TMPDIR/materialize-arities.pl" > "$TEST_TMPDIR/materialize-arities.out" && grep -Fq "unary(a)." "$TEST_TMPDIR/materialize-arities.out" && grep -Fq "ternary(a, b, c)." "$TEST_TMPDIR/materialize-arities.out" && ! grep -Fq "binary(a, ok)." "$TEST_TMPDIR/materialize-arities.out"' "$BIN"
  run 'multiple input files compose one program' bash -c 'printf "seed(alice).\n" > "$TEST_TMPDIR/multi-a.pl" && printf "type(X, person) :- seed(X).\n" > "$TEST_TMPDIR/multi-b.pl" && "$0" "$TEST_TMPDIR/multi-a.pl" "$TEST_TMPDIR/multi-b.pl" | grep -Fq "type(alice, person)."' "$BIN"
  run 'stdin input with dash' bash -c 'printf "works(stdin, true) :- eq(ok, ok).\n" | "$0" - | grep -Fq "works(stdin, true)."' "$BIN"
  run 'file and stdin inputs compose one program' bash -c 'printf "seed(bob).\n" > "$TEST_TMPDIR/file-plus-stdin.pl" && printf "type(X, streamed) :- seed(X).\n" | "$0" "$TEST_TMPDIR/file-plus-stdin.pl" - | grep -Fq "type(bob, streamed)."' "$BIN"
  run 'end of options allows dashed file names' bash -c 'bin=$(pwd)/${0#./}; mkdir -p "$TEST_TMPDIR/dash-file"; printf "works(dashed, true) :- eq(ok, ok).\n" > "$TEST_TMPDIR/dash-file/--program.pl"; (cd "$TEST_TMPDIR/dash-file" && "$bin" -- --program.pl) | grep -Fq "works(dashed, true)."' "$BIN"
  run 'parse errors fail with diagnostic text' bash -c 'printf "broken(a\n" > "$TEST_TMPDIR/broken.pl"; if "$0" "$TEST_TMPDIR/broken.pl" > "$TEST_TMPDIR/broken.out" 2> "$TEST_TMPDIR/broken.err"; then exit 1; fi; grep -Fq "expected )" "$TEST_TMPDIR/broken.err"' "$BIN"
  run 'URL input loads program' bash -c 'printf "works(url, true) :- eq(ok, ok).\n" > "$TEST_TMPDIR/url-example.pl" && python3 - "$TEST_TMPDIR" "$0" <<"PY"
import os
import subprocess
import sys
import threading
from functools import partial
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
root = sys.argv[1]
bin_path = sys.argv[2]
handler = partial(SimpleHTTPRequestHandler, directory=root)
server = ThreadingHTTPServer(("127.0.0.1", 0), handler)
thread = threading.Thread(target=server.serve_forever, daemon=True)
thread.start()
try:
    url = f"http://127.0.0.1:{server.server_port}/url-example.pl"
    result = subprocess.run([bin_path, url], cwd=os.getcwd(), text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
    if "works(url, true)." not in result.stdout:
        print(result.stdout)
        print(result.stderr, file=sys.stderr)
        raise SystemExit(1)
finally:
    server.shutdown()
PY' "$BIN"
  run 'parenthesized conjunction query' bash -c '"$0" --query "(ancestor(pat, X), ancestor(X, emma))" examples/ancestor.pl | grep -q "(ancestor(pat, jan), ancestor(jan, emma))."' "$BIN"
  run 'query preserves duplicate proof answers' bash -c 'printf "seed(a).\nans(a, ok) :- seed(a).\nans(a, ok) :- seed(a).\n" > "$TEST_TMPDIR/query-duplicates.pl" && [ "$("$0" --query "ans(X, Y)" "$TEST_TMPDIR/query-duplicates.pl" | grep -c "^ans(a, ok)\.$")" = 2 ]' "$BIN"
  run 'query works with empty stdin for pure builtins' bash -c 'printf "" | "$0" --query "eq(ok, ok)" - | grep -Fq "eq(ok, ok)."' "$BIN"
  run 'explain prints original rule and substitution' bash -c '"$0" --explain examples/socrates.pl | grep -Fq "because rule #" && "$0" --explain examples/socrates.pl | grep -Fq "where X = socrates"' "$BIN"
  run 'explain query prints requested answer proof' bash -c '"$0" --explain --query "ancestor(pat, emma)" examples/ancestor.pl > "$TEST_TMPDIR/explain-query.out" && grep -Fq "ancestor(pat, emma)." "$TEST_TMPDIR/explain-query.out" && grep -Fq "need ancestor(pat, emma)" "$TEST_TMPDIR/explain-query.out" && grep -Fq "therefore ancestor(pat, emma)" "$TEST_TMPDIR/explain-query.out"' "$BIN"
  run 'formula_atom enumerates formula members' bash -c '"$0" --query "formula_atom((b(a, c), e(d, f)), X)" examples/annotation.pl | grep -Fq "formula_atom((b(a, c), e(d, f)), e(d, f))."' "$BIN"
  run 'formula_binary exposes relation name from p(S,O)' bash -c '"$0" --query "formula_binary((b(a, c), e(d, f)), S, P, O)" examples/annotation.pl | grep -Fq "formula_binary((b(a, c), e(d, f)), d, e, f)."' "$BIN"
  run 'quoted atom output round-trips' bash -c '"$0" --query "p('"'"'needs'"'"''"'"'quote'"'"', X)" test/eyelog-syntax.pl | grep -Fq "p('"'"'needs'"'"''"'"'quote'"'"', ok)."' "$BIN"
  run 'lists strings compounds and numbers print correctly' bash -c '"$0" test/eyelog-syntax.pl | grep -Fq "tail(list_case, [b, c])." && "$0" --query "term(compound_case, X)" test/eyelog-syntax.pl | grep -Fq "pair(3, nested(atom, [x, y]))" && "$0" --query "number(scientific, X)" test/eyelog-syntax.pl | grep -Fq "1.25e-3"' "$BIN"
  run 'memoized fibonacci remains queryable' bash -c '"$0" --query "fib(10000, X)" examples/fibonacci.pl | sed -n "s/^fib(10000, \([0-9]*\)).$/\1/p" | awk "length(\$0)==2090 {ok=1} END{exit !ok}"' "$BIN"
  run 'ackermann benchmark remains queryable' bash -c '"$0" --query "ackermann(4, 2, A)" examples/ackermann.pl | sed -n "s/^ackermann(4, 2, \([0-9]*\)).$/\1/p" | awk "length(\$0)==19729 {ok=1} END{exit !ok}"' "$BIN"
  run 'sudoku builtin accepts dot blanks' bash -c '"$0" --query "once(sudoku(\"1....7.9..3..2...8..96..5....53..9...1..8...26....4...3......1..4......7..7...3..\", S))" examples/sudoku.pl | grep -q "\[8, 9, 7, 2, 6, 1, 3, 5, 4\]"' "$BIN"
  run 'basic monadic matches expected answer count' bash -c '[ "$("$0" examples/basic-monadic.pl | wc -l | tr -d " ")" = 1518 ]' "$BIN"
  run 'turing machine increments carry chain' bash -c '"$0" examples/turing.pl | grep -Fq "output(case3, [1, 0, 0, 0, 0, 0, 0, #])."' "$BIN"
  section_end
}
run_examples(){
  local f
  section_begin Examples
  for f in examples/*.pl; do
    run "$(basename "$f")" compare_example "$f"
  done
  section_end
}

for suite in "${suites[@]}"; do
  case "$suite" in
    conformance) run_conformance ;;
    api) run_api ;;
    examples) run_examples ;;
    *) echo "test: internal error: unknown suite $suite" >&2; exit 1 ;;
  esac
done

grand_end=$(date +%s%3N); grand_ms=$((grand_end-grand_start))
printf '\n== Grand total\n%bOK%b %s/%s tests passed %b(%s ms)%b\n' "$GREEN" "$RESET" "$ok" "$total" "$DIM" "$grand_ms" "$RESET"
