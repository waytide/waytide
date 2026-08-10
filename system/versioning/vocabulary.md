# Versioning — Vocabulary

The versioning package's vocabulary. One term, and it is the one the package exists to
introduce: everything else in a version number is semantic versioning, which is defined
elsewhere and is not restated here. Binding — use this term with this meaning in rules, release
notes, prose, and dialogue.

## Terms

**These terms are Waytide's technical nouns and technical verbs**, declared under STE Rules 1.5
through 1.13 in category 19, Computer science, information and communication technology. STE
Rule 1.8 requires a technical noun to be approved in the subject field, and this file is that
approval. **A term with no STE note is absent from the STE dictionary**, which is the ordinary case
for a word this project coined. See the `language` package's
waytide-keeps-its-word-where-the-ste-word-means-something-else rule.

- **product generation** *— **STE: absent.** `generation` is absent from the STE dictionary, and `product (n)` is listed with the guidance to be accurate.* — the **leading segment** of a four-segment version
  (`<generation>.<major>.<minor>.<patch>`), and a **different kind of statement** from the three
  that follow it. The semver segments answer *what does a user of this have to do?* — a
  technical compatibility claim, derived from what changed. The generation answers *which
  product line is this?* — a **declaration**, made by product management, that a new line has
  begun. It is not derived from a change and cannot be computed from a diff. Nothing about a
  code change ever obliges a generation bump, and a generation bump does not, by itself, say
  anything about compatibility.

  A version with **no** leading segment is the ordinary case: three segments, plain semver, no
  generation declared. The segment appears only where a project has declared generations, and
  its absence is not a defect.

---

Authored by Scott Bellware on Mon Aug 3 2026 at 11:31:19 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:23:03 PM PT
