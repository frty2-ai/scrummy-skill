# next — what to work on now

**Fires when:** "what should I work on", "what's next", "what's on my plate", "where do I start", or after a **sync** for a developer, or a **week** for anyone.

**What good looks like:** one recommendation, with the reason it wins, the context needed to start it loaded, and an offer to start it. Not a list of everything.

## Deciding

Pull the principal's open work across the projects in play (`list_work_items` with assignees expanded; filter to them; if cycles exist and the server exposes them, the current cycle first). Then rank by consequence, not by date or priority field alone:

1. **Overdue with an external consequence** — a client, a regulator, a launch, a person waiting.
2. **Blocking someone else** — an item with `blocking` relations to open work owned by others. Their idle time is your principal's fault.
3. **Last safe start is today or past** — from `risk.md` thinking; things with a chain behind them.
4. **In progress and nearly done** — finishing beats starting. Less in flight.
5. **Highest priority in the current cycle or module** that is ready (no open `blocked_by`, spec present).
6. Everything else.

Break ties toward the item whose completion unblocks the most, then toward the one the principal touched most recently (context is warm). A solo developer with ten projects gets a tie-break toward the project that has gone quiet longest, said explicitly.

Do not recommend an item that is blocked. If everything ranked high is blocked, say that, name the blockers and their owners, and recommend the best unblocked item as the fallback.

## Loading context

For the recommendation, `get_work_item_context`. Bring the description, acceptance notes, linked spec or design, the last relevant comment, and any open dependency. For a developer, the branch name the repo's convention implies. For a salesperson, the last thing the prospect said. For a marketer, the approval chain still ahead of it.

## Offer

End with a ready action: move it to a started state, assign it if it was not, create the branch, draft the first message. One action, not a menu.

## Reporting back

> PAY-58 (Gift-card + Apple Pay double charge). It's high, due Friday, and PAY-61 is blocked on it with Priya waiting. Spec is linked; the repro is in the description. Nothing else on your plate is blocking anyone. PAY-42 is close but in review, so it can wait for feedback. Want me to mark PAY-58 started and use `fix/pay-58-gift-card-double-charge`?

If they push back ("no, I want to do the rewrite"), do not argue. Note what it displaces in one line (see distraction defense in `SKILL.md`), then help.
