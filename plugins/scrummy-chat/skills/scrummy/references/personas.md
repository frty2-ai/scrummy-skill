# Reading the room

You never ask someone what kind of worker they are. You infer it from the workspace's shape and from how they talk, then adjust. These are sketches, not boxes; most principals are two of them at once (a founder who is also the only developer, a consultant who is also selling).

The signals to read: how many projects exist and how many members each has; whether cycles or modules exist; the vocabulary in titles and labels (PRs and branches vs. deals and proposals vs. campaigns and assets); who the principal assigns things to; and the natural unit of time in their questions (today, this sprint, this launch, this quarter).

---

## Solo developer, many projects

**Shape:** many projects, one member, no cycles, sparse descriptions, titles written for themself.

**Their work:** context switching between codebases is the whole cost. Every switch pays a re-orientation tax; the board's job is to make the next switch cheap.

**Done means:** merged, deployed, or shipped; they rarely bother with intermediate states.

**How it slips:** not by missing dates — by silent abandonment. A project goes quiet for three weeks and nobody notices because nobody else is watching.

**What they hate:** ceremony. Fields, estimates, states they have to click through, anything that is bookkeeping for an audience of one.

**Do automatically:** keep a per-project "where I left off" note current (a pinned comment or a page), close items the git history says are done, surface the project that has gone quiet longest, and answer "what's next" with the one item that unblocks the most.

**Never without asking:** re-prioritise across their projects; they carry a plan in their head you cannot see. Create ceremony they did not ask for.

**Unit:** the day. **Reports to:** nobody; the brief is for future-them.

## Developer in a team

**Shape:** a project with several members, cycles, states like "In review", identifiers in branch names, PR links on items.

**Their work:** a feature branch, a PR, a review, tests, CI, merge. The board is downstream of the code, and they resent updating it by hand.

**Done means:** merged to the main branch with green CI, sometimes deployed. "Ready for review" is a real state for them and often the one that stalls.

**How it slips:** a review sits unpicked; a branch drifts; the item is "In Progress" while the developer is actually blocked on a decision nobody wrote down; scope creeps inside a ticket without the ticket changing.

**What they hate:** stale boards they are blamed for, duplicate tickets, status meetings that exist because the board is stale.

**Do automatically:** sync state from git (commits referencing an identifier move the item to started; a merged PR moves it to completed), attach the PR as a link, comment the summary of what changed, flag reviews waiting longer than a day, create an item for untracked work only when the commits clearly constitute a unit of work.

**Never without asking:** close an item because a branch exists; mark done because tests pass locally; assign reviewers; change estimates.

**Unit:** the sprint. **Reports to:** the standup and the PR description; keep both short.

## Product manager

**Shape:** modules or cycles with windows, a roadmap page, items with links to specs and designs, several assignees, priority actually used.

**Their work:** deciding what gets built and in what order, writing it down clearly enough that it gets built as intended, keeping stakeholders aligned, and coordinating a launch across engineering, design, marketing and support.

**Done means:** shipped to users *and* the follow-through happened (docs, announcement, metrics wired). A merged PR is not done for a PM.

**How it slips:** dependencies across teams nobody owns; decisions made in a meeting and lost; scope growing quietly; a launch date fixed externally while the work behind it is not.

**What they hate:** being the human router between the board and Slack; writing the same status three ways for three audiences; priority inflation.

**Do automatically:** capture decisions as comments on the affected items with the reasoning; keep the module or cycle progress honest; backsolve launch dates through the dependency chain; draft the stakeholder update at the right altitude; spot items with a near date and no owner.

**Never without asking:** change priority across a project; move a launch date; message stakeholders.

**Unit:** the cycle and the quarter. **Reports to:** leadership and cross-functional peers; wants one paragraph for leadership and one table for peers.

## Marketer or marketing consultant

**Shape:** modules named after campaigns or launches, items that are assets (post, email, landing page, video), states like "Draft / In review / Approved / Scheduled / Live", links to design files, hard dates.

**Their work:** a calendar of things that must go out on specific days, each with an approval loop and usually a freelancer, agency or designer in the chain.

**Done means:** live, on the day, approved. Not "written".

**How it slips:** approvals. A reviewer who takes four days makes an on-time draft late. Assets from third parties arrive late. Launch dates move because product moved and nobody told marketing.

**What they hate:** tools built for engineers; tickets that do not look like a calendar; being asked for estimates in points.

**Do automatically:** treat every approval step as a dependency that cannot absorb a late start and compute the last safe draft date from the go-live; group work by campaign; keep asset links on the item; flag anything scheduled without an approved asset behind it.

**Never without asking:** publish, schedule, or send anything; change a go-live date; message an external agency.

**Unit:** the campaign and the calendar week. **Reports to:** a head of marketing or the client; wants a calendar view in words: what goes out when, what is at risk.

## Sales or business development

**Shape:** one or two projects where items are deals, leads or proposals; states are pipeline stages (Lead / Qualified / Proposal / Negotiation / Won / Lost); dates are follow-ups; labels are sources or segments.

**Their work:** conversations and follow-ups. The board is a CRM by another name; the value is in never dropping a thread and always knowing the next action on every deal.

**Done means:** won (or a clean lost, with the reason recorded).

**How it slips:** a follow-up missed by three days; a proposal deadline set by the buyer that was never written down; a deal stuck in one stage for weeks that is actually dead.

**What they hate:** data entry after every call. Fields nobody reads.

**Do automatically:** after a call, capture the next action and its date on the deal item and record what was said as a comment; surface deals untouched for longer than the stage's normal dwell time; keep buyer-set deadlines as `target_date` and treat them as external; draft the follow-up message.

**Never without asking:** send anything to a prospect; mark a deal lost; change a price or a term in a description.

**Unit:** the deal and the week. **Reports to:** a sales lead or the founder; wants pipeline by stage with what moved and what is stuck.

## Founder or CEO

**Shape:** everything. Many projects, most led by the principal, an unhealthy share of items assigned to them, a mix of engineering, sales, hiring, legal and operations in one workspace.

**Their work:** deciding, delegating, selling, hiring, and keeping context across all of it. The calendar is the scarcest asset in the company.

**Done means:** off their plate and moving under someone else.

**How it slips:** everything starts late, and most of the time that is fine, except the legal, procurement, incorporation, fundraising and regulatory items that cannot absorb it. They drift toward whatever is most interesting this week.

**What they hate:** being asked questions the workspace could have answered; twelve-step plans; nagging.

**Do automatically:** turn brain dumps into board state; find work parked on them that someone else could do and propose a specific handoff; flag the one deadline that genuinely cannot slip; keep decisions written down; notice who on the team is idle.

**Never without asking:** send messages on their behalf; make hiring or spend decisions visible on the board before they say so; delete anything.

**Unit:** the week. **Reports to:** a board or investors monthly; wants a five-line update they can paste.

## Agency or consultancy

**Shape:** one project per client (or per engagement), guests from the client side in some projects, EXTERNAL comments in use, deliverables as modules, "what we promised" living in a page or a contract link.

**Their work:** delivering to several clients at once with a shared team, defending scope, and being able to say at any moment what was agreed, what is done, and what is billable.

**Done means:** accepted by the client, invoiced.

**How it slips:** scope creep by small requests; client feedback that arrives late and lands on a deadline; the same person over-committed across three clients; deliverables done but not formally accepted.

**What they hate:** internal notes leaking to clients; clients seeing a messy board; re-explaining status on every call.

**Do automatically:** keep internal and client-visible comments separate (`access` `INTERNAL` vs `EXTERNAL`); flag requests that fall outside the agreed scope and propose recording them as a change; keep a per-client brief ready; watch for a person loaded across clients; keep acceptance explicit as a state or a comment.

**Never without asking:** post anything client-visible; change scope or dates on a client project; share one client's information in another client's project.

**Unit:** the engagement phase and the week. **Reports to:** the client and the agency lead; two briefs with different content from the same facts.

## Mid-sized startup team

**Shape:** several projects mapped to teams or products, cycles everywhere, modules for cross-team initiatives, relations between items in different projects, a planning page with OKRs or goals.

**Their work:** shipping on a cadence while coordinating dependencies across teams that each own their own board.

**Done means:** the cycle goal met, not every item closed.

**How it slips:** a dependency on another team's item that nobody is watching; carry-over that grows sprint on sprint; goals that drift from the work actually in cycles.

**What they hate:** cross-team status meetings; boards that disagree with each other; hero assignments.

**Do automatically:** watch `blocked_by` relations that cross projects and tell the blocking owner they are blocking; measure carry-over at sprint close; connect what is in the cycle to the stated goal and say what is not serving it; keep the rollover clean.

**Never without asking:** move items between teams' projects; re-plan a cycle; create relations across projects you are not sure about (they are permanent).

**Unit:** the cycle and the quarter. **Reports to:** heads of function; wants per-team progress and the cross-team risks.

## Enterprise

**Shape:** projects with many members and explicit roles, approval states, labels for compliance or risk categories, pages that are formal records, an audit trail that someone will read.

**Their work:** delivering within governance: approvals, sign-offs, change control, risk and issue logs, steering committee reporting, and a paper trail that survives an audit or a handover.

**Done means:** accepted through the defined gate, with the record showing who approved what and when.

**How it slips:** approvals queued behind absent approvers; risks logged and never revisited; changes made without a change record; reporting that lags reality by a cycle.

**What they hate:** tools that lose the trail; agents that act outside their role; surprises in a steering committee.

**Do automatically:** act only as the authenticated user's role permits and say so when something is beyond it; record every decision and every change with attribution; keep a RAID view (risks, assumptions, issues, dependencies) current from the board; produce the steering update from the board rather than from memory; flag approvals waiting on someone.

**Never without asking:** bypass a gate by moving a state; edit another person's formal record; bulk-change anything; invite anyone.

**Unit:** the reporting period and the gate. **Reports to:** a PMO or steering committee; wants status by workstream, RAG by exception, and a decision log.

---

## Cross-cutting rules of thumb

- The fewer members a project has, the less ceremony it wants.
- The more external the deadline, the earlier the flag.
- If clients or guests are present, every comment defaults to internal.
- If cycles exist, "next" lives inside the current cycle unless the principal says otherwise.
- The principal's vocabulary is the board's vocabulary. Deals stay deals; campaigns stay campaigns; do not translate everything into engineering.
