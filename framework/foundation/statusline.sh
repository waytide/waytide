#!/bin/sh
# Render the status line, carrying a persistent Waytide load indicator.
#
# Run by the harness as its statusLine command — see the
# announce-waytide-at-session-start rule. Where the SessionStart notice marks
# the moment the framework loaded, this keeps the fact on screen for the whole
# session, outside the conversation.
#
# Because a project-level statusLine replaces whatever status line the developer
# configured for themselves, this renders the working directory and git branch
# too, so adopting it takes nothing away.

set +e

# The harness sends session context as JSON on stdin. Nothing here needs it, but
# it is consumed so the harness never writes into a closed pipe.
cat >/dev/null 2>&1

directory=$(basename "$PWD" 2>/dev/null)
branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

# Locate the framework, as the session-start notice does.
if [ -d waytide/framework ]; then
  framework=waytide/framework
elif [ -d framework ] && [ -d framework/foundation ]; then
  framework=framework
else
  framework=
fi

waytide=
if [ -n "$framework" ] && [ -z "$WAYTIDE_QUIET" ]; then
  count=$(
    cd "$framework" 2>/dev/null &&
      find . -mindepth 2 -maxdepth 3 -name README.md 2>/dev/null | wc -l | tr -d ' '
  )
  if [ -n "$count" ] && [ "$count" != "0" ]; then
    noun=packages
    if [ "$count" = "1" ]; then
      noun=package
    fi
    waytide="- Waytide framework active ($count $noun)"
  fi
fi

# The directory and branch lead, separated by a middle dot; the Waytide segment
# trails after a hyphen, so the developer's own orientation comes first and the
# framework indicator reads as an annotation on it.
line=
for segment in "$directory" "$branch"; do
  if [ -n "$segment" ]; then
    if [ -z "$line" ]; then
      line="$segment"
    else
      line="$line · $segment"
    fi
  fi
done

if [ -n "$waytide" ]; then
  if [ -z "$line" ]; then
    line="$waytide"
  else
    line="$line $waytide"
  fi
fi

printf '%s\n' "$line"
