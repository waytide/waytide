# The `test-tree` script is mandated by a rule and shipped by nothing, and `testing` as framed cannot ship it

- **State:** Stated
- **Tags:** [observation]

`test-tree-command`'s How-to-apply reads: *"on a 'test tree' request, **run the durable tree
script** and present its output."* The rule body says such a script *"makes the command
reproducible across sessions rather than a rebuilt throwaway"* and points outside the system
for one — *"(`constant`'s `test/automated/tree.rb` is one such implementation.)"*

The `testing` package ships twenty files: a README, a vocabulary, seventeen rules, and
`install-dependencies.sh`. **No script.** So a project that installs `testing` and types
"test tree" has a rule instructing it to run something the install did not provide. The
command is not reproducible from an install alone, which is the exact property the rule
invokes the script to secure.

**The constraint on fixing it is `testing`'s own framing.** The package README opens *"Not
tied to a specific test-framework API."* A tree script cannot hold to that: it runs a suite,
suppresses that runner's narration, and parses that framework's output format. Shipping it in
`testing` would put a TestBench-and-Ruby dependency inside the package whose first sentence
disclaims one — reproducing in `testing` precisely the defect the sibling observation records
in `git`.

**Three placements are available, and they are not equally costly.**

- **`code/ruby`** — where stack-specific material already lives, and which already carries a
  command rule of the same shape (`lib-report-format`). The cost is that `test-tree` is a
  *testing* command whose rule would then sit in a language package, split from the rules it
  serves.
- **`testing`, with the neutrality claim narrowed** — the claim would have to become
  something like *the conventions are not tied to a framework, though the commands are*.
  That is a real weakening of a claim the package leads with.
- **Neither** — the rule is reworded to describe a script the project supplies, dropping the
  instruction to run one the system does not ship. Cheapest, and it leaves the command
  unreproducible by design rather than by oversight.

**This question and the runner question have the same shape.** Both are stack-specific
material sitting in, or wanted by, a package that disclaims a stack. They may want one
answer rather than two.

---

Authored by Scott Bellware on Thu Jul 30 2026 at 7:03:19 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:16:30 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:21:39 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:25:14 PM PT
