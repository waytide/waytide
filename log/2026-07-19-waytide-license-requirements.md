# Eventide Common Interest License — Requirements Sheet

Plain-language requirements for a custom license (the **Eventide Common Interest License**, ECIL) for Waytide. This is a **specification of intent** — permissions, prohibitions, and edge cases — **not legal text.** A lawyer should draft or review the actual license; a custom license is exactly where do-it-yourself wording creates loopholes or unenforceable terms.

## Context — what is licensed, and why

- **The work:** Waytide — a set of conventions (rules, mostly Markdown prose) for AI coding agents, organized into installable packages.
- **Owner:** Eventide (Scott Bellware's solely-owned business). Copyright is held by Eventide.
- **How it's distributed:** each package is a git repository; a consumer installs a package with `git subtree`, which **copies the package's files as-is into the consumer's own repository**, where they are committed alongside the consumer's code and read by an AI agent at the start of each session.
- **Purpose:** free to use; its role is to build **Eventide's credibility.** So the Eventide association must stay attached, and the conventions must remain a single canonical standard.
- **Positioning:** this is a **source-available, free-to-use** license — **not "open source"** in the strict (OSI) sense, because OSI open source requires allowing modification. Describe it as "free to use" / "source-available," not "open source."

## Permissions — what a user MAY do

1. **Use the conventions** in their own projects: the AI agent reads the rule files and follows them; the user relies on the conventions in their work.
2. **Install and copy the files as-is** into their own repository (via `git subtree` or otherwise). The install *is* a copy, so copying-for-installation must be permitted, as is committing the unmodified files alongside their own code.
3. **Add their own separate rules alongside** Waytide's (e.g., a `local/` directory of their own project-specific conventions). Their own content is theirs and is not part of the licensed work.
4. **Use it for any purpose, including commercial** — a business may use Waytide conventions in its own commercial software. *(Confirm — see Decisions.)*
5. **Redistribute the work unmodified,** with the license and attribution intact. *(Confirm — see Decisions.)*

## Prohibitions — what a user may NOT do

1. **No modification / no derivative works.** Users may not change the content of Waytide's rule files or create altered or derived versions. (They add their own *separate* rules instead — permission 3.)
2. **No forking into a divergent version** of Waytide.
3. **No removing or obscuring attribution** — the license notice and the "by Eventide" attribution stay intact and visible.
4. **No use of the names or marks** "Waytide" or "Eventide" for a user's own version or product, or in any way that implies Eventide's endorsement (trademark — see below).
5. **No relicensing or sublicensing** under different terms; the work stays under the ECIL.
6. **No taking it proprietary or passing it off as one's own** product. *(Confirm the exact boundary — see Decisions.)*

## Attribution requirements

- Keep the license text and Eventide copyright notice with the files.
- Keep the "Waytide — by Eventide" attribution and the link to `eventide-project.org` intact and visible. The Eventide association may not be stripped.

## Trademark — separate from the copyright license

- "Waytide" and "Eventide" are trademarks of Eventide. The license grants **no** right to use these names or marks.
- Model this on the Apache 2.0 trademark clause. **Trademark, not the copyright terms, is what actually protects the name** from being taken — the copyright license governs the files, the trademark governs the name. Registering the marks is a separate step worth doing.

## Warranty and liability

- Provided **"as is," with no warranty.** Eventide is **not liable** for any damages or problems arising from use. (Standard in every license — keep it; this is the liability protection.)

## Waytide-specific edge cases (essential — the distribution and AI-use model)

1. **The install is a copy.** The no-modification term must clearly distinguish *copying the files as-is into your repo* (allowed — that is how it is used) from *changing the content of a file* (prohibited). Don't let "no modification" accidentally forbid the normal install.
2. **AI-generated output is NOT a derivative of Waytide.** When an AI agent follows Waytide's conventions to produce the user's code, that resulting code is the **user's own work, not a derivative of Waytide** — the same way writing code to a published style guide doesn't make your code a derivative of the style guide. The license must state this plainly. Without it, no one can safely adopt Waytide, and the credibility goal fails. **This is a protection for the user and is essential to adoption.**
3. **Machine reading is use.** "Use" explicitly includes an automated agent reading the files and acting on them.
4. **Local additions are not modifications.** A user adding their own rules in a separate location is permitted and creates no derivative of Waytide.

## Decisions needed from Scott (the license can't be finalized without these)

1. **Redistribution:** may a user pass the unmodified work to others (e.g., a consultant installing it for clients)? *(Likely yes.)*
2. **Commercial boundary:** using Waytide conventions inside a commercial product is presumably fine; *selling Waytide itself*, or a service that is mainly redistributing Waytide, presumably is not. Where is the line?
3. **Contributions back:** the original design let users refine rules and push them back. A no-modify license ends that as a *right*. Do you want a separate **contribution path** — users submit suggestions to Eventide, which Eventide may adopt into the canonical version and own — via a contribution term or a CLA (contributor license agreement)?
4. **"Common Interest" meaning:** confirm the intent is *"one canonical, unforkable standard"* (no-modify) rather than *"improvements stay in a shared commons"* (copyleft). The name fits either; the terms differ sharply.
5. **Trademark registration:** decide whether to register "Waytide" (and confirm "Eventide") as trademarks — this is the real protection for the name.

## Adoption note (not a license term, but relevant)

A no-modify license narrows who will adopt Waytide — some teams won't take on something they can't adjust. The contribution path (Decision 3) is the usual release valve: they can't change it themselves, but they can propose changes that flow into the canonical version. Worth deciding alongside the license.

---

*Hand this to a lawyer to draft or review the enforceable text. This sheet is the intent and the edge cases; the wording is legal work.*
