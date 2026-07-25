#!/usr/bin/env bash
# Structure checks for skills/*/SKILL.md — run before committing.
set -euo pipefail
fail=0
for f in skills/*/SKILL.md; do
  dir=$(basename "$(dirname "$f")")
  head -1 "$f" | grep -q '^---$' || { echo "FAIL $f: no frontmatter"; fail=1; }
  name=$(awk '/^name:/{print $2; exit}' "$f")
  [ "$name" = "$dir" ] || { echo "FAIL $f: name '$name' != folder '$dir'"; fail=1; }
  grep -q '^description:' "$f" || { echo "FAIL $f: no description"; fail=1; }
  grep -qiE 'use (when|for|at)' "$f" || { echo "FAIL $f: description lacks 'Use when…' trigger"; fail=1; }
  lines=$(wc -l < "$f")
  [ "$lines" -le 150 ] || { echo "FAIL $f: $lines lines (>150)"; fail=1; }
  if grep -qE 'estimat|appkittie|sensor tower|apptopia|apptweak|appfollow|appfigures' "$f"; then
    echo "FAIL $f: forbidden wording"; fail=1
  fi
done
[ $fail -eq 0 ] && echo "OK: all skills valid"
exit $fail
