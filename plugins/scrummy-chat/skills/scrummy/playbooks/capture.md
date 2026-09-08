# capture — conversation into board state

**Fires when:** a brainstorm, design discussion, debugging session, meeting, voice-note transcript, or `dump:` just happened and the residue belongs on the board. Also when the user says "write that down", "make sure we don't lose this", or ends a long exchange with "ok, capture this".

**What good looks like:** the conversation can end. Nothing that mattered lives only in chat. The person reads five lines and knows what changed, what is new, what was decided, and what you could not place.

## Before writing anything

Re-read the conversation as an editor, not a stenographer. Most of it is not worth capturing: exploration that was abandoned, options that were rejected without a decision, thinking out loud. Capture the *residue*: what changed, what is new, what was decided and why, what is now a risk, and what someone else needs to hear.

Then orient in the workspace if you have not yet, and search before you create. Every proper noun, every title-ish fragment, every "the auth thing" goes through `search_work_items` first. Duplicates are the tax on lazy parsing.

## Sorting the residue

- **Changed** → an existing item gained scope, lost scope, moved, got an owner, got a date. `update_work_item`, and a comment saying what changed and why if the change is not self-evident.
- **New** → a unit of work that did not exist. `create_work_item`, fully populated in one call: sharp title, a description that says what done looks like, priority relative to its siblings (not inflated), owner if the conversation named one, dates derived from the module or cycle it belongs in. Put it in the module or cycle if one fits.
- **Decided** → a choice was made. `add_comment` on the item it affects: what was decided, who decided, in which conversation, what it rules out. If it changes scope or dates, make the matching update in the same batch. A decision without an item to hang on is a page entry (one living "Decisions" page per project, appended, not a new page per meeting).
- **Risky** → something could go wrong that nobody owns. Comment on the affected item, or create an item if it needs an owner and a date. Enterprise principals may want a RAID entry on a page.
- **Informs someone** → a teammate needs to know something they will not learn from the board on their own. Draft it: a comment that names them on the item, or a message for Slack, WhatsApp or email if those tools exist. Show the draft. **Never send without a go.**
- **Could not place** → a fragment you could not resolve to a project or an item, or a name that maps to two people. Keep a short list at the end. Not questions; a list.

## Granularity

One conversation rarely produces more than a handful of items. If you are about to create ten, stop: you are probably capturing a plan, not work. Capture the parent and the first two or three children; note the rest in the parent's description as a checklist. The person can split later. (See `plan.md` for real scoping.)

A brainstorm that produced ideas but no commitments is a page, not items. Title it by topic, not by date, so it can be updated next time.

## Persona notes

- **Developers:** a debugging session that ended in a fix belongs on the item as a comment (root cause, fix, what to watch), not as a new item. An architecture discussion becomes a page linked from the items it affects.
- **PMs:** decisions are the whole point. Every "we'll go with X" gets attributed and dated on the item.
- **Sales:** a call summary goes on the deal item: what they said, objections, next action with a date. The next action *is* the `target_date`.
- **Marketers:** feedback on an asset goes on the asset item; approval given verbally becomes the state change plus a comment saying who approved.
- **Founders:** a dump touching three projects is normal. Route by project; if one fragment could belong to two projects and misrouting is expensive, that is one of the rare questions worth asking, once, at the end.
- **Agencies:** default every comment to internal. Only mark `EXTERNAL` when the conversation clearly produced something the client should see, and say you did.

## Reporting back

Five to eight lines. Changed / created / decided / flagged / could not place / one offer. Identifiers where they exist (`PAY-42`) so the person can click through. No narration of tool calls.

> Updated PAY-42 (scope now excludes refunds, per your call with finance) and PAY-51 (moved to In review). Created PAY-58 "Gift-card + Apple Pay double-charge" under Checkout, high, on Priya, due 12 Sep to match the module. Recorded the refund decision on PAY-42. Flagged: the Stripe webhook change has no owner and a 15 Sep date. Couldn't place: "the thing Rajat mentioned about invoices". Want me to draft the note to Priya about PAY-58?
