# Conform Waytide's vocabulary to STE, and declare the terms that stay as technical nouns and technical verbs

Every Waytide vocabulary term was checked against the ASD-STE100 Issue 9 dictionary on 2026-08-08.
The STE dictionary holds 1,898 entries. This item carries the two lists that check produced.

- **Waits for:** a decision to adopt ASD-STE100 in any part. The Simplified Technical English
  experiment tests that. Nothing here is applied before it concludes.

## How a word was classified

The STE dictionary writes an approved word in capitals. It writes a word that is not approved in lower case,
with the approved word that replaces it. A word can also be absent.

1. **Approved.** Use it as the STE dictionary's part of speech, with the STE dictionary's meaning.
2. **Not approved.** The STE dictionary names a replacement.
3. **Absent.** STE Rule 1.1 permits it only as a technical noun or a technical verb.

## Terms to replace with an approved word

These terms are not approved, and an approved word carries the same meaning.

| Waytide term | Replace with | Reason |
|---|---|---|
| `initiate` | **START** | The STE dictionary names START. Waytide uses `initiate` for beginning work. |
| `impact` | **EFFECT** | The STE dictionary names HIT, which is wrong here. EFFECT is approved as a noun and says what Waytide means. |
| `convey` | **MOVE** | The STE dictionary names MOVE. Waytide's `convey` is a value passed through layers. |
| `protect` | **PREVENT** | The STE dictionary names PREVENT. A test prevents a regression. |
| `scenario` | **CONDITION** | `scenario` is absent. `case` is not approved and CONDITION replaces it. |

**These Waytide terms are already approved and do not change:** `examine`, `increment`, `cycle`,
`loop`, `mechanical`, `name`, `activate`, `install packages`, `out of scope`, `work session
record`.

## Terms Waytide declares as technical nouns and technical verbs

**All of these fit category 19, Computer science, information and communication technology.** The
category's own examples include AI, large language model, machine learning, and prompt
engineering. STE Rule 1.5 permits a technical noun in a category. STE Rule 1.12 permits a technical verb in
a category. STE Rule 1.8 requires the terms to be approved in the company or subject field, which each
package's `vocabulary.md` already does.

| Term | Part of speech | Package | In the STE dictionary |
|---|---|---|---|
| `efferent` | noun, adjective | language, design-by-efferent | absent |
| `actuation` | noun | language, design-by-efferent | not approved, replaced by OPERATION |
| `solubility` | noun | language, design-by-efferent | absent |
| `hinge` | noun | design-by-efferent | not approved, replaced by TURN |
| `cradle` | noun | design-by-efferent | absent |
| `mean-bias` | noun | design-by-efferent | absent |
| `origination` | noun | design-by-efferent | absent |
| `deliberation` | noun | design-by-efferent | absent |
| `observation` | noun | design-by-efferent | absent |
| `attended`, `unattended` | adjective | design-by-efferent | absent |
| `subtle`, `load-bearing` | adjective | design-by-efferent | absent |
| `Design By Efferent` | noun | design-by-efferent | the method's name |
| `controls` | noun | testing | absent |
| `precondition` | noun | testing | absent |
| `verified` | adjective | testing | absent. `verify` is not approved, replaced by MAKE SURE |
| `deferred`, `suspended` | adjective | foundation | absent |
| `projection` | noun | foundation | absent |
| `reconcile` | verb | foundation | absent |
| `working-state artifact` | noun | foundation | absent |
| `recognizable-content line` | noun | foundation | absent |
| `product generation` | noun | versioning | not approved, no replacement given |
| `mediates` | verb | language | absent. A technical verb under STE Rule 1.12 |
| `normal path` | noun | language | `path` is absent. The pair is one technical noun |

## Four terms neither table settles

1. **`Observe`, `Orient`, `Decide`, `Act`.** None of the four is approved. The STE dictionary replaces them
   with MONITOR, POINT, and SELECT, and gives no replacement for `act`. They are Boyd's OODA
   phases, quoted from another author. A technical noun category does not obviously hold a phase
   name. **OODA mode's own artifact names, `orientation` and `action`, rest on these words.**
2. **`gate`.** The design-by-efferent vocabulary uses `gate` as a noun and as a verb, and states
   both: *Verb: the loop gates at hinges.* **STE Rule 1.7 forbids a technical noun used as a verb. Rule
   1.13 forbids a technical verb used as a noun.** One of the two uses must change.
3. **`verified`.** The testing vocabulary requires `verified` over `green`. The STE dictionary replaces
   `verify` with MAKE SURE, a verb phrase. `Verified: 47 tests` has no approved form, and the
   test-report format depends on it.
4. **`conform`.** The STE dictionary replaces it with AGREE, which does not carry Waytide's meaning.
   Category 21, Law and regulations, lists `conform to` as a technical verb, but Waytide's use is
   not legal or regulatory.

**Why:** Waytide's vocabulary and the STE dictionary disagree in 38 places. Five terms need
replacing. Twenty-three need declaring as technical nouns or technical verbs. Four have no answer.
Ten terms already agree. Until this work is done, a rule written in STE cannot use Waytide's own
terms, and the `language` package's substitution tables and the STE dictionary give different
instructions for the same word.

**How to apply:** wait for the Simplified Technical English experiment's verdict. If the
specification is adopted, apply the replacements as substitution-table changes in each package's
`vocabulary.md`, and record the declared terms in the same files as technical nouns and technical
verbs with their category. Settle the four open terms first. `gate` breaks STE Rule 1.7 and STE Rule 1.13.
The OODA phase names reach the mode rule, which names `orientation` and `action` as OODA mode's
artifacts. Related: the STE
Spec experiment (which read the specification), the Simplified Technical English experiment (which
this is gated on), the deferred item recording that the specification permits project words, and
each package's `vocabulary.md`.

---
Authored by Scott Bellware on Fri Aug 7 2026 at 11:57:46 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 12:09:51 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 12:27:08 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 1:37:01 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 1:57:24 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 10:50:31 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:09:30 PM PT
