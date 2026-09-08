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
claude plugin marketplace add frty2-ai/scrummy-skill
claude plugin install scrummy@scrummy-skill
```

The plugin registers the MCP server itself; nothing else is configured, because
the connection carries no credential. Only set `SCRUMMY_URL` if you run your own
Scrummy host:

```bash
export SCRUMMY_URL="https://<your-scrummy-host>"      # no trailing slash
```

Put that export in your shell profile so every session sees it.

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

This repo doubles as a plugin marketplace. It carries two plugins, because the
two ChatGPT surfaces get their tools by different routes.

| Shown as | Plugin | Where it works | How it reaches the board |
|---|---|---|---|
| **Scrummy for Codex** | `scrummy` | ChatGPT desktop (Work mode), Codex CLI and IDE | declares the MCP server itself |
| **Scrummy for Chat** | `scrummy-chat` | ChatGPT Chat, on web, desktop and mobile | calls a connector ChatGPT hosts |

Only **Scrummy for Codex** is published today. The Chat plugin is built but
deliberately unlisted until it has a real app id, because an entry pointing at
a placeholder installs and then fails with *Couldn't load connector*.

A plugin that declares its own MCP server is marked **Desktop only** by OpenAI
and cannot run in ChatGPT on the web. That holds even when the server is a
remote HTTPS URL like ours, and adding an `.app.json` alongside does not lift
it. Chat runs no local host, so a bundled server has nothing to run on; it
reaches tools only through a connector registered with ChatGPT. Hence two
plugins rather than one with both fields.

### Adding the marketplace

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

If you do want a narrow checkout, list all three paths: `.agents`,
`plugins/scrummy` and `plugins/scrummy-chat`.

Adding a marketplace is gated behind Developer mode. If you do not see the
option, turn it on in Settings first.

### Desktop and Codex

Install **Scrummy for Codex** from the marketplace that appears.
Authentication is set to happen on install, so it opens the Scrummy consent
screen: sign in, leave the workspaces ticked, approve.

In Codex:

```bash
codex plugin marketplace add frty2-ai/scrummy-skill
codex plugin install scrummy
```

That covers ChatGPT desktop in Work mode, the Codex CLI, and the IDE
extension, which share one MCP configuration.

### Chat on the web

Chat reaches tools only through an app ChatGPT itself hosts, and only the
person publishing this repo can mint one. Until then `plugins/scrummy-chat`
exists but is not listed in the marketplace.

1. In ChatGPT, **Settings → Security and login → Developer mode**, on.
2. Go to **chatgpt.com/plugins**, press **+**, give it a name, and enter the
   server URL including the path: `https://scrum.beta.safeai.global/mcp`.
3. Approve the OAuth flow, then review the tools it discovers.
4. Copy the **app's** id out of the browser URL. It is the app id, not a
   plugin id.
5. Wire it in and publish:

```bash
sh bin/enable-chat-plugin.sh <app-id>
git commit -am "Publish the Chat plugin"
# then republish the mirror
```

That writes the id into `plugins/scrummy-chat/.app.json` and adds the
marketplace entry. After the marketplace syncs, install **Scrummy for Chat**.

**The marketplace also has to reach the web.** A marketplace you add in the
desktop app lives in the local `~/.codex/config.toml`, and ChatGPT web does
not read local Codex configuration, so it will not appear at chatgpt.com. For
that, a workspace admin imports it under **Workspace settings → Plugins → Add
→ Import marketplace**, which needs a Business or Enterprise workspace. The
alternative is publishing through OpenAI's plugin submission portal, which
lists it in the universal directory for everyone.

### Pointing at your own deployment

`plugins/scrummy/.mcp.json` names our host. For a different Scrummy instance,
fork the repo, change the URL there and in `agents/openai.yaml`, register your
own connector for the Chat plugin, and add your fork as the marketplace.

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
| Plugin installed in Chat but no tools, works in Work mode | You installed **Scrummy for Codex**, which bundles an MCP server, so OpenAI marks it Desktop only | Install **Scrummy for Chat** instead, which needs a registered connector id |
| "Couldn't load connector" when adding the Chat plugin | Its `.app.json` still holds the placeholder id, so there is no app to load | Register the app in developer mode and run `bin/enable-chat-plugin.sh`; until then only install **Scrummy for Codex** |
| Marketplace missing on chatgpt.com but present in the desktop app | It was added to the local `~/.codex/config.toml`, which ChatGPT web does not read | A workspace admin imports it under Workspace settings → Plugins, or publish to the universal directory |
| Agent never opens a browser | The deployment has not set `PLANE_PUBLIC_URL`, so OAuth is off | Set it on the MCP container to the public origin, then reconnect |
| A workspace is missing | It was left unticked at consent | Reconnect and tick it; the refusal message names the workspace |
| "Could not tell which of N workspaces to use" | A call that needs a named workspace, such as creating a project, got none | Name the workspace in that call |
| 401 on every call | The connection expired or was revoked | Reconnect; the agent will run the sign-in again |
| Skill fires on ordinary code talk | Description matched loosely | It should decline silently; if it keeps happening, add `disable-model-invocation: true` to `SKILL.md` and invoke with `/scrummy` |
| Assignment fails | Person is not a project member | The skill adds them first; if it cannot, they need a workspace invitation |
