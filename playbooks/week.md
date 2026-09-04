# week — review, close, retro, hygiene

**Fires when:** "weekly review", "close the sprint", "retro", "what shipped this week", "clean up the board", Friday afternoon, Monday morning, or the end of a cycle.

**What good looks like:** the board tells the truth again. What shipped is closed and credited. What slipped is carried with a reason. What is dead is gone or parked deliberately. The next week or sprint starts from a clean picture, and a five-line summary exists for whoever needs it.

## Looking back

From the board, for the window:

- **Shipped:** items that entered a completed state (`list_work_item_activity` or `-updated_at` and state group). Credit the owner.
- **Slipped:** items with a target date in the window that are not done. For each, the board's reason if it has one (a comment, a blocker); otherwise "no reason recorded", which is itself a finding.
- **Stale:** started items with no activity in the window.
- **Untracked:** work the conversation or the repo shows happened but the board does not (from `sync.md` for developers).
- **Decisions made** this week that are only in chat. Capture them now.

Say what you see, in the principal's register. A retro is a judgment, not a list: what pattern explains the slips (review queue, one overloaded person, scope growing inside tickets, a dependency nobody owned)? One or two patterns, not seven.

## Closing a cycle

If the project runs cycles: `list_cycles cycle_view=completed` for the one that ended, `get_cycle` for the counts. Carry-over is the number that matters; say it as a fraction and compare it to the last cycle if you can. Then `transfer_cycle_work_items` into the next cycle (create it on the same cadence if it does not exist), and comment on each carried item with why it slipped when the reason is known. Do not silently roll everything; if more than half the cycle is carrying over, the plan was wrong and the next cycle should be smaller. Say so.

## Hygiene

Propose, then do on a go, in one batch:

- close items the evidence says are done;
- assign owners to items with a near date and none;
- sharpen titles that will confuse someone in a month;
- set dates on started items that have none, derived from the cycle or module window;
- park or cancel items nobody has touched in a long time and nobody mentions (cancelled-group state, with a comment saying why), confirming first, since closing work you did not open is a decision.

Never delete. Cancel with a reason; the audit trail is the point.

## Looking forward

End with the shape of next week or next cycle: the goal in one line, the three items that matter most, who is at capacity, and the one risk to watch. Then the offer: set up the next cycle, move the items, draft the summary for the team or the client.

## Persona notes

- **Solo developers:** the review is also the plan: which projects get the coming week, which are deliberately parked. Write the parking down so it is a decision, not neglect.
- **PMs:** the cycle goal versus the cycle's contents; say what was in the cycle that did not serve the goal.
- **Sales:** pipeline movement: what advanced, what stalled, what died, what the coming week's follow-ups are.
- **Marketers:** what went live, what is scheduled next week, which approvals are still open ahead of those dates.
- **Agencies:** per client, and the acceptance status of anything delivered.
- **Enterprise:** the reporting period; the update is a record, so write it on a page as well as saying it.

## Reporting back

> Sprint 14 closed: 9 of 13 done, 4 carrying (two waited on the Stripe decision, one on review, one had no reason recorded). Carry-over is up from 2 last sprint; the pattern is the review queue, not effort. Moved the four into Sprint 15, which starts Monday with 11 items; that's already at last sprint's finish rate, so I'd not add more. Cleaned up: closed PAY-33 (merged Tuesday), gave PAY-55 to Priya, cancelled PAY-12 with a note (18 weeks untouched, nobody's mentioned it). Summary for the team is below.
