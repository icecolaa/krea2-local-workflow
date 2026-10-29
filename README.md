# Krea2 本地出图工作流

RTX 3080 10GB 上从零跑通 Krea2 Turbo 本地出图的完整实录：环境布局、一键启动、出图脚本、提示词方法论、玩法清单与排障手册。

**👉 打开 [`index.html`](index.html) 看完整手册（含实出样图对比）。**

## 仓库结构

```
krea2-local-workflow/
├── index.html            # 作战手册（主文档）
├── krea2-generate.mjs    # 命令行出图脚本（Node 调 ComfyUI API）
├── assets/               # 实出样图（种子42 基线 vs LoRA 对比）
└── scripts/
    └── 启动ComfyUI.bat   # 一键启动器副本（桌面那份的源）
```

## 30 秒速览

| 环节 | 内容 |
|---|---|
| 后端 | `D:\LocalAI\ComfyUI_windows_portable`（v0.43.0，端口 8188） |
| 界面 | 浏览器 `127.0.0.1:8188` 或 Comfy Desktop 远程连接 |
| 模型 | Krea2 Turbo FP8 三件套（17.3GB）+ 墨玉 AIO（22.3GB，二选一）+ 人像 LoRA ×3 |
| 关键参数 | 8 步 / CFG 1 / euler / simple / 负向 ConditioningZeroOut |
| 出图脚本 | `node krea2-generate.mjs <nolora\|lora> <种子> <输出名>` |

## 双源推送

仓库已配好双远程的推送脚本，首次使用前先添加你的仓库地址：

```bash
git remote add github https://github.com/<你的用户名>/krea2-local-workflow.git
git remote add gitee  https://gitee.com/<你的用户名>/krea2-local-workflow.git
bash scripts/push-both.sh
```

---
*生成于 2026-10-30 · 数据源：当天全程实测 + 微信群「手绘-贴图」看板（2026-10-29）*
