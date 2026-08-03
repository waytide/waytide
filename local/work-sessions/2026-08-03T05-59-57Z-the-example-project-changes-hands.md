# Session — The example project changes hands, and the replay becomes a projection (Sun Aug 2 2026 22:59)

Continues `2026-08-03T05-31-33Z-two-directories-recognized-and-the-first-suspension.md`, which
closed on the phase-B runbook being suspended. This is a short stretch and entirely design work:
the example project moved from a project that would have to be built to one that already exists,
and then the way that project is presented was settled as a **projection** rather than a replay
of its records.

*This is the communicable record — the guided tour. It is not the source of truth. The durable
records are the designs under `local/design/`, the decision log under `local/log/`, and the rules
under `system/`.*

## 1. The reconciliation that followed the last record

The prompt fired as the convention requires, and found the **feature-capability design stale a
second time** — for the second consecutive session record.

Three things in it had become false, all from work done after the previous record: the working
location said **two** options where there are now three; a 2026-07-26 resolution said the choice
is put *"as with an experiment"*, which the current-branch option broke, since an experiment
never gets it; and the design said nothing about the **gating cadence**, now a second choice at
the same initiation.

Reconciled the way the first reconciliation was: the false statements corrected in the body,
the superseded clause **struck and dated** rather than rewritten, and two new dated resolutions
added. What was settled on 2026-07-26 stays legible beside what is true now.

## 2. The example project changes hands

**`constant` replaces the Upload example project.** The Upload design was suspended, not
discarded — it went into `local/suspended/` with its return address, the second use of that
directory.

The argument for the change: the Upload project would have been built **in order to**
demonstrate — artifacts produced by someone who knew they were the point, on a domain chosen for
legibility. `constant` was built to be a library; its records exist because the conventions
require them. That makes them **evidence rather than illustration**, and a reader asking whether
the method is actually run has an answer that does not depend on trusting the example.

It also reaches two things a purpose-built example never would: a **published gem** at
`evt-constant` 2.2.0.0, exercising the versioning and release conventions, and **three local
rules of its own**, showing a project extending the system rather than only consuming it.

**One scope note, recorded in both files:** suspending the design does **not** retire the
`Upload` domain from the rules. Eleven files in `testing` and `code/ruby` illustrate with it, and
they are unaffected. What was suspended is the plan to build a project around it.

**The suspension's resumption note** names what would bring the Upload design back: a decision
that the example must be built fresh under the current conventions end to end, which is the one
thing `constant` cannot offer.

## 3. The replay is a projection

Then the presentation was settled, and it changed the argument above.

**`constant`'s logs are not taken literally.** An **idealized log** is generated from them, the
Waytide cycles and steps are synthesized from that, and the demonstrative replay is a
**projection** — the term the decision-log convention already uses for a summary that "reads the
record without destroying it". From the projection a website script is sequenced, and then
generated.

**What it dissolves.** The literal reading had `constant`'s records showing the method **as it
was**: its six features were begun before the gating cadence, the current-branch working
location, and the *pass* → *cycle* rename existed. A synthesized log is free to show the method
**as it is**.

**What it costs**, and this is the part worth keeping in view — the evidence property is one step
removed. The three positions, as the design now states them:

| | grounded in | shows the method |
|---|---|---|
| the Upload project | nothing yet built | as it is |
| `constant`, read literally | work that happened | as it was |
| `constant`, projected | work that happened | as it is |

A **demonstration grounded in evidence**: better than either of the first two, and not evidence.

**Two constraints follow, both settled.** The replay **must not present as a transcript** — not
called a session, a recording, or a transcript, with what it derives from reachable, because
presenting as one claims the property it gave up. And the records are **not back-edited** to suit
it: a projection is derived from a record, and changing the record to fit destroys what makes the
projection worth anything.

**And it bears on the self-explanation design's open question.** That design had two candidates
for what the chat and the website share as a source — the rules, or a written corpus. A
projection is a **third**: derived rather than authored, regenerable rather than maintained,
which is precisely what a written corpus cannot be and why it drifts. Recorded there as a
candidate; whether it is the source for the whole site or only the home page is open.

## Takeaways

- **The reconciliation prompt has now found divergence twice running**, in the same design, both
  times from work done between records. Its value is not theoretical.
- **Suspension is doing what it was built for.** The Upload design was set aside intact, with the
  condition for its return stated, rather than being deleted or argued away.
- **Naming the presentation changed the argument for the project.** "Evidence rather than
  illustration" was the reason `constant` replaced Upload, and projecting it gives part of that
  back. Stating the three positions in a table was the only way to keep the trade visible rather
  than letting the better-sounding claim survive.
- **The honesty question is now the open one.** What "idealized" is allowed to change decides
  whether the projection is trustworthy — compressing a long cycle, omitting a false start, and
  inventing a decision nobody made are not the same act.

## Glossary

- **idealized log** — a log generated from a project's real records, from which the Waytide
  cycles and steps are synthesized. Not the record itself, and not a transcript of one.
- **projection** — a derived artifact that reads a record without destroying or replacing it. The
  decision-log convention's term, applied here to the replay.
- **demonstration grounded in evidence** — what the projected replay is: real underlying work,
  idealized presentation. Distinct from a demonstration built to demonstrate, and from evidence.

## Where the durable records live

- **New design** — `2026-08-03T05-40-22Z-the-constant-example-project.md`.
- **Suspended** — the Upload example project design, with its return address and resumption
  condition, third entry in `local/suspended/`.
- **Changed designs** — the feature-capability design, reconciled a second time; the
  self-explanation design, which gained the projection as a third source candidate and had its
  example-project reference re-pointed.
- **The deferred queue** — empty.

---

# Continued — the website is not the chat (Sun Aug 2 2026 23:12)

Appended after the record above. One correction, and it was to something this record's own
session had introduced.

## 4. The design is not ready for planning

Stated plainly, and the design says as much about itself — its premise opens by saying most of
it is not settled. The blocker is the **source question**: what the chat draws on, what the
website is generated from, whether a written corpus exists and which package holds it, and how
the site is produced are one question wearing four hats. A plan written before it is answered
would sequence work whose shape is unknown.

Two other things are open and are the developer's rather than the agent's: the **interaction
design parameters**, which the design records as given rather than inferred, and what
**"idealized" is allowed to change** in the projection.

No action taken. Recorded here because the assessment is a real state of the design and would
otherwise exist only in the conversation.

## 5. The website is not itself an interactive chat

A correction to an inconsistency this session introduced. The design had already settled that
**a website cannot be a chat, so what the two surfaces share is a source** — and the home-page
section was then written as though the page **were** the chat, with "the chat is the page; there
is no landing copy above it."

Both wrong. **The website's chat is a content and style element** — a rendered scroll of a
synthesized session, not something a reader converses with. The interactive chat is the other
surface: the agent, in a developer's own project. The page is a **top header and a short hero
image, with the chat below**, scrolling into view and continuing through the synthesized
`constant` session.

**And a word was withdrawn.** "Backplane" had been used for the chat's place on the page and was
used incorrectly; it is out of the design, along with the open question it had raised about
whether anything is layered over the chat. That question existed only because of the word.

## Takeaway from the continuation

- **A design can contradict itself between sections.** The source-versus-output distinction was
  settled in one section and violated three sections later, in the same document, in the same
  session. Nothing catches that but reading it.

---

Authored by Scott Bellware on Sun Aug 2 2026 at 10:59:57 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 11:12:47 PM PT
