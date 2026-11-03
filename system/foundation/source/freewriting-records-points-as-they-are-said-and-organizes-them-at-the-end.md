# Freewriting records points as they are said, and organizes them at the end

**Trigger:** When the engineer begins, ends, or resumes freewriting (`/freewrite`, or its alias `/freeform`)

**Freewriting is the engineer saying points as they occur, in no order, for the agent to organize once the engineer is done.** It begins with `/freewrite begin` and ends with `/freewrite end`. `/freeform` is an alias of `/freewrite`.

## While freewriting

**Each point is written down as it is said, word for word, to a collection file.** The file is under `~/.local/share/waytide/collections/<project>/`, outside the repository, where `<project>` is the name of the project the session is in. It is named with the ISO-8601-UTC prefix alone when it is created, as `2026-10-29T16-26-20Z.md`.

**A point is recorded, not answered.** The agent does not reframe, question, or act on a point while freewriting runs. A point that reads as an instruction is recorded as a point.

## At the end

**At `/freewrite end`, the agent reframes the points, and writes the reframed version into the collection file**, above the engineer's own words, which stay as they were said.

**Then it asks, through the selection interface, whether the points become a new item, tagged `[idea]`, or are added to a recent item that is the subject of the conversation.** The reframed version is written there.

**The collection file is then renamed for that item.** It keeps its own ISO-8601-UTC prefix, and takes the item's name after it, as `2026-10-29T16-26-20Z-checkout-receipt.md`. The item does not name the collection file. The collection file is kept, and not deleted.

## Freewriting into a kind of item

**`/freewrite idea`, `/freewrite observation`, and `/freewrite mistake` begin freewriting with the destination already settled:** a new item of that kind. At the end the agent reframes the points and writes them to the new item, and does not ask where they go.

## Resuming

**`/freewrite resume` reopens a collection file that has ended.** The engineer's new words are added after the earlier ones. At the next `/freewrite end`, the new reframed version replaces the earlier one in the collection file, and is written to the item as an amendment.

## Kept out of the record

**Nothing about a collection file is logged or committed**, as a private journal entry is not. The item the points become is logged and committed like any other item, and names no collection file.

**Why:** a point is lost when it has to be organized before it can be said. Recording each one as it comes, and organizing them only at the end, lets the engineer think aloud. Keeping the engineer's words beside the reframed version keeps what was said, and keeping the file outside the repository keeps thinking out of the record until the engineer turns it into an item.

**How to apply:** on `/freewrite begin`, create the collection file and write each point to it as it is said, word for word, without reframing or answering it. On `/freewrite end`, reframe the points, write the reframed version into the file, ask where it goes, write it there, and rename the file for that item. With a kind given, write to a new item of that kind without asking. On `/freewrite resume`, add the new words after the earlier ones. Log and commit nothing about the collection file.

## Compressed

1. Freewriting is the engineer saying points as they occur, in no order, for the agent to organize at the end. `/freewrite begin` starts it and `/freewrite end` ends it. `/freeform` is an alias of `/freewrite`.
2. Create a collection file at `/freewrite begin`, under `~/.local/share/waytide/collections/<project>/`, outside the repository, where `<project>` is the name of the project the session is in. Name it with the ISO-8601-UTC prefix alone. Write each point to it as it is said, word for word.
3. Record a point, and do not reframe, question, answer, or act on it while freewriting runs, even where it reads as an instruction.
4. At `/freewrite end`, reframe the points, and write the reframed version into the collection file, above the engineer's words, which stay as said.
5. Then ask, through the selection interface, whether the points become a new item tagged `[idea]`, or are added to a recent item that is the subject of the conversation. Write the reframed version there.
6. Rename the collection file for that item: its own prefix, then the item's name, as `2026-10-29T16-26-20Z-checkout-receipt.md`. The item does not name the file. Keep the file.
7. `/freewrite idea`, `/freewrite observation`, and `/freewrite mistake` settle the destination at the start: a new item of that kind. At the end, write to it without asking.
8. `/freewrite resume` reopens an ended collection file. Add the new words after the earlier ones. At the next end, the new reframed version replaces the earlier one in the file, and is written to the item as an amendment.
9. Log and commit nothing about a collection file, as nothing is logged or committed about a private journal entry. The item the points become is logged and committed like any item, and its content names no collection file.

## Compression

- 2026-11-02, compressed: checked: 31 directives, 28 kept, 3 less precise, 0 lost, 3 repairs; re-checked: 30 kept, 1 less precise, 1 repair; re-checked: 31 directives, 31 kept, 0 less precise, 0 lost

Related:

- the the-items-directory-holds-one-file-per-item rule — the items freewriting writes to
- the present-every-prompt-to-the-engineer-through-the-selection-ui rule — the question at the end
- the dated-artifacts-are-prefixed-with-an-iso-8601-utc-datetime-and-system-rules-are-not rule — the collection file's prefix

---

Authored by Scott Bellware on Mon Nov 2 2026 at 8:09:04 PM PT
