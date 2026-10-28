# An error test is named Fails, and its condition is a context

When a test's assertion is that the actuation raises an error (an `assert_raises`), the `test` block's name is **"Fails"** — the actuation fails. The complementary assertion, that the actuation does **not** raise, is named **"Doesn't fail"**. The **condition** under which the actuation fails (or doesn't) is **not** part of the test name. It is promoted to a **`context`** that encloses the test and names that condition.

**The tell:** a `test` name may want the word **"when"**. That "when" clause is a *condition*. Lift it into a `context`, and name the `test` "Fails", or "Doesn't fail".

```ruby
context "When the name is not defined" do
  test "Fails" do
    assert_raises(SomeError) { actuation }
  end
end
```

**Why:** an error outcome establishes "*under condition X*, the actuation **fails**." Those are two different things — the **scenario** (a context) and the **fact observed** (the test). "Fails" and "Doesn't fail" name the actuation's behavior directly, and keep the test name uniform. They let several conditions over the same actuation sit as sibling `When …` contexts, each with its own `test "Fails"`.

Naming an error test for its behavior rather than a value comparison is fully consistent with the "Is"-naming rule. That rule reserves "Is" for value-equals. "Fails" is a plain outcome name, not an "Is" case.

**Relation to the context rule:** an error test always takes an enclosing context, because the context carries the **condition**, which is real information. It is the only place the condition can live, since the test name is fixed as "Fails" or "Doesn't fail". So the a-context-block-is-used-for-a-test-block-only-when-the-tests-outcome-needs-local-instrumentation-or-local-variables rule, which warns of a context that holds only a test, never warns of a leading `When …` context.

**How to apply:** name any `assert_raises` test "Fails". Name the non-raising assertion "Doesn't fail". Put it inside a `context` named for the condition, the "when …".

## Compression

- Solubility 89, clarity 0.90 (2026-10-28)
- Compression 0.33, change 0.66 (2026-10-24)
- 8 directives, 8 kept, 0 less precise, 0 lost (2026-10-28)

Related:

- the start-a-test-name-with-is-only-for-a-value-equals-comparator-assertion rule
- the a-context-block-is-used-for-a-test-block-only-when-the-tests-outcome-needs-local-instrumentation-or-local-variables rule
