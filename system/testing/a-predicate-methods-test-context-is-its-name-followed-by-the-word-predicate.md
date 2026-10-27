# A predicate method's test context is its name followed by the word "Predicate"

The `context` for a predicate method — a `?`-suffixed, boolean-returning method — is named by the method's name (without the `?`) followed by **"Predicate"**. So `defined?` → `context "Defined Predicate"`, not `context "Defined?"`.

Examples: `defined?` → "Defined Predicate", `valid?` → "Valid Predicate", and `empty?` → "Empty Predicate".

**Why:** The context names the *feature* under test. "Defined?" carries the method's punctuation and reads as a bare question. "Defined Predicate" names what the method **is**, a predicate on definedness. That is the literal, precise description, "predicate" being the exact term for a boolean-returning method. It also keeps the `?` out of a `context` label, where it would read as interrogative prose rather than a feature name. Consistent with the name-concepts-literally-not-by-analogy-code-or-jargon rule and the test-context-nesting conventions.

**How to apply:** When the unit under test is a predicate method `foo?`, name its feature `context` "Foo Predicate". Titlecase the name without the `?`, then append "Predicate".

## Compression

- Solubility 98, clarity 0.98 (2026-10-24)
- Compression 0.39, change 0.63 (2026-10-24)
- 3 directives, 3 kept, 0 less precise, 0 lost (2026-10-24)

Related:

- the test-context-nesting-mirrors-the-folder-hierarchy rule
- the start-a-test-name-with-is-only-for-a-value-equals-comparator-assertion rule
- the name-concepts-literally-not-by-analogy-code-or-jargon rule
