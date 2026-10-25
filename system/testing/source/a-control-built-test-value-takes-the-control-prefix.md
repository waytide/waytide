# A control-built test value takes the control_ prefix

- **Solubility:** 99
- **Original rank:** 106 of 106
- **Unclarity:** 0.00

In test code, a local variable may hold a value built by a control, meaning anything from `Controls::*`. Name it with a `control_` prefix, as in `control_file` and `control_response`. The prefix marks the value as control-produced.

**Why:** Consistency with the existing tests, which already use names like `control_file` and `control_response`. It also makes it obvious at a glance which values originate from controls. Reinforces that these helpers are controls.

**How to apply:** When writing or editing a test, prefix any local bound to a control's output with `control_`. Don't name it bare (`value`, `name`, etc.). Related: the "sent to" entry in the `language` vocabulary.

## Compressed

1. In test code, a control is anything from `Controls::*`.
2. Name a local variable that holds a control-built value with a `control_` prefix, as in `control_file` and `control_response`.
3. This applies whenever you write or edit a test.
4. Do not give such a local a bare name, such as `value` or `name`.
5. **Why:** The existing tests already use this naming, and the prefix shows at a glance which values come from controls. It also reinforces that these helpers are controls.

## History

Until Sun Oct 25 2026 this rule was named control-prefix-test-vars and titled "control_ prefix for control-built test values".

---

Authored by Scott Bellware on Fri Jun 5 2026 at 10 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Thu Oct 15 2026 at 4:46:47 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:33:43 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:32 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:26:19 PM PT
