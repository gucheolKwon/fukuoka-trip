#!/bin/bash
# Fukuoka Trip Planner GitHub Sync Script
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$DIR"

# 1. Ensure index.html is always in sync with 후쿠오카_여행_스프레드시트_보기.html
if [ -f "후쿠오카_여행_스프레드시트_보기.html" ]; then
  cp "후쿠오카_여행_스프레드시트_보기.html" "index.html"
fi

# 2. Add and commit
MSG="${1:-Update Fukuoka Trip Planner}"
git add -A

if git diff-index --quiet HEAD --; then
  echo "✅ 변경된 내용이 없습니다. (Everything up-to-date)"
else
  git commit -m "$MSG"
  git push origin main
  echo "🚀 GitHub에 성공적으로 푸시되었습니다!"
  echo "🌐 접속 주소: https://gucheolkwon.github.io/fukuoka-trip/"
fi
