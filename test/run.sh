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
run 'pow bigint query' bash -c './bin/eyelog --query "pow(2, 100, X)" examples/list-collection.pl | grep -q "1267650600228229401496703205376"'
run 'ackermann [4,2] has 19729 digits' bash -c './bin/eyelog --query "ackermann(4, 2, A)" examples/ackermann.pl | sed -n "s/^ackermann(4, 2, \([0-9]*\)).$/\1/p" | awk "length(\$0)==19729 {ok=1} END{exit !ok}"'
run 'big integer div query' bash -c './bin/eyelog --query "div(15470000000000000000, 1643630000000000, X)" examples/bayes-diagnosis.pl | grep -q "div(15470000000000000000, 1643630000000000, 9412)."'
run 'decimal literal query' bash -c './bin/eyelog --query "posterior(:COVID19, X)" examples/bayes-diagnosis.pl | grep -q "posterior(:COVID19, 0.9412093962753174)."'
run 'bayes emits COVID posterior' bash -c './bin/eyelog examples/bayes-diagnosis.pl | grep -q "triple(result(:COVID19), :posterior, 0.9412093962753174)."'
run 'floating add query' bash -c './bin/eyelog --query "add(1.5, 2.25, X)" examples/floating-point.pl | grep -q "add(1.5, 2.25, 3.75)."'
run 'floating math:sum query' bash -c './bin/eyelog --query "math:sum(0.125, 0.875, X)" examples/floating-point.pl | grep -q "math:sum(0.125, 0.875, 1.0)."'
run 'floating comparison query' bash -c './bin/eyelog --query "gt(2.5, 2)" examples/floating-point.pl | grep -q "gt(2.5, 2)."'
run 'delfour all checks pass' bash -c './bin/eyelog examples/delfour.pl | grep -q "triple(:result, :allChecksPass, true)."'
run 'delfour suggests low sugar biscuits' bash -c './bin/eyelog --query "suggested_alternative(:case, X)" examples/delfour.pl | grep -q "suggested_alternative(:case, :prod_BIS_101)."'
run 'string:notMatches alternation query' bash -c './bin/eyelog --query "string:notMatches(\"scoped retail insight\", \"diabetes|medical\")" examples/delfour.pl | grep -q "string:notMatches"'
run 'timestamp comparison alias query' bash -c './bin/eyelog --query "math:notGreaterThan(\"2025-10-05T20:35:48.907163+00:00\", \"2025-10-05T22:33:48.907185+00:00\")" examples/delfour.pl | grep -q "math:notGreaterThan"'
run 'list reverse query' bash -c './bin/eyelog --query "reverse([a, b, c], X)" examples/list-collection.pl | grep -q "reverse(\[a, b, c\], \[c, b, a\])."'
run 'list not member query' bash -c './bin/eyelog --query "list:notMember(d, [a, b, c])" examples/list-collection.pl | grep -q "list:notMember(d, \[a, b, c\])."'
run 'list rest query' bash -c './bin/eyelog --query "list:rest([a, b, c], X)" examples/list-collection.pl | grep -q "list:rest(\[a, b, c\], \[b, c\])."'
run 'log not equal query' bash -c './bin/eyelog --query "log:notEqualTo(dp:P1, dp:P2)" examples/dining-philosophers.pl | grep -q "log:notEqualTo(dp:P1, dp:P2)."'
run 'risk path selects B' bash -c './bin/eyelog examples/dijkstra-risk-path.pl | grep -q "triple(:dijkstraRiskPath, :selects, :pathB)."'
run 'drone planner emits 17 plans' bash -c '[ "$(./bin/eyelog examples/drone-corridor-planner.pl | wc -l)" -eq 17 ]'
run 'dining philosophers derives 15 meals' bash -c '[ "$(./bin/eyelog examples/dining-philosophers.pl | grep -c "dp:type, dp:Meal")" -eq 15 ]'
section Examples
for f in examples/*.pl; do
  run "$(basename "$f")" compare_example "$f"
done
end=$(date +%s%3N)
ms=$((end-start))
printf '\n== Total\n%bOK%b %s/%s tests passed %b(%s ms)%b\n' "$GREEN" "$RESET" "$ok" "$total" "$DIM" "$ms" "$RESET"
