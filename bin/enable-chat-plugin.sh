#!/usr/bin/env sh
# Turn on the ChatGPT Chat plugin once you have a connector id.
#
# Chat on the web cannot run a plugin's own MCP server. It can only call a
# connector ChatGPT hosts, so plugins/scrummy-chat ships with a placeholder
# id and is held back from the marketplace until that id is real. Get one by
# registering https://scrum.beta.safeai.global/mcp at chatgpt.com/plugins
# with developer mode on, then copy the id out of the browser URL.
#
#   sh bin/enable-chat-plugin.sh <connector-id>
#
# Then commit and republish. See INSTALL.md for the whole path.
set -eu
id="${1:-}"
if [ -z "$id" ]; then
  echo "usage: sh bin/enable-chat-plugin.sh <connector-id>" >&2
  exit 2
fi
case "$id" in
  REPLACE_WITH_CONNECTOR_ID|*" "*|"")
    echo "error: '$id' is not a connector id" >&2; exit 2 ;;
esac

root="$(cd "$(dirname "$0")/.." && pwd)"
python3 - "$root" "$id" <<'PY'
import json, sys, pathlib
root, cid = pathlib.Path(sys.argv[1]), sys.argv[2]

app = root / "plugins/scrummy-chat/.app.json"
data = json.loads(app.read_text())
data["apps"]["scrummy"]["id"] = cid
app.write_text(json.dumps(data, indent=2) + "\n")

mk = root / ".agents/plugins/marketplace.json"
data = json.loads(mk.read_text())
for plugin in data["plugins"]:
    if plugin["name"] == "scrummy-chat":
        plugin["policy"]["installation"] = "AVAILABLE"
mk.write_text(json.dumps(data, indent=2) + "\n")
print(f"connector id set to {cid}")
print("scrummy-chat is now AVAILABLE in the marketplace")
PY
