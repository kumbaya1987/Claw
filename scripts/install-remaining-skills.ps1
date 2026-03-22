# 剩余 8 个技能批量安装脚本
# 运行方式：powershell -ExecutionPolicy Bypass -File scripts\install-remaining-skills.ps1

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  开始安装 8 个剩余技能" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

$skills = @(
    @{name="ai-humanizer"; desc="Humanizer (洗掉 AI 味)"},
    @{name="openclaw-tavily-search"; desc="Tavily 搜索"},
    @{name="firecrawl-search"; desc="Firecrawl 网页抓取"},
    @{name="playwright"; desc="Playwright 浏览器自动化"},
    @{name="browser-use"; desc="Browser Use (简单浏览器控制)"},
    @{name="obsidian-notesmd-cli"; desc="Obsidian 知识库联动"},
    @{name="openclaw-github-assistant"; desc="GitHub 代码管理"},
    @{name="linear-skill"; desc="Linear Bug 进度跟踪"}
)

$success = @()
$failed = @()

for ($i = 0; $i -lt $skills.Count; $i++) {
    $skill = $skills[$i]
    Write-Host "`n[$($i+1)/$($skills.Count)] 安装 $($skill.name) - $($skill.desc)..." -ForegroundColor Yellow

    $result = npx clawhub install $skill.name --workdir ~ --dir .workbuddy/skills 2>&1

    if ($result -match "OK\. Installed") {
        Write-Host "  ✅ 成功" -ForegroundColor Green
        $success += $skill.name
    } else {
        Write-Host "  ❌ 失败" -ForegroundColor Red
        Write-Host "  错误: $($result | Select-String -Pattern 'Error|timed out|Rate limit' | Select-Object -First 1)" -ForegroundColor DarkGray
        $failed += $skill.name
    }

    # 避免 ClawHub 速率限制
    Start-Sleep -Seconds 5
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  安装汇总" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "`n✅ 成功: $($success.Count) 个" -ForegroundColor Green
$success | ForEach-Object { Write-Host "  - $_" -ForegroundColor Green }

Write-Host "`n❌ 失败: $($failed.Count) 个" -ForegroundColor Red
$failed | ForEach-Object { Write-Host "  - $_" -ForegroundColor Red }

# 复制到用户级目录
if ($success.Count -gt 0) {
    Write-Host "`n📦 复制成功安装的技能到用户级目录..." -ForegroundColor Cyan
    $success | ForEach-Object {
        Copy-Item "C:\Users\Administrator\WorkBuddy\Claw\~\.workbuddy\skills\$_" "C:\Users\Administrator\.workbuddy\skills\" -Recurse -Force -ErrorAction SilentlyContinue
    }

    # 同步到项目目录
    Write-Host "🔄 同步到项目目录..." -ForegroundColor Cyan
    Copy-Item "C:\Users\Administrator\.workbuddy\skills\*" "C:\Users\Administrator\WorkBuddy\Claw\.workbuddy\skills\" -Recurse -Force -Exclude "skills"

    Write-Host "`n✅ 完成！记得运行 git add/commit/push" -ForegroundColor Cyan
}

Write-Host "`n按任意键退出..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
