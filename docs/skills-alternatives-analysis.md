# 技能替代方案对比分析

> 基于 `~/.workbuddy/skills` 现有技能库的检查结果

---

## ✅ 已安装的替代技能

### 1. Humanizer（洗掉 AI 味）

| 项目 | 已安装 | ClawHub 备选 | 评分对比 |
|------|---------|----------------|----------|
| **humanizer** | ✅ 已安装 | `ai-humanizer` | 3.603 |
| 功能 | ✅ 移除 AI 写作痕迹 | 同类功能 | - |
| 评分 | 未知（本地安装） | 3.603 | 已有即可 |

**结论**：✅ **已有 `humanizer`，无需安装 `ai-humanizer`**

---

### 2. Obsidian（知识库联动）

| 项目 | 已安装 | ClawHub 备选 | 评分对比 |
|------|---------|----------------|----------|
| **obsidian** | ✅ 已安装 | `obsidian-notesmd-cli` | 3.477 |
| 功能 | ✅ 管理 Obsidian vault + obsidian-cli 自动化 | 同类功能 | - |
| 评分 | 未知（本地安装） | 3.477 | 已有即可 |

**结论**：✅ **已有 `obsidian`，无需安装 `obsidian-notesmd-cli`**

---

### 3. GitHub（代码管理）

| 项目 | 已安装 | ClawHub 备选 | 评分对比 |
|------|---------|----------------|----------|
| **github** | ✅ 已安装 | `openclaw-github-assistant` | 3.675 |
| 功能 | ✅ `gh` CLI 管理 Issues/PR/CI | 同类功能 | - |
| 评分 | 未知（本地安装） | 3.675 | 已有即可 |

**结论**：✅ **已有 `github`，无需安装 `openclaw-github-assistant`**

---

### 4. Browser Use（浏览器控制）

| 项目 | 已安装 | ClawHub 备选 | 评分对比 |
|------|---------|----------------|----------|
| **fast-browser-use** | ✅ 已安装 | `browser-use` | 3.799 |
| `playwright` | ❌ 未安装 | `playwright` | 3.608 |
| 功能 | ✅ Rust 驱动浏览器自动化（CDP 直接驱动 Chrome） | 同类功能 | - |
| 特点 | 10x 快于 Puppeteer，15 MB 内存占用 | 基于 Node.js | - |

**结论**：
- ✅ **已有 `fast-browser-use`，无需安装 `browser-use`**
- ⚠️ **`playwright` 仍需安装**（评分 3.608，功能更完整）

---

## ❌ 仍需从其他平台安装的技能

### 优先级 1：联网搜索

| 技能 | 功能 | 替代方案 | 建议 |
|------|------|----------|------|
| **Tavily 搜索** | 结构化搜索结果 | WorkBuddy 内置 `web_search` 工具 | 使用内置工具 + 配置 Tavily API Key |
| **Firecrawl 抓取** | 网页抓取神奇 | WorkBuddy 内置 `web_fetch` 工具 | 使用内置工具 + 配置 Firecrawl API Key |

**结论**：
- ⚠️ ClawHub 安装失败
- ✅ **WorkBuddy 内置 `web_search` 和 `web_fetch` 工具已具备类似功能**
- 💡 建议直接配置 API Key 使用内置工具

---

### 优先级 2：Playwright

| 技能 | 评分 | 状态 |
|------|------|------|
| **playwright** | 3.608 | ❌ 未安装 |

**功能差异**：
- `fast-browser-use`：Rust 驱动，轻量快速，适合简单抓取
- `playwright`：支持多浏览器（Chrome/Firefox/Safari），功能更完整

**建议**：
- ✅ **保留 `fast-browser-use` 用于快速任务**
- ⚠️ **需要时再安装 `playwright` 用于复杂多浏览器场景**

---

### 优先级 3：Linear

| 技能 | 功能 | 状态 |
|------|------|------|
| **linear-skill** | Bug 进度跟踪 | ❌ 未安装 |
| 评分 | 3.511 | - |

**替代方案**：
- ⚠️ 检测到您已有 `trello` 技能（看板工具）
- 💡 若 Trello 可满足需求，Linear 可暂缓安装

---

## 📊 最终建议

### 立即可用（已安装）

| 技能 | 来源 | 状态 |
|------|------|------|
| ✅ **humanizer** | 本地安装 | 可用 |
| ✅ **obsidian** | 本地安装 | 可用 |
| ✅ **github** | 本地安装 | 可用 |
| ✅ **fast-browser-use** | 本地安装 | 可用 |

### 暂缓/替代方案

| 技能 | 替代方案 | 原因 |
|------|----------|------|
| ❌ **ai-humanizer** | 已有 `humanizer` | 重复 |
| ❌ **openclaw-tavily-search** | 内置 `web_search` | ClawHub 失败 |
| ❌ **firecrawl-search** | 内置 `web_fetch` | ClawHub 失败 |
| ❌ **browser-use** | 已有 `fast-browser-use` | 重复 |
| ❌ **obsidian-notesmd-cli** | 已有 `obsidian` | 重复 |
| ❌ **openclaw-github-assistant** | 已有 `github` | 重复 |

### 按需安装

| 技能 | 评分 | 建议 |
|------|------|------|
| ⏳ **playwright** | 3.608 | 需要多浏览器支持时安装 |
| ⏳ **linear-skill** | 3.511 | 检查 Trello 是否满足需求 |

---

## 🚀 内置工具配置

### 配置 Tavily 搜索

WorkBuddy 内置 `web_search` 工具，可配置使用 Tavily：

1. 获取 API Key：https://tavily.com
2. 配置环境变量：
```powershell
[System.Environment]::SetEnvironmentVariable("TAVILY_API_KEY", "your_api_key", "User")
```

### 配置 Firecrawl 抓取

WorkBuddy 内置 `web_fetch` 工具，可配置使用 Firecrawl：

1. 获取 API Key：https://www.firecrawl.dev
2. 配置环境变量：
```powershell
[System.Environment]::SetEnvironmentVariable("FIRECRAWL_API_KEY", "your_api_key", "User")
```

---

_分析完成时间：2026-03-22 10:33_
