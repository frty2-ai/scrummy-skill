#!/usr/bin/env sh
# Publish the ChatGPT Chat plugin once you have a real app id.
#
# Chat on the web cannot run a plugin's own MCP server. It can only call an
# app that ChatGPT already hosts, so plugins/scrummy-chat is built but is
# deliberately NOT listed in .agents/plugins/marketplace.json: an entry whose
# .app.json holds a placeholder is offered for install and then fails with
# "Couldn't load connector", which looks like a broken product. This script
# adds the entry only once the id is real.
#
# Get an id: in ChatGPT turn on Settings -> Security and login -> Developer
# mode, go to chatgpt.com/plugins, press +, enter
# https://scrum.beta.safeai.global/mcp, approve the OAuth flow, then copy the
# app's id from the browser URL. Use the app's id, not a plugin id.
#
#   sh bin/enable-chat-plugin.sh <app-id>
#
# Then commit and republish. See INSTALL.md for the whole path.
set -eu
id="${1:-}"
if [ -z "$id" ]; then
  echo "usage: sh bin/enable-chat-plugin.sh <app-id>" >&2
  exit 2
fi
case "$id" in
  REPLACE_WITH_CONNECTOR_ID|*[!A-Za-z0-9_-]*)
    echo "error: '$id' does not look like an app id" >&2; exit 2 ;;
esac

root="$(cd "$(dirname "$0")/.." && pwd)"
python3 - "$root" "$id" <<'PY'
import json, sys, pathlib, collections
root, app_id = pathlib.Path(sys.argv[1]), sys.argv[2]

app = root / "plugins/scrummy-chat/.app.json"
data = json.loads(app.read_text(), object_pairs_hook=collections.OrderedDict)
data["apps"]["scrummy"]["id"] = app_id
app.write_text(json.dumps(data, indent=2) + "\n")

mk = root / ".agents/plugins/marketplace.json"
data = json.loads(mk.read_text(), object_pairs_hook=collections.OrderedDict)
entry = collections.OrderedDict([
    ("name", "scrummy-chat"),
    ("source", collections.OrderedDict([
        ("source", "local"), ("path", "./plugins/scrummy-chat")])),
    ("policy", collections.OrderedDict([
        ("installation", "AVAILABLE"), ("authentication", "ON_INSTALL")])),
    ("category", "Productivity"),
])
plugins = [p for p in data["plugins"] if p["name"] != "scrummy-chat"]
plugins.append(entry)
data["plugins"] = plugins
mk.write_text(json.dumps(data, indent=2) + "\n")

print(f"app id set to {app_id}")
print("scrummy-chat listed in the marketplace:",
      ", ".join(p["name"] for p in plugins))
PY
