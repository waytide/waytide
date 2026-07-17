# Include the primary domain mixin before infrastructure mixins

When a class includes both a **domain mixin** (the type's defining abstraction —
e.g. `Storage`) and an **infrastructure mixin** (a mechanical capability — e.g.
`Dependency`), list the domain mixin **first**. The domain mixin has more
primacy to what the class *is*; the infrastructure mixin is a supporting
mechanism. Reading order should reflect that priority.

So `Upload` opens with `include Storage`, then
`include Dependency` — not the reverse.

(Ruby requires only that `include Dependency` precede the `dependency` macro
call; the relative order of the two includes is otherwise free, so it is chosen
for primacy/readability, not mechanics.)

**Why:** The order in which includes are listed reads as a statement of what
matters most to the type. Leading with the domain mixin says "this is a
`Storage` operation, mechanically wired by `Dependency`," not "this is a
`Dependency` thing that also happens to be `Storage`." Primacy first.

**How to apply:** In a class that mixes in both, write the domain mixin's
`include` before any infrastructure mixin's. Put the `dependency` (or other
macro) call after the infrastructure `include` it depends on. Related: the
`build`-normalizes / `new`-is-strict rule.
