#!/usr/bin/env bash
set -euo pipefail
GREEN=''
DIM=''
RED=''
RESET=''
if [ -t 1 ]; then
  GREEN=$'\033[32m'; DIM=$'\033[2m'; RED=$'\033[31m'; RESET=$'\033[0m'
fi
ok=0; total=0; start=$(date +%s%3N)
TEST_TMPDIR=$(mktemp -d "${TMPDIR:-/tmp}/eyelog-test.XXXXXX")
export TEST_TMPDIR
trap 'rm -rf "$TEST_TMPDIR"' EXIT
TEST_OUT="$TEST_TMPDIR/out"
TEST_ERR="$TEST_TMPDIR/err"
TEST_ACTUAL="$TEST_TMPDIR/actual"
section(){ printf '\n== %s\n' "$1"; }
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
  ./bin/eyelog "$f" > "$TEST_ACTUAL"
  diff -u "examples/output/$b.pl" "$TEST_ACTUAL"
}

section API
run 'version flag' bash -c './bin/eyelog --version | grep -q "^eyelog $(cat VERSION)$"'
run 'help mentions derived binary materialization' bash -c './bin/eyelog --help | grep -Fq "materializing new binary derivations"'
run 'query ancestor' bash -c './bin/eyelog --query "ancestor(pat, X)" examples/ancestor.pl | grep -q "ancestor(pat, emma)."'
run 'default excludes facts and prints derived binary consequences' bash -c 'printf "parent(pat, jan).\nparent(jan, emma).\nancestor(X, Y) :- parent(X, Y).\nancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).\n" > "$TEST_TMPDIR/anc.pl" && ./bin/eyelog "$TEST_TMPDIR/anc.pl" | grep -Fq "ancestor(pat, emma)." && ! ./bin/eyelog "$TEST_TMPDIR/anc.pl" | grep -Fq "parent(pat, jan)."'
run 'materialize declarations focus default output' bash -c 'printf "materialize(answer, 2).\nseed(a).\nhelper(X, y) :- seed(X).\nanswer(X, ok) :- helper(X, y).\n" > "$TEST_TMPDIR/materialize.pl" && ./bin/eyelog "$TEST_TMPDIR/materialize.pl" | grep -Fq "answer(a, ok)." && ! ./bin/eyelog "$TEST_TMPDIR/materialize.pl" | grep -Fq "helper(a, y)."'
run 'multiple input files compose one program' bash -c 'printf "seed(alice).\n" > "$TEST_TMPDIR/multi-a.pl" && printf "type(X, person) :- seed(X).\n" > "$TEST_TMPDIR/multi-b.pl" && ./bin/eyelog "$TEST_TMPDIR/multi-a.pl" "$TEST_TMPDIR/multi-b.pl" | grep -Fq "type(alice, person)."'
run 'stdin input with dash' bash -c 'printf "works(stdin, true) :- eq(ok, ok).\n" | ./bin/eyelog - | grep -Fq "works(stdin, true)."'
run 'file and stdin inputs compose one program' bash -c 'printf "seed(bob).\n" > "$TEST_TMPDIR/file-plus-stdin.pl" && printf "type(X, streamed) :- seed(X).\n" | ./bin/eyelog "$TEST_TMPDIR/file-plus-stdin.pl" - | grep -Fq "type(bob, streamed)."'
run 'URL input loads program' bash -c 'printf "works(url, true) :- eq(ok, ok).\n" > "$TEST_TMPDIR/url-example.pl" && python3 - "$TEST_TMPDIR" <<"PY"
import os
import subprocess
import sys
import threading
from functools import partial
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
root = sys.argv[1]
handler = partial(SimpleHTTPRequestHandler, directory=root)
server = ThreadingHTTPServer(("127.0.0.1", 0), handler)
thread = threading.Thread(target=server.serve_forever, daemon=True)
thread.start()
try:
    url = f"http://127.0.0.1:{server.server_port}/url-example.pl"
    result = subprocess.run(["./bin/eyelog", url], cwd=os.getcwd(), text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
    if "works(url, true)." not in result.stdout:
        print(result.stdout)
        print(result.stderr, file=sys.stderr)
        raise SystemExit(1)
finally:
    server.shutdown()
PY'
run 'parenthesized conjunction query' bash -c './bin/eyelog --query "(ancestor(pat, X), ancestor(X, emma))" examples/ancestor.pl | grep -q "(ancestor(pat, jan), ancestor(jan, emma))."'
run 'explain prints original rule and substitution' bash -c './bin/eyelog --explain examples/socrates.pl | grep -Fq "because rule #" && ./bin/eyelog --explain examples/socrates.pl | grep -Fq "where X = socrates"'
run 'formula_atom enumerates formula members' bash -c './bin/eyelog --query "formula_atom((b(a, c), e(d, f)), X)" examples/annotation.pl | grep -Fq "formula_atom((b(a, c), e(d, f)), e(d, f))."'
run 'formula_binary exposes relation name from p(S,O)' bash -c './bin/eyelog --query "formula_binary((b(a, c), e(d, f)), S, P, O)" examples/annotation.pl | grep -Fq "formula_binary((b(a, c), e(d, f)), d, e, f)."'
run 'quoted atom output round-trips' bash -c "./bin/eyelog --query \"p('needs''quote', X)\" test/eyelog-syntax.pl | grep -Fq \"p('needs''quote', ok).\""
run 'lists strings compounds and numbers print correctly' bash -c './bin/eyelog test/eyelog-syntax.pl | grep -Fq "tail(list_case, [b, c])." && ./bin/eyelog --query "term(compound_case, X)" test/eyelog-syntax.pl | grep -Fq "pair(3, nested(atom, [x, y]))" && ./bin/eyelog --query "number(scientific, X)" test/eyelog-syntax.pl | grep -Fq "1.25e-3"'
run 'memoized fibonacci remains queryable' bash -c './bin/eyelog --query "fib(10000, X)" examples/fibonacci.pl | sed -n "s/^fib(10000, \([0-9]*\)).$/\1/p" | awk "length(\$0)==2090 {ok=1} END{exit !ok}"'
run 'ackermann benchmark remains queryable' bash -c './bin/eyelog --query "ackermann(4, 2, A)" examples/ackermann.pl | sed -n "s/^ackermann(4, 2, \([0-9]*\)).$/\1/p" | awk "length(\$0)==19729 {ok=1} END{exit !ok}"'
run 'sudoku builtin accepts dot blanks' bash -c './bin/eyelog --query "once(sudoku(\"1....7.9..3..2...8..96..5....53..9...1..8...26....4...3......1..4......7..7...3..\", S))" examples/sudoku.pl | grep -q "\[8, 9, 7, 2, 6, 1, 3, 5, 4\]"'
run 'basic monadic matches expected answer count' bash -c '[ "$(./bin/eyelog examples/basic-monadic.pl | wc -l | tr -d " ")" = 1518 ]'
run 'turing machine increments carry chain' bash -c './bin/eyelog examples/turing.pl | grep -Fq "output(case3, [1, 0, 0, 0, 0, 0, 0, #])."'

section Examples
for f in examples/*.pl; do
  run "$(basename "$f")" compare_example "$f"
done

end=$(date +%s%3N); ms=$((end-start))
printf '\n== Total\n%bOK%b %s/%s tests passed %b(%s ms)%b\n' "$GREEN" "$RESET" "$ok" "$total" "$DIM" "$ms" "$RESET"
