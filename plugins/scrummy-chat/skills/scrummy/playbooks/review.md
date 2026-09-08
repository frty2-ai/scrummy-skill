# review — recording a verdict

**Fires when:** the principal has looked at something — a PR, a design, a draft, a deck, a proposal, a candidate, a deliverable — and says what they think: "reviewed the landing page, two changes then good", "that PR is fine, ship it", "the proposal needs the pricing section redone", "I looked at Priya's work, it's done".

**What good looks like:** the verdict is on the item in the owner's language, the state reflects it, the follow-ups exist with owners, and the owner has a message ready to receive. The principal said it once; you did the rest.

## Reading the verdict

Verdicts come in four shapes. Identify which before writing:

- **Approved as is** → state moves forward (to done, approved, ready to ship, whatever the project's states say; read the groups, not the names). Comment: approved by whom, when, any caveat.
- **Approved with changes** → state stays or moves to a "changes requested" kind of state if one exists; the changes become sub-items or a checklist in a comment, each with an owner (default: the item's current assignee) and a date derived from the original. The item's target date does not move unless they said so.
- **Rejected or sent back** → state back to the previous working state; comment with the reason in their words. If it is a deliverable for a client, this is internal until they say otherwise.
- **Reviewed someone else's work as done** → the item completes and the comment credits the reviewer's judgment, not yours. Never close work the principal did not review or own; if they say "everything Priya did is done" across many items, that is a bulk change and gets a confirmation first.

## Capturing feedback

Feedback belongs on the item, verbatim where the wording matters ("the headline should say 'free' not 'complimentary'"), summarised where it does not. Attribute it. Feedback that is a decision ("we're not doing dark mode in v1") is also a decision: record it where the scope lives.

For a PR review, the substance lives in the PR; the board gets the verdict and a link. Do not duplicate line comments onto the board.

## Follow-ups

Each change requested is a unit of work with an owner. Create sub-items under the reviewed item when they are separately trackable; use a checklist in one comment when they are small and will be done in one pass. Do not create six items for six typo fixes.

## Telling the owner

Draft the note to the owner: what was approved, what needs changing, by when. Keep it in the principal's voice. Show it; send only on a go, and only through a tool that exists.

## Persona notes

- **Developers:** reviewing a PR moves the item; approving in the PR tool is the real approval. If the PR tool is connected, the board follows it, not the other way round.
- **Marketers:** approval is a state transition *and* an attribution. "Approved by Sam 4 Sep" is what saves you when the client asks who signed off.
- **Agencies:** a client's approval is `EXTERNAL`-visible; the internal reaction to the client's feedback is not.
- **Enterprise:** an approval is a gate. Record who, when, and under what authority. Do not move a gate state on the principal's behalf if their role does not permit it; say so.

## Reporting back

> Landing page (MKT-31): approved with two changes. Sub-items MKT-31a (headline copy) and MKT-31b (hero image swap) on Dana, due Thursday to hold the 12 Sep go-live. Feedback recorded verbatim on MKT-31. Draft note to Dana is below; say send.
