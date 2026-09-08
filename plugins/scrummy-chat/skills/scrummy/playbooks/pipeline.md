# pipeline — deals, follow-ups, buyer deadlines

**Fires when:** the workspace has a project whose items are deals, leads or proposals, and the principal talks about calls, prospects, follow-ups, proposals, closing, or "where are we with <company>". The board is a CRM by another name.

**What good looks like:** no thread is ever dropped. Every deal has a next action with a date and an owner. After a call, the deal reflects what was said without the salesperson typing anything. The pipeline brief says what moved, what is stuck, and what closes this month.

## The model

- A **deal** is a work item. Its title is the account and the opportunity ("Acme — analytics platform, 3-yr"). Its description holds the essentials: contact, value, stage entry dates, what they are buying and why.
- **Stages** are the project's states. Read them by group: backlog and unstarted are early stages, started is active selling, completed is won, cancelled is lost. If the project's states do not look like a pipeline, work with what exists and offer to set up stages once, as a clause.
- **Next action** is the `target_date`, and the last comment says what it is. A deal without a next action is a deal that is quietly dying.
- **Buyer-set deadlines** (RFP due, budget cycle closes, contract expiry) are external and go on the item as dates or as a child item with the date, and they cannot absorb a late start.
- **Labels** for source, segment, or size, if the team uses them.
- **Links** for the proposal, the deck, the contract.

## After a call (this is most of the job)

The principal says "just got off with Acme, they want a pilot first, pricing is fine, legal wants a DPA, follow up Thursday". You:

1. Find the deal (`search_work_items` on the account name).
2. Comment: what they said, objections, who was on the call, what was agreed, attributed and dated.
3. Set the next action: `target_date` Thursday, and the comment names it ("Send pilot proposal + DPA").
4. Move stage if the call moved it (proposal → negotiation).
5. Create children for internal work the deal now needs (DPA from legal, pilot scoping from product), with owners and dates that back off from the follow-up.
6. Draft the follow-up message in the principal's voice. Show it. Send only on a go.

## The pipeline brief

By stage: count, value if the descriptions carry it, what moved this week, what is stuck. "Stuck" means untouched longer than the stage's normal dwell (infer from the project's history; a week in proposal is normal, a month is not). Lead with what closes this month and what needs the principal personally.

## Quiet failures, sales edition

- Next action date passed, no activity.
- Deal in one stage far longer than the others took.
- Buyer deadline within two weeks and the internal chain (pricing, legal, security questionnaire) not started.
- A prospect who has gone quiet after a proposal, with no scheduled touch.
- Won deals with no handoff item to delivery.

## Never without asking

Send anything to a prospect. Mark a deal lost. Change a price, a term or a date in a proposal description. Create a deal for a name mentioned in passing.

## Reporting back

> Acme updated: pilot-first, pricing accepted, DPA needed. Next action Thu 11 Sep (pilot proposal + DPA), on you. Created two children: DPA draft on Karan (legal, due Tue; that's the step that can't slip), pilot scope on Priya (due Wed). Stage → Negotiation. Follow-up draft to Acme is below. Also: Northwind has had no touch in 16 days since the proposal; want a check-in draft for them too?
