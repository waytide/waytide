# An error test is named "Fails" (or "Doesn't fail"). Its condition is promoted to a context

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

**Relation to the context rule:** an error test always takes an enclosing context, because the context carries the **condition**, which is real information. It is the only place the condition can live, since the test name is fixed as "Fails" or "Doesn't fail". So the a-test-takes-a-context-only-when-its-outcome-needs-local-instrumentation rule, which warns of a context that holds only a test, never warns of a leading `When …` context.

**How to apply:** name any `assert_raises` test "Fails". Name the non-raising assertion "Doesn't fail". Put it inside a `context` named for the condition, the "when …".

## Compressed

1. When a test asserts that the actuation raises an error (an `assert_raises`), name the `test` block "Fails".
2. When a test asserts that the actuation does not raise, name the `test` block "Doesn't fail".
3. Do not put the condition under which the actuation fails, or doesn't, in the test name.
4. Promote that condition to a `context` that encloses the test and names the condition as a "When …" clause.
5. A test name that wants the word "when" signals a condition. Lift that "when" clause into an enclosing `context`, and name the test "Fails" or "Doesn't fail".

```ruby
context "When the name is not defined" do
  test "Fails" do
    assert_raises(SomeError) { actuation }
  end
end
```

6. Several conditions over the same actuation may sit as sibling `When …` contexts, each with its own `test "Fails"`.
7. "Fails" is a plain outcome name, not an "Is" case. It does not conflict with the "Is"-naming rule, which reserves "Is" for value-equals.
8. An error test always takes an enclosing context, because the context carries the condition. The a-test-takes-a-context-only-when-its-outcome-needs-local-instrumentation rule warns of a context that holds only a test. It never warns of a leading `When …` context, such as an error test's.
9. **Why:** an error outcome states "under condition X, the actuation fails." The scenario belongs in a context and the observed fact in the test. "Fails" names the behavior directly and keeps test names uniform.

## History

Until 2026-10-24 an error test's context was called the deliberate exception to the context-only-for-local-instrumentation rule's ban on a context that holds only a test. That rule now warns rather than bans, and does not warn of a leading `When …` context, so there is no exception to make.

Related:

- the test-name-is-prefix rule
- the a-test-takes-a-context-only-when-its-outcome-needs-local-instrumentation rule

---

Authored by Scott Bellware on Thu Jul 16 2026 at 7 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:57:57 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:16 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 1:56:34 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:26:14 PM PT
