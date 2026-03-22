# TOOLS - 工具与配置汇总

> 这是我的作弊表（cheat sheet）——不是文档，只是我操作所需的事实信息。

---

## 系统信息

### 基础环境
- **操作系统**：Windows (win32)
- **Shell**：PowerShell
- **Workspace**：`c:/Users/Administrator/WorkBuddy/Claw`
- **User Home**：`C:\Users\Administrator`

### 目录结构
```
~/
├── .workbuddy/
│   ├── automations/          # 自动化任务配置
│   ├── memory/               # 记忆系统
│   │   ├── MEMORY.md         # 精选长期记忆
│   │   ├── learnings.md      # 教训与规则
│   │   └── YYYY-MM-DD.md     # 每日日志
│   ├── skills/               # 用户级技能
│   └── mcp.json              # MCP 服务器配置
└── WorkBuddy/Claw/
    ├── .workbuddy/
    │   └── skills/           # 项目级技能
    ├── docs/                 # 项目文档
    ├── examples/             # 示例文件
    ├── scripts/              # 脚本文件
    └── README.md
```

---

## Git 配置

### 仓库信息
- **仓库路径**：`C:\Users\Administrator\WorkBuddy\Claw`
- **远程仓库**：`https://github.com/kumbaya1987/Claw.git`
- **当前分支**：`main`
- **Git 路径**：`C:\Program Files\Git\bin\git.exe`

### 常用命令
```powershell
# 基本操作
cd "C:\Users\Administrator\WorkBuddy\Claw"
& "C:\Program Files\Git\bin\git.exe" add <files>
& "C:\Program Files\Git\bin\git.exe" commit -m "<message>"
& "C:\Program Files\Git\bin\git.exe" push origin main

# 查看状态
& "C:\Program Files\Git\bin\git.exe" status
& "C:\Program Files\Git\bin\git.exe" log --oneline

# 查看特定提交
& "C:\Program Files\Git\bin\git.exe" show <commit-hash>

# 回退操作（谨慎使用）
& "C:\Program Files\Git\bin\git.exe" restore <file>
```

### 工作流规则
- ✅ 提交后立即推送
- ❌ 禁止 `force push`
- ❌ 禁止删除分支（除非确认）
- ✅ 保护 Git 历史完整性

---

## SSH 信息

### 已知服务器
- **目前无 SSH 配置记录**

### 使用方式
```powershell
# SSH 连接示例
ssh user@hostname

# SSH 密钥位置（如果有）
C:\Users\Administrator\.ssh\
```

---

## API 配置

### API 密钥位置
所有 API 密钥存储在：`.secrets/`

### 已配置 API
- **目前无 API 密钥记录**

### API 使用示例
```bash
# OpenAI
export OPENAI_API_KEY=$(cat ~/.secrets/openai.txt)

# Google Gemini
export GEMINI_API_KEY=$(cat ~/.secrets/gemini.txt)

# Anthropic Claude
export ANTHROPIC_API_KEY=$(cat ~/.secrets/anthropic.txt)

# xAI (Grok)
export XAI_API_KEY=$(cat ~/.secrets/xai.txt)
```

---

## 部署目标

### 生产环境
- **目前无生产环境配置记录**

### 部署命令示例
```bash
# Netlify 部署（如果有）
npx netlify-cli deploy --prod

# Vercel 部署（如果有）
npx vercel deploy --prod
```

---

## 已安装工具

### CLI 工具
| 工具 | 用途 | 检查命令 |
|------|------|----------|
| **Git** | 版本控制 | `git --version` |
| **Python** | Python 脚本 | `python --version` |
| **Node.js** | Node.js 环境 | `node --version` |
| **npm** | Node 包管理 | `npm --version` |
| **curl** | 网络请求 | `curl --version` |
| **PowerShell** | Windows Shell | `$PSVersionTable` |

### Python 包
| 包 | 用途 | 检查命令 |
|----|------|----------|
| **PyPDF2** | PDF 读取 | `python -c "import PyPDF2"` |

### Node.js 包（npx 可用）
| 包 | 用途 | 检查命令 |
|----|------|----------|
| **clawhub** | OpenClaw 技能安装 | `npx clawhub search <skill>` |
| **mcporter** | MCP 服务器管理 | `npx mcporter list` |

---

## 机器名称

### 本地机器
- **主机名**：`WIN-2601081628`
- **用户**：`Administrator`
- **域名**：`workbuddy`

### 远程机器
- **目前无远程机器配置**

---

## 已安装技能（Skills）

### 用户级技能位置
`C:\Users\Administrator\.workbuddy\skills\`

### 项目级技能位置
`C:\Users\Administrator\WorkBuddy\Claw\.workbuddy\skills\`

### 已安装技能列表（示例）
| 技能名称 | 功能 | 安装位置 |
|---------|------|---------|
| **ima** | IMA 笔记服务 | 用户级 |
| **obsidian** | Obsidian 笔记管理 | 用户级 |
| **baidu-search** | 百度 AI 搜索 | 用户级 |
| **github** | GitHub CLI 集成 | 用户级 |
| **excel-xlsx** | Excel 文件处理 | 用户级 |
| **ai-ppt-generator** | AI PPT 生成 | 用户级 |
| **AI绘图** | 图像生成（Gemini 3 Pro） | 用户级 |

> 注意：具体已安装技能需通过 `Get-ChildItem` 命令检查

### 技能查找优先级
1. WorkBuddy 内置技能
2. 已安装的 skillhub 技能（`~/.workbuddy/skills/`）
3. ClawHub 下载安装（仅在前两步都无匹配时）

---

## MCP 服务器配置

### MCP 配置文件
`C:\Users\Administrator\.workbuddy\mcp.json`

### 已配置 MCP 服务器
- **github** - GitHub 集成
- **link-reader** - 网页抓取
- **summarize** - 内容总结

### MCP 工具使用
- 创建仓库：`create_repository`
- 搜索仓库：`search_repositories`
- 创建 Issue：`create_issue`
- 创建 PR：`create_pull_request`

---

## 浏览器规则

### Chrome Browser Relay (profile="chrome")
- **用途**：访问需要登录会话的网站
- **示例**：Twitter、YouTube、认证仪表板

### 隔离浏览器 (profile="openclaw")
- **用途**：通用 Web 自动化
- **示例**：无头浏览器测试、网页抓取

### 浏览器相关技能
- **fast-browser-use** - 浏览器自动化
- **agent-browser** - 复杂浏览器交互

---

## 自动化任务（Automations）

### 自动化配置位置
`~/.workbuddy/automations/<automation-id>/automation.toml`

### 创建自动化规则
- 使用 iCalendar RRULE 格式（`FREQ=HOURLY`, `FREQ=WEEKLY` 等）
- 支持的计划：
  - Hourly: `FREQ=HOURLY;INTERVAL=<hours>`
  - Weekly: `FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR,SA,SU;BYHOUR=9;BYMINUTE=0`
  - Daily: `FREQ=DAILY;BYHOUR=0;BYMINUTE=0`

---

## 心跳检查（Heartbeat）

### 心跳配置文件
`.workbuddy/HEARTBEAT.md`

### 建议的心跳任务
- 日历检查
- Todoist 同步
- 品牌交易跟踪
- 鱼缸监控（如果有）
- 系统状态检查

---

## 常用命令速查

### 文件操作
```powershell
# 列出目录
Get-ChildItem "C:\path" -Directory

# 删除文件（需要用户确认）
Remove-Item "C:\path\file" -Force -ErrorAction SilentlyContinue

# 复制文件
Copy-Item "C:\source" "C:\dest" -Recurse -Force
```

### 网络操作
```powershell
# 下载文件
curl -o "C:\dest\file.ext" "http://example.com/file.ext"

# 网络搜索（如果有 API）
# 使用 baidu-search 技能或其他搜索工具
```

### Git 操作
```powershell
# 查看最后 3 条推送输出
& "C:\Program Files\Git\bin\git.exe" push origin main 2>&1 | Select-Object -Last 3

# 查看提交历史
& "C:\Program Files\Git\bin\git.exe" log --oneline --since="2026-03-20"
```

---

## 问题排查

### 常见问题
1. **Git 推送失败**
   - 检查网络连接
   - 确认远程仓库 URL 正确
   - 本地提交成功即可，推送失败不阻塞工作流

2. **技能安装失败**
   - 检查 ClawHub 网络连接
   - 优先使用本地已安装技能
   - 使用 `--force` 参数强制覆盖

3. **文件删除被取消**
   - 删除前明确说明删除内容
   - 使用 `requires_approval=true` 参数
   - 等待用户明确确认

---

## 更新日志

### 2026-03-22 15:33
- 创建 TOOLS.md 文件
- 汇总系统信息、Git 配置、API 配置、已安装工具等

---

## 维护说明

- 本文件应在以下情况更新：
  - 安装新工具时
  - 添加新 API 密钥时
  - 添加新的部署目标时
  - 机器配置变更时

- 维护频率：
  - 每周检查一次
  - 每次安装新工具后立即更新

---

**文件信息**
- **创建时间**：2026-03-22 15:33
- **最后更新**：2026-03-22 15:33
- **创建人**：WorkBuddy AI Assistant
- **用途**：快速查找工具和配置信息
