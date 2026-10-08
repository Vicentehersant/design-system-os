#!/usr/bin/env bash
# zero-hex-grep.sh — fail if hardcoded hex colors appear outside token files.
# Usage: ./zero-hex-grep.sh [dir ...]   (default: src)
# Allowed files: tokens.css, globals.css, theme.css (edit ALLOW to change).
set -uo pipefail

DIRS=("${@:-src}")
ALLOW='(tokens|globals|theme)\.css'

MATCHES=$(grep -rnE '#[0-9a-fA-F]{3}([0-9a-fA-F]{1}|[0-9a-fA-F]{3}|[0-9a-fA-F]{5})?\b' "${DIRS[@]}" \
  --include='*.ts' --include='*.tsx' --include='*.js' --include='*.jsx' \
  --include='*.css' --include='*.scss' --include='*.html' \
  --include='*.vue' --include='*.svelte' --include='*.astro' \
  --exclude-dir=node_modules --exclude-dir=.next --exclude-dir=dist 2>/dev/null \
  | grep -vE "$ALLOW" \
  | grep -vE '^[^:]+:[0-9]+:[[:space:]]*(//|/\*|\*)')

if [ -n "$MATCHES" ]; then
  echo "Zero-hex: FAILED — hardcoded hex colors found outside token files:"
  echo "$MATCHES"
  echo
  echo "Replace each with a semantic token (e.g. var(--color-text-muted) / text-muted)."
  exit 1
fi

echo "Zero-hex: clean"
