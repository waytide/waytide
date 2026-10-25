# A control's string value starts with "some"

A control may hold a **string value**, meaning a literal value used as test input rather than a constant name. The string starts with **"some"**, as in `control_file = "some file"` and not `"a file"`. The word "some" marks it as an arbitrary placeholder value whose specific content does not matter.

This parallels the constant-name convention, where example names are `"SomeModule"`, `"SomeOtherModule"` (capitalized, because they are constant names). A bare string *value* is lowercase: `"some file"`, `"some other file"`.

**Why:** "some" signals "any value would do here" — the value is a stand-in, not significant. "a string" reads as a specific thing. "some string" reads as a placeholder, matching the `control_` prefix's intent (a known, set-up reference whose identity, not content, is what the test turns on). Consistent with the `Some…` naming already used for example constant names.

**How to apply:** Write `control_file = "some file"` (and `"some other file"`, etc.) for placeholder string values. Reserve specific string content only when the test actually depends on it. Non-string placeholder values (e.g. a number) are not covered — they have no "some" form.

## Compressed

1. A control may hold a string value: a literal used as test input, not a constant name.
2. The string value starts with "some", as in `control_file = "some file"`, not `"a file"`.
3. "some" marks the value as an arbitrary placeholder whose content does not matter.
4. A bare string value is lowercase: `"some file"`, `"some other file"`.
5. This differs from example constant names, which are capitalized: `"SomeModule"`, `"SomeOtherModule"`.
6. Write `control_file = "some file"` for a placeholder string value. Write each further placeholder in the "some other …" form, as in `"some other file"`.
7. Use specific string content only when the test actually depends on it.
8. Non-string placeholder values, such as a number, are not covered, because they have no "some" form.
9. **Why:** "some" signals that any value would do. That matches the `control_` prefix's intent, where the test turns on the value's identity, not its content.

## History

Until Sun Oct 25 2026 this rule was named control-string-value-starts-with-some.

Related:

- the `control_` test-variable prefix rule
- the controls-not-fixtures conventions

---

Authored by Scott Bellware on Mon Jun 29 2026 at 2 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:15 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:26:24 PM PT
