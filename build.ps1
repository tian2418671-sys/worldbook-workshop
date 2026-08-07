# ============================================================
#  世界书工坊 构建脚本
#  将 src/ 下的模块合并为单文件 index.html（用于 GitHub Pages 部署）
# ============================================================
param(
    [string]$OutputFile = "..\index.html"
)

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptDir

Write-Host "🔨 世界书工坊 - 构建中..." -ForegroundColor Cyan

# 1. 读取 HTML 骨架
$html = Get-Content "index.html" -Raw -Encoding UTF8

# 2. 读取 CSS 并内联
$cssPath = "css\style.css"
if (Test-Path $cssPath) {
    $css = "<style>`n" + (Get-Content $cssPath -Raw -Encoding UTF8) + "`n</style>"
    # 使用字符串 .Replace() 而非正则 -replace，防止 JS 中的 $& 等被 PowerShell 错误解释
    $html = $html.Replace('<!-- CSS_PLACEHOLDER -->', $css)
    Write-Host "  ✅ CSS 已内联: $((Get-Item $cssPath).Length) bytes" -ForegroundColor Green
} else {
    Write-Host "  ⚠️  CSS 文件缺失: $cssPath" -ForegroundColor Yellow
}

# 3. 读取所有 JS 文件并合并内联
$jsDir = "js"
if (Test-Path $jsDir) {
    $jsFiles = Get-ChildItem "$jsDir\*.js" | Sort-Object Name
    $jsContent = ""
    foreach ($f in $jsFiles) {
        $jsContent += "`n// ===== $($f.Name) =====`n" + (Get-Content $f.FullName -Raw -Encoding UTF8) + "`n"
    }
    $js = "<script>`n" + $jsContent.Trim() + "`n</script>"
    # 使用字符串 .Replace() 而非正则 -replace，防止 JS 中的 $& 等被 PowerShell 错误解释
    $html = $html.Replace('<!-- JS_PLACEHOLDER -->', $js)
    Write-Host "  ✅ JS 已合并内联: $($jsFiles.Count) 个文件" -ForegroundColor Green
} else {
    Write-Host "  ⚠️  JS 目录缺失: $jsDir" -ForegroundColor Yellow
}

# 4. 清理多余空行
$html = $html -replace '\n{3,}', "`n`n"

# 5. 输出
$outPath = Join-Path $scriptDir $OutputFile
Set-Content -Path $outPath -Value $html -Encoding UTF8 -NoNewline
Write-Host "`n🎉 构建完成: $outPath ($((Get-Item $outPath).Length) bytes)" -ForegroundColor Green
