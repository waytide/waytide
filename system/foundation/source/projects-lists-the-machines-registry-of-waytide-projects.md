# Projects lists the machine's registry of Waytide projects

**Trigger:** When the engineer asks for the Waytide projects on this machine, as with `/projects`

**`/projects` lists the Waytide projects registered on this machine, from within any project on it.** It runs foundation's `read-consuming-projects.sh`, which reads the registry at `~/.config/waytide/consuming-projects.toml`, and prints what the script reports.

**The registry is per-machine configuration, and stays outside every repository.** `/projects` names no project in any file it writes, and writes no project's name into the project the session is in, per the a-project-does-not-name-its-downstream-consumers-in-its-own-files rule.

**Listing is the whole of what `/projects` does.** It does not change the registry, and it acts on no project it lists. Where no registry exists, it says there is none.

**Why:** an engineer with Waytide in several projects asks which they are, and the answer is on the machine rather than in any project. A command that reads the registry answers it from wherever the engineer is working.

**How to apply:** on `/projects`, run `read-consuming-projects.sh` and print its report. Change nothing, and write no project's name into any file. Say so where there is no registry.

## Compressed

1. `/projects` lists the Waytide projects registered on this machine, from within any project. Run foundation's `read-consuming-projects.sh`, which reads `~/.config/waytide/consuming-projects.toml`, and print its report.
2. Write no project's name into any file, and none into the project the session is in.
3. List only. Do not change the registry, and act on no project listed. Where there is no registry, say so.

## Compression

- 2026-11-02, compressed: checked: 11 directives, 11 kept, 0 less precise, 0 lost

Related:

- the a-project-does-not-name-its-downstream-consumers-in-its-own-files rule — why the registry stays outside every repository

---

Authored by Scott Bellware on Mon Nov 2 2026 at 9:02:21 PM PT
