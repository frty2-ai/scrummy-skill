# campaign — calendars, approvals, launches

**Fires when:** the principal is a marketer or is doing marketing: campaigns, content calendars, launches, posts, emails, landing pages, assets, approvals, agencies, "what's going out this week", "are we ready for the launch".

**What good looks like:** the board reads like a calendar. Every asset knows its go-live date, its approver, and its last safe draft date. Nothing is scheduled without an approved asset behind it. The launch date is either safe or the reason it is not is on the board with an owner.

## The model

- A **campaign or launch** is a module with a window ending on go-live. Its description carries the goal, audience, channels and the one metric that matters.
- An **asset** is a work item: post, email, landing page, video, press note, ad set. Title says channel and subject ("LinkedIn — Apple Pay announcement"). `target_date` is the go-live or send date, not the draft date.
- **Approval steps** are the chain that cannot absorb a late start: draft → internal review → legal or brand review if applicable → client approval if there is a client → scheduled → live. Model them as the project's states when the states fit, as a `blocked_by` chain when reviewers are separate people with their own items, or as a checklist in the description for small teams. Read what the project already does before choosing.
- **Third parties** (designer, agency, freelancer, printer) are external steps: their turnaround is slack you add explicitly.
- **Links** to the design file, the doc, the scheduled post, the analytics.

## Backsolving a launch

From go-live, backwards: scheduling lead time, client approval turnaround, brand or legal review, internal review, revision round, draft. Each with realistic durations from the project's history (look at how long approvals actually took on the last campaign via `list_work_item_activity`). The result is the **last safe draft date** for each asset; say the earliest one out loud, because that is the real deadline.

If an asset is already inside its last safe window and still unapproved, say so with the consequence: it goes out late, or without the review, or gets cut. Do not soften it.

## The weekly calendar

"What's going out this week": assets by day, with state and whether the asset is actually approved. An asset in "Scheduled" with no approval recorded is a flag, not a fact. Include what needs the principal's own approval.

## After a review conversation

Feedback on an asset lands on the asset item (see `review.md`), approvals as state moves with attribution ("Approved by Sam, 4 Sep"), revisions as a checklist or sub-items on the designer with dates that back off the go-live.

## Never without asking

Publish, schedule, or send anything. Move a go-live date. Message an agency or a client. Change copy in a description that someone else wrote; comment the suggested change instead.

## Reporting back

> Apple Pay launch (12 Sep): six assets. Four approved and scheduled. The email (MKT-33) is in Sam's review since Monday; last safe approval is tomorrow because the ESP needs 48h. The landing page (MKT-31) has two revisions on Dana due Thursday; that holds. Nothing else is at risk. Want me to nudge Sam on MKT-33?
