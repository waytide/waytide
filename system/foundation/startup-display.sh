#!/bin/sh
# Print the Waytide startup display when the engineer types load waytide, or /load, its skill.
#
# Run by the harness as a UserPromptSubmit hook, not by the agent. The harness sends the
# prompt as JSON on standard input, and renders the systemMessage this prints as its own
# message, so the display does not depend on the agent following an instruction.
#
# The display is read from the the-startup-display-prints-as-the-session-starts's fenced blocks — the title, the copyright
# and license, the loading line, and the figure — so the rule stays the one copy of it. The
# package-set example block is skipped: the agent prints the package set, in markdown.
#
# The display never disrupts a prompt: any problem exits quietly with no output.
#
# Invocation:
#
#   printf '{"prompt":"load waytide"}' | waytide/system/foundation/startup-display.sh
#   waytide/system/foundation/startup-display.sh message
#
# Nobody types that. It is wired into .claude/settings.json as the UserPromptSubmit hook
# command, and the harness runs it on every prompt. The line is recorded because a script whose
# invocation is not written down is one nobody can reproduce when the wiring breaks.

# Never let the display break a prompt.
set +e

# Locate the system: waytide/system/ in a consuming project, system/ in the Waytide authoring
# source. Checked in that order — a consuming project may have a system/ directory of its own.
if [ -d waytide/system ]; then
  system=waytide/system
elif [ -d system ] && [ -d system/foundation ]; then
  system=system
else
  exit 0
fi

# The source rule, since the compiled rules are one file per package. Only its body is read, up to
# its Compressed section, whose fenced blocks would shift the count below.
rule=$system/foundation/source/the-startup-display-prints-as-the-session-starts.md
[ -f "$rule" ] || exit 0

# Given message, the display is printed alone, as the systemMessage carries it, for
# session-start.sh to put ahead of the notice. No prompt is read.
if [ "$1" != "message" ]; then
  # Only the exact command, or /load, its skill, typed bare or in the plugin's namespace. The
  # closing quote is what makes the match exact.
  case "$(cat)" in
    *'"prompt":"load waytide"'*|*'"prompt": "load waytide"'*) ;;
    *'"prompt":"/load"'*|*'"prompt": "/load"'*) ;;
    *'"prompt":"/slasher:load"'*|*'"prompt": "/slasher:load"'*) ;;
    *) exit 0 ;;
  esac
fi

# Fenced blocks 1, 3, 4, and 5, with one blank line between them. Block 2 is the package-set
# example, which the agent prints.
display=$(awk '
  /^## Compressed$/ { exit }
  /^```/ {
    if (inside) { inside = 0; next }
    inside = 1; block++
    if (block != 2 && shown) print ""
    next
  }
  inside && block != 2 { print; shown = 1 }
' "$rule")

[ -n "$display" ] || exit 0

# The harness renders a systemMessage as plain text, so a line wrapped in markdown emphasis
# loses its asterisks rather than showing them. Then backslashes and double quotes are escaped
# and the lines joined with a literal backslash-n, which is what a JSON string can carry.
# The message opens with a backslash-n too: the harness prints its own label ahead of a
# systemMessage, and the line break puts the title on a line of its own.
escaped=$(printf '%s\n' "$display" |
  sed 's/^\*\(.*\)\*$/\1/' |
  sed 's/\\/\\\\/g; s/"/\\"/g' |
  awk 'BEGIN { ORS = "" } { print "\\n" } { print }')

if [ "$1" = "message" ]; then
  printf '%s\n' "$escaped"
  exit 0
fi

printf '{"systemMessage": "%s"}\n' "$escaped"
