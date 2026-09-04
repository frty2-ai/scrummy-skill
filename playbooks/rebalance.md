# rebalance — load, delegation, the leak

**Fires when:** "who's idle", "who has capacity", "what's on my plate that shouldn't be", "can someone else take this", "we're overloaded", after a **capture** or **plan** that put a lot on one person, or whenever a load view would change the principal's day.

**What good looks like:** one specific handoff, proposed with a name and a reason, ready to execute. Not a chart of everyone's workload.

## The load view

`list_members` for the project (or workspace members across the projects in play), `list_work_items` with assignees expanded, then count open items per person, weighted by priority and nearness of date. Note:

- who has nothing open (capacity, not a neutral fact);
- who has more started than they can plausibly finish (too much in flight);
- who has been quiet — no activity on their items in the window (`list_work_item_activity` on a sample);
- what is unassigned with a near date;
- what is on the principal.

## The leak

For each item on the principal, ask: does this need their judgment, their signature, or their relationships? If not, it is execution, research, chasing or drafting, and it is a candidate to move.

Match a candidate to a person by their recent history in that project or module (who touched neighbouring items), not by who is emptiest. Someone who has never worked in Payments is a worse owner for a Payments item than someone with two open items there.

Offer the smaller version too: when an item cannot move whole, propose adding the context (a comment, a link, a sharpened description) that would let it move later.

## Idle capacity

Someone with nothing open while the backlog is not is a proposal waiting to be made: this person, this item, because of this history. One proposal, not a list.

## Overload

Someone with eight started items is not being productive; they are paying context-switching tax. Propose what they finish first and what goes back to the backlog or to someone else. Do not move their items without a go; it is their plan you are changing.

## Executing a handoff

On a yes: read the item, merge the assignee list (list fields replace), `update_work_item`, then `add_comment` with the context the new owner needs and who handed it over. Draft the note to the new owner if the team communicates outside the board. Send only on a go.

## Persona notes

- **Founders:** the leak is the whole game. Expect half of what they hold to be movable.
- **Agencies:** load spans clients; a person at capacity across three projects is invisible from any one project. Look across.
- **Enterprise:** roles are formal. Propose within role; say when a handoff needs a manager's decision.
- **Solo developers:** there is nobody to hand to. Rebalance means: which project gets the week, which get parked, said explicitly so the parking is a decision rather than neglect.

## Reporting back

> Nine of your fourteen open items are execution: drafting, chasing, research. The one that moves cleanest is PAY-44 (vendor comparison); Priya did the last two comparisons in Payments and has one open item. Marco has nothing open and PAY-51 has been waiting on him for a decision, not work; that's a nudge, not a handoff. Want me to move PAY-44 to Priya with the context from your notes?
