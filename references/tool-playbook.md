# Scrummy MCP playbook

Scrummy is a Plane-backed workspace exposed over MCP. The connector may appear under more than one name pointing at the same backend. Use whichever authenticates and stay on it; do not mirror calls across both.

## Contents

1. Conventions that bite
2. Orientation
3. Reading work
4. Structure: states, labels, modules, cycles
5. Writing
6. Docs and history
7. Destructive
8. Recipes the moves rely on

---

## 1. Conventions that bite

- **IDs are UUIDs**, and nearly every call needs `project_id`. Resolve names to IDs once per session and keep them.
- **Dates are `YYYY-MM-DD`.** Work items use `start_date` / `target_date`. Cycles use `start_date` / `end_date`, and want both or neither.
- **Priority** is exactly one of `urgent | high | medium | low | none`. Do not inflate. A project where everything is `high` has no priorities.
- **Descriptions are asymmetric.** Write `description_html`, read back `description_markdown`. Wrap paragraphs in `<p>`; use `<ul><li>` for lists, `<h2>` for sections.
- **List fields replace, they do not append.** `update_work_item` with `assignees=[X]` silently removes everyone else. Same for `labels`, and for `members` on a module. Read the item, merge, then write the full intended list.
- **Assignees must already be project members.** Workspace membership is not enough; `add_project_member` first (role `15` member, `20` admin, `5` guest), then assign.
- **State is not progress.** A ticket can sit in a started state untouched for weeks. `list_work_item_activity` is the only honest answer to "has this moved?"
- **Relations are permanent.** There is no delete for `add_work_item_relation`. Be sure before you wire a `blocked_by`.
- **One cycle per item.** Adding an item to a cycle moves it out of any other. Plane refuses additions to a cycle whose end date has passed.
- **Workspace pinning.** If the token reaches several workspaces and none is pinned, calls are refused until the MCP URL carries `?workspace=<slug>`. Say it once and move on.
- **The tool surface varies by deployment.** Newer servers add tools; an older one will not have every tool named here. Trust the connector's actual tool list over this document, and treat an unknown-tool error as a fact about that server rather than something to retry.
- **Rate limits** are per token per minute. Prefer `get_work_item_context` and `expand=` over bursts of single-field lookups.

---

## 2. Orientation

| Tool | Use it for |
|---|---|
| `authenticate` | Identity behind the token and the active workspace. Always first. |
| `list_my_workspaces` | Slugs, names, roles. Only when ambiguity is reported. |
| `list_projects` | Every project with id, identifier, timezone, lead. |
| `get_project` | One project with entity counts (members, states, labels, items, modules, cycles). |
| `list_workspace_members` | Everyone in the workspace, the pool you can add to projects. |
| `list_members` | Members of one project with roles. This is who you can assign. |

A good session map after orientation: project name → id + identifier; member name → id and which projects they are in; each project's states grouped by `backlog / unstarted / started / completed / cancelled`; whether cycles or modules exist. Keep it in your head for the rest of the session. Offer to persist it in `SCRUMMY.md` when you are inside a repo.

## 3. Reading work

| Tool | Use it for |
|---|---|
| `list_work_items` | Paginated project backlog. Pass `expand=assignees,labels` or you get bare UUIDs. `order_by` accepts `-updated_at`, `priority`, `state__name` and their reverses. |
| `search_work_items` | Title text search across the workspace or within a project. Run this before creating anything. |
| `get_work_item_context` | **Preferred read.** One Markdown document: description, sub-items, relations, links and the comment thread with names resolved. Use it whenever you are about to reason about or act on an item. |
| `get_work_item` | Raw field values when you need them to feed an update. |
| `get_work_item_by_identifier` | Look up by human id, e.g. project `PAY`, issue `42`. This is how branch names and commit messages get resolved. |
| `list_comments` | The thread alone, paginated. |
| `list_work_item_relations` / `list_work_item_links` | Dependency graph and external URLs. |
| `list_work_item_activity` | Audit trail. Who touched it, when, what changed. |

Sub-items: `parent_id` on create or update makes a child. `get_work_item_context` lists children.

## 4. Structure

**States** — `list_states`, `create_state`, `update_state`, `delete_state`. Groups are `backlog | unstarted | started | completed | cancelled`. Moving an item into a `completed`-group state sets `completed_at`. Never assume state names; a project may call started work "Doing", "Building" or "WIP". Read the group, not the name.

**Labels** — `list_labels`, `create_label`, `update_label`, `delete_label`. Labels are the team's vocabulary; reuse before inventing. A project with sequencing labels (`now / next / later`) is telling you how it prioritises.

**Modules** — epics or feature groups with a window and a lead. `list_modules`, `get_module` (with completion counts), `create_module`, `update_module`, `delete_module`, `list_module_work_items`, `add_work_items_to_module`, `remove_work_item_from_module`. Status: `backlog | planned | in-progress | paused | completed | cancelled`. A module's window is the best source of default dates for new items inside it. For marketers a campaign is a module; for agencies a deliverable phase is a module.

**Cycles** — time-boxed sprints or iterations. **Availability varies by deployment:** older Scrummy servers do not expose the cycle tools at all. If a cycle call comes back as an unknown tool, say so once in a clause, fall back to modules and dates for the same job, and do not retry cycle tools for the rest of the session. `list_cycles` with `cycle_view` of `all | current | upcoming | completed | draft | incomplete`, `get_cycle` (progress counts), `create_cycle`, `update_cycle`, `delete_cycle`, `list_cycle_work_items`, `add_work_items_to_cycle`, `remove_work_item_from_cycle`, `transfer_cycle_work_items` (rollover of unfinished work from an ended cycle into the next). If a project has cycles, "what's next" means "what's in the current cycle", and "week" means sprint close.

## 5. Writing

| Tool | Notes |
|---|---|
| `create_work_item` | `project_id` + `name` minimum. Set `description_html`, `priority`, `state_id`, `assignees`, `labels`, `start_date`, `target_date`, `parent_id` in the same call rather than following up. |
| `update_work_item` | Partial, but list fields replace. Read → merge → write. |
| `add_comment` | Where decisions live. `comment_html`; `access` is `INTERNAL` (team) or `EXTERNAL` (visible to guests, i.e. clients). Attribute the source: "Decided on the 2 Sep call with the vendor: …". |
| `update_comment` | Correct your own notes rather than stacking replies. |
| `add_work_item_relation` | `blocking`, `blocked_by`, `relates_to`, `duplicate`, and scheduling: `start_before`, `start_after`, `finish_before`, `finish_after`. Build the chain before you compute a last-safe-start date. Permanent. |
| `add_work_item_link` | External URLs: PRs, decks, drives, contracts, designs. `http(s)` only, no duplicates per item. |
| `add_project_member` | Prerequisite for assigning someone new. |
| `create_invitation` | Someone not yet in the workspace. Confirm first; it sends email. |

A sharpened title is a legitimate write: "fix bug" becomes "Checkout: 500 on Apple Pay when cart has a gift card". A rewritten *description* of someone else's item is not, unless they asked.

## 6. Docs and history

- `list_pages`, `get_page`, `create_page`, `update_page`, `delete_page` — project-level rich-text documents. The right home for decision records, specs, meeting notes and anything too big for a comment. `access` `0` is all members, `1` is private to the owner. Prefer one living page per topic (update it) over a new page per conversation.
- `list_work_item_activity` — the audit trail. Use it for "has this moved?", "who touched it last?", "when did it actually enter a started state?"

## 7. Destructive — confirm first, every time

`delete_work_item`, `delete_project`, `archive_project`, `delete_module`, `delete_cycle`, `delete_page`, `delete_state`, `delete_label`, `delete_comment`, `remove_project_member`, `delete_invitation`.

Pages must be archived before deletion; a 400 on `delete_page` usually means that. `delete_state` fails while items sit in the state; move them first.

---

## 8. Recipes the moves rely on

### Orientation (every session)
1. `authenticate` → principal, workspace, and anchor today's date.
2. `list_projects`; `list_workspace_members`.
3. For the project in play: `list_states` (note the groups), `list_labels`, `list_cycles cycle_view=current`, `list_modules`.
4. `list_work_items` with `expand=assignees,labels`, sorted by `-updated_at`, paginate as needed.

### Find or create (never just create)
1. `search_work_items` on every proper noun and title-ish fragment. Try two phrasings if the first returns nothing.
2. Match found → `update_work_item` and/or `add_comment`.
3. No match → `create_work_item`, fully populated, in the project the surrounding context implies.

### Resolve a code reference
Branch `pay-42-apple-pay`, commit "PAY-42: handle gift card" or PR title with `PAY-42` → `get_work_item_by_identifier` with project `PAY`, issue `42`. No identifier → `search_work_items` on the branch's words and the commit subject.

### Has it actually moved?
`list_work_item_activity`. Compare the last real change (state, assignee, comment, description) to today. Silence in a started state for longer than the item's plausible size is a flag.

### Backsolve a deadline
1. `get_work_item_context` on the target; it returns relations in one call.
2. Walk `blocked_by` backwards, collecting each blocker's estimate or a sane guess.
3. Add slack for anything external: reviews, legal, procurement, a counterparty who replies in days.
4. Report the **last safe start date**, with the consequence of missing it. If it is already past, lead with what gets cut.

### Load view
`list_members`, then `list_work_items` with assignees expanded, then count open items per person and note who has nothing. Zero is capacity, not a neutral fact.

### Sprint rollover
`list_cycles cycle_view=completed` for the one that just ended, `list_cycles cycle_view=upcoming` or `create_cycle` for the next, then `transfer_cycle_work_items`. Comment on each carried item with why it slipped, if the conversation said.

### Record a decision
`add_comment` on the affected item: what was decided, by whom, in which conversation, and what it rules out. If it changes scope or dates, make the matching `update_work_item` in the same batch.
