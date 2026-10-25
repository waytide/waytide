# The first DBE gate is the actuation and an unnamed assert

Start a feature by writing a test file, not implementation. The first turn produces that file and nothing more. It begins at the **first gate**, where responsibility first transfers to the human, and the file is assembled once the three test hinges are accepted — not before them, unless the engineer chose unattended work at the start.

What the first gate puts down is small and fixed:

1. **The actuation** — the invocation of the unit under test, the first efferent reference, bound to an explaining variable. State any inputs just above it (via controls or literals).
2. **An unnamed assert** — a single bare `test` block asserting that explaining variable (or the variable against a control value). No inner outcome `context`, and so no outcome to name yet.

The file is still nested to mirror its folder path, per the folder-mirroring rule. There is an outer `context` per path segment. The actuation and the unnamed `test` block sit inside the innermost of those.

```ruby
context "Constant" do
  context "Module" do
    context "Namespace" do
      control_value = Controls::Constant.example

      constant = Constant::Module.new(control_value)

      namespace = constant.namespace
      control_namespace_constant = Constant::Module.new(Object)

      comment "Namespace: #{namespace.inspect}"

      test do
        assert(namespace == control_namespace_constant)
      end
    end
  end
end
```

The assertion is made against an **explaining variable** — a named local whose name states what is being asserted — not against an inline expression. That variable holds the result of actuating the concern. Actuate first, bind the result, then assert it.

**Naming the outcome is deferred to the end.** The **shell of the cradle** is the actuation and its unnamed assert. Once it is implemented, the test is left unnamed through the rest of the feature's development. Only **at the end** does the work come back and **name the test**. The outcome `context` each observation establishes is added then. That is the "one inner `context` per outcome" structure of the test-structure rule.

In practice this closing step is the seam where the next feature begins. So a feature in progress carries bare unnamed asserts, and a feature left behind carries named outcome contexts. The first gate deliberately withholds that naming, so its hinge stays the shape of the actuation and the truth of the one observation. It is not about how outcomes are named or carved up.

**Why:** The first turn is where the unit is designed from the efferent side. The actuation is the first efferent reference, and writing it before any implementation forces the interface to be designed from the use site. See the DBE-as-design-tool rule.

Keeping the first gate to the actuation and a single unnamed assert keeps that gate's hinge undiluted. It is the actuation's shape and the observed truth, with no premature commitment to an outcome taxonomy. Asserting against an explaining variable keeps the test reading as a statement of the concern rather than a mechanical check. Binding it to the actuation result keeps the efferent view in the frame.

**How to apply:** When beginning a feature, settle the actuation, the observation, and the controls, then write only the test file this turn. Nest one `context` per folder segment. Actuate the unit under test and bind the result to an explaining variable. Write one bare unnamed `test` block asserting that variable. Do not name an inner outcome context yet. Do not write the implementation, and do not pause to run the inevitably-failing test.

**Acceptance is separate gates, not one.** The *content* of turn one is as above. The human accepts it in separate hinges: **actuation, then observation, then controls**. The implementation is the fourth hinge, and the naming is the fifth, at the feature's close.

Each is proposed and accepted before the next, per the the-hinge-cycle-runs-from-actuation-to-naming rule. Do not present the whole test file for a single accept, unless the engineer chose unattended work at the start (see the attended-or-unattended-is-chosen-when-the-work-is-started rule). Settle the three test hinges first, then assemble and show the file.

## Compressed

1. Start a feature by writing a test file, not implementation.
2. The first turn produces that test file and nothing more.
3. The first turn begins at the first gate, where responsibility first transfers to the human.
4. The first gate puts down only the actuation and an unnamed assert.
5. The actuation is the invocation of the unit under test, the first efferent reference, bound to an explaining variable.
6. State any inputs just above the actuation, via controls or literals.
7. The unnamed assert is a single bare `test` block asserting the explaining variable, or the variable against a control value.
8. Write no inner outcome `context` yet, so no outcome is named.
9. Nest the file to mirror its folder path, per the folder-mirroring rule, with one outer `context` per path segment.
10. Place the actuation and the unnamed `test` block inside the innermost `context`.

```ruby
context "Constant" do
  context "Module" do
    context "Namespace" do
      control_value = Controls::Constant.example

      constant = Constant::Module.new(control_value)

      namespace = constant.namespace
      control_namespace_constant = Constant::Module.new(Object)

      comment "Namespace: #{namespace.inspect}"

      test do
        assert(namespace == control_namespace_constant)
      end
    end
  end
end
```

11. Assert against an explaining variable, a named local whose name states what is asserted, not against an inline expression.
12. The explaining variable holds the result of actuating the concern.
13. Actuate first, bind the result, then assert it.
14. The shell of the cradle is the actuation and its unnamed assert.
15. Once the shell is implemented, leave the test unnamed through the rest of the feature's development.
16. Name the test only at the end of the feature.
17. Add the outcome `context` each observation establishes at that time, giving the test-structure rule's "one inner `context` per outcome" structure.
18. This naming step is the seam where the next feature begins.
19. A feature in progress carries bare unnamed asserts. A finished feature carries named outcome contexts.
20. The first gate's hinge is the actuation's shape and the truth of the one observation, not how outcomes are named or divided.
21. Before writing the file, settle the actuation, the observation, and the controls.
22. Do not write the implementation in the first turn.
23. Do not pause to run the inevitably-failing test.
24. The human accepts the first turn's content in separate hinges: actuation, then observation, then controls.
25. The implementation is the fourth hinge.
26. The naming is the fifth hinge, at the feature's close.
27. Propose each hinge and get it accepted before the next, per the the-hinge-cycle-runs-from-actuation-to-naming rule.
28. Do not present the whole test file for a single accept.
29. Settle the three test hinges first, then assemble and show the file.
30. The exception to points 28 and 29 is when the engineer chose unattended work at the start, per the attended-or-unattended-is-chosen-when-the-work-is-started rule.
31. **Why:** Writing the actuation before any implementation designs the interface from the use site, per the DBE-as-design-tool rule. Limiting the first gate to the actuation and one unnamed assert avoids committing early to an outcome taxonomy. The explaining variable makes the test read as a statement of the concern and keeps the efferent view in frame.

## History

Until Sun Oct 25 2026 this rule was named dbe-first-turn-test-file and titled "DBE, first turn: the first gate is the actuation and an unnamed assert".

Related:

- the DBE-as-design-tool rule
- the test-structure rule — the grown form
- the folder-mirroring rule
- the what-each-hinge-displays rule
- the actuation-gate options-or-chat rule
- the `control_` test-variable prefix rule

---

Authored by Scott Bellware on Sat Jun 20 2026 at 11 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:05:45 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:37:36 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:47:26 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 9:04:18 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:26:52 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 8:35:02 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:38:25 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
