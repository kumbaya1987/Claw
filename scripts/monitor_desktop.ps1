# Desktop File Monitor Script
# Check for new files on desktop

$desktopPath = "F:\Desktop"
$localMemoryPath = "c:\Users\Administrator\WorkBuddy\Claw\.codebuddy\automations\automation\memory.md"
$processedFilesLog = "c:\Users\Administrator\WorkBuddy\Claw\.codebuddy\automations\desktop-monitor\processed_files.txt"

# Create necessary directories
if (-not (Test-Path (Split-Path $processedFilesLog))) {
    New-Item -ItemType Directory -Path (Split-Path $processedFilesLog) -Force | Out-Null
}

# Read processed files list
$processedFiles = @()
if (Test-Path $processedFilesLog) {
    $processedFiles = Get-Content $processedFilesLog
}

# Get files added in the last hour
$recentFiles = Get-ChildItem -Path $desktopPath -File |
    Where-Object { $_.LastWriteTime -gt (Get-Date).AddHours(-1) } |
    Where-Object { $_.FullName -notin $processedFiles }

# Output results
Write-Host ""
Write-Host "=== Desktop File Monitor Report ===" -ForegroundColor Green
Write-Host "Monitor Path: $desktopPath" -ForegroundColor Cyan
Write-Host "Time Range: Last 1 hour" -ForegroundColor Cyan
Write-Host "New Files Count: $($recentFiles.Count)" -ForegroundColor Cyan

if ($recentFiles.Count -eq 0) {
    Write-Host ""
    Write-Host "No new files found" -ForegroundColor Yellow
} else {
    Write-Host ""
    Write-Host "New files found:" -ForegroundColor Green
    foreach ($file in $recentFiles) {
        Write-Host "  - $($file.Name) ($($file.LastWriteTime))" -ForegroundColor White
    }

    # Log new files
    $recentFiles | ForEach-Object { $_.FullName | Out-File -FilePath $processedFilesLog -Append }

    Write-Host ""
    Write-Host "Please ask WorkBuddy AI to process these new files" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=== Monitor Complete ===" -ForegroundColor Green
