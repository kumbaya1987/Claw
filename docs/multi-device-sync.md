# 多设备 WorkBuddy 同步指南

## 概述

本指南用于在家里另一台电脑上登录 WorkBuddy 后,同步项目文件和技能的完整操作步骤。

---

## 前置条件

### 软件要求
- ✅ 已安装 WorkBuddy
- ✅ 已安装 Git
- ✅ 已登录 WorkBuddy 账号(与主电脑相同账号)

### 环境准备
- PowerShell 权限(管理员权限推荐)
- 稳定的网络连接

---

## 操作步骤

### 步骤1: 打开 PowerShell

以管理员身份打开 PowerShell:
1. 按 `Win + X` 键
2. 选择 "Windows PowerShell (管理员)" 或 "终端 (管理员)"

---

### 步骤2: 创建工作目录

```powershell
# 创建工作目录(如果不存在)
New-Item -ItemType Directory -Path "$HOME\WorkBuddy" -Force

# 进入工作目录
cd $HOME\WorkBuddy
```

---

### 步骤3: 克隆项目仓库

```powershell
# 克隆 GitHub 仓库
git clone https://github.com/kumbaya1987/Claw.git

# 进入项目目录
cd Claw
```

**等待克隆完成** - 根据网络速度,可能需要几分钟。

---

### 步骤4: 验证项目结构

克隆完成后,检查项目是否包含以下内容:

```powershell
# 查看项目结构
Get-ChildItem -Recurse | Select-Object FullName
```

**应包含的关键目录**:
- `scripts/` - 自动化脚本
- `docs/` - 文档
- `examples/` - 示例
- `.workbuddy/skills/` - 技能目录(⭐ 重要)
- `.workbuddy/memory/` - 工作记忆
- `.workbuddy/Agents.md` - 智能代理规则
- `.workbuddy/KnowledgeRouter.md` - 知识路由规则

---

### 步骤5: 配置环境变量

#### 5.1 百度搜索 API Key

```powershell
# 设置用户级环境变量(永久生效)
[System.Environment]::SetEnvironmentVariable("BAIDU_API_KEY", "bce-v3/ALTAK-ETMcodYf1MamaUGMSf9Ax/030cca1a63e0014f637a9ad1031ba7c0cb2faab6", "User")

# 当前会话立即生效
$env:BAIDU_API_KEY = "bce-v3/ALTAK-ETMcodYf1MamaUGMSf9Ax/030cca1a63e0014f637a9ad1031ba7c0cb2faab6"

# 验证配置
[System.Environment]::GetEnvironmentVariable("BAIDU_API_KEY", "User")
```

**预期输出**: `bce-v3/ALTAK-ETMcodYf1MamaUGMSf9Ax/030cca1a63e0014f637a9ad1031ba7c0cb2faab6`

---

#### 5.2 IMA 笔记 API 凭证

```powershell
# 设置 IMA ClientID
[System.Environment]::SetEnvironmentVariable("IMA_OPENAPI_CLIENTID", "your_client_id_here", "User")
$env:IMA_OPENAPI_CLIENTID = "your_client_id_here"

# 设置 IMA API Key
[System.Environment]::SetEnvironmentVariable("IMA_OPENAPI_APIKEY", "your_api_key_here", "User")
$env:IMA_OPENAPI_APIKEY = "your_api_key_here"

# 验证配置
[System.Environment]::GetEnvironmentVariable("IMA_OPENAPI_CLIENTID", "User")
[System.Environment]::GetEnvironmentVariable("IMA_OPENAPI_APIKEY", "User")
```

**⚠️ 注意**: 请将 `your_client_id_here` 和 `your_api_key_here` 替换为实际的 IMA 凭证。

如果不确定这些值,请联系主电脑管理员或在 IMA 后台查看。

---

### 步骤6: 配置 Git 用户信息

```powershell
# 设置 Git 用户名(使用你的 GitHub 用户名)
git config --global user.name "kumbaya1987"

# 设置 Git 邮箱
git config --global user.email "your_email@example.com"
```

**⚠️ 注意**: 请将 `your_email@example.com` 替换为你的实际邮箱地址。

---

### 步骤7: 验证技能可用性

#### 7.1 检查技能目录

```powershell
# 列出项目中的技能
Get-ChildItem ".workbuddy\skills" -Directory
```

**预期输出**:
- `baidu-search`
- `ima`

#### 7.2 测试技能功能

打开 WorkBuddy,然后尝试以下命令:

**测试百度搜索**:
```
用百度搜索"人工智能"
```

**测试 IMA 笔记**:
```
帮我查找我的笔记
```

**预期结果**: 功能正常,能够搜索或查询笔记。

---

### 步骤8: 设置工作目录(可选)

如果你希望 WorkBuddy 默认使用这个项目目录,可以:

1. 在 WorkBuddy 中打开设置
2. 找到 "工作目录" 或 "Workspace" 选项
3. 设置为: `C:\Users\你的用户名\WorkBuddy\Claw`

---

### 步骤9: 同步最新更新(后续使用)

每次在其他设备上工作后,回到家需要同步最新代码:

```powershell
# 进入项目目录
cd $HOME\WorkBuddy\Claw

# 拉取最新代码
git pull origin main

# 查看更新内容
git log --oneline -10
```

---

## 常见问题

### 问题1: 克隆仓库时提示权限错误

**解决方案**:
- 确保 Git 已安装: `git --version`
- 检查是否有写入权限: `Test-Path "$HOME\WorkBuddy"`

---

### 问题2: 环境变量设置后不生效

**解决方案**:
1. 重启 PowerShell
2. 或手动设置当前会话:
   ```powershell
   $env:BAIDU_API_KEY = "your_key"
   ```

---

### 问题3: 技能无法识别

**解决方案**:
1. 检查技能目录路径: `Get-ChildItem ".workbuddy\skills"`
2. 确认技能包含 `SKILL.md` 文件
3. 重启 WorkBuddy

---

### 问题4: IMA 凭证丢失

**解决方案**:
1. 登录 IMA 平台(https://ima.xxxx.com)
2. 进入"API管理"或"应用设置"
3. 查看或重新生成 API Key

---

### 问题5: Git 推送时提示冲突

**解决方案**:
```powershell
# 拉取最新代码
git pull origin main --rebase

# 如果有冲突,手动解决冲突文件

# 提交解决后的代码
git add .
git commit -m "Resolve merge conflicts"
git push origin main
```

---

## 完整操作脚本(一次性执行)

将以下命令保存为 `sync_workbuddy.ps1`,然后运行:

```powershell
# ========== WorkBuddy 多设备同步脚本 ==========

Write-Host "开始同步 WorkBuddy 项目和技能..." -ForegroundColor Cyan

# 1. 创建工作目录
Write-Host "`n[1/7] 创建工作目录..." -ForegroundColor Yellow
New-Item -ItemType Directory -Path "$HOME\WorkBuddy" -Force | Out-Null
Set-Location "$HOME\WorkBuddy"
Write-Host "✅ 工作目录创建完成: $HOME\WorkBuddy" -ForegroundColor Green

# 2. 克隆仓库
Write-Host "`n[2/7] 克隆 GitHub 仓库..." -ForegroundColor Yellow
if (Test-Path "Claw") {
    Write-Host "⚠️  项目目录已存在,跳过克隆" -ForegroundColor Yellow
} else {
    git clone https://github.com/kumbaya1987/Claw.git
    Set-Location Claw
    Write-Host "✅ 仓库克隆完成" -ForegroundColor Green
}

# 3. 设置百度搜索 API Key
Write-Host "`n[3/7] 配置百度搜索 API Key..." -ForegroundColor Yellow
$BAIDU_API_KEY = "bce-v3/ALTAK-ETMcodYf1MamaUGMSf9Ax/030cca1a63e0014f637a9ad1031ba7c0cb2faab6"
[System.Environment]::SetEnvironmentVariable("BAIDU_API_KEY", $BAIDU_API_KEY, "User")
$env:BAIDU_API_KEY = $BAIDU_API_KEY
Write-Host "✅ 百度搜索 API Key 已配置" -ForegroundColor Green

# 4. 设置 IMA 凭证
Write-Host "`n[4/7] 配置 IMA 笔记凭证..." -ForegroundColor Yellow
Write-Host "⚠️  需要手动配置 IMA 凭证(请参考文档)" -ForegroundColor Yellow
Write-Host "   运行以下命令:" -ForegroundColor Cyan
Write-Host '   [System.Environment]::SetEnvironmentVariable("IMA_OPENAPI_CLIENTID", "your_client_id", "User")' -ForegroundColor White
Write-Host '   [System.Environment]::SetEnvironmentVariable("IMA_OPENAPI_APIKEY", "your_api_key", "User")' -ForegroundColor White

# 5. 配置 Git
Write-Host "`n[5/7] 配置 Git 用户信息..." -ForegroundColor Yellow
git config --global user.name "kumbaya1987"
git config --global user.email "your_email@example.com"
Write-Host "✅ Git 配置完成" -ForegroundColor Green
Write-Host "⚠️  请将邮箱修改为你的实际邮箱" -ForegroundColor Yellow

# 6. 验证技能
Write-Host "`n[6/7] 验证技能..." -ForegroundColor Yellow
Set-Location "$HOME\WorkBuddy\Claw"
$skills = Get-ChildItem ".workbuddy\skills" -Directory
Write-Host "已同步的技能:" -ForegroundColor Cyan
foreach ($skill in $skills) {
    Write-Host "  ✅ $($skill.Name)" -ForegroundColor Green
}

# 7. 完成
Write-Host "`n[7/7] 同步完成!" -ForegroundColor Green
Write-Host "`n========== 后续操作 ==========" -ForegroundColor Cyan
Write-Host "1. 在 WorkBuddy 中打开项目: $HOME\WorkBuddy\Claw" -ForegroundColor White
Write-Host "2. 手动配置 IMA 凭证(如果需要使用 IMA 笔记功能)" -ForegroundColor White
Write-Host "3. 在 WorkBuddy 中测试技能功能:" -ForegroundColor White
Write-Host "   - 测试百度搜索: 用百度搜索'测试'" -ForegroundColor Gray
Write-Host "   - 测试 IMA 笔记: 帮我查找我的笔记" -ForegroundColor Gray
Write-Host "4. 后续同步: git pull origin main" -ForegroundColor White
Write-Host "================================" -ForegroundColor Cyan
```

**运行脚本**:
```powershell
powershell -ExecutionPolicy Bypass -File sync_workbuddy.ps1
```

---

## 验证清单

同步完成后,请验证以下项目:

- [ ] 项目目录已克隆到 `$HOME\WorkBuddy\Claw`
- [ ] `.workbuddy/skills/` 目录包含 `baidu-search` 和 `ima` 技能
- [ ] `BAIDU_API_KEY` 环境变量已设置且有效
- [ ] `IMA_OPENAPI_CLIENTID` 和 `IMA_OPENAPI_APIKEY` 已设置(如需使用 IMA)
- [ ] Git 用户信息已配置
- [ ] WorkBuddy 能够识别和使用技能
- [ ] 测试百度搜索功能正常
- [ ] 测试 IMA 笔记功能正常(如已配置)

---

## 技能说明

### 已同步的技能

| 技能名称 | 功能 | 配置要求 |
|---------|------|---------|
| **baidu-search** | 百度AI搜索引擎 | BAIDU_API_KEY |
| **ima-note** | IMA个人笔记管理 | IMA_OPENAPI_CLIENTID, IMA_OPENAPI_APIKEY |

### 技能功能

#### 百度搜索 (baidu-search)
- 智能网页搜索
- 时间范围筛选(24小时/7天/31天/365天)
- 自定义结果数量(1-50条)
- 使用示例: `用百度搜索"人工智能"`

#### IMA 笔记 (ima-note)
- 搜索个人笔记
- 浏览笔记本
- 获取笔记内容
- 新建笔记和追加内容
- 使用示例: `帮我查找关于X的笔记`

---

## 定期维护

### 每次回家后的同步流程

```powershell
cd $HOME\WorkBuddy\Claw
git pull origin main
```

### 每次工作完成后的推送流程

```powershell
cd $HOME\WorkBuddy\Claw
git add .
git commit -m "Update work from home"
git push origin main
```

### 每月检查项

- [ ] 检查技能是否有更新
- [ ] 验证环境变量是否仍然有效
- [ ] 清理无用的分支
- [ ] 检查磁盘空间

---

## 联系支持

如果遇到问题:

1. 查看项目文档: `.workbuddy/skills/README.md`
2. 查看桌面监控文档: `docs/desktop_monitor.md`
3. 查看百度搜索配置文档: `docs/baidu-search-setup.md`
4. 联系主电脑管理员获取凭证信息

---

## 版本信息

- **文档版本**: 1.0
- **创建日期**: 2026-03-20
- **适用系统**: Windows 10/11
- **WorkBuddy 版本**: 任意版本

---

**祝你使用愉快! 🎉**
