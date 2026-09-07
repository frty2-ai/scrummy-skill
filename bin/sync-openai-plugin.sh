#!/usr/bin/env sh
# Mirror the skill at the repo root into the Codex/ChatGPT plugin.
#
# The repo root is the canonical skill: Claude Code, claude.ai and a plain
# clone all read it there. Codex and ChatGPT install plugins instead, and a
# plugin must be self-contained because the marketplace fetches only its
# sparse path -- a symlink pointing outside it would dangle. So the skill is
# copied in rather than referenced, and this script is what keeps the copy
# honest. Run it after editing the skill, before publishing.
set -eu
root="$(cd "$(dirname "$0")/.." && pwd)"
dest="$root/plugins/scrummy/skills/scrummy"

rm -rf "$dest"
mkdir -p "$dest"
for item in SKILL.md LICENSE references playbooks examples agents assets; do
  [ -e "$root/$item" ] && cp -R "$root/$item" "$dest/"
done

# Plugin-level icons live beside the manifest, not inside the skill.
mkdir -p "$root/plugins/scrummy/assets"
cp "$root/assets/scrummy-icon.svg" "$root/plugins/scrummy/assets/composer-icon.svg"
cp "$root/assets/scrummy-logo.svg" "$root/plugins/scrummy/assets/logo.svg"

echo "synced -> plugins/scrummy/skills/scrummy"
find "$dest" -maxdepth 1 -mindepth 1 -printf '  %f\n' | sort
