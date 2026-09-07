# Installing `scrummy`

You need two things: the skill (this folder) and a connection to the Scrummy
MCP server.

## 1. The connection

There is no token to copy. The MCP endpoint is one URL:

```
https://<your-scrummy-host>/mcp
```

Point an agent at it and the agent does the rest: it discovers that the
endpoint is protected, opens Scrummy in your browser, and asks you to sign in.
You are shown which workspaces it wants, with all of them ticked. Untick
anything you would rather keep out, approve, and you are returned to the agent
with the connection live.

Whatever you leave unticked is unreachable with that connection, not merely
hidden. You can withdraw it later from Scrummy settings.

## 2. Claude Code

### As a plugin from GitHub (recommended)

```bash
export SCRUMMY_URL="https://<your-scrummy-host>"      # no trailing slash

claude plugin marketplace add frty2-ai/scrummy-skill
claude plugin install scrummy@scrummy-skill
```

Put the export in your shell profile so every session sees it. The plugin's
`.mcp.json` registers the MCP server from it; nothing else is configured,
because the connection carries no credential.

Run `/mcp` inside Claude Code and authenticate `scrummy` when prompted. That
opens the consent screen. `/scrummy` invokes the skill by hand.

### As a plain skill (no plugin)

```bash
git clone https://github.com/frty2-ai/scrummy-skill ~/.claude/skills/scrummy      # personal, every project
# or
git clone https://github.com/frty2-ai/scrummy-skill .claude/skills/scrummy         # this repo only, shared with the team
```

Then connect the MCP yourself:

```bash
claude mcp add --transport http scrummy "https://<your-scrummy-host>/mcp"
```

Then `/mcp` and authenticate.

### Try it without installing

```bash
claude --plugin-dir /path/to/scrummy
```

## 3. ChatGPT and Codex

This repo doubles as a plugin marketplace, so one install brings the skill and
the MCP connection together.

### ChatGPT

**Settings → Plugins → Add plugin marketplace**, then:

| Field | Value |
|---|---|
| Source | `frty2-ai/scrummy-skill` |
| Git ref | `main` |
| Sparse paths | *leave empty* |

**Leave sparse paths empty.** Codex looks for the marketplace manifest at the
root of whatever it checked out, and it only accepts these four paths:

```
.agents/plugins/marketplace.json
.agents/plugins/api_marketplace.json
.claude-plugin/marketplace.json
.cursor-plugin/marketplace.json
```

Narrowing the checkout to `plugins/scrummy` leaves none of them present, and
the add fails with *marketplace root does not contain a supported manifest*.
The whole repo is under a megabyte, so a full checkout costs nothing.

If you do want a narrow checkout, list both paths: `.agents` and
`plugins/scrummy`.

Install **Scrummy** from the marketplace that appears. Authentication is set to
happen on install, so it opens the Scrummy consent screen: sign in, leave the
workspaces ticked, approve.

Adding a marketplace is gated behind Developer mode. If you do not see the
option, turn it on in Settings first.

### Codex

```bash
codex plugin marketplace add frty2-ai/scrummy-skill
codex plugin install scrummy
```

### Pointing at your own deployment

The plugin's `plugins/scrummy/.mcp.json` names our host. For a different
Scrummy instance, fork the repo, change the two URLs there and in
`agents/openai.yaml`, and add your fork as the marketplace instead.

### Skill only, no plugin

The repo root is a plain Agent Skill, so Codex can also take it directly:

```bash
git clone https://github.com/frty2-ai/scrummy-skill ~/.agents/skills/scrummy
```

Then add the MCP server yourself in `~/.codex/config.toml`:

```toml
[mcp_servers.scrummy]
url = "https://scrum.beta.safeai.global/mcp"
```

and run `codex mcp login scrummy`.

## 4. claude.ai

1. Run `bin/package.sh` (or zip the folder yourself; the zip must contain the `scrummy/` folder at its root, with `SKILL.md` inside it).
2. In claude.ai: **Customize → Skills → Add** and upload the zip. Enable it.
3. **Settings → Connectors → Add custom connector** with the MCP URL from step 1. Connecting opens the Scrummy consent screen.

Then talk to it in any chat: "scrummy, capture this", "dump: …", "what's next on the board".

## 5. Per-repository setup for the dev sync (optional)

Copy `examples/SCRUMMY.md` to the root of any repository whose work lives in a Scrummy project, and edit the project identifier and the definition of done. The skill reads it at the start of every session in that repo and uses it to sync commits, branches, PRs and test results to the board without asking which project you mean.

## 6. Using it

The skill triggers on its own when a message is clearly about the board. To force it, name it or use the slash command:

```
/scrummy                          # infer the move from context
/scrummy capture                  # after a brainstorm or a meeting
/scrummy sync                     # after coding
/scrummy next                     # what to work on
/scrummy brief for the client     # status at the right altitude
/scrummy week                     # weekly review or sprint close
```

Or just talk:

- `dump:` followed by raw notes, no structure required
- "what's on my plate that shouldn't be?"
- "who's idle right now?"
- "the Stripe amendment has to be done by 3 Oct; when do I actually have to start?"
- "standup me"

## Editing it

- `SKILL.md` — persona, judgment, defaults. Change this to change how it behaves.
- `playbooks/*.md` — one move each. Add a playbook and a row in the table in `SKILL.md` to add a move.
- `references/personas.md` — how it reads the room. Add a persona if your organisation has a kind of worker it gets wrong.
- `references/tool-playbook.md` — the MCP surface. Update when the server gains or loses tools.
- `references/first-principles.md` — why it judges the way it does.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| "marketplace root does not contain a supported manifest" | Sparse paths excluded the manifest | Clear the sparse paths field, or add `.agents` alongside `plugins/scrummy` |
| Agent never opens a browser | The deployment has not set `PLANE_PUBLIC_URL`, so OAuth is off | Set it on the MCP container to the public origin, then reconnect |
| A workspace is missing | It was left unticked at consent | Reconnect and tick it; the refusal message names the workspace |
| "Could not tell which of N workspaces to use" | A call that needs a named workspace, such as creating a project, got none | Name the workspace in that call |
| 401 on every call | The connection expired or was revoked | Reconnect; the agent will run the sign-in again |
| Skill fires on ordinary code talk | Description matched loosely | It should decline silently; if it keeps happening, add `disable-model-invocation: true` to `SKILL.md` and invoke with `/scrummy` |
| Assignment fails | Person is not a project member | The skill adds them first; if it cannot, they need a workspace invitation |
