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
    t1=$(date +%s%3N)
    ms=$((t1-t0))
    ok=$((ok+1))
    printf '%s %bOK%b %b%s%b %b(%s ms)%b\n' "$nr" "$GREEN" "$RESET" "$GREEN" "$name" "$RESET" "$DIM" "$ms" "$RESET"
  else
    printf '%s %bFAIL%b %s\n' "$nr" "$RED" "$RESET" "$name"
    cat "$TEST_ERR"
    cat "$TEST_OUT"
    exit 1
  fi
}
compare_example(){
  f=$1; b=$(basename "$f" .pl)
  ./bin/eyelog "$f" > "$TEST_ACTUAL"
  diff -u "examples/output/$b.pl" "$TEST_ACTUAL"
}
section API
run 'version flag' bash -c './bin/eyelog --version | grep -q "^eyelog $(cat VERSION)$"'
run 'query ancestor' bash -c './bin/eyelog --query "triple(pat, ancestor, X)" examples/ancestor.pl | grep -q "triple(pat, ancestor, emma)."'
run 'usage shows multiple inputs stdin and URLs' bash -c './bin/eyelog --help | grep -Fq "usage: eyelog [--version] [--query GOAL] [file-or-url.pl|- ...]"'
run 'multiple input files compose one program' bash -c 'printf "seed(alice).\n" > "$TEST_TMPDIR/multi-a.pl" && printf "triple(X, type, person) :- seed(X).\n" > "$TEST_TMPDIR/multi-b.pl" && ./bin/eyelog "$TEST_TMPDIR/multi-a.pl" "$TEST_TMPDIR/multi-b.pl" | grep -Fq "triple(alice, type, person)."'
run 'stdin input with dash' bash -c 'printf "triple(stdin, works, true).\n" | ./bin/eyelog - | grep -Fq "triple(stdin, works, true)."'
run 'interactive stdin exits after one Ctrl-D' bash -c 'python3 - <<"PY"
import os
import pty
import select
import subprocess
import sys
import time

master, slave = pty.openpty()
proc = subprocess.Popen(["./bin/eyelog", "-"], stdin=slave, stdout=slave, stderr=slave, close_fds=True)
os.close(slave)
os.write(master, b"triple(tty, eof, ok).\n")
time.sleep(0.1)
os.write(master, b"\x04")
output = b""
deadline = time.time() + 3
while time.time() < deadline:
    ready, _, _ = select.select([master], [], [], 0.1)
    if ready:
        try:
            chunk = os.read(master, 4096)
        except OSError:
            break
        if not chunk:
            break
        output += chunk
    if proc.poll() is not None:
        try:
            while True:
                chunk = os.read(master, 4096)
                if not chunk:
                    break
                output += chunk
        except OSError:
            pass
        break
if proc.poll() is None:
    proc.kill()
    print(output.decode(errors="replace"))
    raise SystemExit(1)
if b"triple(tty, eof, ok)." not in output:
    print(output.decode(errors="replace"))
    raise SystemExit(1)
PY'
run 'file and stdin inputs compose one program' bash -c 'printf "seed(bob).\n" > "$TEST_TMPDIR/file-plus-stdin.pl" && printf "triple(X, type, streamed) :- seed(X).\n" | ./bin/eyelog "$TEST_TMPDIR/file-plus-stdin.pl" - | grep -Fq "triple(bob, type, streamed)."'
run 'URL input loads program' bash -c 'printf "triple(url, works, true).\n" > "$TEST_TMPDIR/url-example.pl" && python3 - "$TEST_TMPDIR" <<"PY"
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
    if "triple(url, works, true)." not in result.stdout:
        print(result.stdout)
        print(result.stderr, file=sys.stderr)
        raise SystemExit(1)
finally:
    server.shutdown()
PY'
run 'parenthesized conjunction query' bash -c './bin/eyelog --query "(triple(pat, ancestor, X), triple(X, ancestor, emma))" examples/ancestor.pl | grep -q "(triple(pat, ancestor, jan), triple(jan, ancestor, emma))."'
run 'quoted atom output round-trips' bash -c "./bin/eyelog test/eyelog-syntax.pl | grep -Fq \"triple('quoted atom', p, 'atom with space').\""
run 'doubled quote in atom query' bash -c "./bin/eyelog --query \"triple('needs''quote', p, X)\" test/eyelog-syntax.pl | grep -Fq \"triple('needs''quote', p, ok).\""
run 'empty quoted atom output' bash -c "./bin/eyelog test/eyelog-syntax.pl | grep -Fq \"triple('empty atom', p, '').\""
run 'list tail syntax in rule head' bash -c "./bin/eyelog test/eyelog-syntax.pl | grep -Fq \"triple(list_case, tail, [b, c]).\""
run 'anonymous variables are fresh' bash -c "./bin/eyelog test/eyelog-syntax.pl | grep -Fq \"triple(anonymous_case, matched, true).\""
run 'scientific and negative decimal syntax' bash -c "./bin/eyelog test/eyelog-syntax.pl | grep -Fq \"triple(scientific, number, 1.25e-3).\" && ./bin/eyelog test/eyelog-syntax.pl | grep -Fq \"triple(negative_decimal, number, -2.5).\""
run 'Eyelog syntax covers atoms strings numbers compounds lists' bash -c "./bin/eyelog test/eyelog-syntax.pl | grep -Fq 'triple(graphic_atom, value, #).' && ./bin/eyelog test/eyelog-syntax.pl | grep -Fq 'triple(string_case, escaped, \"line\\nquote: \\\"ok\\\"\").' && ./bin/eyelog test/eyelog-syntax.pl | grep -Fq 'triple(compound_case, term, pair(3, nested(atom, [x, y]))).' && ./bin/eyelog test/eyelog-syntax.pl | grep -Fq 'triple(improper_list_case, value, [a, b | tail]).'"
run 'fib(10000) has 2090 digits' bash -c './bin/eyelog examples/fibonacci.pl | sed -n "s/^triple(10000, fibonacci, \([0-9]*\)).$/\1/p" | awk "length(\$0)==2090 {ok=1} END{exit !ok}"'
run 'path discovery derives three routes' bash -c '[ "$(./bin/eyelog examples/path-discovery.pl | wc -l)" -eq 3 ]'
run 'cyclic path closure terminates' bash -c '[ "$(./bin/eyelog examples/cyclic-path.pl | wc -l)" -eq 16 ]'
run 'service impact closure terminates' bash -c '[ "$(./bin/eyelog examples/service-impact.pl | wc -l)" -eq 11 ]'
run 'service impact flags mobile checkout' bash -c './bin/eyelog examples/service-impact.pl | grep -q "triple(mobile_checkout, businessFunctionAtRisk, true)."'
run 'list append query' bash -c './bin/eyelog --query "append([a, b], [c], X)" examples/list-collection.pl | grep -q "append(\[a, b\], \[c\], \[a, b, c\])."'
run 'list split query' bash -c '[ "$(./bin/eyelog --query "append(A, B, [a, b])" examples/list-collection.pl | wc -l)" -eq 3 ]'
run 'pow bigint query' bash -c './bin/eyelog --query "pow(2, 100, X)" examples/list-collection.pl | grep -q "1267650600228229401496703205376"'
run 'ackermann [4,2] has 19729 digits' bash -c './bin/eyelog --query "ackermann(4, 2, A)" examples/ackermann.pl | sed -n "s/^ackermann(4, 2, \([0-9]*\)).$/\1/p" | awk "length(\$0)==19729 {ok=1} END{exit !ok}"'
run 'big integer div query' bash -c './bin/eyelog --query "div(15470000000000000000, 1643630000000000, X)" examples/bayes-diagnosis.pl | grep -q "div(15470000000000000000, 1643630000000000, 9412)."'
run 'decimal literal query' bash -c './bin/eyelog --query "posterior(covid19, X)" examples/bayes-diagnosis.pl | grep -q "posterior(covid19, 0.9412093962753174)."'
run 'bayes emits COVID posterior' bash -c './bin/eyelog examples/bayes-diagnosis.pl | grep -q "triple(result(covid19), posterior, 0.9412093962753174)."'
run 'bayes therapy recommends Paxlovid' bash -c './bin/eyelog examples/bayes-therapy.pl | grep -q "triple(case, recommendedTherapy, paxlovid)."'
run 'bayes therapy utility remains queryable' bash -c './bin/eyelog --query "utility(paxlovid, X)" examples/bayes-therapy.pl | grep -q "utility(paxlovid, 3.5851740117076503)."'
run 'bmi computes normal category' bash -c './bin/eyelog examples/bmi.pl | grep -q "triple(answer, category, \"Normal\")."'
run 'bmi rounds reported BMI' bash -c './bin/eyelog examples/bmi.pl | grep -q "triple(answer, bmi, 22.72)."'
run 'rounded query returns integer term' bash -c './bin/eyelog --query "rounded(22.7244, X)" examples/bmi.pl | grep -q "rounded(22.7244, 23)."'
run 'age example passes 80-year threshold' bash -c './bin/eyelog examples/age.pl | grep -q "triple(test, is, true)."'
run 'age date difference query returns ISO duration' bash -c './bin/eyelog --query "difference(\"2026-05-19\", \"1944-08-21\", X)" examples/age.pl | grep -q "difference(\"2026-05-19\", \"1944-08-21\", \"P81Y8M28D\")."'
run 'age duration comparison query' bash -c './bin/eyelog --query "gt(\"P81Y8M28D\", \"P80Y\")" examples/age.pl | grep -q "gt"'
run 'c core throughput materializes 40007 triples' bash -c '[ "$(./bin/eyelog examples/c-core-throughput.pl | wc -l)" -eq 40007 ]'
run 'c core throughput reaches last generated row' bash -c './bin/eyelog examples/c-core-throughput.pl | grep -q "triple(report, lastRow, row10000)."'
run 'c core transitive closure materializes 2492 triples' bash -c '[ "$(./bin/eyelog examples/c-core-transitive-closure.pl | wc -l)" -eq 2492 ]'
run 'c core transitive closure reaches last node' bash -c './bin/eyelog examples/c-core-transitive-closure.pl | grep -q "triple(n1, reaches, n70)."'
run 'floating add query' bash -c './bin/eyelog --query "add(1.5, 2.25, X)" examples/floating-point.pl | grep -q "add(1.5, 2.25, 3.75)."'
run 'floating add query' bash -c './bin/eyelog --query "add(0.125, 0.875, X)" examples/floating-point.pl | grep -q "add(0.125, 0.875, 1.0)."'
run 'native add query' bash -c './bin/eyelog --query "add(0.125, 0.875, X)" examples/aliases-and-namespaces.pl | grep -q "add(0.125, 0.875, 1.0)."'
run 'native string match query' bash -c './bin/eyelog --query "matches(scoped_retail_insight, retail)" examples/aliases-and-namespaces.pl | grep -q "matches(scoped_retail_insight, retail)."'
run 'native comparison query' bash -c './bin/eyelog --query "lt(2, 3)" examples/aliases-and-namespaces.pl | grep -q "lt(2, 3)."'
run 'floating comparison query' bash -c './bin/eyelog --query "gt(2.5, 2)" examples/floating-point.pl | grep -q "gt(2.5, 2)."'
run 'complex exponentiation query' bash -c './bin/eyelog --query "complex_exponentiation([0, 1], [0, 1], X)" examples/complex.pl | grep -q "complex_exponentiation(\[0, 1\], \[0, 1\], \[0.20787957635076193, 0.0\])."'
run 'complex asin query' bash -c './bin/eyelog --query "complex_asin([2, 0], X)" examples/complex.pl | grep -q "complex_asin(\[2, 0\], \[1.5707963267948966, 1.3169578969248166\])."'
run 'delfour all checks pass' bash -c './bin/eyelog examples/delfour.pl | grep -q "triple(result, allChecksPass, true)."'
run 'delfour suggests low sugar biscuits' bash -c './bin/eyelog --query "suggested_alternative(case, X)" examples/delfour.pl | grep -q "suggested_alternative(case, prod_BIS_101)."'
run 'delfour policy is projected from formula data' bash -c './bin/eyelog --query "policy_triple(policy, odrl_permission, X)" examples/delfour.pl | grep -q "policy_triple(policy, odrl_permission, permission(odrl_use, insight, \"shopping_assist\"))."'
run 'not_matches alternation query' bash -c './bin/eyelog --query "not_matches(\"scoped retail insight\", \"diabetes|medical\")" examples/delfour.pl | grep -q "not_matches"'
run 'timestamp comparison query' bash -c './bin/eyelog --query "le(\"2025-10-05T20:35:48.907163+00:00\", \"2025-10-05T22:33:48.907185+00:00\")" examples/delfour.pl | grep -q "le"'
run 'list reverse query' bash -c './bin/eyelog --query "reverse([a, b, c], X)" examples/list-collection.pl | grep -q "reverse(\[a, b, c\], \[c, b, a\])."'
run 'list not member query' bash -c './bin/eyelog --query "not_member(d, [a, b, c])" examples/list-collection.pl | grep -q "not_member(d, \[a, b, c\])."'
run 'list rest query' bash -c './bin/eyelog --query "rest([a, b, c], X)" examples/list-collection.pl | grep -q "rest(\[a, b, c\], \[b, c\])."'
run 'list nth0 query' bash -c './bin/eyelog --query "nth0(2, [a, b, c], X)" test/eyelog-syntax.pl | grep -q "nth0(2, \[a, b, c\], c)."'
run 'list set_nth0 query' bash -c './bin/eyelog --query "set_nth0(1, [a, b, c], X, z)" test/eyelog-syntax.pl | grep -q "set_nth0(1, \[a, b, c\], \[a, z, c\], z)."'
run 'findall collects duplicate solutions' bash -c 'printf "p(a).\np(b).\np(a).\n" | ./bin/eyelog --query "findall(X, p(X), L)" - | grep -Fq "findall(X, p(X), [a, b, a])."'
run 'sort orders and removes duplicates' bash -c './bin/eyelog --query "sort([3, 1, 2, 1], S)" test/eyelog-syntax.pl | grep -Fq "sort([3, 1, 2, 1], [1, 2, 3])."'
run 'log not equal query' bash -c './bin/eyelog --query "neq(dp_P1, dp_P2)" examples/dining-philosophers.pl | grep -q "neq(dp_P1, dp_P2)."'
run 'risk path selects B' bash -c './bin/eyelog examples/dijkstra-risk-path.pl | grep -q "triple(dijkstraRiskPath, selects, pathB)."'
run 'gps recommends direct route' bash -c './bin/eyelog examples/gps.pl | grep -q "triple(decision, recommendedRoute, routeDirect)."'
run 'gps report derives selected route metrics' bash -c './bin/eyelog examples/gps.pl | grep -q "triple(report, selectedRoute, route(routeDirect, \[drive_gent_brugge, drive_brugge_oostende\], 2400.0"'
run 'gps path metrics remain queryable' bash -c './bin/eyelog --query "route_metrics(routeDirect, D, C, B, F)" examples/gps.pl | grep -q "route_metrics(routeDirect, 2400.0, 0.01"'
run 'dijkstra network is projected from quoted formula' bash -c './bin/eyelog --query "base_link(a, b, X)" examples/dijkstra.pl | grep -q "base_link(a, b, 4)."'
run 'risk route segment is projected from quoted formula' bash -c './bin/eyelog --query "route_segment(depotA, relay, Raw, Risk)" examples/dijkstra-risk-path.pl | grep -q "route_segment(depotA, relay, 5.0, 0.2)."'
run 'drone planner emits 17 plans' bash -c '[ "$(./bin/eyelog examples/drone-corridor-planner.pl | wc -l)" -eq 17 ]'
run 'dining philosophers derives 15 meals' bash -c '[ "$(./bin/eyelog examples/dining-philosophers.pl | grep -c "dp_type, dp_Meal")" -eq 15 ]'
run 'allen interval table is list-backed' bash -c './bin/eyelog --query "start(a, S)" examples/allen-interval-calculus.pl | grep -q "start(a, 10)."'
run 'family parent is projected from formula data' bash -c './bin/eyelog --query "parent(adam, bob)" examples/family-cousins.pl | grep -q "parent(adam, bob)."'
run 'mod query' bash -c './bin/eyelog --query "mod(202692987, 3881, X)" examples/fundamental-theorem-arithmetic.pl | grep -q "mod(202692987, 3881, 0)."'
run 'div query' bash -c './bin/eyelog --query "div(202692987, 3881, X)" examples/fundamental-theorem-arithmetic.pl | grep -q "div(202692987, 3881, 52227)."'
run 'fundamental theorem factors target' bash -c './bin/eyelog examples/fundamental-theorem-arithmetic.pl | grep -q "triple(case, factorsSmallest, \[3, 3, 7, 829, 3881\])."'
run 'easter computus 2035' bash -c './bin/eyelog examples/easter-computus.pl | grep -q "triple(y2035, easterDate, date(2035, march, 25))."'
run 'gradient descent emits tenth bound' bash -c './bin/eyelog examples/gd-step-certified.pl | grep -q "triple(result, xBounds, bounds(10, -27.925465497600001, 29.925465497600001))."'
run 'fft8 ramp dc component' bash -c './bin/eyelog examples/fft8-numeric.pl | grep -q "triple(ramp8, dcComponent, c(28, 0.0))."'
run 'odrl dpv ranks account removal first' bash -c './bin/eyelog examples/odrl-dpv-risk-ranked.pl | grep -q "triple(report, firstRisk, risk1)."'
run 'odrl policy formula is materialized as formula data' bash -c './bin/eyelog examples/odrl-dpv-risk-ranked.pl | grep -q "triple(policyGraph1, contains, triple(policy1, odrl_permission, permDeleteAccount))."'
run 'odrl dpv scores sharing risk 97' bash -c './bin/eyelog examples/odrl-dpv-risk-ranked.pl | grep -q "triple(risk3, score, 97)."'
run 'odrl dpv classifies export as moderate' bash -c './bin/eyelog examples/odrl-dpv-risk-ranked.pl | grep -q "triple(risk4, dpv_hasRiskLevel, risk_ModerateRisk)."'
run 'annotation names Alice triple directly' bash -c './bin/eyelog examples/annotation.pl | grep -q "triple(t, log_nameOf, triple(a, name, \"Alice\"))."'
run 'native formula_triple enumerates comma formula' bash -c './bin/eyelog --query "formula_triple((triple(a, b, c), triple(d, e, f)), S, P, O)" examples/annotation.pl | grep -q "formula_triple((triple(a, b, c), triple(d, e, f)), d, e, f)."'
run 'context association keeps source formula names' bash -c './bin/eyelog examples/context-association.pl | grep -q "triple(skolem_g0, log_nameOf, triple(bob, foaf_name, \"Bob\"))."'
run 'derived rule fires' bash -c './bin/eyelog examples/derived-rule.pl | grep -q "triple(test, is, true)."'
run 'skolem function produces deterministic observation id' bash -c './bin/eyelog --query "observation_id(alice, glucose, X)" examples/skolem-functions.pl | grep -q "observation_id(alice, glucose, skolem_observation(alice, glucose))."'
run 'skolem function avoids clashes' bash -c './bin/eyelog examples/skolem-functions.pl | grep -q "triple(skolemDemo, noObservationClash, true)."'
run 'healthcare policy formula ranks consent risk first' bash -c './bin/eyelog examples/odrl-dpv-healthcare-risk-ranked.pl | grep -q "triple(report, firstRisk, riskH1)."'
run 'healthcare policy formula suppresses satisfied human review risk' bash -c '! ./bin/eyelog examples/odrl-dpv-healthcare-risk-ranked.pl | grep -q "riskH3"'
run 'healthcare mitigation is formula-valued' bash -c './bin/eyelog examples/odrl-dpv-healthcare-risk-ranked.pl | grep -q "triple(mitigateDeId, suggestAddGraph, (triple(permShareWithPharma"'
run 'turing machine increments carry chain' bash -c './bin/eyelog examples/turing.pl | grep -q "triple(case3, output, \[1, 0, 0, 0, 0, 0, 0, #\])."'
run 'socrates derives mortal' bash -c './bin/eyelog examples/socrates.pl | grep -q "triple(socrates, type, mortal)."'
run 'superdense coding preserves all four messages' bash -c '[ "$(./bin/eyelog examples/superdense-coding.pl | grep -c "decodesAs")" -eq 4 ]'
run 'superdense coding cancels cross talk' bash -c './bin/eyelog examples/superdense-coding.pl | grep -q "triple(protocol, cancelsCrossTalk, true)."'
run 'wolf goat cabbage finds two seven-move solutions' bash -c '[ "$(./bin/eyelog examples/wolf-goat-cabbage.pl | grep -c "triple(puzzle, solution")" -eq 2 ]'
run 'hamiltonian path enumerates 120 paths' bash -c '[ "$(./bin/eyelog examples/hamiltonian-path.pl | grep -c "hamiltonianPath")" -eq 120 ]'
run 'animal example derives Joe as animal' bash -c './bin/eyelog examples/animal.pl | grep -q "triple(joe, type, animal)."'
run 'diamond property is preserved under reflexive closure' bash -c './bin/eyelog examples/diamond-property.pl | grep -q "triple(diamondProperty, preservedUnderReflexiveClosure, true)."'
run 'monkey bananas finds a grab plan' bash -c './bin/eyelog examples/monkey-bananas.pl | grep -q "triple(monkeyBananas, plan, \[go(loc3), push(loc1), climb_on, grab\])."'
run 'n queens enumerates all 92 eight-queen solutions' bash -c '[ "$(./bin/eyelog examples/n-queens.pl | grep -c "triple(nQueens8, solution")" -eq 92 ]'
run 'zebra puzzle solves classic answer' bash -c './bin/eyelog examples/zebra.pl | grep -q "triple(zebraPuzzle, zebraOwner, japanese)."'
run 'sudoku solves classic puzzle' bash -c './bin/eyelog examples/sudoku.pl | grep -q "triple(case, status, ok)."'
run 'sudoku emits completed first row' bash -c './bin/eyelog examples/sudoku.pl | grep -q "\[1, 6, 2, 8, 5, 7, 4, 9, 3\]"'
run 'sudoku builtin accepts dot blanks' bash -c './bin/eyelog --query "once(sudoku(\"1....7.9..3..2...8..96..5....53..9...1..8...26....4...3......1..4......7..7...3..\", S))" examples/sudoku.pl | grep -q "\[8, 9, 7, 2, 6, 1, 3, 5, 4\]"'
run 'once returns a single n-queens solution' bash -c '[ "$(./bin/eyelog --query "once(queens(8, Qs))" examples/n-queens.pl | grep -c "once")" -eq 1 ]'
run 'kaprekar reaches 6174 for 3524' bash -c './bin/eyelog examples/kaprekar.pl | grep -q "triple(3524, kaprekarSteps, 3)."'
run 'kaprekar reports four demo cases' bash -c '[ "$(./bin/eyelog examples/kaprekar.pl | grep -c "kaprekarSteps")" -eq 4 ]'
run 'kaprekar treats 6174 as already converged' bash -c './bin/eyelog examples/kaprekar.pl | grep -q "triple(6174, kaprekarSteps, 0)."'
run 'takeuchi classic result' bash -c './bin/eyelog examples/takeuchi.pl | grep -q "triple(classic, takeuchiResult, 13)."'
run 'control system computes actuator2 signal' bash -c './bin/eyelog examples/control-system.pl | grep -q "triple(actuator2, controlSignal, 26.079999999999998)."'
run 'matrix determinant matches Trealla reference' bash -c './bin/eyelog examples/matrix.pl | grep -q "determinant(\[\[2, -1, 0\], \[-1, 2, -1\], \[0, -1, 2\]\], 4.0)"'
run 'matrix multiplication matches Trealla reference' bash -c './bin/eyelog examples/matrix.pl | grep -q "matrix_multiply(\[\[\[1, 2\], \[3, 4\], \[5, 6\]\], \[\[1, 1, 1\], \[1, 1, 1\]\]\], \[\[3, 3, 3\], \[7, 7, 7\], \[11, 11, 11\]\])"'
run 'matrix Cholesky matches Trealla reference' bash -c './bin/eyelog examples/matrix.pl | grep -q "cholesky_decomposition(\[\[25, 15, -5\], \[15, 18, 0\], \[-5, 0, 11\]\], \[\[5.0, 0, 0\], \[3.0, 3.0, 0\], \[-1.0, 1.0, 3.0\]\])"'
run 'quadratic formula derives roots' bash -c './bin/eyelog examples/quadratic-formula.pl | grep -q "triple(eq1, root, 3.0)." && ./bin/eyelog examples/quadratic-formula.pl | grep -q "triple(eq2, root, -1.0)."'
run 'statistics summary computes variance' bash -c './bin/eyelog examples/statistics-summary.pl | grep -q "triple(scores, populationVariance, 4.0)."'
run 'vector similarity computes cosine' bash -c './bin/eyelog examples/vector-similarity.pl | grep -q "triple(pair1, cosineSimilarity, 0.36548694232390361)."'
run 'electrical RC filter computes cutoff' bash -c './bin/eyelog examples/electrical-rc-filter.pl | grep -q "triple(filter1, cutoffFrequency_Hz, 15.915494309189533)."'
run 'beam deflection stays within limit' bash -c './bin/eyelog examples/beam-deflection.pl | grep -q "triple(beam1, status, within_deflection_limit)."'
run 'heat loss flags high loss' bash -c './bin/eyelog examples/heat-loss.pl | grep -q "triple(wall1, status, high_heat_loss)."'
run 'cache performance classifies effective cache' bash -c './bin/eyelog examples/cache-performance.pl | grep -q "triple(api_cache, status, cache_effective)."'
run 'canary release recommends rollback' bash -c './bin/eyelog examples/canary-release.pl | grep -q "triple(canary42, status, rollback_recommended)."'
run 'network sla path is compliant' bash -c './bin/eyelog examples/network-sla.pl | grep -q "triple(edge_path, status, sla_compliant)."'
run 'ideal gas law checks atmospheric pressure' bash -c './bin/eyelog examples/ideal-gas-law.pl | grep -q "triple(cell1, status, near_atmospheric)."'
run 'radioactive decay leaves quarter activity' bash -c './bin/eyelog examples/radioactive-decay.pl | grep -q "triple(iodine_sample, remainingActivity_Bq, 20.0)."'
run 'pendulum period matches target' bash -c './bin/eyelog examples/pendulum-period.pl | grep -q "triple(pendulum1, period_s, 2.0)."'
run 'competitive enzyme kinetics flags significant inhibition' bash -c './bin/eyelog examples/competitive-enzyme-kinetics.pl | grep -q "triple(assay1, status, significant_inhibition)."'
run 'hamming code corrects bit five' bash -c './bin/eyelog examples/hamming-code.pl | grep -q "triple(packet1, errorBit, 5)." && ./bin/eyelog examples/hamming-code.pl | grep -q "triple(packet1, decodedPayload, \[1, 0, 1, 0\])."'
run 'buck converter ripple design is stable' bash -c './bin/eyelog examples/buck-converter-design.pl | grep -q "triple(regulator1, status, stable_ripple_design)."'
run 'least squares regression accepts model fit' bash -c './bin/eyelog examples/least-squares-regression.pl | grep -q "triple(regression1, rSquared, 0.64000000000000001)."'
run 'orbital transfer design is within delta-v budget' bash -c './bin/eyelog examples/orbital-transfer-design.pl | grep -q "triple(mars_hohmann, status, feasible_reference_transfer)."'
run 'lldm outputs discrepancy alarm' bash -c './bin/eyelog examples/lldm.pl | grep -q "triple(meas47, type, lld_alarm)."'
run 'lldm outputs concise discrepancy reason' bash -c './bin/eyelog examples/lldm.pl | grep -q "triple(meas47, lld_discrepancy_cm, -1.9082339805374957)."'
run 'illegitimate reasoning flags affirming consequent' bash -c './bin/eyelog examples/illegitimate-reasoning.pl | grep -q "triple(arg_affirming_consequent, fallacy, affirming_consequent)."'
run 'illegitimate reasoning leaves modus ponens unflagged' bash -c '! ./bin/eyelog examples/illegitimate-reasoning.pl | grep -q "arg_modus_ponens"'
run 'clinical trial screening keeps only eligible candidate' bash -c './bin/eyelog examples/clinical-trial-screening.pl | grep -q "triple(p001, status, eligible)." && ! ./bin/eyelog examples/clinical-trial-screening.pl | grep -q "triple(p002, status, eligible)."'
run 'microgrid dispatch preserves reserve' bash -c './bin/eyelog examples/microgrid-dispatch.pl | grep -q "triple(campus_interval_17, status, stable_dispatch)." && ./bin/eyelog examples/microgrid-dispatch.pl | grep -q "triple(campus_interval_17, reserveAfterDispatch_kW, 80.0)."'
run 'manufacturing quality control flags one capable and one adjustment' bash -c './bin/eyelog examples/manufacturing-quality-control.pl | grep -q "triple(line8_shift_b, status, capable_process)." && ./bin/eyelog examples/manufacturing-quality-control.pl | grep -q "triple(line7_shift_a, status, needs_process_adjustment)."'
run 'security incident correlation escalates only confirmed compromise' bash -c './bin/eyelog examples/security-incident-correlation.pl | grep -q "triple(inc42, status, escalate_to_incident_response)." && ! ./bin/eyelog examples/security-incident-correlation.pl | grep -q "inc43"'
run 'peano arithmetic derives unary sum and product' bash -c './bin/eyelog examples/peano-arithmetic.pl | grep -Fq "triple(peano_case, sum, s(s(s(s(s(0))))))." && ./bin/eyelog examples/peano-arithmetic.pl | grep -Fq "triple(peano_case, product, s(s(s(s(s(s(0)))))))."'
run 'graph reachability finds positive and negative cases' bash -c './bin/eyelog examples/graph-reachability.pl | grep -Fq "triple(reachability_case, reachable, path(a, f))." && ./bin/eyelog examples/graph-reachability.pl | grep -Fq "triple(reachability_case, not_reachable, path(b, e))."'
run 'proof by contrapositive refutes raining' bash -c './bin/eyelog examples/proof-contrapositive.pl | grep -Fq "triple(proof1, refutes, raining)."'
run 'access control policy passes finite checks' bash -c './bin/eyelog examples/access-control-policy.pl | grep -Fq "triple(test1, status, policy_passed)."'
run 'dijkstra findall sort derives shortest path' bash -c './bin/eyelog examples/dijkstra-findall-sort.pl | grep -Fq "triple(dijkstra_findall_sort, shortestPath, [a, c, b, d, e, f])."'
run 'combinatorics findall sort derives ten unique combinations' bash -c './bin/eyelog examples/combinatorics-findall-sort.pl | grep -Fq "triple(combinations_5_choose_3, count, 10)."'
run 'eulerian path findall sort derives circuit' bash -c './bin/eyelog examples/eulerian-path.pl | grep -Fq "triple(eulerian_path_case, edgeCount, 11)." && ./bin/eyelog examples/eulerian-path.pl | grep -Fq "triple(eulerian_path_case, path, [v1, v2, v3, v4, v5, v1, v3, v6, v2, v4, v6, v1])."'
run 'd3 group findall sort enumerates subgroups' bash -c './bin/eyelog examples/d3-group.pl | grep -Fq "triple(d3_group, subgroupCount, 6)."'
run 'quine mccluskey findall sort derives minimal cover' bash -c './bin/eyelog examples/quine-mccluskey.pl | grep -Fq "triple(quine_mccluskey, minimalCover, [[0, 0, x, x], [x, x, 1, 1]])."'
run 'basic monadic findall sort summarizes classes' bash -c './bin/eyelog examples/basic-monadic.pl | grep -Fq "triple(basic_monadic, entityCount, 29)." && ./bin/eyelog examples/basic-monadic.pl | grep -Fq "triple(basic_monadic, selfLoops, [i_11, i_75, i_76, i_93])."'
section Examples
for f in examples/*.pl; do
  run "$(basename "$f")" compare_example "$f"
done
end=$(date +%s%3N)
ms=$((end-start))
printf '\n== Total\n%bOK%b %s/%s tests passed %b(%s ms)%b\n' "$GREEN" "$RESET" "$ok" "$total" "$DIM" "$ms" "$RESET"
