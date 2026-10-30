# Waytide skills

- **State:** Open
- **Tags:** [idea]

**Some of Waytide is delivered as Claude Code skills.** A skill loads when its command is typed or its task is recognized, rather than in the session-start read. The hypothesis logged as `2026-10-29T16-23-07Z-waytide-as-a-set-of-skills-is-hypothesized` sorts the rules into those always in force, those triggered by a command, and those triggered by a condition, and names the test that would refute it.

**Not yet settled:**

- which rules become skills
- how a skill is delivered to a consuming project, beside or in place of `git subtree`
- whether this is an experiment, run to the test the hypothesis names

## Amended — 2026-10-29

**The engineer added commands to the list of those fit for skills.** Most follow one form: *New <kind of record>* creates a record of that kind. A slash separates other wordings of the same command.

1. **Items**
   - `New item` creates an item. It carries `[idea]` where no other tag is given.
   - `New idea` creates an item tagged `[idea]`.
   - `/item work` creates an item tagged `[work]`, a piece of work to be done. `/work-item` is another wording of it.
   - `List` lists the items in a given state, such as `/list open`. It renders the list as the a-record-list-is-a-table rule fixes it: an ordinal, the handle, the title, and the state.
   - `New mistake` creates an item tagged `[mistake]`.
   - `New problem` creates an item tagged `[problem]`.
   - `New observation` / `Record observation` / `Observation` / `Observe` creates an observation, tagged `[observation]`, with the state `Recorded`.
2. **Implementations**
   - `New feature` starts a feature, with its implementation record.
   - `New experiment` starts an experiment, with its implementation record.
   - `New experiment with phases`: a new experiment prompts for whether it has phases.
   - An experiment and feature status command lists the phases, marks the current phase, and states its goal. A feature has no phases under the implementation-lifecycle rule, so what its status shows is not settled.
   - Affirming an experiment: the engineer's declaration that concludes it as `Affirmed`. The log is copied into the project log, and the branch merges where it produced implementation. The agent still never raises the end of an experiment, so the skill runs only on the engineer's command.
3. **The journal**
   - `New journal entry` / `journal entry` writes a shared journal entry, beside the existing `new entry`.
   - `New private journal entry` / `private journal entry` writes a private journal entry, beside the existing three commands.
4. **The log**
   - `Log` / `Log this` / `New log entry` / `Log entry` writes a log entry.
5. **Collecting**
   - `Begin collection` / `resume` / `end` are other wordings of `begin collecting`, `resume collecting`, and `end collecting`.
6. **Packages**
   - `Activate package` / `Deactivate package` activates or deactivates an installed package. That is a package-set declaration naming the change, per the a-project-declares-its-package-set rule.
7. **Lifecycle states**, one command for each state a record with a lifecycle can reach. Each command writes the `**State:**` line, renames the file with the new state suffix, and writes the log entry. An observation has no lifecycle, so it takes no state command, and its one command is its promotion.
   - **An item:**
     - `Start item`: Open to Active
     - `Realize item`: Realized
     - `Defer item`: Deferred
     - `Suspend item`: Suspended
     - `Supersede item`: Superseded, naming the item that replaces it
     - `Abandon item`: Abandoned
     - `Lapse item`: Lapsed
     - `Reopen item`: takes back Realized, Deferred, or Open, returning to Active or Open
   - **An observation:** `Promote observation to rule` writes the rule in `local/rules/`, naming the observation it came from. It adds the `**Promoted to:**` line under the observation's `**Tags:**` line and writes the promotion's log entry. The observation stays `Recorded`, and nothing else in it changes.
   - **A piece of work, tagged `[work]`:** the item commands, with `Done` in place of `Realize item`, and no `Lapse item`. `Reopen item` takes back Done.
   - **An experiment:**
     - `Affirm experiment`: Affirmed
     - `Refute experiment`: Refuted
     - `Experiment is inconclusive`: Inconclusive
     - `Suspend experiment` / `Resume experiment`: Suspended, and back to Active
     - `Supersede experiment`: Superseded, after it has been Suspended
     - `Abandon experiment`: Abandoned
   - **A feature:**
     - `Complete feature`: Completed
     - `Suspend feature` / `Resume feature`: Suspended, and back to Active
     - `Supersede feature`: Superseded, after it has been Suspended
     - `Abandon feature`: Abandoned
   - The agent still never raises the end of an experiment. Every experiment command runs only on the engineer's command.

## Amended — 2026-10-29: slash commands and subcommands

**A Claude Code slash command takes a subcommand as its first argument.** What is typed after the command's name reaches it as `$ARGUMENTS`, and word by word as `$1`, `$2`. `/collect begin`, `/collect end`, and `/collect resume` are one command whose instructions branch on `$1`. The lifecycle commands could take the same form, one command for each kind of record: `/item realize`, `/experiment affirm`.

- **The harness does not validate a subcommand.** The command's instructions handle a word they do not recognize.
- **Tab completion completes the command's name and not its subcommand**, as far as is known. This is not verified against the installed version of Claude Code. An `argument-hint` line in the frontmatter shows the expected arguments as grey text after the name, such as `begin | end | resume`. It is read, and it is not selected from.
- **A command entered with no argument asks through `AskUserQuestion`.** The command's instructions direct the agent to put the subcommands as options, with `Explain`, which is the form the present-every-prompt-through-askuserquestion rule already requires. This replaces most of what tab completion of a subcommand would give.
- **The options follow the current state.** While a collection runs, `/collect` offers `end`. While none runs, it offers `begin` and `resume`.
- **Where the frontmatter carries an `allowed-tools` line, `AskUserQuestion` is in it**, or the agent cannot call it.
- **The interaction was simulated** for `/collect` with no argument and no collection running: the question *No collection is running. What do you want to do?*, with the options `begin`, `resume`, and `Explain`.

## Amended — 2026-10-29: the list command

**Items are listed by state in two forms, `/item list <state>` and `/list <state>`**, such as `/item list open` and `/list open`. Each is a wording of the same command.

**`current` is a virtual, aggregate state: Open, Active, and Suspended together.** `/list current` lists the items in any of the three. No `**State:**` line ever reads `Current`, and no filename carries it. It is a word the list command reads, not a state an item reaches.

- **A suspended item is asked for by name here.** The status-report-format rule counts a suspended record in a report or a brief rather than listing it, and lists it when it is asked for. `/list current` asks for it.
- **STE:** `current` as an adjective is absent from the STE dictionary, which carries the word only as electrical current in an example.

## Amended — 2026-10-29: work

**The category is named "work", and its tag is `[work]`.** The engineer judges "work item" colloquial. The items-convention names the tag `[work-item]`, and this item does not change that rule.

## Amended — 2026-10-29: the work-item tag stays

**The tag stays `[work-item]`.** Offered `[work]`, `[work-item]`, and `[task]`, the engineer selected `[work-item]`, and that replaces the `[work]` in the amendment above. The commands keep their words: `/item work`, with `/work-item` as another wording of it. The foundation rules already name the tag `[work-item]`, so no rule changes.

## Amended — 2026-10-29: the tag is `[work]`

**The tag is `[work]`, reversing the amendment above.** The foundation rules name the tag `[work-item]`, and where they change is not settled.

## Amended — 2026-10-29: aliases for creating items

**Each kind of item is also created by a command of its own name.** `/idea` is `/item idea`, `/mistake` is `/item mistake`, `/problem` is `/item problem`, and `/work` and `/work-item` are `/item work`. `/observation` is `/item observation`, which creates an item tagged `[observation]` with the state `Recorded`.

**Not settled:** `/observation` already takes `promote` as a subcommand. Whether `/observation` alone creates one and `/observation promote` promotes one, or the promotion moves elsewhere.

**The engineer judges that the two do not clash (2026-10-29).** `/observation` with no subcommand creates an observation, and `/observation promote` promotes one.

**A bare `/idea` is `/idea new` (2026-10-29).** `/idea` takes subcommands, and with none it creates an idea, as a bare `/observation` creates an observation.

## Amended — 2026-10-29: freewrite

**`/freewrite begin`, `/freewrite end`, and `/freewrite resume` replace `/collect` and `/sketch`.**

## Amended — 2026-10-29: projects

**`/projects` is a root command that works with the machine's registry of Waytide projects, `~/.config/waytide/consuming-projects.toml`, from within any project on the machine.** It replaces `/package projects`, which put a command about projects under packages. Listing the registered projects is one thing it does.

**Not settled:** what else it does, such as adding a project to the registry or removing one.

## History

As the engineer first stated it: "Idea: Waytide skills"

On 2026-10-29, the engineer added: "New idea", "New feature", "New experiment", "New experiment with phases (prompt for whether a new experiment has phases)", "New mistake", "New problem", "Observation / New observation", "New journal entry / journal entry", "New private journal entry / private journal entry", "Begin collection / resume / end", "New item", "Log / Log this", "New log entry", "Log entry"

On 2026-10-29, the engineer added: "Activate / Deactivage package"

On 2026-10-29, the engineer added: "Affirming experiments"

On 2026-10-29, the engineer asked: "Add commands for all lifecycle states for items than have lifecycles"

On 2026-10-29, offered a command for an observation: "Yes, “promote observation to rule”"

On 2026-10-29: "There should be a new observation / record observation / observation / observe command"

On 2026-10-29: "An experiment and feature status command. It lists phases, current phase, and goal"

On 2026-10-29, the engineer asked: "Can Claude slash commands have subcommand options", then "Are they presented to the user through the tab completion that the slash comands themselves use", then "If a command like collect is entered without an argument, can askuserquestion be used to ask the user what their intention is", then "Simulate this interaction", then "Record all this in the item"

On 2026-10-29: "A “list” command that can list items of a particular state"

On 2026-10-29, of the slash-command forms: "“/item list” is good, but so is “/list open”"

On 2026-10-29: "Use the word “current” as a virtual, aggregate state that includes open, active, and suspended items"

On 2026-10-29: "“Work item” is colloquial. The category should ust be “work”. The tag should be [work]. “/item work” is fine". Then: "“/work-item” should be an alias for “/item work”"

On 2026-10-29: "I'm not sure if it's [work-item] or [work]". Offered `[work]`, `[work-item]`, and `[task]`, the engineer selected `[work-item]`.

On 2026-10-29: "No. Reverse that. Use the tag [work]"

On 2026-10-29: "The following should be alias to the respective item commands: idea, observation, mistake, problem, work (and also work-item)"

On 2026-10-29: "No clash"

On 2026-10-29, of how a bare `/item` offers its subcommands: "No, disregard that. A bare “/idea” is an alias for “/idea new”"

On 2026-10-29, after "brainstorm", "sketch", "braindump", and "spew" were weighed: "Yup. “freewrite” is right". Offered whether it replaces only "sketch" or "collect" too, the engineer selected that it replaces both.

On 2026-10-29: "Yeah. That's the wrong place for that. There should be a root “/projects” command that can interact with the consuming projects registry from within a project on the machine"

---

Authored by Scott Bellware on Thu Oct 29 2026 at 9:24:42 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 9:48:40 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 9:49:14 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:39:51 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:40:17 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:47:27 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:47:56 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:19:44 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 12:14:30 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 1:26:21 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 6:14:30 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 6:17:07 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 6:30:54 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 6:33:18 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 6:33:42 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:25:31 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:26:51 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:29:17 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:43:36 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:48:29 PM PT
