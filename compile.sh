#!/bin/sh
# Compile each package's source rules into the rule files the session-start read reads.
#
# Run from the repository root:
#
#   ./compile.sh                 compile each rule's uncompressed text
#   ./compile.sh --compressed    compile each rule's compressed text, where it has one
#
# A source rule is the authority and the only copy edited. Its compiled rule sits at the
# package root under the same name, and is regenerated, never edited. By default the compiled
# rule is the source rule without its Compressed section, its Compression section, its History
# section, and its provenance footer: the --- divider and the Authored by and Changed by lines
# below it. Each section runs from its "## Compressed", "## Compression", or "## History" line
# to the next of the three, the "Related:" line, or the footer.
#
# Told --compressed, a rule that has a Compressed section compiles to its title, the compressed
# text, and its Related list. A rule that has none compiles as it does by default.
set -e

compressed=0
[ "$1" = "--compressed" ] && compressed=1

for source_rule in $(find system -path '*/source/*' -name '*.md' | sort); do
  compiled_rule=$(printf '%s' "$source_rule" | sed 's|/source/|/|')
  mkdir -p "$(dirname "$compiled_rule")"

  awk -v compressed="$compressed" '
    function add(text) { out[++count] = text }

    # The lines of one part, without its own heading and the blank lines at its start and end. The
    # headings within the part are its content, and are kept.
    function add_part(name, skip_heading,    i, first, last) {
      first = 0
      for (i = 1; i < footer; i++) {
        if (kind[i] != name) continue
        if (skip_heading && line[i] == "## Compressed") continue
        if (!first && line[i] == "") continue
        if (!first) first = i
        last = i
      }
      if (!first) return
      while (last > first && line[last] == "") last--
      if (count > 0) add("")
      for (i = first; i <= last; i++) {
        if (kind[i] != name) continue
        if (skip_heading && line[i] == "## Compressed") continue
        add(line[i])
      }
    }

    { line[NR] = $0 }

    END {
      # The footer: the --- divider and the Authored by and Changed by lines below it.
      footer = NR + 1
      for (i = NR; i > 0 && line[i] ~ /^((Authored|Changed) by .*)?$/; i--) footer = i
      if (i > 0 && line[i] == "---") footer = i

      # Each line before the footer is the title, the body, a Compressed, Compression, or History section,
      # or the Related list.
      part = "title"
      for (i = 1; i < footer; i++) {
        if (i > 1 && part == "title") part = "body"
        if (line[i] == "## Compressed") { part = "compressed"; has_compressed = 1 }
        else if (line[i] == "## Compression") part = "compression"
        else if (line[i] == "## History") part = "history"
        else if (line[i] ~ /^Related:/) part = "related"
        kind[i] = part
      }

      count = 0
      if (compressed && has_compressed) {
        add(line[1])
        add_part("compressed", 1)
        add_part("related", 0)
      } else {
        for (i = 1; i < footer; i++)
          if (kind[i] == "title" || kind[i] == "body" || kind[i] == "related") add(line[i])
      }

      while (count > 0 && out[count] == "") count--
      for (i = 1; i <= count; i++) print out[i]
    }
  ' "$source_rule" > "$compiled_rule"
done
