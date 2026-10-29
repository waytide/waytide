# A pair of commands begins and ends a recording

- **State:** Realized
- **Tags:** [idea]

**A pair of commands marks where a recording begins and where it ends.** The engineer types the first to start it and the second to stop it. The candidate words are *begin recording* and *end recording*, or *begin stream* and *end stream*.

**Not yet settled:**

- what is recorded between the two commands, and into which record
- which pair of words the commands take

## Settled

- **2026-10-28** — What is recorded is a stream of ad hoc points. The points are organized once the recording has ended, and not while it runs.
- **2026-10-28** — A stream that has ended can be opened again later, and the recording continues it.
- **2026-10-28** — The commands are *begin recording*, *end recording*, and *resume recording*. *Resume recording* opens a stream that has ended and continues it. *Stream* is not used in a command, because the ETE category for evented systems already holds `stream` as a message stream.
- **2026-10-28** — The commands are *begin collecting*, *end collecting*, and *resume collecting*. This replaces the words in the resolution above. `COLLECT (v)` is approved in the STE dictionary, meaning *to come, or cause to come, together in one location*. `resume (v)` is not approved, and the STE dictionary gives START (v) and CONTINUE (v).
- **2026-10-28** — The points are held in the session while collecting runs, and written once, at *end collecting*. Nothing is written to disk before then.
- **2026-10-28** — At *end collecting*, the engineer is asked whether the points become a new item or are appended to a recent item that is the subject of the conversation. A new item is tagged `[idea]`.
- **2026-10-28** — The agent reframes the points when it writes them, rather than writing them as the engineer said them.
- **2026-10-28** — A resumed collection is organized again when it ends a second time.
- **2026-10-28** — Each point is written as it arrives, to a file outside the repository, under `~/.local/share/waytide/collections/<project>/`. This replaces the resolution that the points are held in the session and written once at the end. The file records the engineer's original points as they were stated. It is not deleted when collecting ends, and the reframed points still go to a new idea or a recent item.
- **2026-10-28** — The reframed version is also written to the collection file, beside the engineer's original points. It still goes to a new idea or a recent item as well.
- **2026-10-28** — The collection file is named with the ISO-8601-UTC datetime prefix, followed, where possible, by a name derived from its content.
- **2026-10-28** — The collection file is named with the datetime prefix alone when it is created. It is renamed once the name is known, which is when the item file is written. Its name then reflects the item file's name.
- **2026-10-28** — The item does not name the collection file it came from.
- **2026-10-28** — When a resumed collection ends, its new reframed version replaces the earlier one in the collection file. The engineer's new words are appended after the earlier ones.
- **2026-10-28** — The collection file is kept out of the repository's record, as a private journal entry is. Nothing about a collection file is logged or committed.

- **2026-10-29** — *Sketch* is a second wording of each command, beside *collect*: *begin sketching*, *end sketching*, and *resume sketching* do what *begin collecting*, *end collecting*, and *resume collecting* do. The item `2026-10-29T19-18-01Z-collect-might-be-brainstorm` settles it.

**Opened by the first two resolutions, and not yet settled:** what the points are organized into, and whether reopening a stream organizes its points again once it ends a second time.

## Amended — 2026-10-28

**Not yet settled, as the engineer raised them:**

- which tag the collected record carries
- whether the points are held as they are collected and reframed by the agent at the end, or written to disk as each one arrives

## History

As the engineer first stated it: "Idea: Command protocol for “begin recording” (or “begin stream”) and “end recording” (or “end stream”)"

On 2026-10-28, to what is recorded: "A stream of ad hoc points that will be organized once recording has ended. The stream can be re-opened later, as well"
On 2026-10-28, offered *begin recording*, *end recording*, and *resume recording* against *begin recording* and *end recording* alone, the engineer selected the first.
On 2026-10-28: "I'm not sure which kind of tag such a recording would get, or if it's collected first and then the agent re-frames, or if it's written right to disk." Then: "Actually, I like begin/end/resume “collecting” better than “recording”"
On 2026-10-28, offered options for how the points are written: "Hold and write at end, but then ask me if it's a new item, or an append to a recent item that is the subject of the conversation. If it's a new item, it's an idea"
On 2026-10-28, to whether the agent reframes the points: "Reframes". To whether a resumed collection is organized again: "Yes"
On 2026-10-28, offered places for the stream to be written: "A file outside the repository, removed at the end (~/.local/share/waytide/collections/<project>/), but the file is not deleted, and the engineer's original ideas are recorded there as well"
On 2026-10-28: "The reframed version should also be written to the collection file"
On 2026-10-28: "The collection file should be named with the standard datetime prefix, and if possible, a title derived from the content"
On 2026-10-28: "The file is named only with the date prefix to begin with, and then renamed once the name is known. The name is known when the item file is written. The collection file name will reflect the item file's name." Then: "The item doesn't name the collection file it came from". Then: "A resume collection's new reframed version replaces the earlier one, but the engineers new words are appended". Then: "The collection file is kept out of the repository's record, just like private journal entries are kept out"

On 2026-10-29: "It will be collect and sketch"

---

Authored by Scott Bellware on Wed Oct 28 2026 at 7:42:44 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 7:51:20 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 9:41:24 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 9:43:44 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 9:49:31 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 9:54:09 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 9:57:12 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 9:59:39 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 10:02:02 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 10:05:01 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 1:18:37 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 1:56:18 PM PT
