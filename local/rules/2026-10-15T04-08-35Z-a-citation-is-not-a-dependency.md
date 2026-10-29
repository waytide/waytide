# A citation of another package's rule is not a dependency unless the rule will not work without it

A rule may **name** another package's rule — for orientation, for contrast, or because that rule treats something this one only touches. Naming it is a **citation**, and a citation is **not** a dependency. A **dependency** exists only where the citing rule **will not work** without the cited package.

**The test:** take the cited package away. Can the rule still be applied? If it can, the reference is a citation and nothing is declared. It cannot be applied where the rule instructs something that has no meaning, or requires content that is not there. Then the reference is a dependency. It is declared in the package's README and added to its `install-dependencies.sh`.

**Motivation is not the test.** A rule whose *reason to exist* weakens when a sibling package is absent still works, and a citation is what that is. The question is whether the rule can be **applied**, not whether it still has a point. Reaching for the weaker test would make a dependency out of every rule that is more useful in company than alone. That is most of them.

**A "standalone" claim is about installation, not about prose.** A package that declares no dependencies may still name any other package's rules. The claim says what must be installed alongside it. It says nothing about what its rules may refer to.

**The model citation** is foundation's own a-status-report-prints-a-fixed-whole-project-report rule. It names the `testing` package and is written for its absence. Its words are *"If the project has **not** adopted the testing conventions, degrade this section."* The rule works either way. So `testing` is cited and not declared.

**The refused dependency** is the the-implementations-directory-holds-one-record-per-implementation rule. It cites `design-by-efferent`'s a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule and deliberately stops short of requiring anything in `waytide/local/logs/loops/`. Its words are *"would invert the package graph, and would make the implementation lifecycle unavailable to a project that installs `foundation` alone."* That rule is two things at once. It is a citation of another package, and the reason a dependency was not taken.

**Why:** the alternative reading is not available, and the package graph shows it. Six of the seven packages name packages they do not declare. `foundation`, the base every other package builds on, cites most of them, design-by-efferent among them. If a citation were a dependency, `foundation` would depend on `design-by-efferent`, which declares a dependency on `foundation`, and the graph would cycle. So the two kinds of reference have to be distinct, and the only workable line between them is whether the rule functions alone.

Keeping the line at *works* rather than *is motivated* also keeps the declarations meaningful. A declared dependency obliges an install. Declaring one that is merely helpful would make every install drag in the whole system and reduce the graph to noise.

This criterion was practiced before it was written. Every declaration in the system already conforms to it. Stating it here is what makes it available to a rule's author without their having to infer it from another rule's aside.

**It is a local rule of the Waytide authoring source, not a `foundation` rule.** It governs writing packages, and the packages are written here. It moved from `foundation` on 2026-10-14, so that a project which installs `foundation` and writes no package does not read it. A `foundation` rule does not cite it, since a citation of this repository's local rule points at nothing in any other project.

**How to apply:** when a rule you are writing names another package's rule, ask one question. Could your rule still be applied with that package absent? If it could, cite it plainly and declare nothing. If it could not, declare the dependency in the package README's `Includes` line and its dependency graph. Add it to `install-dependencies.sh`. Do not declare a dependency for any of these reasons:

- a citation is frequent
- the packages are usually installed together
- the rule reads better with its sibling present

## Compressed

## Citation and dependency

1. A rule may name another package's rule. Naming it is a citation, and a citation is not a dependency.
2. A dependency exists only where the citing rule will not work without the cited package.

## The test

1. When a rule you are writing names another package's rule, ask whether your rule could still be applied with that package absent.
2. It cannot be applied where it instructs something that has no meaning without the package, or requires content that is not there.
3. If it can be applied, cite the rule plainly and declare nothing.
4. If it cannot, declare the dependency in the package README's `Includes` line and its dependency graph, and add it to `install-dependencies.sh`.
5. Judge whether the rule can be applied, not whether it still has a point. A rule whose reason to exist weakens without the sibling package is still a citation.
6. Do not declare a dependency because a citation is frequent, because the packages are usually installed together, or because the rule reads better with its sibling present.
7. A rule that names another package may be written to work in that package's absence, and that package is then cited, not declared.

## Standalone packages

1. A "standalone" claim is about installation, not about prose. It says what must be installed alongside the package.
2. A package that declares no dependencies may still name any other package's rules.

## Scope

1. This is a local rule of the Waytide authoring source, not a `foundation` rule. It governs writing packages.
2. A `foundation` rule does not cite this rule.

## Compression

- 2026-10-29, compressed: 4238 → 1584 characters; checked: 17 directives, 15 kept, 1 less precise, 1 lost; nothing repaired, the items not kept being reasons or background

Related:

- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule — the rule format and where rules live
- the the-implementations-directory-holds-one-record-per-implementation rule — the refused dependency it declines
- the a-status-report-prints-a-fixed-whole-project-report rule — the model citation, written for the cited package's absence
- each package's README — where a dependency is declared

---

Authored by Scott Bellware on Fri Jul 31 2026 at 10:42:45 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:40:54 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:58:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 9:08:35 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 9:56:57 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:37 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:03 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:26 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:02:18 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:02:45 AM PT
