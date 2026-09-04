# Installing `scrummy`

You need two things: the skill (this folder) and a connection to the Scrummy MCP server.

## 1. Get a token and the MCP URL

In Scrummy: **Settings → API tokens → Add token**. The modal shows the MCP connection URL for your instance, of the form:

```
https://<your-scrummy-host>/mcp/?token=<your-token>
```

If your token reaches more than one workspace, append `&workspace=<slug>` so calls are not refused for ambiguity.

The token acts as you. Everything the skill does is done in your name and shows in the activity log as you.

## 2. Claude Code

### As a plugin from GitHub (recommended)

```bash
export SCRUMMY_URL="https://<your-scrummy-host>"      # no trailing slash
export SCRUMMY_TOKEN="<your-token>"
export SCRUMMY_WORKSPACE="<slug>"                     # optional if the token reaches one workspace

claude plugin marketplace add SAFE-AI-Global/scrummy-skill    # this repo
claude plugin install scrummy@scrummy-skill
```

Put the three exports in your shell profile so every session sees them. The plugin's `.mcp.json` reads them and registers the `scrummy` MCP server with the token in an `Authorization` header, so it never appears in a URL or a log.

Verify with `/mcp` inside Claude Code (you want `scrummy` connected) and `/scrummy` to invoke the skill by hand.

### As a plain skill (no plugin)

```bash
git clone https://github.com/SAFE-AI-Global/scrummy-skill ~/.claude/skills/scrummy      # personal, every project
# or
git clone https://github.com/SAFE-AI-Global/scrummy-skill .claude/skills/scrummy         # this repo only, shared with the team
```

Then connect the MCP yourself:

```bash
claude mcp add --transport http scrummy \
  "https://<your-scrummy-host>/mcp/?token=<your-token>&workspace=<slug>"
```

### Try it without installing

```bash
claude --plugin-dir /path/to/scrummy
```

## 3. claude.ai

1. Run `bin/package.sh` (or zip the folder yourself; the zip must contain the `scrummy/` folder at its root, with `SKILL.md` inside it).
2. In claude.ai: **Customize → Skills → Add** and upload the zip. Enable it.
3. **Settings → Connectors → Add custom connector** with the MCP URL from step 1, including the token and workspace parameters.

Then talk to it in any chat: "scrummy, capture this", "dump: …", "what's next on the board".

## 4. Per-repository setup for the dev sync (optional)

Copy `examples/SCRUMMY.md` to the root of any repository whose work lives in a Scrummy project, and edit the project identifier and the definition of done. The skill reads it at the start of every session in that repo and uses it to sync commits, branches, PRs and test results to the board without asking which project you mean.

## 5. Using it

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
| "workspace is ambiguous" | Token reaches several workspaces, none pinned | Add `&workspace=<slug>` to the URL, or set `SCRUMMY_WORKSPACE` |
| 401 on every call | Token invalid or expired | Make a new one in Settings → API tokens |
| Skill fires on ordinary code talk | Description matched loosely | It should decline silently; if it keeps happening, add `disable-model-invocation: true` to `SKILL.md` and invoke with `/scrummy` |
| Assignment fails | Person is not a project member | The skill adds them first; if it cannot, they need a workspace invitation |
