#!/usr/bin/env sh
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/rpril14/agent-harness-template/main/install.sh | sh
#   curl -fsSL https://raw.githubusercontent.com/rpril14/agent-harness-template/main/install.sh | sh -s -- my-project

set -eu

REPO="rpril14/agent-harness-template"
BRANCH="main"
DEST="${1:-.}"

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

echo "Downloading harness template..."
curl -fsSL "https://github.com/$REPO/archive/refs/heads/$BRANCH.tar.gz" \
  | tar -xz -C "$TMP" --strip-components=1

mkdir -p "$DEST"

find "$TMP" -type f | while IFS= read -r src; do
  rel="${src#$TMP/}"
  # skip the installer itself
  [ "$rel" = "install.sh" ] && continue
  [ "$rel" = "install.ps1" ] && continue

  dst="$DEST/$rel"
  if [ -e "$dst" ]; then
    echo "  skip (exists): $rel"
  else
    mkdir -p "$(dirname "$dst")"
    cp "$src" "$dst"
    echo "  add: $rel"
  fi
done

# ensure verify script is executable
chmod +x "$DEST/harness/scripts/verify" 2>/dev/null || true

echo ""
echo "Done. Harness installed to: $DEST"
echo ""
echo "Next steps:"
echo "  1. Fill in harness/PRODUCT.md"
echo "  2. Run: ./harness/scripts/verify"
echo "  3. See harness/docs/prompt-recipes.md for how to start"
