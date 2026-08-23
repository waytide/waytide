#!/bin/sh
# The ANSI probe emits JSON a harness can parse, carrying real escape sequences.
#
# Usage:
#
#   test/automated/ansi-notice-encoding.sh
#
# Run from the repository root.
#
# It proves everything up to the harness boundary and nothing past it. Whether the harness
# *renders* the sequences is not decidable here — that needs a session start and a person to
# look at it, which is test/manual/ansi-in-the-notice.sh. What is decidable here is that the
# probe cannot fail for the boring reason: emitting bytes that make the notice unparseable,
# in which case it would vanish with no error and the silence would be read as "stripped".
#
# A false negative is the failure this exists to prevent. Of the three outcomes the manual
# test distinguishes, "stripped" and "never arrived" look identical to the engineer.
set -e

probe=test/manual/ansi-in-the-notice.sh

fail() {
  echo "$1"
  shift
  for line in "$@"; do echo "  $line"; done
  echo "1 failed, 0 aborted"
  exit 1
}

output=$("$probe")

# The escape sequences are emitted ------------------------------------------------------
#
# Written as a pattern rather than as the sequence itself, for the reason the probe gives:
# the six characters must not appear anywhere a printf format or a shell expansion could
# reach them and turn them into the raw byte.
escapes=$(printf '%s' "$output" | grep -c '\\u001b\[[0-9]*m' || true)

[ "$escapes" -ge 1 ] ||
  fail "The probe emitted no escape sequence." \
    "found:    $escapes lines carrying one" \
    "expected: at least 1"

# No raw control character is emitted ---------------------------------------------------
#
# This is the hazard. JSON forbids an unescaped control character inside a string, so a raw
# 0x1B would make the whole object unparseable. The notice would then not print at all, and
# the manual test would read as a stripped result rather than as a broken one.
control=$(printf '%s' "$output" | LC_ALL=C tr -d '\n' | LC_ALL=C grep -c '[[:cntrl:]]' || true)

[ "$control" = "0" ] ||
  fail "The probe emitted a raw control character." \
    "found:    $control" \
    "expected: 0"

# It parses, and it decodes to real escape bytes ----------------------------------------
#
# The two checks above are structural and this one is the claim itself: a parser reading
# the output gets a string with 0x1B in it. It needs a JSON parser, which no other test
# here does, so its absence is reported rather than passed over — a skipped check that
# says nothing is a check that reads as having passed.
if command -v python3 >/dev/null 2>&1; then
  decoded=$(printf '%s' "$output" | python3 -c '
import json, sys
message = json.load(sys.stdin)["systemMessage"]
print(message.count("\x1b"))
') || fail "The probe output did not parse as JSON." "found:    a parse error" "expected: an object"

  [ "$decoded" -ge 1 ] ||
    fail "The parsed notice carries no escape byte." \
      "found:    $decoded" \
      "expected: at least 1"
else
  echo "python3 is absent: the parse and decode check did not run."
fi

echo "0 failed, 0 aborted"
