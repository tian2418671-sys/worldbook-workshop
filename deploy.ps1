# ==========================================
# 🚀 世界书工坊 · GitHub Pages 一键部署脚本
# 用法：先完成 gh 登录（浏览器授权），再运行本脚本
#   .\deploy.ps1              # 默认创建公开仓库 worldbook-workshop
#   .\deploy.ps1 -RepoName my-lorebook -Private
# ==========================================
param(
    [string]$RepoName = "worldbook-workshop",
    [switch]$Private
)

$ErrorActionPreference = "Stop"
$gh = "C:\Program Files\GitHub CLI\gh.exe"
if (-not (Test-Path $gh)) { $gh = "gh" }

# 1. 检查登录
Write-Host "🔑 检查 GitHub 登录状态..." -ForegroundColor Cyan
& $gh auth status 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ 尚未登录 GitHub。请先运行：gh auth login（浏览器授权）" -ForegroundColor Red
    exit 1
}

# 2. 获取用户名
$user = (& $gh api user --jq .login).Trim()
Write-Host "✅ 已登录：$user" -ForegroundColor Green

# 3. 创建仓库（已存在则跳过）
Write-Host "📦 检查/创建仓库 $RepoName ..." -ForegroundColor Cyan
& $gh repo view "$user/$RepoName" 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    if ($Private) { & $gh repo create "$RepoName" --private --source . --push }
    else { & $gh repo create "$RepoName" --public --source . --push }
    Write-Host "✅ 仓库已创建并推送" -ForegroundColor Green
} else {
    Write-Host "ℹ️ 仓库已存在，执行推送..." -ForegroundColor Yellow
    git branch -M main
    git remote remove origin 2>$null
    git remote add origin "https://github.com/$user/$RepoName.git"
    git push -u origin main
}

# 4. 开启 GitHub Pages（从 main 分支根目录）
Write-Host "🌐 开启 GitHub Pages..." -ForegroundColor Cyan
try {
    & $gh api "repos/$user/$RepoName/pages" -X POST -f "source[branch]=main" -f "source[path]=/" 2>&1 | Out-Null
} catch {
    # Pages 可能已开启，尝试更新配置
    & $gh api "repos/$user/$RepoName/pages" -X PUT -f "source[branch]=main" -f "source[path]=/" 2>&1 | Out-Null
}

Write-Host "==============================================" -ForegroundColor Green
Write-Host "🎉 部署完成！" -ForegroundColor Green
Write-Host "  在线访问：https://$user.github.io/$RepoName/" -ForegroundColor Green
Write-Host "==============================================" -ForegroundColor Green
