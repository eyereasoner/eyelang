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
run 'cyclic path closure terminates' bash -c '[ "$(./bin/eyelog examples/cyclic-path.pl | wc -l)" -eq 16 ]'
run 'service impact closure terminates' bash -c '[ "$(./bin/eyelog examples/service-impact.pl | wc -l)" -eq 11 ]'
run 'service impact flags mobile checkout' bash -c './bin/eyelog examples/service-impact.pl | grep -q "triple(:mobile_checkout, :businessFunctionAtRisk, true)."'
run 'list append query' bash -c './bin/eyelog --query "append([a, b], [c], X)" examples/list-collection.pl | grep -q "append(\[a, b\], \[c\], \[a, b, c\])."'
run 'list split query' bash -c '[ "$(./bin/eyelog --query "append(A, B, [a, b])" examples/list-collection.pl | wc -l)" -eq 3 ]'
run 'pow bigint query' bash -c './bin/eyelog --query "pow(2, 100, X)" examples/list-collection.pl | grep -q "1267650600228229401496703205376"'
run 'ackermann [4,2] has 19729 digits' bash -c './bin/eyelog --query "ackermann(4, 2, A)" examples/ackermann.pl | sed -n "s/^ackermann(4, 2, \([0-9]*\)).$/\1/p" | awk "length(\$0)==19729 {ok=1} END{exit !ok}"'
run 'big integer div query' bash -c './bin/eyelog --query "div(15470000000000000000, 1643630000000000, X)" examples/bayes-diagnosis.pl | grep -q "div(15470000000000000000, 1643630000000000, 9412)."'
run 'decimal literal query' bash -c './bin/eyelog --query "posterior(:COVID19, X)" examples/bayes-diagnosis.pl | grep -q "posterior(:COVID19, 0.9412093962753174)."'
run 'bayes emits COVID posterior' bash -c './bin/eyelog examples/bayes-diagnosis.pl | grep -q "triple(result(:COVID19), :posterior, 0.9412093962753174)."'
run 'bayes therapy recommends Paxlovid' bash -c './bin/eyelog examples/bayes-therapy.pl | grep -q "triple(:Case, :recommendedTherapy, :Paxlovid)."'
run 'bayes therapy utility remains queryable' bash -c './bin/eyelog --query "utility(:Paxlovid, X)" examples/bayes-therapy.pl | grep -q "utility(:Paxlovid, 3.5851740117076503)."'
run 'floating add query' bash -c './bin/eyelog --query "add(1.5, 2.25, X)" examples/floating-point.pl | grep -q "add(1.5, 2.25, 3.75)."'
run 'floating math:sum query' bash -c './bin/eyelog --query "math:sum(0.125, 0.875, X)" examples/floating-point.pl | grep -q "math:sum(0.125, 0.875, 1.0)."'
run 'native sum alias query' bash -c './bin/eyelog --query "sum(0.125, 0.875, X)" examples/aliases-and-namespaces.pl | grep -q "sum(0.125, 0.875, 1.0)."'
run 'native string match alias query' bash -c './bin/eyelog --query "matches(scoped_retail_insight, retail)" examples/aliases-and-namespaces.pl | grep -q "matches(scoped_retail_insight, retail)."'
run 'native comparison alias query' bash -c './bin/eyelog --query "less_than(2, 3)" examples/aliases-and-namespaces.pl | grep -q "less_than(2, 3)."'
run 'floating comparison query' bash -c './bin/eyelog --query "gt(2.5, 2)" examples/floating-point.pl | grep -q "gt(2.5, 2)."'
run 'delfour all checks pass' bash -c './bin/eyelog examples/delfour.pl | grep -q "triple(:result, :allChecksPass, true)."'
run 'delfour suggests low sugar biscuits' bash -c './bin/eyelog --query "suggested_alternative(:case, X)" examples/delfour.pl | grep -q "suggested_alternative(:case, :prod_BIS_101)."'
run 'delfour policy is projected from graph data' bash -c './bin/eyelog --query "policy_triple(:policy, odrl:permission, X)" examples/delfour.pl | grep -q "policy_triple(:policy, odrl:permission, permission(odrl:use, :insight, \"shopping_assist\"))."'
run 'string:notMatches alternation query' bash -c './bin/eyelog --query "string:notMatches(\"scoped retail insight\", \"diabetes|medical\")" examples/delfour.pl | grep -q "string:notMatches"'
run 'timestamp comparison alias query' bash -c './bin/eyelog --query "math:notGreaterThan(\"2025-10-05T20:35:48.907163+00:00\", \"2025-10-05T22:33:48.907185+00:00\")" examples/delfour.pl | grep -q "math:notGreaterThan"'
run 'list reverse query' bash -c './bin/eyelog --query "reverse([a, b, c], X)" examples/list-collection.pl | grep -q "reverse(\[a, b, c\], \[c, b, a\])."'
run 'list not member query' bash -c './bin/eyelog --query "list:notMember(d, [a, b, c])" examples/list-collection.pl | grep -q "list:notMember(d, \[a, b, c\])."'
run 'list rest query' bash -c './bin/eyelog --query "list:rest([a, b, c], X)" examples/list-collection.pl | grep -q "list:rest(\[a, b, c\], \[b, c\])."'
run 'log not equal query' bash -c './bin/eyelog --query "log:notEqualTo(dp:P1, dp:P2)" examples/dining-philosophers.pl | grep -q "log:notEqualTo(dp:P1, dp:P2)."'
run 'risk path selects B' bash -c './bin/eyelog examples/dijkstra-risk-path.pl | grep -q "triple(:dijkstraRiskPath, :selects, :pathB)."'
run 'gps recommends direct route' bash -c './bin/eyelog examples/gps.pl | grep -q "triple(:decision, :recommendedRoute, :routeDirect)."'
run 'gps report mirrors Eyeling answer' bash -c './bin/eyelog examples/gps.pl | grep -q "Recommended route: Gent → Brugge → Oostende"'
run 'gps path metrics remain queryable' bash -c './bin/eyelog --query "route_metrics(:routeDirect, D, C, B, F)" examples/gps.pl | grep -q "route_metrics(:routeDirect, 2400.0, 0.01"'
run 'dijkstra network is projected from quoted graph' bash -c './bin/eyelog --query "base_link(:a, :b, X)" examples/dijkstra.pl | grep -q "base_link(:a, :b, 4)."'
run 'risk route segment is projected from quoted graph' bash -c './bin/eyelog --query "route_segment(:DepotA, :Relay, Raw, Risk)" examples/dijkstra-risk-path.pl | grep -q "route_segment(:DepotA, :Relay, 5.0, 0.2)."'
run 'drone planner emits 17 plans' bash -c '[ "$(./bin/eyelog examples/drone-corridor-planner.pl | wc -l)" -eq 17 ]'
run 'dining philosophers derives 15 meals' bash -c '[ "$(./bin/eyelog examples/dining-philosophers.pl | grep -c "dp:type, dp:Meal")" -eq 15 ]'
run 'allen interval table is list-backed' bash -c './bin/eyelog --query "start(:A, S)" examples/allen-interval-calculus.pl | grep -q "start(:A, 10)."'
run 'family parent is projected from graph data' bash -c './bin/eyelog --query "parent(:Adam, :Bob)" examples/family-cousins.pl | grep -q "parent(:Adam, :Bob)."'
run 'math remainder alias query' bash -c './bin/eyelog --query "math:remainder(202692987, 3881, X)" examples/fundamental-theorem-arithmetic.pl | grep -q "math:remainder(202692987, 3881, 0)."'
run 'integer quotient alias query' bash -c './bin/eyelog --query "math:integerQuotient(202692987, 3881, X)" examples/fundamental-theorem-arithmetic.pl | grep -q "math:integerQuotient(202692987, 3881, 52227)."'
run 'fundamental theorem factors target' bash -c './bin/eyelog examples/fundamental-theorem-arithmetic.pl | grep -q "triple(:case, :factorsSmallest, \[3, 3, 7, 829, 3881\])."'
run 'easter computus 2035' bash -c './bin/eyelog examples/easter-computus.pl | grep -q "triple(:y2035, :easterDate, date(2035, :March, 25))."'
run 'gradient descent emits tenth bound' bash -c './bin/eyelog examples/gd-step-certified.pl | grep -q "triple(:result, :xBounds, bounds(10, -27.925465497600001, 29.925465497600001))."'
run 'fft8 ramp dc component' bash -c './bin/eyelog examples/fft8-numeric.pl | grep -q "triple(:ramp8, :dcComponent, c(28, 0.0))."'
run 'odrl dpv ranks account removal first' bash -c './bin/eyelog examples/odrl-dpv-risk-ranked.pl | grep -q "triple(:report, :firstRisk, :risk1)."'
run 'odrl policy graph is materialized as graph data' bash -c './bin/eyelog examples/odrl-dpv-risk-ranked.pl | grep -q "triple(:PolicyGraph1, :contains, triple(:Policy1, odrl:permission, :PermDeleteAccount))."'
run 'odrl dpv scores sharing risk 97' bash -c './bin/eyelog examples/odrl-dpv-risk-ranked.pl | grep -q "triple(:risk3, :score, 97)."'
run 'odrl dpv classifies export as moderate' bash -c './bin/eyelog examples/odrl-dpv-risk-ranked.pl | grep -q "triple(:risk4, dpv:hasRiskLevel, risk:ModerateRisk)."'
run 'annotation names Alice triple directly' bash -c './bin/eyelog examples/annotation.pl | grep -q "triple(:t, log:nameOf, graph(\[triple(:a, :name, \"Alice\")\]))."'
run 'context association keeps source graph names' bash -c './bin/eyelog examples/context-association.pl | grep -q "triple(skolem:g0, log:nameOf, graph(\[triple(:Bob, foaf:name, \"Bob\")\]))."'
run 'derived rule fires' bash -c './bin/eyelog examples/derived-rule.pl | grep -q "triple(:test, :is, true)."'
run 'skolem function produces deterministic observation id' bash -c './bin/eyelog --query "observation_id(:Alice, :glucose, X)" examples/skolem-functions.pl | grep -q "observation_id(:Alice, :glucose, skolem:observation(:Alice, :glucose))."'
run 'skolem function avoids clashes' bash -c './bin/eyelog examples/skolem-functions.pl | grep -q "triple(:skolemDemo, :noObservationClash, true)."'
run 'healthcare policy graph ranks consent risk first' bash -c './bin/eyelog examples/odrl-dpv-healthcare-risk-ranked.pl | grep -q "triple(:report, :firstRisk, :riskH1)."'
run 'healthcare policy graph suppresses satisfied human review risk' bash -c '! ./bin/eyelog examples/odrl-dpv-healthcare-risk-ranked.pl | grep -q "riskH3"'
run 'healthcare mitigation is graph-valued' bash -c './bin/eyelog examples/odrl-dpv-healthcare-risk-ranked.pl | grep -q "triple(:MitigateDeId, :suggestAddGraph, graph(\[triple(:PermShareWithPharma"'
section Examples
for f in examples/*.pl; do
  run "$(basename "$f")" compare_example "$f"
done
end=$(date +%s%3N)
ms=$((end-start))
printf '\n== Total\n%bOK%b %s/%s tests passed %b(%s ms)%b\n' "$GREEN" "$RESET" "$ok" "$total" "$DIM" "$ms" "$RESET"
