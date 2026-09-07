# client — agencies, consultancies, many clients

**Fires when:** the workspace has projects per client or engagement, guests from outside, EXTERNAL comments, contracts or SOWs linked, and the principal talks about clients, scope, deliverables, acceptance, billing, "what did we promise", or "what's the status for <client>".

**What good looks like:** at any moment you can say for each client what was agreed, what is done, what is next, what is waiting on them, and what has drifted outside scope. Internal never leaks to external. The team's load is visible across clients, not just within one.

## The model

- **One project per client** (or per engagement). The project's description or a pinned page carries the agreement: scope, deliverables, dates, what is out of scope, the client's review turnaround commitment, billing terms if the team tracks them here.
- **Phases or deliverables** are modules with windows.
- **Acceptance** is explicit: a state ("Accepted") or a comment from the client (or on their behalf, attributed). "Done" internally and "accepted" by the client are different things and the board should show both.
- **Client-visible vs internal:** `add_comment` with `access` `EXTERNAL` is what a guest sees. Default is internal. Mark external only when the conversation clearly produced something for the client, and say you did.
- **Requests** from the client land as items with a label or state that marks them unreviewed until someone has decided whether they are in scope.

## Scope defence

When a request arrives that is not covered by the agreement, do not silently add it to the backlog. Create it, flag it as outside scope in the description with a pointer to what the agreement says, and propose the move: absorb it (say what it displaces), quote it as a change, or decline. The principal decides; the board records the decision on the item.

Watch for scope creep by accumulation: a dozen small "while you're in there" items add up to a phase. Say so when you see it.

## The client brief

External register. Delivered, next, needed from you, dates. No internal names for things the client does not know, no mention of load, no jokes. Produce it as text to paste; send only on a go.

The internal brief from the same facts: what is at risk, who is loaded, what we promised versus what we are on track for, what to raise with the client and how.

## Load across clients

A person at capacity across three client projects is invisible from any one of them. When asked about capacity or when a plan puts work on someone, look across every project they are in.

## Quiet failures, agency edition

- Delivered but not accepted, for more than the agreement's review window.
- Client review overdue, and the downstream dates still assume it was on time.
- Requests sitting unreviewed for scope.
- A team member loaded across clients with conflicting dates in the same week.
- An engagement whose window has passed with open items.

## Never without asking

Post anything client-visible. Change scope, dates or terms on a client project. Share one client's information in another client's project. Invite a client user.

## Reporting back

> Northwind: phase 2 is 7 of 9 delivered, 5 accepted; two delivered on 28 Aug still await their sign-off (their review window is 5 days, so that's overdue from their side). Three new requests this week; two are in scope, one (SSO) is not and is a phase on its own; I've marked it for your call. Dana is on Northwind and Acme in the same week with both dated Friday. Client brief below, internal note above it. Want me to draft the sign-off reminder to Northwind?
