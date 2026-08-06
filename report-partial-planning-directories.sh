#!/bin/sh
# Report files under system/ that name some but not all of a mode's planning
# directories.
#
# A project works in one of three modes, and each mode names the same two
# planning artifacts differently: the direction artifact is a design, an
# aspiration, or an orientation, and the sequencing artifact is a plan, an
# intention, or an action (see foundation's
# a-project-works-in-a-mode-chosen-at-initiation rule). A rule that is *about*
# one of those artifacts names every mode's directory; a rule that merely
# mentions one names none of them, writing "the direction artifact" or "the
# sequencing artifact" instead.
#
# Nothing enforced either half, so a rule naming only `plans/` reviewed,
# published, and installed cleanly, and was wrong in every intuitive-mode and
# OODA-mode project until someone followed it into a directory that does not
# exist. This reports it beforehand.
#
# Run from the repository root, before publishing:
#
#   ./report-partial-planning-directories.sh
#
# It only reads.
#
# What it reports is a triple named in part: the three directories of an
# artifact are named together or not at all, and only a defect produces one or
# two of them. So the check needs no notion of what a rule is for. What it does
# not report is a merely-mentioning rule that names all three rather than
# generalizing — that is verbose, and it sends no reader to a directory that
# does not have one.
#
# The remedy differs by site and this does not choose it: a rule *about* the
# artifact gains the missing directories, and a rule that merely mentions one
# drops all of them for the covering term.

set -e

if [ ! -d system/foundation ]; then
  echo "Run this from the composite repository root." >&2
  exit 1
fi

direction="design aspiration orientation"
sequencing="plans intention action"

# A directory is named either by the consuming-project path the rules state
# (`waytide/local/plans/`) or as a bare backticked name in a list (`plans/`).
names_directory() {
  file=$1
  directory=$2

  grep -qE "local/$directory/|\`$directory/\`" "$file"
}

found=0

for file in $(find system -type f | sort); do
  findings=""

  for artifact in direction sequencing; do
    eval "members=\$$artifact"

    named=""
    missing=""

    for member in $members; do
      if names_directory "$file" "$member"; then
        named="$named $member/"
      else
        missing="$missing $member/"
      fi
    done

    # Named in full, or not named at all — both are correct under the convention.
    if [ -z "$named" ] || [ -z "$missing" ]; then
      continue
    fi

    findings="$findings    $artifact: names$named — missing$missing
"
  done

  if [ -n "$findings" ]; then
    found=1
    printf '%s\n%s' "$file" "$findings"
  fi
done

if [ "$found" = "0" ]; then
  echo "No partial planning directories. Every file names a mode's triple in full or not at all."
  exit 0
fi

cat <<'REMEDY'

Correct each before publishing. Where the file is *about* the artifact, name the
missing directories beside the ones already there. Where it merely mentions the
artifact, drop the concrete names for "the direction artifact" or "the
sequencing artifact" — the covering terms, which keep their class noun and are
never shortened. See foundation's a-project-works-in-a-mode-chosen-at-initiation
rule.
REMEDY

exit 1
