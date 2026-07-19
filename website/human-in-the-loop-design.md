# Human-in-the-loop design

*Also called Design by Efferent (DBE) — "efferent" is explained below.*

You stay in charge of the design decisions that actually matter, while the AI does the generation. Not reviewing every line, and not approving everything the AI produces without really looking — your attention goes to the few choices the design turns on, and the AI generates the rest.

## The problem it solves

An AI can generate code quickly, but two things go wrong when you let it design:

- **It pulls toward the average.** The AI leans toward the average of all the code it has seen — and a lot of that code is mediocre. Worse, a single confident proposal drags *your* judgment toward that average too: shown one finished-looking answer, you tend to approve it. Left alone, you end up ratifying average work and calling it review.
- **The usual ceremony just gets in the way.** Red-green-refactor only ever existed to force a human to pay attention at each step. A test written before its code is *going* to fail — that failure teaches nothing. The ceremony is a stand-in for the thing you actually want: your attention on the decisions that matter.

## The main idea

Keep design judgment with the human; let the AI generate everywhere else. Put your attention on the handful of decisions the design genuinely turns on, and generate straight through the rest.

The whole method is one sentence: **the AI generates; the human deliberates.**

## Where judgment lives — the hinges

A **hinge** is a decision that is both:

- **Subtle** — it takes design judgment that isn't written down in the code or the tests, and
- **Load-bearing** — other work rests on it, so getting it wrong spreads through everything and is expensive to change later.

Two hinges are known (more are still being found):

- **The shape of the call.** How you invoke the thing *is* its interface — `upload.(file)` returning a result, and what that result is. This is the caller's-eye view of the unit, which the method calls its **efferent** shape (hence "Design by Efferent"). It's the most important decision in the whole feature, and it's usually one line. **You set it.**
- **Solubility — the result.** Whether the finished unit has *dissolved into its use*: usable, clear, as simple as it should be and no simpler. **You judge it.**

Everything else — the test scaffolding, the implementation body, running the test — is generation or checking, not a hinge. **The AI does it.**

## The loop

The loop stops at each hinge so you can decide, and runs straight through everything else. Stopping at a hinge is called a **gate**.

1. **You set the shape of the call** — the one line that says how the unit is invoked and what it returns.
2. **The AI writes the first test** — just the test file, against that shape, nothing more.
3. **The AI writes the implementation** to satisfy the shape, straight through — no red-green ceremony.
4. **You loop one outcome at a time** — each new behavior is its own small step, and you decide the next one.
5. **You stop when it's soluble** — when the unit reads cleanly and does exactly what's needed and no more. Not when a coverage number says you're done.

## What keeps it honest

- **Every decision is a real choice.** At a gate you're given options — or, when there's only one sensible path, a prompt to accept it — never a settled result. You always have the option to just dictate the answer or talk it through. The AI is not allowed to present a single pick as already decided.
- **No "passes on arrival" tests.** A test that's green the moment it's written drove no design — it's dropped, because its only job was to force a decision that never happened.
- **A deliberate guard against averaging.** Because a lone AI proposal quietly pulls your judgment toward the mean, the gates are built to make you *originate* — to produce the better answer, not pick the least-bad option from the AI's list.

## A worked example

> You're adding a way to upload a file and get a result back.
>
> - **You set the shape:** `upload.(file)` returns an `Upload::Result`. That one line is the decision everything else rests on — so it's yours, not the AI's.
> - **The AI writes the first test** against that shape.
> - **The AI fills in the implementation,** straight through, no ceremony.
> - **You take the outcomes one at a time** — the success case, then a rejected upload — deciding each, letting the AI generate it.
> - **You stop when the result reads cleanly** and does exactly what's needed. It's done because it's *soluble*, not because coverage hit a number.
>
> Along the way, when the AI offered to name the result variable something generic, that was a gate: you gave it the name that fits the domain instead. Small, but it's exactly the kind of choice that's yours to make.

---

*This method is the `design-by-efferent` package. It carries the loop, the gates, the "no green on arrival" rule, and the full vocabulary (hinge, gate, cradle, efferent, solubility, and the rest). It builds on `foundation`, `language`, and `testing`. See [Getting started](#) for installation.*
