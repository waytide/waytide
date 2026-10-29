# The startup display prints once per session

**Trigger:** When the engineer types `load waytide`, or when changing the startup display or its script

The things below are printed once per session, verbatim. Four are always printed, in the order this file gives them. The fifth, the package set, is printed only where the project has declared one, and it prints after the other four, whatever its place in this file.

**The harness prints the four, and the agent prints none of them.** When the engineer types `load waytide`, a `UserPromptSubmit` hook runs `waytide/system/foundation/startup-display.sh`, which prints them as a `systemMessage`. An agent can skip a display it is told to print, or write it into its thinking, where it is not shown, and nothing reports either. A display the harness prints does not depend on the agent following an instruction.

**The package set is the one part the agent still prints**, at the head of the response that carries the rule read, because it is the one part that needs markdown. See below.

**The script reads the four from the fenced blocks of this rule's body, in its source file, by position.** It stops at the `## Compressed` heading, so the compressed text's blocks are not counted. The first, third, fourth, and fifth fenced blocks are the title, the copyright and license, the loading line, and the figure. The second is the package-set example, which the script skips. **Adding, removing, or reordering a fenced block in this rule's body changes what is printed.** The automated test `test/automated/startup-display.sh` compares the printed display with the expected text, and fails when the two differ.

**The display prints on `load waytide` and on no other prompt.** A session opened with any other request shows no display. That is the cost of the hook acting only on the exact command.

First the title, on its own:

```
Waytide: Human-in-the-Loop Harness
```

**It stands alone.** No subtitle or description is printed under it. What the system is belongs to the `README.md`, which a reader reaches deliberately. This display is read every session by someone who has read it before.

**The package set is described here, and prints after the display, where one is declared.** The agent prints it at the head of the response that carries the rule read, after the harness has printed the display. The display and the stanza come from two printers at two moments, so the stanza follows the display rather than sitting inside it. Where no set is declared, nothing about a set is printed and this part is absent entirely — no line saying there is none.

**The declared set `default` prints nothing, where nothing is deactivated.** `default` is the set a project gets by asking for no set at all, so a stanza reporting it says what the absence of a stanza already says, at the cost of four lines in a display printed every session.

**It prints where `default` leaves something deactivated.** A project can hold a package that `default` does not name — `ext/ruby-lang` is one — and there the set is not the whole of what is installed. The condition is that nothing is off, not that the name is `default`, and a suppressed stanza must never be the reason a deactivated package goes unmentioned.

**A named set other than `default` prints even where nothing is deactivated.** Its name is information about the project that the count cannot supply.

The declaration is supplied by the read instruction, which is what reaches the agent before any file is opened. See the a-project-declares-which-installed-packages-are-active rule for where the record lives and what it carries.

```
*design-by-efferent*, **foundation**, **git**, **journal**, **language**, *testing*,
*ext/ruby-lang*, **versioning**
package set: content
(5 active of 8 installed)
```

**The three lines carry no gap between them.** They are one stanza: what the project holds, what the set is called, and how much of it is in force.

**The list leads and the set's name follows it.** The packages are what the engineer is looking for and the name is what accounts for them, so the name reads as a caption under the thing it explains rather than as a heading over a list nobody has seen yet. It sits above the count for the same reason: the count is arithmetic on the list and closes the stanza.

**The set is named in the engineer's own wording** — `package set: content` — rather than in a restatement of it. It is what they type to declare one, and the line that reports it says the same thing back.

**Every installed package is listed, in the order the session-start notice lists them.** The active ones are bold and the deactivated ones are italic. None is omitted and none is replaced by a count: the engineer is being told what the project holds and which half of it is in force.

**The count line says how many, which the emphasis does not.** Eight names in mixed weight are read one at a time, and the count is read at once. It also states the total, which nothing else on the line does.

**A legend is not printed, and the count is why.** With the count naming five active and exactly five names in bold, the convention discloses itself by arithmetic, and a legend would spend a line saying what the reader has already worked out.

Then **one blank line**, then the copyright notice and the license line, on consecutive lines with no gap between them:

```
Copyright © 2026 Scott Bellware
*Eventide Common Interest License*
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

**Each gap is one blank line.** There are three — after the title, after the license line, and after the loading line. With no gap at all a block reads as a caption attached to what follows, or as its first line, so a separation is needed.

**The harness renders the display as plain text, so the lines print exactly as the blocks hold them.** A blank line is a blank line, and the figure keeps its spacing without a fence. One line is kept because one is what separates.

**The fences in this file are what the script reads, not what is printed.** They mark where each printed part begins and ends. They also keep the figure's spacing when this rule is read as markdown.

**These are the whole of what is printed.** Nothing else accompanies them — no greeting, no account of what is about to be read, no name for the block itself. The package set is the one part that is not always present, and its absence is the ordinary case rather than an omission.

**The loading line says what the wait is.** The display is printed when the engineer types `load waytide`, and the response that follows loads every installed package's rules. That is a wait an engineer sees. The line names it rather than leaving a pause unexplained. It is the only one at the head that is about the moment rather than about the work.

**It repeats the session-start notice's caveat deliberately, and the two are read at different moments.** The notice says *Loading the rules will take a few moments* **before** the engineer types `load waytide`. It is one of the two facts they weigh in deciding to type it. This line is read **after** they have, while the wait is happening.

The first informs a decision. The second explains a pause. Duplication costs where one fact is stated twice to one reader. This is one fact stated to a reader in two different positions, and removing either leaves that position uncovered.

**It says *Waytide* rather than *the rules*.** The notice can say *the rules* because its preceding line has just named the system. This line stands with a title, a copyright, and a license above it and a figure below, none of which is a sentence. So it names its subject itself.

**The title leads.** It is the first line of the display, and the display is printed before the agent's response begins, so nothing the agent writes can stand ahead of it.

**The display opens with a line break, so the title starts a line of its own.** The harness prints its own label ahead of a hook's message, as in `UserPromptSubmit says:`. Without the break, the title runs on from that label as though the two were one sentence. The break is the script's, and it is not a fenced block in this file.

**The title is the category line.** It is what this display prints and what the root `README.md` leads with, so the system names itself the same way wherever it is met.

**No description of Waytide is printed here.** What Waytide is and what it does live in the `README.md`. This display carries a name, a configuration, an ownership statement, and a wait — and nothing that argues for the system to a reader who is already using it.

**The title names the work, so the copyright line does not.** The title stands above it and names the work outright, and the copyright line carries the owner and the year alone.

**Emphasis is available on the package set stanza and nowhere else in this display.** The stanza's bold and italic work because the agent prints it, and the agent's output is rendered as markdown. The display the harness prints is plain text, as the session-start notice is, and markup there reaches the engineer as literal asterisks.

**This surface is where a standing statement belongs, and the notice is not.** A line that never changes stops being read, which is this system's own argument against a permanent segment on the session-start notice. That notice reports what is installed and what is open, and its content moves. This display prints a copyright and a license that never move, once per session, at the one moment the system is announced as itself rather than used. A statement of what the work is sits with them rather than against them.

**The license line sits directly under the copyright, with no blank line between them.** The two are one statement about the work. Who owns it, and on what terms it may be used — and a bare copyright answers only the first while raising the second. For a work distributed by copying its files into other people's repositories, the terms are the question a reader actually has.

**The line is the license's name alone, set in italics.** Leading words such as *Licensed under the* would say what the name's position under the copyright already says, and the name is what a reader looks for. A title, an owner, and a license name are three names.

**The block keeps the line in italics, and the display prints it without them.** The italics hold the license name apart from the copyright above it where this rule is read as markdown, so a reader of the rule sees it as emphasized. The harness prints plain text, so `startup-display.sh` removes the asterisks from a line wrapped in them rather than showing them.

**The gap falls after the license line, never between it and the copyright.** It separates the whole statement, the copyright and the terms together, from what follows. It does not split the statement in two. The gap above the copyright does the same work for the title above it.

**What the printed line is for, and what it is not.** It **points**. The `LICENSE` file **states**. A copy of that file sits at this repository's root and in every package directory. So it travels into each component repository and into every project that installs a package. That is where the license is read. The printed line does not carry terms and is not the place to put them.

**The year is the year of the notice, not of the session.** It is written into this rule and is printed verbatim, so it does not track the clock and is not computed. It changes when the rule changes.

## Compressed

1. Five parts are printed once per session, verbatim. Four are always printed, in this file's order. The package set is printed only where the project has declared one.
2. The harness prints the four always-printed parts. The agent prints none of them.
3. When the engineer types `load waytide`, a `UserPromptSubmit` hook runs `waytide/system/foundation/startup-display.sh`, which prints them as a `systemMessage`.
4. The display prints on `load waytide` and on no other prompt. A session opened with any other request shows no display.
5. The agent prints the package set, at the head of the response that carries the rule read.
6. The script reads the four from the fenced blocks of this rule's body, in its source file, by position. It stops at the `## Compressed` heading.
7. The first, third, fourth, and fifth fenced blocks are the title, the copyright and license, the loading line, and the figure.
8. The second fenced block is the package-set example, which the script skips.
9. Adding, removing, or reordering a fenced block in this rule's body changes what is printed, so the rule's sections stay where they are.
10. The automated test `test/automated/startup-display.sh` compares the printed display with the expected text. It fails when the two differ.
11. The fences mark where each printed part begins and ends. They are not printed.
12. First the title, on its own:

```
Waytide: Human-in-the-Loop Harness
```

13. The title leads. It is the first line of the display, and nothing the agent writes stands ahead of it.
14. The display opens with a line break, so the title starts a line of its own after the harness's label, as in `UserPromptSubmit says:`. The break is the script's, not a fenced block in this file.
15. The title stands alone. No subtitle or description is printed under it.
16. The title is the category line. The root `README.md` leads with the same line.
17. No description of Waytide is printed. What Waytide is and does belongs to the `README.md`.
18. The display carries nothing that argues for the system to a reader already using it.
19. The package set is described here, and prints after the display, where one is declared. The agent prints it after the harness has printed the display.
20. The stanza follows the display rather than sitting inside it.
21. Where no set is declared, this part is absent entirely. No line says there is none.
22. The declared set `default` prints nothing where nothing is deactivated.
23. The `default` set prints where it leaves an installed package deactivated, such as `ext/ruby-lang`.
24. The condition is that nothing is off, not that the name is `default`.
25. A suppressed stanza must never be the reason a deactivated package goes unmentioned.
26. A named set other than `default` prints even where nothing is deactivated.
27. The declaration is supplied to the agent by the read instruction, before any file is opened. The a-project-declares-which-installed-packages-are-active rule says where the record lives and what it carries.
28. The stanza takes this form:

```
*design-by-efferent*, **foundation**, **git**, **journal**, **language**, *testing*,
*ext/ruby-lang*, **versioning**
package set: content
(5 active of 8 installed)
```

29. The stanza's lines carry no gap between them.
30. The package list leads. The set's name follows it, above the count. The count closes the stanza.
31. The set is named in the engineer's own wording, as in `package set: content`, not in a restatement of it.
32. Every installed package is listed, in the order the session-start notice lists them.
33. Active packages are bold. Deactivated packages are italic.
34. No package is omitted, and none is replaced by a count.
35. The count line states how many are active and the installed total, in the form `(N active of M installed)`.
36. No legend is printed.
37. Emphasis is available on the package set stanza and nowhere else in the display.
38. The harness display is plain text, where markup reaches the engineer as literal asterisks.
39. Then one blank line, then the copyright notice and the license line, on consecutive lines with no gap between them:

```
Copyright © 2026 Scott Bellware
*Eventide Common Interest License*
```

40. The copyright and license belong on this display, not on the session-start notice. Any standing statement that never changes belongs here, not as a permanent segment of the notice.
41. The copyright line carries the owner and the year alone. It does not name the work.
42. The license line is the license's name alone, set in italics. It takes no leading words such as *Licensed under the*.
43. The block keeps the license line in italics. `startup-display.sh` removes the asterisks from a line wrapped in them, so it prints without them.
44. The gap falls after the license line, never between it and the copyright.
45. The printed license line points to the license. It does not carry the terms, and is not the place to put them.
46. The `LICENSE` file states the terms. A copy sits at this repository's root and in every package directory.
47. The year is the year of the notice, not of the session. It is written into this rule and printed verbatim.
48. The year is not computed. It changes only when the rule changes.
49. Then one blank line, then the loading line:

```
Loading Waytide will take a few moments.
```

50. The loading line says *Waytide* rather than *the rules*. It names the wait after `load waytide`, while the response loads every installed package's rules.
51. The loading line deliberately repeats the session-start notice's caveat. Neither statement is removed.
52. Then one blank line, then the block:

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

53. Each gap is one blank line. There are three: after the title, after the license line, and after the loading line.
54. The harness renders the display as plain text, so the lines print exactly as the blocks hold them.
55. A blank line prints as a blank line. The figure keeps its spacing without a fence.
56. These are the whole of what is printed. No greeting, no account of what is about to be read, and no name for the block accompany them.
57. The package set's absence is the ordinary case, not an omission.

## Compression

- 2026-10-24, compressed: compression 0.44, change 0.74, solubility 18 → 53, clarity 0.35 → 0.90, 56 directives, 55 kept, 1 less precise, 0 lost, after 3 repairs, re-checked kept; directive 40 less precise, judged immaterial
- 2026-10-25, revised: points 1, 14, and 18 take the new wording, that the package set prints after the display; not checked
- 2026-10-27, re-checked: 53 directives, 51 kept, 2 less precise, 0 lost, 2 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 53 → 52, clarity 0.90 → 0.90; checked: 46 directives, 46 kept, 0 less precise, 0 lost
- 2026-10-29, revised: the compiled rules are one file per package and the read runs the loader, solubility 52 → 52, clarity 0.90 → 0.90; checked: 51 directives, 51 kept, 0 less precise, 0 lost
- 2026-10-29, revised: point 12's title reads *Waytide: Human-in-the-Loop Harness*, as the body's does; not checked
- 2026-10-29, merge from master re-checked: 60 directives, 60 kept, 0 less precise, 0 lost, 0 repairs
- 2026-10-29, revised: master's line break ahead of the title is carried into the compressed text; not checked
- 2026-10-29, merge from master re-checked: 61 directives, 60 kept, 1 less precise, 0 lost, 1 repair

## History

The agent printed the four until 2026-10-10, at the head of the response that carried the rule read. Under a later model they stopped reaching the engineer: the agent skipped them, or wrote them into its thinking, and nothing reported either failure. That the harness renders blank lines and the figure's spacing exactly was confirmed in a session on 2026-10-10.

The formulation *Agent harness and ally* sat under the title until 2026-08-23, when it was removed — first to the end of the load and then from the display altogether.

The package set stood between the title and the copyright until 2026-10-10, because it says what this session is running.

The list carried `**on**  *off*` under it briefly on 2026-08-23.

*Waytide: Human-Agent Relations* was settled as the category line on 2026-08-03, and it was the title until 2026-10-28, when the engineer changed it to *Waytide: Human-in-the-Loop Harness*. The four-sentence paragraph *A Generalized Description of Waytide* was settled on 2026-08-20, and with the formulation it lives in the `README.md`.

The license line read `Licensed under the Eventide Common Interest License` until 2026-08-23. Its italics held the name apart from the copyright while the agent printed the display as markdown.

The copyright line read `Waytide — Copyright © 2026 Scott Bellware` until 2026-08-21, because a notice printed with no surrounding prose had nothing to attach itself to.

Until 2026-10-25 the rule said its parts print "in this order" and described the package set second, between the title and the copyright, while saying the agent prints the set after the harness's display. The title section said "Nothing is printed under it". The engineer settled that the order covers the harness's four parts, that the package set keeps its place in this file and prints after them, and that what the title excludes is a subtitle or description. The sections stay where they are, because the script reads the display's parts from this file's fenced blocks by position.

Until Sun Oct 25 2026 this rule was named initialization-rule and titled "Initialization".

Until Thu Oct 29 2026 the script read the display from this rule's compiled file, which held the body alone. When the compiled rules became one file per package, it began reading the source file, up to the `## Compressed` heading.

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
Changed by Scott Bellware on Sun Aug 23 2026 at 3:34:00 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:44:10 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:49:30 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:56:40 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:46:13 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:12:05 PM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 10:22:31 AM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:11:55 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:39:37 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 9:27:32 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 3:30:04 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:13:54 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:09 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 6:57:20 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 7:35:51 PM PT
