#!/bin/sh
# Measure the session-start read in Claude Code session transcripts.
#
# Usage:
#
#   ./measure-session-start-read.sh <transcript.jsonl> [<transcript.jsonl> ...]
#
# A transcript is ~/.claude/projects/<project>/<session-id>.jsonl. For each one, the read runs
# from the engineer's load waytide message to the last assistant entry before their next
# message. The script reports that span's duration and its tool calls, then the median and the
# range across the transcripts given.
#
# A disposable measurement tool for the derived-rule-files experiment, written directly and not
# designed through the hinges. Its numbers are checked against one transcript by hand. It reads
# Claude Code's working state, which is not a documented interface, so an update can break it.
set -e

[ $# -gt 0 ] || { echo "Usage: ./measure-session-start-read.sh <transcript.jsonl> ..." >&2; exit 1; }

python3 -I - "$@" <<'PYTHON'
import json, sys
from datetime import datetime

def parse(stamp):
    return datetime.fromisoformat(stamp.replace("Z", "+00:00"))

def prompt(entry):
    message = entry.get("message") or {}
    content = message.get("content")
    if entry.get("type") == "user" and isinstance(content, str):
        return content.strip()
    return None

durations, calls = [], []

for path in sys.argv[1:]:
    entries = []
    for line in open(path):
        try:
            entries.append(json.loads(line))
        except ValueError:
            pass

    start = end = model = None
    count = 0
    for entry in entries:
        text = prompt(entry)
        if start is None:
            if text == "load waytide":
                start = entry["timestamp"]
            continue
        if text is not None:
            break
        if entry.get("type") == "assistant":
            end = entry["timestamp"]
            model = (entry.get("message") or {}).get("model")
            content = (entry.get("message") or {}).get("content")
            if isinstance(content, list):
                count += sum(1 for block in content if block.get("type") == "tool_use")

    name = path.rsplit("/", 1)[-1][:8]
    if start is None or end is None:
        print(f"{name}  no load waytide read found")
        continue

    seconds = (parse(end) - parse(start)).total_seconds()
    durations.append(seconds)
    calls.append(count)
    print(f"{name}  {model}  {start}  {seconds:6.1f} s  {count:3d} tool calls")

def median(values):
    ordered = sorted(values)
    middle = len(ordered) // 2
    return ordered[middle] if len(ordered) % 2 else (ordered[middle - 1] + ordered[middle]) / 2

if len(durations) > 1:
    print(f"median    {median(durations):6.1f} s  {median(calls):5.1f} tool calls")
    print(f"range     {min(durations):.1f}–{max(durations):.1f} s  {min(calls)}–{max(calls)} tool calls")
PYTHON
