# Testing — Vocabulary

The testing package's vocabulary: the terms it defines and the word substitutions it enforces, for controls-based test-writing. Binding — use these terms and swaps in tests, rules, prose, and dialogue.

**Every word here is approved in the STE dictionary, or reserved in a category its entry names.** The vocabulary-convention sets out what each means, what a reserved word's entry states, and what silence means in an entry.

## Terms

- **controls** — the known, deterministic inputs a test is built from: the helpers that build example values, the example values themselves, and the pre-actuation setup that establishes them. A test reads **control → actuate → observe**. The conventions that hold the term in place — controls never "factories" / "fixtures" / "arrange", the `control_` variable prefix, and the "some" string value — are the package's control rules. **STE: absent from the STE dictionary as a plural. `CONTROL (n)` is approved, meaning something that controls, which is the singular sense this narrows. Technical noun, STE category 7, mathematical, scientific, engineering terms, and formulas.**
- **precondition** — a bare `assert` or `refute` that is **not** a test. It is written to **document a factor that decides the test's outcome** where the test script does not express it. That factor is most often a property of a **control**, whose value is named rather than described. It documents by asserting, so the clarification is checked rather than merely claimed. It **qualifies** the test rather than preventing a regression: when a precondition fails, the test's result is *meaningless*, not wrong. It carries no name because its predicate reads inline as the name, and it sits immediately before what it qualifies. **STE: absent from the STE dictionary. Technical noun, STE category 7, mathematical, scientific, engineering terms, and formulas.**
- **uncontested** — of a test: it passes without any implementation being written to meet it, because the behavior it checks already exists. A test is *contested* when it fails until code is written to satisfy it, which is how a DBE test drives a design. An uncontested test drives nothing, so it is coverage rather than design. The word is taken from a no-bid contract, which is awarded without a competing bid. Taxonomically such a test is a **confirming test**. **STE: absent from the STE dictionary. Technical adjective, ETE engineering, design, process, and method.**

## Substitutions

Test-domain word substitutions. When the impulse is a word in the **Don't use** column, write the **Use** term.

| Use | Don't use | Meaning |
|---|---|---|
| **verified** | "green" | passing tests, and the report that tests pass — see below. **STE: absent from the STE dictionary. `verify (v)` is not approved and gives MAKE SURE (v). Technical verb, STE category 2b, computer processes and applications, user interface and application processes, where the dictionary's own list gives `validate`. `verified` is its past participle used as an adjective, which STE Rule 1.13 permits** |
| **prevent** | "guard" / "protect" | what a test does to a regression — see below. **STE: `PREVENT (v)` is approved, and used with its approved meaning** |

### Finer distinctions

- **verified** governs the *report*, not the cycle. Where "green" names a state in the red/green cycle rather than a claim that behavior is confirmed, it stands — the **red/green loop** keeps its name. Prefer "Verified: N tests" over "the suite is verified at N" (technobabble).
- **prevent** — a test **prevents** a regression (a regression in the behavior, the delegation, the seam). The STE dictionary replaces `protect` with PREVENT, and the two differ in what they take as an object: `protect` names the thing kept safe, `prevent` names the thing stopped. Write what is stopped. Keep "guard clause" for the early-return control-flow construct. A test's role is "prevent", never "guard".

---

Authored by Scott Bellware on Wed Jul 22 2026 at 3 PM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 4:14:08 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:23:03 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:50:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 7:22:16 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 9:24:38 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 10:22:47 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 12:14:07 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 10:31:52 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 11:18:04 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 12:52:39 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 1:08:26 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:29:25 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:00:02 PM PT
