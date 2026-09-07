# brief — status at the right altitude

**Fires when:** "standup me", "where are we", "status on X", "give me an update for the board / the client / my manager / the team", "what happened this week", or any request that will be forwarded to someone else.

**What good looks like:** the reader learns what matters in the time it takes to read one screen, in the shape they expect, and nobody needs a meeting.

## The audience decides everything

Ask yourself who reads it, then write for them. Do not ask the principal unless it is genuinely unclear.

| Audience | Wants | Shape |
|---|---|---|
| Self, morning | The five things that matter today, ranked, and one offered action | Bullets |
| Team standup | Done since last time, doing now, blocked, in the principal's words | Three short lines |
| Manager or leadership | Outcomes, risks, decisions needed from them | One paragraph, then at most three asks |
| Board or investors | Progress against the goals they know about, one number if there is one, what changed, what is at risk | Five lines they can paste |
| Client | What was delivered, what is next, what is needed from them, dates | Short, external register, no internal chatter |
| Steering committee (enterprise) | Status by workstream, RAG by exception, decisions taken, decisions needed, risks with owners | Table plus a decision log |
| Cross-functional peers | What is done, what is in review, what depends on them | Table: item, owner, state, date, risk |

## Building it

Read from the board, not from memory: `list_work_items` sorted by `-updated_at` for the window, `list_work_item_activity` where you need to know whether something actually moved, `get_cycle` or `get_module` for progress counts, relations for blocks.

Then compress. A hundred items become the five that matter and a count of the rest. Sort by consequence. Facts first, judgment second, ask last.

Say what slipped and why, when the board knows why (a comment, a blocker). Do not invent a why. Do not soften a slip into "in progress".

Say what is needed from the reader. A brief that contains no ask is often a brief nobody needed.

## Register

Match the principal's voice; they are the one sending it. Internal briefs can carry the dry joke. Client and board briefs cannot. No emojis unless the workspace's own comments use them.

Keep the workspace's names for things. Do not rename "Checkout v2" to "the checkout project" for a client who knows it as Checkout v2.

## Deliver, do not send

Produce the brief as text they can paste. If Slack, email or WhatsApp tools exist, offer to send it, once, and wait for the go. Never post a brief to a channel or a person on your own.

## Reporting back

For a standup:

> **Done:** PAY-39 merged (gift-card refunds). **Doing:** PAY-42, in review since yesterday. **Blocked:** PAY-51, waiting on the Stripe webhook decision from Marco since 2 Sep. Two other items untouched this sprint; both low. Want me to nudge Marco on PAY-51 with the two options from Tuesday?

For a client:

> Delivered this week: the new checkout flow (in your staging environment since Tuesday) and the gift-card fix. Next: Apple Pay on the same flow, targeted for 15 Sep. From your side we need the updated terms copy by 10 Sep to hold that date.
