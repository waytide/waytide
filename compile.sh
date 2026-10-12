#!/bin/sh
# Compile each package's source rules into the rule files the session-start read reads.
#
# Run from the repository root:
#
#   ./compile.sh
#
# A source rule is the authority and the only copy edited. Its compiled rule sits at the
# package root under the same name, and is regenerated, never edited. This cut removes the
# provenance footer: the --- divider and the Authored by and Changed by lines below it.
set -e

for source_rule in $(find system -path '*/source/*' -name '*.md' | sort); do
  compiled_rule=$(printf '%s' "$source_rule" | sed 's|/source/|/|')
  mkdir -p "$(dirname "$compiled_rule")"

  awk '
    { line[NR] = $0 }
    END {
      end = NR
      while (end > 0 && line[end] ~ /^((Authored|Changed) by .*)?$/) end--
      if (end > 0 && line[end] == "---") end--
      while (end > 0 && line[end] == "") end--
      for (i = 1; i <= end; i++) print line[i]
    }
  ' "$source_rule" > "$compiled_rule"
done
