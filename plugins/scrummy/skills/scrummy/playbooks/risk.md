# risk — what cannot absorb a late start

**Fires when:** "are we on track", "what's at risk", "when do I actually have to start X", "can we make the date", "what am I missing", and unprompted whenever a **capture**, **plan** or **brief** surfaces something with a chain behind it and a hard date ahead of it.

**What good looks like:** the one date that actually matters, said once, with the consequence attached, and the quiet failures nobody is watching, in a list short enough to act on.

## The last-minute model

Assume the principal starts everything late, and that this is usually fine. Your job is to know when it is not. Anything with one of these behind it cannot absorb a late start:

- a dependency chain (`blocked_by` that is still open);
- an external party (a vendor, a client, a regulator, a reviewer who is not on the team);
- a review or approval cycle;
- a legal, procurement, compliance, incorporation or contract step;
- a hard external date (a launch, an event, a filing, a contract milestone, a buyer's deadline).

For each, backsolve: the target date, minus the duration of each step in the chain, minus slack for every external step (days for a busy reviewer, weeks for legal or procurement). The result is the **last safe start date**. That is the number you report, not the due date.

If the last safe start is already past, lead with that, and with what gets cut or who has to be asked for an extension today.

## Quiet failures

These eat a week without appearing on any dashboard. Check them every time you are asked about risk and once per session anyway:

- **Start date passed, nothing moved.** `list_work_item_activity` shows no real change since the start date.
- **Near date, no owner.** An unassigned item due within two weeks.
- **Started long past plausibility.** In a started state far longer than its size warrants, with no activity.
- **Blocker owned by someone who does not know.** A `blocked_by` whose owner has not touched their item; they may not know they are blocking.
- **Review waiting.** In a review state for more than a day or two with no reviewer activity.
- **Cross-project dependency** nobody on either side is watching.
- **Cycle nearly over, most items untouched.** Not a slip yet; a slip next week.
- **A date that moved twice.** Look at activity for `target_date` changes; a date that has slipped twice will slip again, and the reason is usually not on the board.

## Saying it

Once, sharply, with the consequence. "PAY-49 has to start by Friday or Apple Pay misses the 3 Oct launch; legal takes two weeks and it hasn't been sent." Not "PAY-49 is at risk". Then stop. If they do nothing and ask again next week, say it again then; do not repeat it in between. Nagging becomes wallpaper.

Group quiet failures into one short list, ranked by consequence, with a proposed action on each line where one is obvious.

## Persona notes

- **Marketers:** every approval is an external step. The last safe *draft* date is usually the number they need.
- **Sales:** the buyer's deadline is the target; the internal steps (pricing sign-off, legal) are the chain.
- **Founders:** legal, incorporation, regulatory and fundraising items are the ones that cannot absorb a late start; everything else usually can.
- **Enterprise:** maintain a RAID view (risks, assumptions, issues, dependencies) on a page and update it from the board when asked; steering committees expect it, and "we flagged it on 4 Sep" is what the record is for.
- **Developers:** the risk is usually a review queue or an integration nobody has tried yet. Suggest the spike early.

## Reporting back

> One real one: the Stripe amendment (PAY-49). Legal takes about two weeks and it hasn't been sent; last safe start is this Friday, or Apple Pay misses 3 Oct. Three quiet ones: PAY-51 has sat In Progress for 9 days with no commits; PAY-55 is due 15 Sep with no owner; MKT-31 is waiting on Sam's review since Monday. Want me to send Marco the amendment ask today?
