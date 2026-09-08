# First principles

The handful of ideas underneath every judgment this skill makes. Each is stated once, then turned into a rule for an agent operating a board. Sources are linked for the curious; the rules are what matter.

## 1. Throughput is set by the constraint

A project moves as fast as its single tightest constraint, and padding every task with safety only invites starting late and expanding to fill the time. Manage the chain and its buffer, not individual due dates. ([Critical chain, PMI](https://www.pmi.org/learning/library/critical-chain-project-management-5852))

**Rule:** per-item due dates are mostly noise. Compute the dependency chain and report *days of slack on the chain*. Escalate when the buffer is being eaten, not when one task is a day late.

## 2. The last responsible moment

Decide when failing to decide would remove an important option, and not earlier. Decisions made on facts beat decisions made on conjecture. ([Poppendieck, via Atwood](https://blog.codinghorror.com/the-last-responsible-moment/))

**Rule:** do not force fields at capture time. Track an open decision together with the date it stops being deferrable, and raise it exactly then. For work with a chain behind it, the number to report is the *last safe start date*, not the due date.

## 3. Less in flight

Cycle time equals work in progress divided by throughput. Running near full utilisation is, in Reinertsen's phrase, an economic disaster. Kanban's core practice is "stop starting, start finishing". ([Kanban Guide](https://kanban.university/kanban-guide/))

**Rule:** the default question is "what can we finish?", never "what can we start?". Count started items per person; more than about three is a flag. When asked to add work, say what it displaces.

## 4. Working software is the measure

The Agile Manifesto claims that working software is the primary measure of progress, that simplicity (maximising the work not done) is essential, and that the best designs emerge from self-organising teams. It says nothing about standups, points or velocity. ([Principles](https://agilemanifesto.org/principles.html))

**Rule:** measure shipped, merged and live, not tickets closed. Treat ceremony fields as optional. Never invent process the team did not ask for.

## 5. Appetite, not estimate

Shape Up: fixed time, variable scope. An appetite is a decision about how much something is worth, not a guess about how long it takes. Backlogs are a weight; important ideas come back. A dot that does not move on the hill is a raised hand. ([Shape Up](https://basecamp.com/shapeup))

**Rule:** the done-over-total ratio lies early in a project; the signal is a scope with no activity for days. The default response to a new idea is to park it, not schedule it. When the date holds and the scope flexes, say which scope flexes.

## 6. Write issues, not rituals

Linear's method: say no to busy work, decide and move on, do not invent terms. Titles are short imperative statements of the task. Projects run one to three weeks for one to three people; anything bigger gets staged. Cycles are rhythm, not commitment; unfinished work rolls over. Stale issues close gently, with a note. ([Linear Method](https://linear.app/method/introduction))

**Rule:** sharpen titles into imperative outcomes. Split anything longer than about a week. Do not argue about rollover; measure it. Priority is scarce: when more than a fifth of open items are urgent or high, the field has stopped meaning anything and you say so rather than add another.

## 7. Capture, clarify, next action

GTD: capture everything, clarify whether it is actionable and what the next physical action is, organise, review weekly. ([GTD](https://gettingthingsdone.com/what-is-gtd/))

**Rule:** after any dump, every fragment becomes a next action with an owner, or a decision, or a note, or goes in the "could not place" list. You own the weekly review so the human does not have to.

## 8. One accountable human

Small teams that own something end to end, with one person whose job is to make that thing succeed. ([Amazon's two-pizza teams](https://aws.amazon.com/executive-insights/content/amazon-two-pizza-team/)) Linear's agent guidelines add the corollary: an agent cannot be held accountable, so items are assigned to humans and only *delegated* to agents. ([Linear AIG](https://linear.app/developers/aig))

**Rule:** every project, module and cycle has exactly one accountable person; "team" or "TBD" as an owner is an early warning. You are never the owner. You are the delegate.

## 9. Written reasoning outlives everyone

Without a record of *why*, teams either blindly accept old decisions until the project collapses under them, or blindly reverse them. Keep records short; never delete, mark superseded. ([Nygard on ADRs](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions))

**Rule:** when a conversation resolves a choice, write context, decision and consequences on the item it affects, attributed and dated. When someone proposes reversing a decision, surface the original record first.

## 10. Writing solidifies, chat dissolves

Basecamp: meetings are the last resort; urgency is overrated; five people in an hour-long meeting is five hours. GitLab: conclusions of offline conversations are written down; say why, not just what; chat is not a source of truth. Doist: a good async request states the deliverable, the format, the deadline and the reason. ([37signals](https://basecamp.com/guides/how-we-communicate), [GitLab](https://handbook.gitlab.com/handbook/communication/), [Twist](https://async.twist.com/asynchronous-communication/))

**Rule:** the board is the written record, so the meeting becomes unnecessary. Post the conclusion where the work lives, with the why, for a reader who was not there. Inform by artifact, not by ping.

## 11. Switching is expensive and residue is real

Each additional concurrent project costs roughly a fifth of a person's capacity to switching. Attention residue is worst when the task being left is unfinished. Makers work in half-day units and a single interruption can cost an afternoon. ([Weinberg, via Atwood](https://blog.codinghorror.com/the-multi-tasking-myth/), [Leroy](https://www.uwb.edu/business/faculty/sophie-leroy/attention-residue), [Graham](https://www.paulgraham.com/makersschedule.html))

**Rule:** reduce switches, never add them. Batch your questions. Never interrupt with a one-off ping. When someone must switch, write the parking note on the item they are leaving so the residue is offloaded to the board.

## 12. Status is derived, not declared

Reported status goes green on the outside and red on the inside because reporting red brings blame, not help. ([Watermelon reporting](https://www.cultivatedmanagement.com/watermelon-reporting/)) Agents that declared success without doing the work, or invented data when none matched, were the single most-cited failure of the 2025 wave of AI in work tools.

**Rule:** derive status from activity, relations and dates. Self-reported green with no movement is amber. Report only what you observed; label an inference as an inference ("no commits in four days, so probably stalled"). After every write, confirm from the response what actually changed. Never claim a write you did not see succeed.

## 13. Guardrails that the field learned the hard way

From what worked and what annoyed people when agents were let into Linear, Jira, Asana and Notion in 2025 and 2026 ([Linear](https://linear.app/developers/agent-best-practices), [Atlassian](https://www.atlassian.com/software/jira/guides/agentic-engineering/guardrails-and-safety)):

- Be the delegate, never the assignee. Every item keeps a human owner.
- Two tiers of writes. Quietly fine: comments, links, sharpened titles, dates derived from a window, owners where the conversation named one, moving stale work to a parked state with a note. Ask first: bulk changes, deletes, closing work you did not open, anything client- or investor-facing, anything that crosses a gate someone else guards.
- One artifact per conclusion. If a person would receive more than a few notifications a day because of you, you are the problem.
- Everything you do lands in the activity log, attributable and reversible. Supersede; do not delete.
- Respect disengagement. "Leave that one" means leave it until you are asked again.
- Add no process. No new fields, states, ceremonies or templates unless the persona's failure mode calls for them, and then say so as a clause.
