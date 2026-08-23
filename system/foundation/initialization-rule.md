# Initialization

Print the things below, verbatim and in this order. Four are always printed and the fifth is
printed only where the project has declared a package set. Print them **once per session, at the
head of the response that carries the rule read**. They go above any account of the read, and
above every tool call the read makes.

**This rule file is opened ahead of every other**, which is what puts them in hand.

First the title and the description, on consecutive lines with no gap between them. The
description is italicized and the title is not:

```
Waytide: Human-Agent Relations
*Agent harness and ally*
```

**Then the package set, where one is declared**, after one blank line. It goes here rather than
lower because it says what this session is running, and that belongs beside what the system is
called rather than after the license. Where no set is declared, nothing about a set is printed and
this item is absent entirely — no line saying there is none.

The declaration is supplied by the read instruction, which is what reaches the agent before any
file is opened. See the a-project-declares-its-package-set rule for where the record lives and what
it carries.

```
package set: content

**design-by-efferent**, **foundation**, **git**, **journal**, **language**, *testing*,
**versioning**

**on**  *off*
```

**The set is named in the engineer's own wording** — `package set: content` — rather than in a
restatement of it. It is what they type to declare one, and the line that reports it says the same
thing back.

**Every installed package is listed, active in bold and deactivated in italic**, in the order the
notice lists them. None is omitted and none is replaced by a count: the engineer is being told what
the project holds and which half of it is in force, and a count of the deactivated ones would
answer neither question.

**The legend follows on its own line** and carries no words but the two. It is there because bold
and italic are a convention the reader has not agreed to, and two words fix it at the cost of one
line.

Then **one blank line**, then the copyright notice and the license line, on consecutive lines
with no gap between them:

```
Copyright © 2026 Scott Bellware
Licensed under the Eventide Common Interest License
```

Then **one blank line**, then the loading line:

```
Loading Waytide will take a few moments.
```

Then **one blank line**, then the block:

```
     __      /
    /  \    /
   |    |  /
    \__/  /
      | =/=
     _|_/
    / |
     / \
    /   \
   /    /
===========
    | |
  __|_|__
 (o)   (o)
```

**Each gap is one blank line, and a larger one is not available.** There are three — after the
description, after the license line, and after the loading line — and a fourth after the package
set where one is printed. With no gap at all a block reads
as a caption attached to what follows, or as its first line, so a separation is needed.

A wider one cannot be
had. The agent's output is **rendered as markdown**, and markdown collapses any run of blank lines
between blocks into a single paragraph break. Writing two or three produces exactly what writing
one produces. Specifying a count that cannot be observed would be a rule nothing can comply
with or violate.

**The block sits in a fenced code block and the notice does not.** The fence is what preserves the
figure's spacing. The notice is ordinary prose and reads as prose. That difference is also why the gap between them is the renderer's paragraph break rather than a count of lines. They are two kinds of thing, and the break between them is whatever separates a paragraph from a code block.

**A wider gap is achievable only by giving something up**, and neither cost is worth it. Putting the notice inside the fence with the block would set it in monospace and make it part of the figure. Separating them with lines carrying an invisible character would put marks in the output whose purpose no reader could see.

**These are the whole of what is printed there.** Nothing else accompanies them — no greeting, no
account of what is about to be read, no name for the block itself. The package set is the one item
that is not always present, and its absence is the ordinary case rather than an omission.

**The loading line says what the wait is.** Everything printed here appears at the head of
the response that then opens every rule file in every installed package. That is a wait an
engineer sees. The line names it rather than leaving a pause unexplained. It is the only one of the
four that is about the moment rather than about the work.

**It repeats the session-start notice's caveat deliberately, and the two are read at different moments.** The notice says *Loading the rules will take a few moments* **before** the engineer types `load waytide`. It is one of the two facts they weigh in deciding to type it. This line is
read **after** they have, while the wait is happening.

The first informs a decision. The second
explains a pause. Duplication that has cost this system elsewhere was one fact stated twice for
one reader. This is one fact stated to a reader in two different positions, and removing either
leaves that position uncovered.

**It says *Waytide* rather than *the rules*.** The notice can say *the rules* because its
preceding line has just named the system. This line stands with a title, a copyright, and a
license above it and a figure below, none of which is a sentence. So it names its subject itself.

**The title leads.** It is therefore the **first text of the read**, which the
announce-waytide-at-session-start rule permits unchanged. That rule requires the response opening
this file to carry no prose, so that *what this rule carries* comes first. The title is part of
what this rule carries.

**The title is the category line and the line under it is the formulation.**
*Waytide: Human-Agent Relations* was settled as the category line on 2026-08-03, and *Agent
harness and ally* is the formulation, first settled the same day and shortened on 2026-08-23. The root `README.md` leads
with the two, and this display prints the same pair, so the system says one thing about itself
wherever it is met.

**The formulation is not the generalized description**, which is the four-sentence paragraph
*A Generalized Description of Waytide* settled on 2026-08-20. That paragraph says what Waytide
does. This line says what Waytide is to the two parties, in four words, and it is short enough to
stand under a title. This rule attributed the line to that aspiration until 2026-08-21, which
named the wrong record.

**The ally is named without a qualifier, as of 2026-08-23.** The word in front of it took three
revisions: *engineer ally* on 2026-08-03, *human ally* the same day because *human* pairs with
*agent* as a kind of entity rather than a role, and *engineer ally* again on 2026-08-21 once the
`language` vocabulary reserved **engineer** for the person the work is done with and for.

**Dropping it settles the question rather than answering it a fourth time.** *Ally* stands as a
bare noun beside *harness*, which is also bare, and the line no longer has to name which word for
the non-agent party is the right one. What it gives up is that the pairing is no longer stated —
the harness is the agent's and the ally is the engineer's, and the shortened line leaves a reader
to see it. Three revisions of the qualifier are what argue it can be left to them.

**They name the work, which is why the copyright line no longer does.** That line read
`Waytide — Copyright © 2026 Scott Bellware` until 2026-08-21, because a notice printed with no
surrounding prose had nothing to attach itself to. The title now stands above it and names the
work outright, so the copyright line carries the owner and the year alone.

**The description is italicized and the title is not.** The two are a name and a gloss on it,
and the emphasis is what separates them where no blank line does. Italics are available here
because the agent's output is rendered as markdown. They are **not** available on the
session-start notice, which the harness renders literally — the announce-waytide-at-session-start
rule records what that cost when the notice's own markup reached the engineer as asterisks.

**This surface is where a standing statement belongs, and the notice is not.** A line that never
changes stops being read, which is this system's own argument against a permanent segment on the
session-start notice. That notice reports what is installed and what is open, and its content
moves. This display prints a copyright and a license that never move, once per session, at the
one moment the system is announced as itself rather than used. A statement of what the work is
sits with them rather than against them.

**The license line sits directly under the copyright, with no blank line between them.** The two are one statement about the work. Who owns it, and on what terms it may be used — and a bare copyright answers only the first while raising the second. For a work distributed by copying its
files into other people's repositories, the terms are the question a reader actually has.

**The gap falls after the license line, never between it and the copyright.** It separates the
whole statement, the copyright and the terms together, from what follows. It does not split the
statement in two. The gap above the copyright does the same work for the title and the
description, which are one statement in the same way.

**What the printed line is for, and what it is not.** It **points**. The `LICENSE` file **states**.
A copy of that file sits at this repository's root and in every package directory. So it travels
into each component repository and into every project that installs a package. That is where the
license is read. The printed line does not carry terms and is not the place to put them.

**The year is the year of the notice, not of the session.** It is written into this rule and is
printed verbatim, so it does not track the clock and is not computed. It changes when the rule
changes.

**Why:** the block stands for the system being brought into force in this session. So it is
printed at the moment the rule files are opened, the one moment only the agent is present for.
The notice sits there for the same reason. It is the one moment in a session where the system
is announced as itself rather than being used. A copyright notice belongs on the work at the
point the work is presented, and so does the work's own name and what it is for.

**How to apply:** read this file ahead of every other rule file. At the head of the response
carrying the rest of the read, print the title. Put the italicized description on the next line.
Then one blank line, then the copyright notice, then the license line on the next line. Then one
blank line, then the loading line, then one blank line, then the block.

Print all of it verbatim and in that order. Print no other words with any of them. Print them once per session and
never again. There is no condition under which they are withheld.

---

Authored by Scott Bellware on Wed Aug 5 2026 at 10:47:28 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:08:06 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:30:57 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:44:36 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 4:53:15 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 4:57:42 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 4:59:06 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 5:06:41 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 5:08:51 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 5:11:06 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 6:05:55 PM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 10:51:50 AM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:34:58 PM PT
Changed by Scott Bellware on Fri Aug 21 2026 at 11:25:15 AM PT
Changed by Scott Bellware on Fri Aug 21 2026 at 11:39:17 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:09:40 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 4:22:15 AM PT
