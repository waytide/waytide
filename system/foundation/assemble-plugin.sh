#!/bin/sh
# Assemble the Slasher plugin, named slasher, in .claude/skills/slasher/.
#
# Run from the project root:
#
#   slasher/system/foundation/assemble-plugin.sh     in a consuming project
#   system/foundation/assemble-plugin.sh             in the Waytide authoring source
#
# install.sh runs it in a consuming project, and compile.sh runs it in the authoring source.
#
# The plugin is foundation's plugin/ directory, which holds its manifest and its session-start
# hooks, with each active package's skills under skills/, each as skills/<command>/ in its package.
# The plugin is assembled, never edited: a skill is changed in its package, so the directory is
# rebuilt whole each time and nothing in it is kept.
set -e

# Locate the system and the project's own directory: slasher/ in a consuming project, the root
# in the Waytide authoring source. Checked in that order — a consuming project may have a
# system/ directory of its own.
if [ -d slasher/system ]; then
  system=slasher/system
  local=slasher/local
else
  system=system
  local=local
fi

plugin=.claude/skills/slasher

[ -d "$system/foundation/plugin" ] || exit 0

# A deactivated package's skills go with it. The packages are read from the latest package set's
# Inactive line, as load-rules.sh reads them.
declaration=$(ls "$local"/*-package-set.md 2>/dev/null | sort | tail -1)
deactivated=
if [ -n "$declaration" ]; then
  deactivated=$(sed -n 's|^[[:space:]]*-\{0,1\}[[:space:]]*\*\*Inactive:\*\*[[:space:]]*\(.*\)$|\1|p' "$declaration" |
    head -1 | tr ',' '\n' | sed 's/^[[:space:]]*//; s/[[:space:]]*$//' | grep -v '^none$' || true)
fi

rm -rf "$plugin"
mkdir -p .claude/skills
cp -R "$system/foundation/plugin" "$plugin"

for skill in "$system"/*/skills/*/; do
  [ -f "${skill}SKILL.md" ] || continue
  package=${skill#"$system"/}
  package=${package%%/*}
  if printf '%s\n' "$deactivated" | grep -qx "$package"; then
    continue
  fi
  mkdir -p "$plugin/skills"
  cp -R "${skill%/}" "$plugin/skills/"
done

# The full help a bare /slasher prints: the header, then each skill's help in the order
# help-order lists, then any skill the list does not name, in name order. An alias carries no
# help.md of its own, so it adds nothing. The header and the list are what the help is built
# from, not part of the plugin, so they are removed once it is written.
if [ -f "$plugin/help-header.md" ] && [ -f "$plugin/help-order" ]; then
  {
    cat "$plugin/help-header.md"
    listed=" "
    while IFS= read -r name; do
      [ -n "$name" ] || continue
      listed="$listed$name "
      [ -f "$plugin/skills/$name/help.md" ] || continue
      echo
      cat "$plugin/skills/$name/help.md"
    done < "$plugin/help-order"
    for help in "$plugin"/skills/*/help.md; do
      [ -f "$help" ] || continue
      name=${help%/help.md}
      name=${name##*/}
      case "$listed" in *" $name "*) continue ;; esac
      echo
      cat "$help"
    done
  } > "$plugin/help.md"
  rm -f "$plugin/help-header.md" "$plugin/help-order"
fi
