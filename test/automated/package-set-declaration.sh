#!/bin/sh
# session-start.sh carries a declared package set to the agent.
#
# Usage:
#
#   test/automated/package-set-declaration.sh
#
# Run from the repository root.
#
# Five outcomes. No declaration says nothing about a set, which is every project today and the
# case that must not regress. A declaration is carried with its active and deactivated packages.
# The most recent of several holds. A record missing its resolution is ignored rather than obeyed.
# And every one of them emits JSON a harness can parse — the failure that would otherwise be
# silent, since a notice that cannot be parsed does not arrive and leaves no error behind.
set -e

repository=$(pwd)

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

fail() {
  echo "$1"
  shift
  for line in "$@"; do echo "  $line"; done
  echo "1 failed, 0 aborted"
  exit 1
}

# A scratch project in the consuming-project layout, which is what an install produces.
project() {
  path="$tmp/$1"
  mkdir -p "$path/waytide/system/foundation" "$path/waytide/local"
  echo "# Foundation" > "$path/waytide/system/foundation/README.md"
  cp "$repository/system/foundation/session-start.sh" "$path/waytide/system/foundation/"
  printf '%s' "$path"
}

declare_set() {
  cat > "$1/waytide/local/$2-package-set.md" <<RECORD
# Package set

- **Package set:** $3
- **Packages:** $4
- **Inactive:** $5
RECORD
}

# The parsed context, or a failure that says the JSON did not parse at all.
context() {
  ( cd "$1" && ./waytide/system/foundation/session-start.sh ) |
    python3 -c '
import json, sys
try:
    print(json.load(sys.stdin)["hookSpecificOutput"]["additionalContext"])
except Exception:
    print("THE OUTPUT DID NOT PARSE")
'
}

# No declaration says nothing about a set --------------------------------------

silent=$(project silent)

case $(context "$silent") in
  *"package set"*)
    fail "A project with no declaration was told about a set." \
      "found:    a mention of one" \
      "expected: no mention"
    ;;
  *"THE OUTPUT DID NOT PARSE"*)
    fail "The output did not parse with no declaration present."
    ;;
esac

# A declaration is carried, with both lists -------------------------------------

declared=$(project declared)
declare_set "$declared" "2026-08-23T09-30-00Z-content" "content" \
  "foundation, git, journal, language, versioning" "design-by-efferent, testing"

carried=$(context "$declared")

for expected in "package set: content" "foundation, git, journal, language, versioning" "design-by-efferent, testing"; do
  case $carried in
    *"$expected"*) ;;
    *) fail "The declaration was not carried." "found:    it absent" "expected: $expected" ;;
  esac
done

# The most recent of several holds ----------------------------------------------

recent=$(project recent)
declare_set "$recent" "2026-08-23T09-30-00Z-content" "content" \
  "foundation, git" "design-by-efferent"
declare_set "$recent" "2026-08-24T11-02-14Z-default" "default" \
  "design-by-efferent, foundation, git" "none"

held=$(context "$recent")

case $held in
  *"package set: default"*) ;;
  *) fail "The most recent declaration did not hold." \
      "found:    not the later one" "expected: package set: default" ;;
esac

case $held in
  *"package set: content"*)
    fail "A superseded declaration was carried." \
      "found:    the earlier one as well" "expected: only the later one"
    ;;
esac

# A record with no resolution is ignored ----------------------------------------
#
# Obeying it would deactivate every package, which nobody means by declaring a set.

partial=$(project partial)
cat > "$partial/waytide/local/2026-08-23T09-30-00Z-content-package-set.md" <<'RECORD'
# Package set

- **Package set:** content
RECORD

case $(context "$partial") in
  *"package set"*)
    fail "A record with no resolution was obeyed." \
      "found:    it carried" "expected: it ignored"
    ;;
esac

# A hand-written record cannot break the JSON ------------------------------------
#
# The declaration is the one input here that is not this system's own output, and it is
# interpolated into a JSON string by a printf with no escaping.

hostile=$(project hostile)
cat > "$hostile/waytide/local/2026-08-23T09-30-00Z-content-package-set.md" <<'RECORD'
# Package set

- **Package set:** content" , "x": "
- **Packages:** foundation\, git
RECORD

case $(context "$hostile") in
  *"THE OUTPUT DID NOT PARSE"*)
    fail "A hand-written record broke the JSON." \
      "found:    a parse error" "expected: an object"
    ;;
esac

echo "0 failed, 0 aborted"
