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
section(){ printf '\n== %s\n' "$1"; }
run(){
  total=$((total+1)); nr=$(printf '%03d' "$total"); name=$1; shift
  t0=$(date +%s%3N)
  if "$@" > /tmp/eyelog-test-out 2> /tmp/eyelog-test-err; then
    t1=$(date +%s%3N)
    ms=$((t1-t0))
    ok=$((ok+1))
    printf '%s %bOK%b %b%s%b %b(%s ms)%b\n' "$nr" "$GREEN" "$RESET" "$GREEN" "$name" "$RESET" "$DIM" "$ms" "$RESET"
  else
    printf '%s %bFAIL%b %s\n' "$nr" "$RED" "$RESET" "$name"
    cat /tmp/eyelog-test-err
    cat /tmp/eyelog-test-out
    exit 1
  fi
}
compare_example(){
  f=$1; b=$(basename "$f" .pl)
  ./bin/eyelog "$f" > /tmp/eyelog-actual
  diff -u "examples/output/$b.pl" /tmp/eyelog-actual
}
section API
run 'version flag' bash -c './bin/eyelog --version | grep -q "^eyelog $(cat VERSION)$"'
run 'query ancestor' bash -c './bin/eyelog --query "triple(:pat, :ancestor, X)" examples/ancestor.pl | grep -q "triple(:pat, :ancestor, :emma)."'
run 'fib(10000) has 2090 digits' bash -c './bin/eyelog examples/fibonacci.pl | sed -n "s/^triple(10000, :fibonacci, \([0-9]*\)).$/\1/p" | awk "length(\$0)==2090 {ok=1} END{exit !ok}"'
run 'path discovery derives three routes' bash -c '[ "$(./bin/eyelog examples/path-discovery.pl | wc -l)" -eq 3 ]'
run 'list append query' bash -c './bin/eyelog --query "append([a, b], [c], X)" examples/list-collection.pl | grep -q "append(\[a, b\], \[c\], \[a, b, c\])."'
run 'list split query' bash -c '[ "$(./bin/eyelog --query "append(A, B, [a, b])" examples/list-collection.pl | wc -l)" -eq 3 ]'
section Examples
for f in examples/*.pl; do
  run "$(basename "$f")" compare_example "$f"
done
end=$(date +%s%3N)
ms=$((end-start))
printf '\n== Total\n%bOK%b %s/%s tests passed %b(%s ms)%b\n' "$GREEN" "$RESET" "$ok" "$total" "$DIM" "$ms" "$RESET"
