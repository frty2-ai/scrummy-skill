# sync — code into board state, board into next commit

**Fires when:** the principal has been writing code (in this session, or since the last sync) and wants the board to reflect it: "sync the board", "done with the auth branch", "what did I get through today", "pull what's next", "reconcile with the tests". Also at the end of a Claude Code session that touched a repo with a `SCRUMMY.md`.

**What good looks like:** the developer closes the laptop and the board already says what they did, what is left, and what tomorrow's first commit should be. Nobody asks them for a status update because the board is the status.

## Ground truth is the repository

Read the repo before the board. From the working directory:

- `git branch --show-current`, and `git log --oneline main..HEAD` (or the repo's default branch) for what this branch contains.
- `git log --since="<last sync or a sensible window>" --format="%h %ad %s" --date=short` across branches for everything recent.
- `git status --short` for uncommitted work in flight.
- PR state if a tool for it exists (`gh pr status`, `gh pr list --author @me`); a merged PR is the strongest "done" signal there is.
- Test results if the conversation ran them, or if the user asks you to run the project's test command (never guess the command; read `package.json`, `Makefile`, `pyproject.toml`, or ask once).

Then read `SCRUMMY.md` at the repo root if it exists. It tells you which project this repo maps to, how "done" is defined here, and any conventions (branch naming, which labels mean what). If it does not exist and you find the mapping by other means, offer to create it from `examples/SCRUMMY.md` at the end.

## Resolving code to items

1. Identifiers in branch names, commit subjects, PR titles (`PAY-42`, `pay-42-…`, `#42` when the repo's convention says so) → `get_work_item_by_identifier`.
2. No identifier → `search_work_items` on the branch's words and the commit subjects. Two phrasings before you give up.
3. Still nothing, and the commits clearly form a unit of work → this is untracked work. Create an item *only* if it is substantial enough that someone would want to know it happened; otherwise mention it in the report and let them decide.

## What moves what

Signals, in rising order of confidence:

| Evidence | Board effect |
|---|---|
| Branch exists, no commits | Nothing. A branch is an intention. |
| Commits on a branch referencing the item | Item in a `started`-group state if it was not; comment with a two-line summary of what changed. |
| PR opened | Link the PR on the item (`add_work_item_link`). If the project has a review state, move there. |
| PR merged to the default branch | Item to a `completed`-group state, unless `SCRUMMY.md` says done means deployed. Comment: merged, sha, what it closes. |
| Tests failing on the branch | Comment on the item naming the failing tests. Do not move state backwards unless the item was in review. |
| Tests written for an untracked behaviour | Note it; do not create items for tests. |
| Uncommitted changes | Mention in the report; never touches the board. |

Never mark done because tests pass locally. Never close an item because a branch exists. Never assign reviewers. If `SCRUMMY.md` defines done differently, that definition wins.

## Reconciling drift

After the forward pass, look the other way: items on the board in a started state, assigned to the principal, in this project, with no commits touching them in the window. Those are either blocked, forgotten, or being done somewhere you cannot see. List them; do not move them. One line each.

## Pulling what is next

After the sync, answer "what's next" from the board (see `next.md`), but for a developer the answer comes with its context loaded: the item's description, acceptance notes, linked design or spec, open comments, and any `blocked_by` that is still open. Offer to move it to started and to create the branch name the repo's convention implies.

## Session end in Claude Code

If this session made commits and a `SCRUMMY.md` exists, offer the sync unprompted when the work reaches a natural stop: one line, "Want me to sync the board? Two items done, one in review." Then do it on a yes. Do not sync speculatively in the middle of a coding task.

## Reporting back

> Synced from `feat/pay-42-gift-card` (4 commits, PR #218 open). PAY-42 → In review, PR linked. PAY-39 → Done (merged this morning). PAY-51 has been In Progress for 9 days with no commits; blocked or forgotten? Next up: PAY-58 (high, due Fri, spec linked, nothing blocking). Want me to start it?
