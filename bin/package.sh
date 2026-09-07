#!/usr/bin/env sh
# Package the skill for claude.ai (Customize → Skills → upload).
# Produces scrummy.zip next to this directory, with the skill folder at the
# root of the archive, which is the layout claude.ai expects.
set -eu
here="$(cd "$(dirname "$0")/.." && pwd)"
name="$(basename "$here")"
out="$(dirname "$here")/$name.zip"
rm -f "$out"
cd "$(dirname "$here")"
# The plugin tree under plugins/ is a copy of this same skill for Codex and
# ChatGPT, and .agents/ is its marketplace. Neither belongs in an upload that
# is already the skill itself, and including them would double the archive.
zip -qr "$out" "$name" \
  -x "$name/bin/*" "$name/.claude-plugin/*" "$name/.mcp.json" "$name/*.zip" "$name/.git/*" \
     "$name/plugins/*" "$name/.agents/*"
echo "wrote $out"
unzip -l "$out" | tail -n +4 | head -n 30
