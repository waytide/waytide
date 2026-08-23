#!/bin/sh
# Does the harness render ANSI escape sequences in the session-start notice?
#
# Usage:
#
#   Wire it as a second SessionStart hook in .claude/settings.json, beside
#   system/foundation/session-start.sh, then restart Claude and read what prints.
#
# It cannot be run to a verdict from a terminal. The question is what the *harness* does
# with the bytes, and the harness only runs this at the start of a session. Running it by
# hand shows the JSON it emits, which is a different thing and is worth seeing — the JSON
# is checked by test/automated/ansi-notice-encoding.sh, which proves everything up to the
# harness boundary and nothing past it.
#
# Why the question exists. The notice is a systemMessage and the harness displays it as
# plain text. It carried markdown asterisks until 2026-07-28 and they reached the engineer
# literally, drawing the eye to punctuation — see the emphasis comment in session-start.sh.
# ANSI is a different mechanism and has never been tried here. A package set names some
# installed packages as active and leaves the rest deactivated, and the notice is to list
# every one of them with the active ones emphasized. Whether that emphasis is available
# decides the notice's form.
#
# Three outcomes, and the engineer reads which one happened:
#
#   Rendered   the labelled words show as weight, and no escape codes are visible.
#              The emphasis stands as designed.
#   Literal    bracket-and-letter sequences are visible in the text. Worse than plain,
#              and a plain-text distinction replaces the emphasis.
#   Stripped   every word looks the same and no codes are visible. Same conclusion as
#              literal, with a tidier failure.
#
# Remove the wiring when the result is read. This prints a second notice at every session
# start until it is unwired.
set +e

# The escape is written as a six-character JSON escape rather than as a raw escape byte.
# The notice is interpolated into a JSON string by printf with no escaping at all, and JSON
# forbids an unescaped control character in a string — a raw 0x1B would make the whole
# object unparseable and the notice would vanish with no error, which is the same hazard
# the double-quote comment in session-start.sh records.
#
# It is assembled from a backslash held in its own variable rather than written out whole.
# bash's printf interprets a lowercase-u escape in a *format* string and would turn the
# written form into the raw byte this is avoiding, so the sequence never appears anywhere
# printf could read it as format. Every one of these reaches the output through %s.
backslash='\'
esc="${backslash}u001b"
bold="${esc}[1m"
italic="${esc}[3m"
dim="${esc}[2m"
off="${esc}[0m"

newline="${backslash}n"
blank="${newline}${newline}"

# Two parts, and both are wanted. The swatches answer which sequences survive, and dim is
# there beside bold and italic because italic is the likeliest of the three to be dropped —
# a terminal may not carry the face — and dim is the fallback if it is. The specimen shows
# the notice as it would actually print, because a row of short swatches can render while
# the real line is unreadable at its actual length.
swatches=$(printf '%sbold%s   %sitalic%s   %sdim%s   plain' \
  "$bold" "$off" "$italic" "$off" "$dim" "$off")

specimen=$(printf 'package set: content%s8 packages: %sdesign-by-efferent%s, %sfoundation%s, %sgit%s, %sjournal%s, %slanguage%s, %stesting%s, %sversioning%s%s%son%s  %soff%s' \
  "$newline" \
  "$italic" "$off" "$bold" "$off" "$bold" "$off" "$bold" "$off" \
  "$bold" "$off" "$italic" "$off" "$bold" "$off" \
  "$blank" "$bold" "$off" "$italic" "$off")

notice=$(printf 'ANSI probe — are the two blocks below shown as weight, or are the escape codes visible?%s%s%s%s%sRemove this hook from .claude/settings.json when the answer is read.' \
  "$blank" "$swatches" "$blank" "$specimen" "$blank")

printf '{"systemMessage": "%s"}\n' "$notice"
