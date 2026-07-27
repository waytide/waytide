#!/bin/sh
# Report component repositories carrying commits that did not come from this
# composite repository.
#
# The component repos are downstream-only: their history is regenerated from
# this repo by `git subtree split` (see CONTRIBUTING.md). A commit made directly
# to one is outside that history, so the next publish cannot fast-forward over
# it — and nothing announces that until a push is attempted and rejected. This
# reports it beforehand.
#
# Run from the repository root, before publishing:
#
#   sh report-direct-commits.sh
#
# It only reads: it fetches from each component repo and pushes nothing.

set -e

if [ ! -d system/foundation ]; then
  echo "Run this from the composite repository root." >&2
  exit 1
fi

# Every message in this repo's history, for membership testing. A component
# commit produced by a split carries its composite commit's message verbatim,
# so a message absent here belongs to a commit that was never in the composite.
composite_messages=$(mktemp)
trap 'rm -f "$composite_messages"' EXIT
git log --all --format=%s | sort -u > "$composite_messages"

# A package is a directory carrying a README.md — the same test the session-start
# notice uses. The nested `code/ruby` publishes to the flat repo name `code-ruby`.
packages=$(
  cd system || exit 1
  find . -mindepth 2 -maxdepth 3 -name README.md |
    sed 's|^\./||; s|/README\.md$||' |
    sort
)

found=0

for package in $packages; do
  repository=$(printf '%s' "$package" | tr '/' '-')
  url="https://github.com/waytide/$repository.git"

  head=$(git ls-remote "$url" master 2>/dev/null | cut -f1)
  if [ -z "$head" ]; then
    printf '%s: no master on %s — skipped\n' "$package" "$url"
    continue
  fi

  git fetch -q "$url" master 2>/dev/null || {
    printf '%s: could not fetch %s — skipped\n' "$package" "$url"
    continue
  }

  # Walk back from the component's head. A direct commit can only sit at the tip:
  # a later publish either fast-forwards, which is impossible over a commit the
  # split does not contain, or force-replaces it. So the direct commits are every
  # commit above the first one whose message this repo knows.
  direct=$(
    git rev-list "$head" | while read -r commit; do
      message=$(git log --format=%s -1 "$commit")
      if grep -Fxq "$message" "$composite_messages"; then
        break
      fi
      printf '  %s  %s\n' "$(git rev-parse --short "$commit")" "$message"
    done
  )

  if [ -n "$direct" ]; then
    found=1
    printf '\n%s — committed directly, not in this repository:\n%s\n' "$package" "$direct"
  fi
done

if [ "$found" = "0" ]; then
  echo "No direct commits. Every component repository head traces to this history."
  exit 0
fi

cat <<'REMEDY'

Adopt each change into the composite before publishing — the content belongs
here, and a direct commit can never become an ancestor of a split, so the
publish will need `--force` once the composite carries the change. Verify the
file content matches before forcing. See CONTRIBUTING.md, "Publishing a package".
REMEDY

exit 1
