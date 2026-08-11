# Testing — Vocabulary

The testing package's vocabulary: the terms it defines and the word substitutions it enforces, for controls-based test-writing. Binding — use these terms and swaps in tests, rules, prose, and dialogue.

**Every word here is one of three things**, and this holds for the terms below and for the **Say**
column of any substitutions table in this file.

- **Approved** in the STE dictionary, and used with its approved meaning.
- **Reserved** by Waytide as a technical noun or a technical verb, under STE Rules 1.5 through 1.13
  in category 19, Computer science, information and communication technology. This is the case for
  a word this project coined, and for a word the STE dictionary disputes. STE Rule 1.8 requires a
  technical noun to be approved in the subject field, and this file is that approval.
- **Approved with a meaning Waytide does not use**, which STE Rule 1.3 forbids.

**A word with no STE note is absent from the STE dictionary and is reserved.** See the `language`
package's waytide-keeps-its-word-where-the-ste-word-means-something-else rule.

## Terms

- **controls** — the known, deterministic inputs a test is built from: the helpers that build example values, the example values themselves, and the pre-actuation setup that establishes them. A test reads **control → actuate → observe**. The conventions that hold the term in place — controls never "factories" / "fixtures" / "arrange", the `control_` variable prefix, and the "some" string value — are the package's control rules.
- **precondition** — a bare `assert` or `refute` that is **not** a test. It is written to **document a factor that decides the test's outcome** where the test script does not express it. That factor is most often a property of a **control**, whose value is named rather than described. It documents by asserting, so the clarification is checked rather than merely claimed. It **qualifies** the test rather than preventing a regression: when a precondition fails, the test's result is *meaningless*, not wrong. It carries no name because its predicate reads inline as the name, and it sits immediately before what it qualifies. Its rule is the package's precondition rule.

## Substitutions

Test-domain word substitutions. When the impulse is a word in the **Don't say** column, write the **Say** term.

| Say | Don't say | What it names |
|---|---|---|
| **verified** | "green" | passing tests, and the report that tests pass — see below |
| **prevent** | "guard" / "protect" | what a test does to a regression — see below |

### Finer distinctions

- **verified** governs the *report*, not the cycle. Where "green" names a state in the red/green cycle rather than a claim that behavior is confirmed, it stands — **green-on-arrival** and the **red/green loop** keep their names. Prefer "Verified: N tests" over "the suite is verified at N" (technobabble).
- **prevent** — a test **prevents** a regression (a regression in the behavior, the delegation, the seam). The STE dictionary replaces `protect` with PREVENT, and the two differ in what they take as an object: `protect` names the thing kept safe, `prevent` names the thing stopped. Write what is stopped. Keep "guard clause" for the early-return control-flow construct. A test's role is "prevent", never "guard".

---

Authored by Scott Bellware on Wed Jul 22 2026 at 3 PM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 4:14:08 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:23:03 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:50:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
