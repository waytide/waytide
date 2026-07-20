# Combine the small migration-note files before finalizing

Before this work is finalized, a lot of the tiny one-note-per-decision files should be combined. Right now a single piece of work often got split across many small files, which is hard to read. (Scott, 2026-07-19.)

## The kinds of record files here

**The build notes — the main thing to fix.** The repo's own `waytide/log/` folder holds 34 tiny files, each jotting one small decision made while building the norms. Nobody who installs the packages ever sees these — they stay in this repo. The problem: one piece of work often became six or seven separate files. For example, the design-by-efferent build is six files all saved within the same minute (the hinge-trio merge, the M4 folds, the tdd-lexicon becoming the DBE glossary, solubility, the tdd→dbe rename test, a filename exemption), and there are five separate "published package X" files, and a cluster about the language package. These read far better combined into a handful of by-topic write-ups.

**The bigger write-ups — already fine.** The `log/` folder has 11 larger documents (the design doc, the state-of-the-work note, the per-package plans). These are already whole topics, so there is little to combine. The finished per-package plans could fold into one "migration record," and the combined build notes above could go there too.

**The notes that ride along inside packages — mostly leave alone.** A few packages carry their own small notes folder that gets copied into other people's projects when they install (testing has 3, language 1, design-by-efferent 5). Combining these is trickier: other people receive them, so changing them means re-publishing the package; and they are the living example of the "one note per decision" rule, so merging them would contradict the rule they demonstrate. Only combine one if it is genuinely confusing (design-by-efferent's five are the candidate).

## This does not change the rule

The "one note per decision" rule (foundation's `decision-log-convention`) stays exactly as it is for notes written from now on. This is only tidying a finished pile of old notes — not changing how notes get written going forward. Optionally add a line to that rule saying a closed pile of old notes may be combined afterward.

## Recommendation

- Combine the repo's own build notes (the 34-file pile) into a few by-topic write-ups — the safe, worthwhile win, since nobody outside sees them.
- Fold the finished per-package plans into one migration record; put the combined build notes there too.
- Leave the ride-along package notes mostly as they are.
- Keep the "one note per decision" rule unchanged.

## Still to decide

- Just the repo's own build notes, or also the notes that ride along inside packages?
- Where the combined write-ups go — a new document in `log/`, or folded into the state-of-the-work note / design doc.
- The combined-away small files get deleted — that is the point; the combined write-up becomes the record.

**Do this before:** calling the migration finished. Not urgent. Combining the repo's own notes affects nobody outside. Touching the ride-along package notes would need a re-publish (see [[2026-07-19T05-22-32Z-pending-release-republish-all-seven-packages]]).

**Why:** one note per decision is right for a live, active log, but a big pile of finished decisions reads better as a few topic write-ups than as dozens of scraps — especially when one piece of work is spread across many files.

**How to do it:** settle the questions above, group the build notes by topic, write the combined write-up(s), delete the small files, and add one note recording that the combining was done.
