# Assert error-message content only when it is the sole way to confirm the correct error

Assert an error's **message content** only when the message is the **only** way for
the test to determine that the **correct error was raised under the expected
conditions**. Otherwise, do not assert the message.

In the ordinary case, `assert_raises(SomeClass)` plus the test's condition setup
already determines that the right error was raised: the class identifies the failure,
and the actuation's setup fixes the condition. A message assertion there tests
**presentation** (the wording), not **behavior** — and couples the test to the exact
string, so a harmless reword breaks it.

**The one situation where the message is the sole discriminator:** the **same error
class is raised from multiple sites reachable in the same execution path.** Then the
class alone cannot tell you *which* site raised — whether the error came from the
intended condition or from an incidental one earlier/elsewhere in the path — and only
the message distinguishes them.

**How to apply.** For each `assert_raises`, ask: *can this exact error class be raised
from more than one site along this actuation's execution?*

- **No → class + condition suffice; assert no message.** A coercion's lone `TypeError`
  (one `raise` site on the un-coercible path); a literal's `#get`, which always raises
  from a single line — the class and the condition already pin it.
- **Yes → the message is the discriminator; assert it (exact content).** A `::`-path
  `#get` recurses, so `Constant::Error` can be raised at the **head** segment (an
  undefined intermediate) *or* the **tail** segment (the final undefined name) — same
  class, different sites in one execution; the message (which name, which namespace) is
  what confirms the failure is the intended one. Likewise a mid-path **literal**: the
  same `Constant::Error` can come from the module's "not defined" site *or* the
  literal's "primitive value" `#get` site — only the message tells them apart.

**Why:** this keeps error tests about error *correctness* (was the right failure
raised under the right condition), not error *presentation*. It is the same line the
import-define-audit drew — library-specific error classes are "self-evidently the right
failure and need no message" — made into a precise, testable criterion. Related: the
"TDD designs, coverage protects" rule and the say-protect rule.
