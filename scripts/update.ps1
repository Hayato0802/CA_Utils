# Co-Assign Utils Simple Updater
# Usage: irm https://github.com/Hayato0802/CA_Utils/releases/latest/download/update.ps1 | iex

$ErrorActionPreference = "Stop"

# Configuration
$repo = "Hayato0802/CA_Utils"
$installDir = "$env:LOCALAPPDATA\CoAssignUtils"

Write-Host "Checking for updates..." -ForegroundColor Yellow

# Get latest version
try {
    $release = Invoke-RestMethod "https://api.github.com/repos/$repo/releases/latest"
    $latestVersion = $release.tag_name -replace '^v', ''
    $downloadUrl = $release.assets | Where-Object { $_.name -like "*.zip" } | Select-Object -First 1 -ExpandProperty browser_download_url
} catch {
    Write-Host "Error: Cannot check for updates" -ForegroundColor Red
    exit 1
}

# Check current version
if (Test-Path "$installDir\manifest.json") {
    $currentVersion = (Get-Content "$installDir\manifest.json" | ConvertFrom-Json).version
    if ($currentVersion -eq $latestVersion) {
        Write-Host "既に最新版がDLされています (v$currentVersion)" -ForegroundColor Green
        exit 1
    }
    Write-Host "更新中... from v$currentVersion to v$latestVersion" -ForegroundColor Cyan
} else {
    $currentVersion = "未インストール"
    Write-Host "Installing v$latestVersion" -ForegroundColor Cyan
    Write-Host "$installDir"
}

# Download and install
try {
    $tempFile = "$env:TEMP\co-assign-utils.zip"
    Invoke-WebRequest -Uri $downloadUrl -OutFile $tempFile
    
    if (Test-Path $installDir) { Remove-Item $installDir -Recurse -Force }
    Expand-Archive -Path $tempFile -DestinationPath $installDir -Force
    Remove-Item $tempFile
    
    # 更新の場合
    if( $currentVersion -ne "未インストール" ) {
        Write-Host "Updated successfully!" -ForegroundColor Green
        Write-Host "拡張機能画面(chrome://extensions/)からCo-Assign Utilsをreloadしてください！" -ForegroundColor Red
    } else {
        # 初回インストールの場合
        Write-Host "installed successfully!" -ForegroundColor Green
        Write-Host "別ウィンドウで開かれたフォルダ（$installDir）にconfig.jsを追加したのち、" -ForegroundColor Red
        Write-Host "拡張機能画面(chrome://extensions/)にて「パッケージ化されていない拡張機能を読み込む」から上記のフォルダを追加してください！" -ForegroundColor Red
        Start-Process (Resolve-Path $installDir)
    }
    exit 1
} catch {
    Write-Host "Update failed: $_" -ForegroundColor Red
    exit 1
}