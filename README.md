# scrummy — a chief of staff for your Scrummy workspace

A skill for Claude that sits on top of the Scrummy (Plane) MCP and behaves like a chief of staff rather than a tool wrapper. The MCP exposes the raw surface: work items, states, labels, modules, cycles, comments, pages, relations, members. This skill supplies the judgment: what to write down after a conversation, what to do next, who is idle, which deadline cannot absorb a late start, and how to say all of it in five lines.

It is built for people who do not want to operate a project tool: solo developers running ten repos, developers who would rather the board followed their commits, product managers who keep decisions in chat, marketers with launch dates, salespeople with follow-ups, founders with everything parked on themselves, agencies with many clients, and enterprise teams that need the trail to survive an audit.

## What it does

You talk. It does the bookkeeping, then tells you the one thing that changes your day.

| You say | It does |
|---|---|
| `dump:` and five minutes of meeting residue | Updates what changed, creates what is new, records decisions on the items they affect, flags risks, lists what it could not place |
| "done with the auth branch, what's next" | Reads git, moves the items the commits and PRs prove, links the PR, then recommends the next item with its context loaded |
| "standup me" / "update for the board" / "status for the client" | A brief at the right altitude for that reader, as text you can paste |
| "reviewed the landing page, two changes then good" | Records the verdict and feedback, moves the state, creates the follow-ups, drafts the note to the owner |
| "we should launch Apple Pay by October" | A module with items, owners and dates that work backwards from the target, and the last safe start date said out loud |
| "who's idle" / "what's on my plate that shouldn't be" | One specific handoff, with a name and a reason |
| "are we on track" | The one deadline that matters and the quiet failures nobody is watching |
| "close the sprint" | Rollover, carry-over measured, hygiene proposed, a summary for the team |
| "just got off a call with Acme…" | The deal updated, the next action dated, internal children created, the follow-up drafted |

Twelve moves, described in `playbooks/`: capture, sync, next, brief, review, plan, rebalance, risk, week, pipeline, campaign, client. They are lenses, not scripts; the model combines them as the situation demands.

A connection usually reaches several workspaces. It treats them as one surface: projects, people and searches span all of them, and the workspace for any given action is worked out from the project rather than asked about. A duplicate in the other workspace is still caught, and a person loaded across two is still one overloaded person.

## What it will not do

Send a message to a person or a channel without an explicit go. Claim a write it did not see succeed. Mark something done because a branch exists or tests passed locally. Inflate priority. Assign someone who is not a project member. Delete anything, or close work it did not open, without asking. Add process nobody asked for.

## Where it runs

`SKILL.md` follows the [Agent Skills open standard](https://agentskills.io), so
one folder serves every agent that implements it: Claude Code and claude.ai,
Codex and ChatGPT, and the rest of the ecosystem. Two small files carry the
platform-specific parts and are ignored elsewhere:

- `.claude-plugin/` and `.mcp.json` — plugin manifest and MCP registration for Claude Code.
- `agents/openai.yaml` — UI labelling and the MCP dependency declaration for Codex and ChatGPT.

## Layout

```
scrummy/
├── SKILL.md                     persona, judgment, the router
├── references/
│   ├── first-principles.md      the thinking underneath every judgment, with sources
│   ├── personas.md              how to read the room: solo dev → enterprise
│   ├── tool-playbook.md         the MCP surface, the traps, the recipes
│   └── workspace-map.template.md
├── playbooks/                   one file per move
├── examples/SCRUMMY.md          per-repo config that lets code sync to the board
├── agents/openai.yaml           Codex and ChatGPT metadata + MCP dependency
├── assets/                      icons referenced by agents/openai.yaml
├── .claude-plugin/              plugin + marketplace manifests for Claude Code
├── .mcp.json                    registers the Scrummy MCP (env-driven)
└── bin/package.sh               zips the skill for claude.ai
```

## Install

See [INSTALL.md](INSTALL.md). Short version: Claude Code users add this repo as a plugin marketplace and set three environment variables; claude.ai users upload the zip and add the MCP connector.

## Requirements

- A Scrummy (Plane) instance with the MCP server enabled. Connecting needs one URL and no token: the agent sends you to Scrummy to sign in and tick which workspaces it may reach.
- Claude Code, or claude.ai on a plan with custom skills.

## Design notes

The skill deliberately keeps the MCP "naked". Every tool is a thin, honest mapping of the API, so any client can use it. Everything opinionated lives here, in prose the model reads, so it can be changed without a deploy and read by a human who wants to know what the agent will and will not do.

Persona detection is inference, not configuration. The shape of the workspace (how many projects, how many members, whether cycles or modules exist, what titles and labels look like) and the way the principal talks tell the model who it is working for. Nobody fills in a form.

The dev sync is designed so git is the ground truth and the board follows it, never the reverse. A `SCRUMMY.md` at the repo root records the mapping and what "done" means there.

## License

AGPL-3.0-only, matching the Scrummy project.
