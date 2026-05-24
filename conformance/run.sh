#!/usr/bin/env bash
set -euo pipefail
ROOT=$(cd "$(dirname "$0")/.." && pwd)
BIN=${EYELOG_BIN:-"$ROOT/bin/eyelog"}
ACCEPT=0
if [ "${1:-}" = "--accept" ]; then
  ACCEPT=1
  shift
fi
if [ ! -x "$BIN" ]; then
  echo "conformance: missing executable: $BIN" >&2
  echo "build it first, or set EYELOG_BIN=/path/to/eyelog" >&2
  exit 1
fi
profiles=("$@")
if [ ${#profiles[@]} -eq 0 ]; then
  profiles=(core extension)
fi
TMPDIR_CONFORMANCE=$(mktemp -d "${TMPDIR:-/tmp}/eyelog-conformance.XXXXXX")
trap 'rm -rf "$TMPDIR_CONFORMANCE"' EXIT
GREEN=''; RED=''; DIM=''; RESET=''
if [ -t 1 ]; then
  GREEN=$'\033[32m'; RED=$'\033[31m'; DIM=$'\033[2m'; RESET=$'\033[0m'
fi
ok=0; total=0; start=$(date +%s%3N)
section(){ printf '\n== %s\n' "$1"; }
run_case(){
  case_file=$1
  rel=${case_file#"$ROOT/conformance/cases/"}
  base=${case_file%.pl}
  expected="$ROOT/conformance/expected/${rel%.pl}.out"
  name=${rel%.pl}
  total=$((total+1)); nr=$(printf '%03d' "$total")
  out="$TMPDIR_CONFORMANCE/out"
  err="$TMPDIR_CONFORMANCE/err"
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
    elif [ -f "$expected" ] && diff -u "$expected" "$out" > "$TMPDIR_CONFORMANCE/diff"; then
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
        cat "$TMPDIR_CONFORMANCE/diff" >&2
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
section Conformance
for profile in "${profiles[@]}"; do
  case_dir="$ROOT/conformance/cases/$profile"
  [ -d "$case_dir" ] || { echo "conformance: unknown profile: $profile" >&2; exit 1; }
  while IFS= read -r -d '' case_file; do
    run_case "$case_file"
  done < <(find "$case_dir" -type f -name '*.pl' -print0 | sort -z)
done
end=$(date +%s%3N); ms=$((end-start))
printf '\n== Total\n%bOK%b %s/%s conformance cases passed %b(%s ms)%b\n' "$GREEN" "$RESET" "$ok" "$total" "$DIM" "$ms" "$RESET"
