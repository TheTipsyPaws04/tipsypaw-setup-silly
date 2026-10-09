# Tipsypaw SillyTavern Setup - Windows
$ErrorActionPreference = 'Stop'
$REPO = 'https://github.com/SillyTavern/SillyTavern'
$DIR  = "$env:USERPROFILE\SillyTavern"

function Test-Cmd($c) { [bool](Get-Command $c -ErrorAction SilentlyContinue) }
function Sync-Path {
  $env:Path = [Environment]::GetEnvironmentVariable('Path','Machine') + ';' + `
              [Environment]::GetEnvironmentVariable('Path','User')
}

if (-not (Test-Cmd git)) {
  Write-Host '[+] Installing Git...' -ForegroundColor Cyan
  winget install -e --id Git.Git --silent --accept-source-agreements --accept-package-agreements
  Sync-Path
}
if (-not (Test-Cmd node)) {
  Write-Host '[+] Installing Node.js LTS...' -ForegroundColor Cyan
  winget install -e --id OpenJS.NodeJS.LTS --silent --accept-source-agreements --accept-package-agreements
  Sync-Path
}

if (Test-Path "$DIR\.git") {
  Write-Host '[+] Updating SillyTavern...' -ForegroundColor Cyan
  Set-Location $DIR
  git pull --rebase --autostash
} else {
  Write-Host '[+] Downloading SillyTavern...' -ForegroundColor Cyan
  git clone -b release $REPO $DIR
}

$desk = [Environment]::GetFolderPath('Desktop')
$ws = New-Object -ComObject WScript.Shell
$sc = $ws.CreateShortcut("$desk\SillyTavern.lnk")
$sc.TargetPath = "$DIR\Start.bat"
$sc.WorkingDirectory = $DIR
$sc.Save()
Write-Host '[+] Shortcut created on Desktop.' -ForegroundColor Green

Set-Location $DIR
Write-Host '[+] Starting SillyTavern...' -ForegroundColor Green
cmd /c Start.bat
