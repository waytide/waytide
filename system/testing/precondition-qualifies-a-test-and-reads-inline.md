# A precondition is a bare assertion that qualifies a test, and its predicate reads inline

A **precondition** is an `assert` or `refute` that is **not** a test. It sits in a context
beside the controls and the actuation rather than inside a `test` block, and it establishes
that the situation the test needs actually holds.

**It qualifies the test rather than protecting behavior.** A test observes an outcome of the
unit under test and protects it against regression. A precondition observes nothing about
that unit — it states what must already be true for the test's observation to mean anything.
That distinction decides how a failure reads: **when a precondition fails, the test's result
is meaningless, not wrong.** The unit may be perfectly correct; the test simply did not
exercise what it claims to.

```ruby
context "Database Connection" do
  session = MessageStore::Postgres::Session.build

  refute(session.connected?)

  test "Connects on first use" do
    refute_raises do
      session.execute('SELECT 1;')
    end
  end
end
```

Without the precondition, "connects on first use" would pass just as readily over a session
that was already connected — the outcome the test names would never have been exercised.

**The tell that one is warranted: the test could pass without exercising what it claims.**
A precondition is not owed to every setup. It earns its place where some prior state, if it
were not what the test assumes, would let the assertion succeed for the wrong reason — a
value already present before the actuation set it, a connection already open, a search that
found nothing so the assertion is made against nothing and passes vacuously.

**The predicate reads inline — no explaining variable.** The assertion's own expression
carries the condition, read as a sentence at the point it is written:
`refute(session.connected?)` is *the session is not connected*;
`assert(account.processed?(deposit.metadata.global_position))` is *the account has processed
that position*. **This is a deliberate exception to the test-block-is-assertion-only rule**,
which requires every operand inside a `test` block to be bound to an explaining variable
first. That rule exists because an assertion mixing computation with a check must be parsed
inside-out, and because naming an operand documents what it is. Neither reaches a
precondition: it has one operand, and a name bound for it only restates the predicate —
`connected = session.connected?` in front of `refute(connected)` adds a line and no
information. **A precondition carries no name because its expression is the name.**

**It sits immediately before what it qualifies.** Before the **actuation** when it qualifies
the controls; before the **test** when it qualifies a value derived from the result. Both are
the same construct in the same relation — the precondition stands directly ahead of the thing
whose meaning depends on it.

```ruby
deposit_message = write.one_message do |written|
  written.instance_of?(Messages::Commands::Deposit)
end

refute(deposit_message.nil?)

test "Deposit message follows previous message" do
  assert(deposit_message.follows?(previous_message))
end
```

**It is not coverage, and it protects nothing.** A precondition asserts over the controls or
over a derivation, never over the library's own decisions, so it is outside what the
do-not-test-the-platform rule weighs and outside what a coverage test is for. Nothing about
the unit is established by one passing.

**Why:** a test that can pass without exercising what it names is worse than no test — it
reports protection that is not there. A precondition closes that gap by stating the
assumption the test rests on, in the one place a reader meets the test, and by failing loudly
when the assumption does not hold. Keeping it a bare assertion rather than a named test is
what keeps the two legible as different things: a named test claims the unit behaves a
certain way, and a precondition claims only that the ground the test stands on is the ground
it thinks it is. Letting the predicate read inline is what makes a nameless assertion
intelligible at all — the condition has nowhere else to be stated, and every alternative
(a bound name, a prose narration) either restates the predicate or duplicates it in a second
place that can drift.

**How to apply:** where a test could pass without exercising the outcome it names, write a
bare `assert` or `refute` stating the assumption, with its predicate read inline and no
explaining variable, placed immediately before what it qualifies — the actuation for a
condition about the controls, the test for a condition about a derived value. Do not wrap it
in a `test` block, do not name it, and do not bind its operand. Related: the
test-block-is-assertion-only rule (the explaining-variable discipline this is a stated
exception to), the tdd-test-structure rule (the control → actuate → observe shape a
precondition sits within), the controls-not-factories-fixtures-arrange rule (the setup a
precondition ordinarily qualifies), the context-only-for-local-instrumentation rule (the
other thing a context holds beside a test), and the do-not-test-the-platform rule (the
boundary a precondition is not to be confused with).

---

Authored by Scott Bellware on Thu Jul 30 2026 at 4:14:08 PM PT
