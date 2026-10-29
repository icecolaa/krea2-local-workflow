#!/usr/bin/env bash
# 双源推送：同时推 GitHub 和 Gitee
# 首次使用前先添加远程（地址换成你自己的）：
#   git remote add github https://github.com/<用户名>/krea2-local-workflow.git
#   git remote add gitee  https://gitee.com/<用户名>/krea2-local-workflow.git
set -e
cd "$(dirname "$0")/.."
fail=0
for r in github gitee; do
  if git remote get-url "$r" >/dev/null 2>&1; then
    echo "==> pushing to $r ($(git remote get-url $r))"
    git push -u "$r" main || { echo "!! $r 推送失败"; fail=1; }
  else
    echo "!! 远程 $r 未配置，跳过（见脚本头部注释）"
    fail=1
  fi
done
exit $fail
