# plan — from ambition to first move, from scope to structure

**Fires when:** "we should build X", "I want to launch Y by November", "plan the migration", "break this down", "set up the sprint", "what would it take to…". Also when a **capture** turns out to be a plan wearing a brain dump's clothes.

**What good looks like:** for a vague ambition, the first concrete move, who owns it, and what it unblocks. For a real scope, a structure on the board — module or cycle, items with owners and dates that work backwards from the target — sized to the team, not to the ambition.

## Two different requests

**A vague ambition** ("we should do a podcast", "let's rebuild onboarding") gets *momentum*, not a plan. Return one first move that produces information (a spike, a draft, a call, a prototype), an owner, a date within a week or two, and what it unblocks. Create that one item. Note the ambition on a page or in the item's description so the thread is not lost. Do not create the twelve steps; they will be wrong by step three.

**A real scope** (a target date exists, or the person has enumerated the pieces, or a client signed something) gets *structure*. Read on.

## Structuring real scope

1. **Find the target.** A date, a launch, a demo, a contract milestone. If none exists, ask once whether there is one, because everything below depends on it. If there truly is none, plan in appetite: how much time is this worth, and stop there.
2. **Name what done looks like** in one sentence, on the container's description. Fixed time, variable scope: the date holds and the scope flexes, unless the principal says the opposite.
3. **Choose the container.** Cycles when the team runs sprints (put the work in the current or next cycle; create the next one if it does not exist, on the same cadence as the last). Modules for a body of work with its own window (a campaign, a client phase, an epic). Both when the work is a module delivered across several cycles. A solo developer usually wants neither; a parent item with children is enough.
4. **Enumerate the work backwards from done**, coarse first. Five to twelve items is normal; more than that and you are writing tasks, not work. Each item: sharp title, a description that says what done looks like, an owner where the conversation or the module's history makes one obvious, priority relative to its siblings.
5. **Wire the dependencies** that actually constrain order (`blocked_by`), especially anything external: review, legal, procurement, a third party, an approval. Relations are permanent; wire only what you are sure of.
6. **Backsolve dates.** From the target, through the chain, with slack on external steps. Set `target_date` on each item. Say the last safe start date for the whole thing out loud. If it is already past, say what gets cut first.
7. **Check load.** If one person now owns everything, say so and propose a split (see `rebalance.md`).

## Sizing to the team

- Solo developer: parent + children, no ceremony, dates only where a real deadline exists.
- Small team: a cycle or a module, items with owners, dates from the window.
- PM: module with a launch checklist item that lists the non-engineering work (docs, announcement, support brief, metrics), because that is what gets forgotten.
- Marketer: campaign module; each asset an item with its approval steps as `blocked_by` chain or a checklist; go-live as the target.
- Sales: a proposal is an item with a buyer-set date; the pieces (pricing, legal review, deck) are children, and legal review is the step that cannot absorb a late start.
- Agency: a phase per module; acceptance as the last item; the client's review turnaround as explicit slack.
- Enterprise: the plan is also a record. A page with scope, assumptions, risks and the decision log, linked from the module; items with the approvers named.

## Do not

Do not create structure for its own sake. Do not create a cycle in a project that has never used one without saying so as a clause. Do not set dates you derived from nothing; leave them empty and say why. Do not write the plan as a wall of text in one description; the board is the plan.

## Reporting back

> Set up "Apple Pay launch" as a module in Payments, window 8 Sep to 3 Oct. Seven items, four on you, two on Priya, one unowned (Stripe contract amendment; that's legal, and it's the one that can't start late: last safe start is 12 Sep). Dependencies wired from the amendment through the webhook work to the launch. First move is the amendment; want me to put it on Marco and draft him the ask?
