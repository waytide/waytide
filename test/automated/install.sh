#!/bin/sh
# Usage:
#
#   test/automated/install.sh
#
# Run from the repository root.
set -e

fail() {
  echo "$1"
  shift
  for line in "$@"; do echo "  $line"; done
  echo "1 failed, 0 aborted"
  exit 1
}

# Controls -------------------------------------------------------------------

project=$(mktemp -d)
trap 'rm -rf "$project"' EXIT
installer="$(pwd)/system/foundation/install.sh"

# Each text is read from a function rather than a heredoc inside $(…): macOS /bin/sh joins a line
# ending in a backslash to the next one there.
control_no_kind_text() {
  cat <<'ITEM'
# Some item

- **State:** Open

Some text.
ITEM
}

control_no_kind_expected_text() {
  cat <<'ITEM'
# Some item

- **State:** Open
- **Tags:** [idea]

Some text.
ITEM
}

control_other_tag_text() {
  cat <<'ITEM'
# Some other item

- **State:** Open
- **Tags:** [deferred]

Some text.
ITEM
}

control_design_text() {
  cat <<'ITEM'
# Some design

- **State:** Active
- **Tags:** [design]

Some text.
ITEM
}

control_skill_text() {
  cat <<'SKILL'
---
name: some-command
description: Some description.
---

Some text.
SKILL
}

control_help_text() {
  cat <<'HELP'
Some help.
HELP
}

control_manifest_text() {
  cat <<'MANIFEST'
{
  "name": "slasher",
  "displayName": "Slasher",
  "description": "The Slasher commands"
}
MANIFEST
}

control_settings_text() {
  cat <<'SETTINGS'
{
  "statusLine": {
    "type": "command",
    "command": "waytide/system/foundation/statusline.sh"
  }
}
SETTINGS
}

control_no_kind_name=2026-01-01T00-00-00Z-some-item-OPEN.md
control_other_tag_name=2026-01-01T00-00-01Z-some-other-item-OPEN.md
control_design_name=2026-01-01T00-00-02Z-some-design-ACTIVE.md

mkdir -p "$project/waytide/local/ideas"
control_no_kind_text > "$project/waytide/local/ideas/$control_no_kind_name"
control_other_tag_text > "$project/waytide/local/ideas/$control_other_tag_name"
control_design_text > "$project/waytide/local/ideas/$control_design_name"

mkdir -p "$project/waytide/system/foundation"
cp -R system/foundation/plugin "$project/waytide/system/foundation/"

control_skill_dir="$project/waytide/system/some-package/skills/some-command"
mkdir -p "$control_skill_dir"
control_skill_text > "$control_skill_dir/SKILL.md"
control_help_text > "$control_skill_dir/help.md"

control_deactivated_skill_dir="$project/waytide/system/some-other-package/skills/some-other-command"
mkdir -p "$control_deactivated_skill_dir"
control_skill_text > "$control_deactivated_skill_dir/SKILL.md"

cat > "$project/waytide/local/2026-01-01T00-00-03Z-some-package-set.md" <<'DECLARATION'
- **Package set:** some-package
- **Packages:** some-package
- **Inactive:** some-other-package
DECLARATION

# Actuation ------------------------------------------------------------------

(cd "$project" && sh "$installer" agents-md) > /dev/null

# Moves ideas to items ------------------------------------------------------

item="$project/waytide/local/items/$control_no_kind_name"
ideas_dir="$project/waytide/local/ideas"

[ -f "$item" ] || fail "Moves ideas to items" "not in items/:" "$control_no_kind_name"
[ ! -e "$ideas_dir" ] || fail "Moves ideas to items" "ideas/ is still present"

# Tags an item without a tag as an idea -----------------------------------

no_kind_item=$(cat "$project/waytide/local/items/$control_no_kind_name")
other_tag_item=$(cat "$project/waytide/local/items/$control_other_tag_name")
design_item=$(cat "$project/waytide/local/items/$control_design_name")

[ "$no_kind_item" = "$(control_no_kind_expected_text)" ] || fail "Tags an item without a tag as an idea" "found:" "$no_kind_item"
[ "$other_tag_item" = "$(control_other_tag_text)" ] || fail "Tags an item without a tag as an idea" "found:" "$other_tag_item"
[ "$design_item" = "$(control_design_text)" ] || fail "Tags an item without a tag as an idea" "found:" "$design_item"

# Places a package's skills in the plugin -------------------------------------

skill=$(cat "$project/.claude/skills/slasher/skills/some-command/SKILL.md" 2>/dev/null || true)
help=$(cat "$project/.claude/skills/slasher/skills/some-command/help.md" 2>/dev/null || true)

[ "$skill" = "$(control_skill_text)" ] || fail "Places a package's skills in the plugin" "SKILL.md found:" "$skill"
[ "$help" = "$(control_help_text)" ] || fail "Places a package's skills in the plugin" "help.md found:" "$help"

# Names the plugin slasher ----------------------------------------------------

manifest=$(cat "$project/.claude/skills/slasher/.claude-plugin/plugin.json" 2>/dev/null || true)

[ "$manifest" = "$(control_manifest_text)" ] || fail "Names the plugin slasher" "plugin.json found:" "$manifest"

# Leaves out a deactivated package's skills ------------------------------------

deactivated_skill="$project/.claude/skills/slasher/skills/some-other-command"

[ ! -e "$deactivated_skill" ] || fail "Leaves out a deactivated package's skills" "present:" "some-other-command"

# Carries the session-start hooks in the plugin ----------------------------------

hooks=$(cat "$project/.claude/skills/slasher/hooks/hooks.json" 2>/dev/null || true)
control_hooks=$(cat system/foundation/plugin/hooks/hooks.json)

[ "$hooks" = "$control_hooks" ] || fail "Carries the session-start hooks in the plugin" "hooks.json found:" "$hooks"

# Places a settings.json carrying only the status line ---------------------------

settings=$(cat "$project/.claude/settings.json" 2>/dev/null || true)

[ "$settings" = "$(control_settings_text)" ] || fail "Places a settings.json carrying only the status line" "settings.json found:" "$settings"

# Writes every skill's help, in the help order, under the header -------------------

full_help=$(cat "$project/.claude/skills/slasher/help.md" 2>/dev/null || true)
control_full_help="$(cat system/foundation/plugin/help-header.md)

$(control_help_text)"

[ "$full_help" = "$control_full_help" ] || fail "Writes every skill's help, in the help order, under the header" "help.md found:" "$full_help"

echo "0 failed, 0 aborted"
