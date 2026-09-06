#!/bin/sh
set -eu

REPO="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
cd "$REPO"

MSG="${1:-Sinkronisasi MA25-31017}"

echo "============================================================"
echo "MA25-31017 SYNC: PULL -> BUILD -> COMMIT -> PUSH"
echo "============================================================"

GITDIR=$(git rev-parse --git-dir)

if [ -d "$GITDIR/rebase-merge" ] || \
   [ -d "$GITDIR/rebase-apply" ] || \
   [ -f "$GITDIR/MERGE_HEAD" ]; then
  echo "ERROR: ada operasi merge/rebase yang belum selesai."
  git status --short
  exit 1
fi

for f in $(git ls-files '*.pdf' 2>/dev/null || true); do
  git restore --source=HEAD --staged --worktree -- "$f" >/dev/null 2>&1 || true
done

STASHED=0
STASH_NAME="auto-sync-$(date +%Y%m%d_%H%M%S)"

if [ -n "$(git status --porcelain)" ]; then
  git stash push -u -m "$STASH_NAME" >/dev/null
  STASHED=1
fi

git fetch origin

if git rev-parse --verify origin/main >/dev/null 2>&1; then
  git checkout main >/dev/null 2>&1 || true
  git merge --no-edit origin/main
fi

if [ "$STASHED" -eq 1 ]; then
  STASH_REF=$(git stash list | awk -v m="$STASH_NAME" \
    'index($0,m){sub(/:.*/,"",$0); print; exit}')

  if [ -n "$STASH_REF" ]; then
    if git stash apply "$STASH_REF"; then
      git stash drop "$STASH_REF" >/dev/null
    else
      echo "ERROR: perubahan lokal bertabrakan dengan perubahan GitHub."
      echo "Stash tetap aman: $STASH_REF"
      exit 1
    fi
  fi
fi

echo "==> Build"
sh tools/build.sh

git add -A

if git diff --cached --quiet; then
  echo "INFO: tidak ada perubahan untuk commit."
else
  git commit -m "$MSG"
fi

git fetch origin

if git rev-parse --verify origin/main >/dev/null 2>&1; then
  git merge --no-edit origin/main
fi

git push -u origin main

LOCAL_SHA=$(git rev-parse HEAD)
REMOTE_SHA=$(git ls-remote origin refs/heads/main | awk '{print $1}')

[ "$LOCAL_SHA" = "$REMOTE_SHA" ] || {
  echo "ERROR: push tidak terverifikasi."
  exit 1
}

echo
echo "BERHASIL: sync + build + push"
echo "SHA: $LOCAL_SHA"
