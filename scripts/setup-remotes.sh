#!/usr/bin/env bash
# 双源远程配置 + 首推（GitHub + Gitee，Gitee 放在 push 链前面）
# 用法: bash scripts/setup-remotes.sh <github仓库URL> <gitee仓库URL>
set -e
cd "$(dirname "$0")/.."
GH="$1"
GE="$2"
if [ -z "$GH" ] || [ -z "$GE" ]; then
  echo "用法: bash scripts/setup-remotes.sh <github仓库URL> <gitee仓库URL>"
  echo "示例: bash scripts/setup-remotes.sh https://github.com/icecola/krea2-local-workflow.git https://gitee.com/icecola/krea2-local-workflow.git"
  exit 1
fi
git remote remove origin 2>/dev/null || true
git remote add origin "$GH"
git remote set-url --add --push origin "$GE"
git remote set-url --add --push origin "$GH"
echo "=== 远程配置 ==="
git remote -v
echo "=== 首推（如弹出浏览器登录，完成授权即可）==="
git push -u origin main
echo "完成。以后双推一条命令: git push origin main"
