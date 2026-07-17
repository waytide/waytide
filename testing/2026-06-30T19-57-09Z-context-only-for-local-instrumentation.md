# Wrap a test in a context only when the outcome needs local instrumentation; otherwise name the test directly

A `test` block holds **exactly one assertion** and nothing else (per the
test-block-is-assertion-only rule). Naming an outcome does **not** require a
`context` block: TestBench lets a test carry its own name — `test "Outcome name" do … end`.

Use a named **`context`** wrapping a `test` when that outcome needs local
instrumentation — an **explaining variable derived for it**, or a
**`comment`/`detail`** specific to it — **or** when the context is a **leading
`When …` condition** (a condition promoted to a context, per the assert-raises
rule). The context exists to hold that local setup alongside the bare test, or to
name the condition.

**The `When` exception is narrow — a *leading* `When …` only.** A context named
`"When the name is not defined"` stays a context (with `test "Is an error"`
inside), even though it wraps nothing but the test. But an **outcome name that
merely contains "when"** — e.g. `"Equal when mediating the same module"`,
`"Unequal when the binding locations differ"` — is *not* a condition context; it
is an outcome name, and it flattens to a directly-named `test "Equal when
mediating the same module" do …`.

When the outcome is a **single assertion over values already in scope** (the
shared arrangement and actuation at the top of the feature context), **name the
`test` directly and use no context** — a context that only wraps a bare test adds
a nesting level that carries no information; the name belongs on the test itself.

```ruby
# No local setup needed → named test, no context
test "Is the Constant::Literal the name resolves to" do
  assert(constant == control_literal)
end

# Local explaining variable / detail needed → context holds it
context "Defined" do
  defined = receiver_constant.const_defined?(new_constant_name)
  detail defined.inspect
  test do
    assert(defined)
  end
end
```

**Why:** a context should *mean something* — "there is local instrumentation
here." A bare `test` inside a `context "name"` whose only content is the
assertion wastes the context: the name could sit on the `test`. Reserving
contexts for outcomes that actually derive a local variable or add local
narration keeps the structure honest and flatter.

**How to apply:** name the `test` directly unless the outcome derives its own
explaining variable, adds an outcome-local `comment`/`detail`, or is a leading
`When …` condition; only then wrap it in a `context`. When flattening an
over-wrapped test, flatten **only** when there is no code between the context and
the `test` (the context wraps nothing but the test) **and** the context is not a
leading `When …` condition. The Constant-class over-wrapping was conformed in one
pass (the `Constant` subtree is now uniformly named tests). Related: the
test-block-is-assertion-only rule, the test-structure rule
(the per-outcome context is for outcomes that *derive* locally), and the
test-name-is-prefix rule.
