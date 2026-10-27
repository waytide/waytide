# Versioning — Vocabulary

The versioning package's vocabulary. One term, and it is the one the package exists to introduce. Everything else in a version number is semantic versioning, which is defined elsewhere and is not restated here. Binding — use this term with this meaning in rules, release notes, prose, and dialogue.

**Every word here is approved in the STE dictionary, or reserved in a category its entry names.** The vocabulary-convention sets out what each means, what a reserved word's entry states, and what silence means in an entry.

## Terms

- **product generation** — the **leading segment** of a four-segment version (`<generation>.<major>.<minor>.<patch>`), and a **different kind of statement** from the three that follow it. The semver segments answer *what does a user of this have to do?* — a technical compatibility claim, derived from what changed. The generation answers *which product line is this?* — a **declaration**, made by product management, that a new line has begun.

  It is not derived from a change and cannot be computed from a diff. Nothing about a code change ever obliges a generation bump, and a generation bump does not, by itself, say anything about compatibility. **STE: absent from the STE dictionary. `generation` is absent from the STE dictionary, and `product (n)` is listed with the guidance to be accurate. Technical noun, STE category 7, mathematical, scientific, engineering terms, and formulas.**

  A version with **no** leading segment is the ordinary case: three segments, plain semver, no generation declared. The segment appears only where a project has declared generations, and its absence is not a defect.

---

Authored by Scott Bellware on Mon Aug 3 2026 at 11:31:19 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:23:03 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:50:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 7:22:16 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 9:24:38 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 10:22:47 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 12:14:07 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 10:31:52 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 11:18:04 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 12:52:39 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 1:08:26 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:29:25 PM PT
