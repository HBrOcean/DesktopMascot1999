#!/usr/bin/env bash
# 一键把作品墙推到 GitHub
# 用法：bash push.sh
set -e

REPO="https://github.com/HBrOcean/DesktopMascot1999.git"

cd "$(dirname "$0")"

if [ ! -d .git ]; then
  git init
  git symbolic-ref HEAD refs/heads/main
fi

git add -A
git commit -m "feat: project wall" || echo "（没有新的改动需要提交）"

if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$REPO"
else
  git remote add origin "$REPO"
fi

git branch -M main

echo ""
echo "推送到 $REPO"
echo "注意：若远端已有提交，这里会用本地内容覆盖（已加 --force）。"
echo ""

git push -u origin main --force
