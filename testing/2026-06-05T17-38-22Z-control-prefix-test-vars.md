# control_ prefix for control-built test values

In test code, a local variable that holds a value built by a control (anything from `Controls::*`, e.g. `Controls::Constant.example(...)`) is named with a `control_` prefix — `control_value`, `control_inner_constant_names`, and so on. The prefix marks the value as control-produced.

**Why:** Consistency with the existing tests (which already use names like `control_inner_constant_names` / `control_inner_constant_name`) and to make it obvious at a glance which values originate from controls. Reinforces that these helpers are controls.

**How to apply:** When writing or editing a test, prefix any local bound to a control's output with `control_`. Don't name it bare (`value`, `name`, etc.). Related: the "sent to" phrasing rule.
