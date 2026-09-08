#!/usr/bin/env sh
# Mirror the skill at the repo root into each Codex/ChatGPT plugin.
#
# The repo root is the canonical skill: Claude Code, claude.ai and a plain
# clone all read it there. Codex and ChatGPT install plugins instead, and a
# plugin must be self-contained because the marketplace fetches only its
# sparse path -- a symlink pointing outside it would dangle. So the skill is
# copied in rather than referenced, and this script is what keeps the copies
# honest. Run it after editing the skill, before publishing.
#
# There are two plugins because the two surfaces get their tools by different
# routes. plugins/scrummy declares the MCP server itself, which OpenAI marks
# "Desktop only" and runs on the local Codex host. plugins/scrummy-chat
# points at a connector ChatGPT hosts, which is the only way Chat on the web
# can reach any tool. Both carry the same skill.
set -eu
root="$(cd "$(dirname "$0")/.." && pwd)"

for plugin in scrummy scrummy-chat; do
  dest="$root/plugins/$plugin/skills/scrummy"
  rm -rf "$dest"
  mkdir -p "$dest"
  for item in SKILL.md LICENSE references playbooks examples agents assets; do
    [ -e "$root/$item" ] && cp -R "$root/$item" "$dest/"
  done

  # Plugin-level icons live beside the manifest, not inside the skill.
  mkdir -p "$root/plugins/$plugin/assets"
  cp "$root/assets/scrummy-icon.svg" "$root/plugins/$plugin/assets/composer-icon.svg"
  cp "$root/assets/scrummy-logo.svg" "$root/plugins/$plugin/assets/logo.svg"

  echo "synced -> plugins/$plugin/skills/scrummy"
  find "$dest" -maxdepth 1 -mindepth 1 -printf '    %f\n' | sort
done
