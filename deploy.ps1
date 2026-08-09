# ==========================================
# 🚀 世界书工坊 · 一键部署脚本（增强版）
#
# 能力：
#   1. 自动把最新构建产物（默认父目录 index.html）同步为部署 index.html
#   2. 自动 git 提交 + 推送（支持自定义提交信息 / 跳过同步 / 跳过推送）
#   3. 仓库不存在时自动创建（gh），并自动开启/更新 GitHub Pages
#
# 用法：
#   .\deploy.ps1                             # 一键：同步 → 提交 → 推送 → 确保 Pages
#   .\deploy.ps1 -CommitMessage "更新日志"
#   .\deploy.ps1 -SourceFile ..\dist\app.html
#   .\deploy.ps1 -RepoName my-lorebook -Private
#   .\deploy.ps1 -SkipSync -SkipPush          # 只查看/提交当前内容，不推送
# ==========================================
param(
    [string]$RepoName = "worldbook-workshop",
    [switch]$Private,
    [string]$SourceFile = "..\index.html",
    [string]$CommitMessage = "",
    [switch]$SkipSync,
    [switch]$SkipPush,
    [string]$PagesBranch = "main"
)

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptDir
$gh = "C:\Program Files\GitHub CLI\gh.exe"
if (-not (Test-Path $gh)) { $gh = "gh" }

Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "🚀 世界书工坊 一键部署引擎" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan

# 1. 检查 git 仓库
if (-not (Test-Path ".git")) {
    Write-Host "❌ github-deploy 不是 git 仓库，无法部署" -ForegroundColor Red
    exit 1
}

# 2. 同步最新构建产物 → index.html（默认：父目录的 index.html）
if (-not $SkipSync) {
    $srcFull = Join-Path $scriptDir $SourceFile
    if (-not (Test-Path $srcFull)) {
        $srcFull = Join-Path (Split-Path -Parent $scriptDir) (Split-Path -Leaf $SourceFile)
    }
    if (-not (Test-Path $srcFull)) {
        Write-Host "❌ 找不到源文件: $SourceFile" -ForegroundColor Red
        exit 1
    }
    Copy-Item -Path $srcFull -Destination "index.html" -Force
    Write-Host "✅ 已同步源文件: $(Split-Path -Leaf $srcFull) ($((Get-Item 'index.html').Length) bytes)" -ForegroundColor Green
} else {
    Write-Host "ℹ️ 已跳过源文件同步 (-SkipSync)" -ForegroundColor Yellow
}

# 3. 有变更则提交（未指定提交信息时自动生成带时间戳的消息）
$status = git status --porcelain
if ($status) {
    if (-not $CommitMessage) {
        $CommitMessage = "Deploy: sync $(Get-Date -Format 'yyyyMMdd-HHmmss')"
    }
    git add index.html
    git commit -m $CommitMessage
    Write-Host "✅ 已提交: $CommitMessage" -ForegroundColor Green
} else {
    Write-Host "ℹ️ 无变更，跳过提交" -ForegroundColor Yellow
}

# 4. 推送（需要 gh 登录；无 remote 时自动检查/创建仓库）
if (-not $SkipPush) {
    Write-Host "🔑 检查 GitHub 登录状态..." -ForegroundColor Cyan
    & $gh auth status 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ 尚未登录 GitHub。请先运行：gh auth login（浏览器授权）" -ForegroundColor Red
        exit 1
    }
    $user = (& $gh api user --jq .login).Trim()
    Write-Host "✅ 已登录：$user" -ForegroundColor Green

    $remote = git remote get-url origin 2>$null
    if (-not $remote) {
        # 无 remote → 检查/创建仓库
        Write-Host "📦 检查/创建仓库 $RepoName ..." -ForegroundColor Cyan
        & $gh repo view "$user/$RepoName" 2>&1 | Out-Null
        if ($LASTEXITCODE -ne 0) {
            if ($Private) { & $gh repo create "$RepoName" --private --source . --push }
            else { & $gh repo create "$RepoName" --public --source . --push }
            Write-Host "✅ 仓库已创建并推送" -ForegroundColor Green
        } else {
            git branch -M $PagesBranch
            git remote add origin "https://github.com/$user/$RepoName.git"
            git push -u origin $PagesBranch 2>&1
        }
    } else {
        git branch -M $PagesBranch
        Write-Host "📤 推送到 origin/$PagesBranch ..." -ForegroundColor Cyan
        git push origin $PagesBranch 2>&1
        Write-Host "✅ 推送完成" -ForegroundColor Green
    }

    # 5. 开启/更新 GitHub Pages（幂等：POST 失败则 PUT 更新）
    Write-Host "🌐 确保 GitHub Pages 开启..." -ForegroundColor Cyan
    try {
        & $gh api "repos/$user/$RepoName/pages" -X POST -f "source[branch]=$PagesBranch" -f "source[path]=/" 2>&1 | Out-Null
    } catch {
        & $gh api "repos/$user/$RepoName/pages" -X PUT -f "source[branch]=$PagesBranch" -f "source[path]=/" 2>&1 | Out-Null
    }

    Write-Host "==============================================" -ForegroundColor Green
    Write-Host "🎉 部署完成！" -ForegroundColor Green
    Write-Host "  在线访问：https://$user.github.io/$RepoName/" -ForegroundColor Green
    Write-Host "==============================================" -ForegroundColor Green
} else {
    Write-Host "ℹ️ 已跳过推送 (-SkipPush)" -ForegroundColor Yellow
    Write-Host "🎉 同步 + 提交完成（未推送）" -ForegroundColor Green
}
