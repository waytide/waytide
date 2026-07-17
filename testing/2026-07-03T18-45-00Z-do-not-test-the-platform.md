# Don't test the platform — a transparent pass-through has nothing of ours to pin

Test the library's **own** behavior and decisions, not the language or framework it
sits on. When a unit is a **transparent pass-through** to a platform primitive — it
adds no branch, guard, normalization, or policy of its own on that path, just forwards
to the primitive — then its behavior on that path **is** the platform's, and a test
there tests the platform, not the library.

**The signal.** If you can only state the expected behavior in terms of the underlying
primitive's guarantee ("`const_set` overwrites an existing constant"), and the unit
contributes nothing of its own on that path, there is nothing of *ours* to protect — so
write no test.

**Worked example.** `Constant::Define.(name, dest, value)` is `dest.const_set(name,
value)` (plus a module default when no value is given). Its **redefinition** behavior is
therefore `const_set`'s — overwrite, with Ruby's "already initialized constant" warning
— verbatim (proven identical to a bare `const_set` and to literal `X = 1; X = 2`
reassignment). Having *decided* that `Define` stays transparent to Ruby on redefinition
(imposes no policy), there is no library redefinition behavior; a "redefinition replaces"
test would merely assert that `const_set` overwrites — i.e. test Ruby. So: no test. The
resolution is the *decision* (transparent), not a test.

**The contrast — what IS ours.** The moment a unit adds a policy, that policy is the
library's and must be tested, because it is a **decision**, not the platform's behavior:
`Define`'s module default (`instance_of?(::Module)`), the coercion's acceptance of
Symbol names, a guard that raises, a normalization, a suppressed warning. Those are
protected; the bare forwarding underneath them is not.

**Why:** tests exist to protect the library's design and decisions. Testing the platform
adds noise, couples the suite to language internals, and gives false confidence that
"we" are covered when nothing of ours ran. Related: the "TDD designs, coverage protects"
rule and the assert-error-message-only-as-sole-discriminator rule (both are about testing
what actually discriminates *our* behavior).
