# The slash-commands phase plan is listed with its progress, the first step done

1. Merge master into the feature branch, and that into the phase branch. Done, as `b66e376`.
2. Each package carries its own skills. A principle the later steps follow.
3. A skill's body is thin: it reads the subcommand, loads the rules for the act, and follows them. With no subcommand, it asks. A principle.
4. Build `/log` first, end to end: the skill, its placement by `install.sh`, and an automated test. Next.
5. Build `/item` and its aliases.
6. Build the other groups, one at a time.
7. Make rules that name a typed directive name its skill too.
8. Make the help text what a bare `/we` prints.
