# 🌐 世界书工坊 · AI 驱动

一个单文件、零依赖安装的 AI 驱动世界书（Lorebook）创作工坊。双击 `index.html` 即可离线使用。

## ✨ 功能亮点
- 📚 **世界书管理**：多世界书、条目增删改查、拖拽排序、跨书移动、SillyTavern V2/V3 兼容导入导出
- 🤖 **AI 设定交流助手**：流式打字机、原生 Function Calling / Tool Calling、旧版文本引擎自动兜底、`<think>` 思考屏蔽、Markdown 表格/代码块保留渲染
- 🕵️ **对话详情**：查看完整 AI 回复与隐藏元指令、系统提示词、提取的操作指令
- 🌐 **星图（知识图谱）**：ECharts 力导向图可视化条目关联，点击节点直达编辑
- 💾 **超大容量存储**：IndexedDB（localforage）主存储 + LocalStorage 降级 + 断网修改时间戳合并
- 📊 **批量生成 / 智能调优 / 触发扫描**：AI 驱动的批量建条目、全局参数优化、关键词触发预览

## 🚀 在线预览（GitHub Pages）
部署后访问：`https://<用户名>.github.io/<仓库名>/`

## � 一键部署（增强版）

在 `github-deploy` 目录下运行 `.\deploy.ps1` 即可完成**同步 → 提交 → 推送 → 开启 Pages** 全流程：

```powershell
cd github-deploy
.\deploy.ps1                        # 一键部署（自动把父目录 新文件2.HTML 同步为 index.html）
.\deploy.ps1 -CommitMessage "更新日志"   # 指定提交信息
.\deploy.ps1 -SourceFile ..\index.html  # 指定其它源文件
.\deploy.ps1 -RepoName my-lorebook -Private   # 部署到新私有仓库
.\deploy.ps1 -SkipSync -SkipPush           # 只提交当前内容，不推送
```

脚本行为：
1. 自动把源文件（默认 `..\新文件2.HTML`）同步为 `index.html`
2. 有变更时自动 `git add/commit`（未指定提交信息则自动带时间戳）
3. 检查 `gh` 登录 → 推送 `main` 分支（仓库不存在时自动创建）
4. 幂等地开启/更新 GitHub Pages（从 `main` 分支根目录服务）

> 前置要求：已安装并登录 GitHub CLI（`gh auth login`），且本目录为 git 仓库。

## �🛠️ 本地使用
直接双击打开 `index.html` 即可（数据保存在浏览器本地，断网可用）。

## ⚙️ 配置 API
在页面顶部「⚙️」配置 API Key（兼容 OpenAI 格式接口），即可启用全部 AI 功能。
