# 🌌 Worldbook Workshop (世界书工坊)
> The Ultimate AI-Driven Lore & Context Manager for SillyTavern 
> 专为 SillyTavern (酒馆) 与 AI 跑团玩家打造的终极本地化世界观构建中枢

[![Local First](https://img.shields.io/badge/Architecture-100%25_Local-success?style=flat-square)](#) 
[![SillyTavern Compatible](https://img.shields.io/badge/SillyTavern-Fully_Compatible-blue?style=flat-square)](#)
[![IndexedDB](https://img.shields.io/badge/Storage-IndexedDB_Powered-orange?style=flat-square)](#)

[**[English]**](#english-introduction) | [**[中文介绍]**](#中文介绍)

---

## 🚀 Quick Start / 一键在线使用
**No Installation Required! / 免安装，点开即用：**
🔗 **[Play Now on GitHub Pages](https://tian2418671-sys.github.io/worldbook-workshop/)** *(Your API keys and worldbooks are safely stored in your browser's local IndexedDB. Zero server tracking.)*
*(您的 API Key 和所有数据均极其安全地保存在本地浏览器的 IndexedDB 中，没有任何服务端遥测或上传。)*

---

## 🇨🇳 中文介绍

**还在用纯文本痛苦地手搓世界书？AI 总是忘记你的设定或者格式乱跑？**
《世界书工坊》是一个**纯前端、无服务端、开箱即用**的硬核生产力工具。它不仅是一个世界书编辑器，更是一个懂酒馆底层逻辑的"全知造物主"。

### 🔥 核心黑科技 (Core Features)

- 🧠 **RAG 全局参谋知识库 (Global RAG Database)**
  你可以导入一整本《19世纪工业科技树》或《魔法阵列大全》作为底层数据库。一键开启后，AI 在帮你扩写设定时，会**强制参考**这些底层逻辑，彻底告别 AI 的玄幻脑补。
- 🎓 **自定义格式克隆引擎 (AI Syntax Learner)**
  无论你习惯用 **W++** (如 `[Character("X"){Mind("Y")}]`)，还是自定义的 XML 标签，只需贴一段样本，工坊的 AI 就会自动提取语法特征，并在后续生成中**100% 完美复刻**你的排版！
- 🎯 **SillyTavern 生态级兼容 (Native Tavern Integration)**
  完全吃透酒馆底层逻辑。无损导入/导出 JSON/YAML 格式世界书。完美解析酒馆现代的 Prompt Manager（预设管理器），全面支持 `{{char}}`, `{{user}}` 等宏自适应渲染。
- 🌌 **神经拓扑星图可视化 (Neural Topology Graph)**
  内嵌 ECharts 渲染引擎。一键将你孤立的文本设定转化为错综复杂的视觉网络，支持点击节点直接跳转编辑，设定关系一目了然。
- 🛡️ **无尽存储与极客级安全 (Infinite Local Storage)**
  突破 LocalStorage 5MB 限制，采用 IndexedDB 底层。你的超长上下文、几万字的设定集、本地/云端大模型 API 密钥，**永远只存在你的本地设备上**。

---

## 🇬🇧 English Introduction

**Tired of manually writing Worldbooks in plain text? Frustrated when the AI forgets your lore or breaks your formatting?**
*Worldbook Workshop* is a **100% local, serverless, out-of-the-box** hardcore productivity tool. It's not just an editor; it's an "Omniscient Creator" that understands the underlying mechanics of SillyTavern.

### 🔥 Killer Features

- 🧠 **Global RAG Database (Lore Reference Engine)**
  Import entire encyclopedias (e.g., "19th Century Tech Tree" or "Magic Spells Compendium") into the database. Toggle them on, and the AI will be **forced to reference** these foundational rules when generating new lore, completely eliminating AI hallucinations.
- 🎓 **AI Syntax & Format Learner**
  Whether you use **W++** format (e.g., `[Character("X"){Mind("Y")}]`) or custom XML tags, just paste a short sample. The AI engine will instantly analyze your syntax rules and **100% flawlessly replicate** your exact formatting in all future generations!
- 🎯 **Native SillyTavern Integration**
  Fully compatible with SillyTavern's core logic. Lossless import/export of JSON/YAML Worldbooks. Perfectly parses the modern Prompt Manager, supporting macros like `{{char}}` and `{{user}}` with adaptive rendering.
- 🌌 **Neural Topology Graph (Visual Lore)**
  Powered by ECharts. Turn your isolated text entries into a complex, interactive visual knowledge network with one click. Click on any node to jump straight into editing.
- 🛡️ **Infinite Storage & Ultimate Privacy**
  Bypasses the 5MB LocalStorage limit by utilizing IndexedDB. Your massive lore books, chat histories, and API Keys for Local/Cloud LLMs **never leave your device**. 100% secure.

---

### 🛠️ How to use locally / 本地部署与使用
If you prefer to run it completely offline:
如果你希望将它完全离线运行：
1. `git clone https://github.com/tian2418671-sys/worldbook-workshop.git`
2. Open `index.html` in any modern browser (Chrome/Edge/Firefox). / 直接用任何现代浏览器双击打开 `index.html` 即可。

### 🤝 Contributing & Feedback / 反馈与贡献
Found a bug or have a feature request? Feel free to open an **Issue** or submit a **Pull Request**!
如果你发现了 Bug 或者有绝妙的点子，欢迎在 Issue 中踢我！
