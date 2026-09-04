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
zip -qr "$out" "$name" \
  -x "$name/bin/*" "$name/.claude-plugin/*" "$name/.mcp.json" "$name/*.zip" "$name/.git/*"
echo "wrote $out"
unzip -l "$out" | tail -n +4 | head -n 30
