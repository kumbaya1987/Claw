# 技能安装清单（待完成）

> 因 ClawHub 网络不稳定，以下技能需要稍后重试或手动安装

## 已成功安装的技能

| # | 技能 | 包名 | 评分 | 状态 | Git 同步 |
|---|------|------|------|------|---------|
| 1 | **summarize** | `summarize` | 4.028 | ✅ 已安装 | ✅ 已同步 |
| - | 一键提炼要点（网页/PDF/视频） | 需 API Key（推荐 Gemini） | 安全审查通过 | - |

---

## 待安装技能（按优先级）

### 优先级 1：内容处理
| # | 技能 | 包名 | 评分 | 安装命令 |
|---|------|------|------|---------|
| 2 | **humanizer** | `ai-humanizer` | 3.603 | `npx clawhub install ai-humanizer --workdir ~ --dir .workbuddy/skills` |
| - | 洗掉 AI 味，让文本更自然 | 移除 AI 生成痕迹 | - |

### 优先级 2：联网搜索抓取
| # | 技能 | 包名 | 评分 | 安装命令 |
|---|------|------|------|---------|
| 3 | **Tavily 搜索** | `openclaw-tavily-search` | 3.747 | `npx clawhub install openclaw-tavily-search --workdir ~ --dir .workbuddy/skills` |
| 4 | **Firecrawl 抓取** | `firecrawl-search` | 3.695 | `npx clawhub install firecrawl-search --workdir ~ --dir .workbuddy/skills` |

### 优先级 3：浏览器控制
| # | 技能 | 包名 | 评分 | 安装命令 |
|---|------|------|------|---------|
| 5 | **Playwright** | `playwright` | 3.608 | `npx clawhub install playwright --workdir ~ --dir .workbuddy/skills` |
| 6 | **Browser Use** | `browser-use` | 3.799 | `npx clawhub install browser-use --workdir ~ --dir .workbuddy/skills` |

### 优先级 4：知识管理
| # | 技能 | 包名 | 评分 | 安装命令 |
|---|------|------|------|---------|
| 7 | **Obsidian** | `obsidian-notesmd-cli` | 3.477 | `npx clawhub install obsidian-notesmd-cli --workdir ~ --dir .workbuddy/skills` |
| 8 | **GitHub** | `openclaw-github-assistant` | 3.675 | `npx clawhub install openclaw-github-assistant --workdir ~ --dir .workbuddy/skills` |
| 9 | **Linear** | `linear-skill` | 3.511 | `npx clawhub install linear-skill --workdir ~ --dir .workbuddy/skills` |

---

## 安装后配置需求

### 需要配置 API Key 的技能
| 技能 | 环境变量 | 获取地址 |
|------|----------|---------|
| **summarize** | `GEMINI_API_KEY` | https://aistudio.google.com/app/apikey |
| **Tavily** | `TAVILY_API_KEY` | https://tavily.com |
| **Firecrawl** | `FIRECRAWL_API_KEY` | https://www.firecrawl.dev |

### 需要配置本地工具的技能
| 技能 | 依赖工具 | 安装方式 |
|------|---------|---------|
| **summarize** | `summarize` CLI | `brew install steipete/tap/summarize` (macOS) 或 `npm i -g @steipete/summarize` |

---

## 快速批量安装脚本

保存为 `install_remaining_skills.ps1`：

```powershell
# 批量安装剩余 8 个技能
$skills = @(
    "ai-humanizer",
    "openclaw-tavily-search",
    "firecrawl-search",
    "playwright",
    "browser-use",
    "obsidian-notesmd-cli",
    "openclaw-github-assistant",
    "linear-skill"
)

foreach ($skill in $skills) {
    Write-Host "安装 $skill..."
    npx clawhub install $skill --workdir ~ --dir .workbuddy/skills
    Start-Sleep -Seconds 3  # 避免 ClawHub 速率限制
}

# 复制到用户级目录
Copy-Item "C:\Users\Administrator\WorkBuddy\Claw\~\.workbuddy\skills\*" "C:\Users\Administrator\.workbuddy\skills\" -Recurse -Force -Exclude "skills"

# 同步到项目
Copy-Item "C:\Users\Administrator\.workbuddy\skills\*" "C:\Users\Administrator\WorkBuddy\Claw\.workbuddy\skills\" -Recurse -Force

Write-Host "✅ 批量安装完成！"
```

运行方式：
```powershell
powershell -ExecutionPolicy Bypass -File install_remaining_skills.ps1
```

---

## 安装后同步到 Git

```powershell
cd C:\Users\Administrator\WorkBuddy\Claw
git add .workbuddy/skills/*
git commit -m "Add remaining skills: humanizer, tavily, firecrawl, playwright, browser-use, obsidian, github, linear"
git push origin main
```

---

_文档创建时间：2026-03-22 09:55_
