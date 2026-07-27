#!/bin/sh
# Print the Waytide load notice at session start.
#
# Run by the harness as a SessionStart hook, not by the agent — see the
# announce-waytide-at-session-start rule. It reads the package directories
# actually present and emits the notice as JSON on stdout, which the harness
# renders as its own message.
#
# The notice never disrupts a session: any problem exits quietly with no output.

# Never let a notice break a session start.
set +e

# A non-empty WAYTIDE_QUIET silences the notice. The opt-out lives in the
# developer's own environment, never in committed project content.
if [ -n "$WAYTIDE_QUIET" ]; then
  exit 0
fi

# Locate the framework: waytide/framework/ in a consuming project, framework/
# in the Waytide authoring source. Checked in that order — a consuming project
# may have a framework/ directory of its own.
if [ -d waytide/framework ]; then
  framework=waytide/framework
elif [ -d framework ] && [ -d framework/foundation ]; then
  framework=framework
else
  exit 0
fi

# A package is a directory carrying a README.md. That distinguishes a package
# from a grouping directory: framework/code/ has no README and is not a package,
# framework/code/ruby/ has one and is. Depth 2 finds a top-level package's
# README, depth 3 a grouped one's.
packages=$(
  cd "$framework" 2>/dev/null || exit 0
  find . -mindepth 2 -maxdepth 3 -name README.md 2>/dev/null |
    sed 's|^\./||; s|/README\.md$||' |
    sort
)

if [ -z "$packages" ]; then
  exit 0
fi

count=$(printf '%s\n' "$packages" | wc -l | tr -d ' ')
list=$(printf '%s\n' "$packages" | tr '\n' ',' | sed 's|,$||; s|,|, |g')

# Installing foundation alone is the ordinary first install, so the single-package
# notice is what a developer sees before any other package is added.
noun=packages
if [ "$count" = "1" ]; then
  noun=package
fi

notice=$(printf 'Waytide loaded from %s/ — %s %s: %s' \
  "$framework" "$count" "$noun" "$list")

# Report experiments that have not reached a concluded state. An experiment is
# never left silently open (the experiment-runs-on-its-own-branch rule), but
# nothing otherwise brings an open one to attention: the working directories
# under waytide/ are not read at session start, and an experiment worked in a
# worktree leaves no trace in the main working tree at all — it stays on the
# upstream branch, so even the branch name gives nothing away.
#
# The state is read from the record's canonical "**State:** <state>" line. The
# state words also appear throughout a record's forecast and findings prose, so
# only that line is authoritative; a record without one is still in flight.
experiments=
experiment_count=0

if [ -d waytide/experiments ]; then
  for record in waytide/experiments/*.md; do
    [ -f "$record" ] || continue

    # The line is ordinarily a list item in the record's Setup block, so an
    # optional leading dash is allowed.
    state=$(
      sed -n \
        's|^[[:space:]]*-\{0,1\}[[:space:]]*\*\*State:\*\*[[:space:]]*\([A-Za-z]*\).*|\1|p' \
        "$record" |
        tail -1
    )

    case "$state" in
      Affirmed|Refuted|Inconclusive|Abandoned|Superseded)
        continue
        ;;
      Suspended)
        note=suspended
        ;;
      '')
        note='no state recorded'
        ;;
      *)
        note=$state
        ;;
    esac

    name=$(
      basename "$record" .md |
        sed 's|^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}T[0-9]\{2\}-[0-9]\{2\}-[0-9]\{2\}Z-||'
    )

    experiment_count=$((experiment_count + 1))
    experiments="${experiments}${experiments:+, }${name} (${note})"
  done
fi

if [ "$experiment_count" -gt 0 ]; then
  enoun=experiments
  if [ "$experiment_count" = "1" ]; then
    enoun=experiment
  fi

  # A literal backslash-n, so the JSON string carries a line break the harness
  # renders — not an actual newline, which would be invalid inside a JSON string.
  notice="${notice}\\n${experiment_count} ${enoun} open: ${experiments}"
fi

printf '{"systemMessage": "%s"}\n' "$notice"
