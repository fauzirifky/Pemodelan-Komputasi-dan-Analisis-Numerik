#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT"

MSG="${1:-Update MA25-31017}"
sh tools/build.sh
git add -A

if git diff --cached --quiet; then
  echo "Tidak ada perubahan."
  exit 0
fi

git commit -m "$MSG"
git pull --rebase origin main 2>/dev/null || true
git push -u origin main
