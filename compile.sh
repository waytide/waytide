#!/bin/sh
# Compile each package's source rules into the one rules file per package the session-start read
# reads.
#
# Run from the repository root:
#
#   ./compile.sh
#
# A source rule is the authority and the only copy edited. Each package's rules file,
# system/<package>/rules-pre-loaded.md, is regenerated, never edited. It holds every source rule under the
# package's source/ directory that has no trigger, in path order. Each rule appears as its title, a Source: line
# giving the path of the source rule it came from, and its compressed text: the Compressed
# section without its heading. A rule that has no Compressed section appears with its body in
# its place. A rule whose source carries a **Trigger:** line under its title goes instead to the
# package's rules-on-demand.md, with a Trigger: line after its Source: line. A package with no triggered
# rule has no rules-on-demand.md.
#
# A source rule's body runs from its title to its first "## Compressed", "## Compression", or
# "## History" line, its "Related:" line, or its provenance footer: the --- divider and the
# Authored by and Changed by lines below it. Its Compressed section runs from its "## Compressed"
# line to the next of those. Neither the Compression and History sections, the Related list, nor
# the footer appears in the rules file.
set -e

for package in system/*/; do
  package=${package%/}
  [ -d "$package/source" ] || continue

  : > "$package/rules-pre-loaded.md"
  : > "$package/rules-on-demand.md"

  for source_rule in $(find "$package/source" -name '*.md' | sort); do
    # A rule with a **Trigger:** line goes to rules-on-demand.md, with its trigger. Every other rule goes
    # to rules-pre-loaded.md.
    trigger=$(sed -n 's/^\*\*Trigger:\*\* //p' "$source_rule" | head -n 1)
    if [ -n "$trigger" ]; then rules_file="$package/rules-on-demand.md"; else rules_file="$package/rules-pre-loaded.md"; fi
    [ -s "$rules_file" ] && echo >> "$rules_file"

    awk -v source="$source_rule" -v trigger="$trigger" '
      { line[NR] = $0 }

      END {
        # The footer: the --- divider and the Authored by and Changed by lines below it.
        footer = NR + 1
        for (i = NR; i > 0 && line[i] ~ /^((Authored|Changed) by .*)?$/; i--) footer = i
        if (i > 0 && line[i] == "---") footer = i

        # Each line before the footer is the title, the body, a Compressed, Compression, or History
        # section, or the Related list.
        part = "title"
        for (i = 1; i < footer; i++) {
          if (i > 1 && part == "title") part = "body"
          if (line[i] == "## Compressed") { part = "compressed"; has_compressed = 1; kind[i] = "heading"; continue }
          else if (line[i] == "## Compression") part = "compression"
          else if (line[i] == "## History") part = "history"
          else if (line[i] ~ /^Related:/) part = "related"
          kind[i] = part
        }

        text = has_compressed ? "compressed" : "body"
        first = 0
        for (i = 1; i < footer; i++) {
          if (kind[i] != text) continue
          if (!first && line[i] == "") continue
          if (!first) first = i
          last = i
        }
        while (last > first && line[last] == "") last--

        print line[1]
        print ""
        print "Source: " source
        if (trigger != "") { print ""; print "Trigger: " trigger }
        if (first) {
          print ""
          for (i = first; i <= last; i++) if (kind[i] == text) print line[i]
        }
      }
    ' "$source_rule" >> "$rules_file"
  done

  [ -s "$package/rules-on-demand.md" ] || rm -f "$package/rules-on-demand.md"
done
