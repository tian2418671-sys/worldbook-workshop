# 🌌 世界书工坊 · Worldbook Workshop

> 🎭 专为 SillyTavern（酒馆）与 AI 跑团玩家打造的终极本地化世界观构建中枢
> The Ultimate AI-Driven Lore & Context Manager for SillyTavern

[![Local First](https://img.shields.io/badge/Architecture-100%25_Local-success?style=flat-square)](#) 
[![SillyTavern Compatible](https://img.shields.io/badge/SillyTavern-Fully_Compatible-blue?style=flat-square)](#)
[![IndexedDB](https://img.shields.io/badge/Storage-IndexedDB_Powered-orange?style=flat-square)](#)

---

## 🚀 一键在线使用（免安装，点开即用）

🔗 **立即体验：[GitHub Pages 在线版](https://tian2418671-sys.github.io/worldbook-workshop/)**

你的 API Key 和所有世界书数据均**只保存在本地浏览器**的 IndexedDB 中，没有服务端遥测，也没有任何数据上传。

---

## 🇨🇳 项目介绍

**还在用纯文本痛苦地手搓世界书？AI 总是忘记你的设定、格式乱跑？**

《世界书工坊》是一个**纯前端、无服务端、开箱即用**的硬核生产力工具。它不仅是一个世界书编辑器，更是一个懂酒馆底层逻辑的"全知造物主"——帮你在搭建世界观时，让 AI 严格遵循你的设定与排版，彻底告别"玄幻脑补"。

### 🔥 核心黑科技

- 🧠 **RAG 全局参谋知识库**
  把《19 世纪工业科技树》《魔法阵列大全》这类设定集整本导入作为底层数据库。一键开启后，AI 在扩写设定时会**强制参考**这些底层逻辑，从根源杜绝设定崩坏。
- 🎓 **自定义格式克隆引擎**
  无论你习惯 **W++**（如 `[Character("X"){Mind("Y")}]`）还是自定义 XML 标签，只需贴一段样本，工坊就会自动提取语法特征，并在后续生成中**100% 完美复刻**你的排版。
- 🎯 **SillyTavern 生态级兼容**
  无损导入/导出 JSON/YAML 世界书，完美解析酒馆现代 Prompt Manager（预设管理器），全面支持 `{{char}}`、`{{user}}` 等宏的自适应渲染。
- 🌌 **神经拓扑星图可视化**
  内嵌 ECharts 引擎，一键把孤立的文本设定转化为错综复杂的视觉知识网络，点击节点即可直接跳转编辑。
- 🛡️ **无尽存储与极客级安全**
  突破 LocalStorage 5MB 限制，采用 IndexedDB 底层。几万字的设定集、对话历史、本地/云端大模型 API 密钥，**永远只存在你的设备上**。

---

## 🌍 English (Brief)

*Worldbook Workshop* is a **100% local, serverless** AI lore manager for SillyTavern. Import RAG reference databases, learn custom output formats, and force AI to respect your worldbuilding rules. Your data and API keys never leave your device.

---

## 🛠️ 本地使用

1. `git clone https://github.com/tian2418671-sys/worldbook-workshop.git`
2. 用任意现代浏览器（Chrome / Edge / Firefox）双击打开 `index.html` 即可，完全离线可用。

## ⚙️ 配置 API

在页面顶部「⚙️」配置 API Key（兼容 OpenAI 格式接口，支持本地 Ollama 等），即可启用全部 AI 功能。

## 🤝 反馈与贡献

发现了 Bug 或有好点子？欢迎在 **Issue** 中提出，或直接提交 **Pull Request**！
