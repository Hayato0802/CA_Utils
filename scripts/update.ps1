# Co-Assign Utils Simple Updater
# Usage: irm https://github.com/Hayato0802/co-assign_utils/releases/latest/download/update.ps1 | iex

$ErrorActionPreference = "Stop"

# Configuration
$repo = "organization/extension-repo"
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
        Start-Process (Resolve-Path $installDir)
        exit 1
    }
    Write-Host "更新中... from v$currentVersion to v$latestVersion" -ForegroundColor Cyan
    Start-Process (Resolve-Path $installDir)
} else {
    Write-Host "Installing v$latestVersion" -ForegroundColor Cyan
    Start-Process (Resolve-Path $installDir)
    Write-Host "$installDir"
    exit 1
}

# Download and install
try {
    $tempFile = "$env:TEMP\co-assign-utils.zip"
    Invoke-WebRequest -Uri $downloadUrl -OutFile $tempFile
    
    if (Test-Path $installDir) { Remove-Item $installDir -Recurse -Force }
    Expand-Archive -Path $tempFile -DestinationPath $installDir -Force
    Remove-Item $tempFile
    
    Write-Host "Updated successfully!" -ForegroundColor Green
    Write-Host "Reload the extension in Chrome" -ForegroundColor Yellow
} catch {
    Write-Host "Update failed: $_" -ForegroundColor Red
    exit 1
}