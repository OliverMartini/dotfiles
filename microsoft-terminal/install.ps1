<#
  .SYNOPSIS
    Install Microsoft Terminal using chocolatey
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install Microsoft Terminal" -InformationAction Continue

$terminalProfileDir = "C:\Users\oliver\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

#
choco install -y microsoft-windows-terminal --limit-output
RefreshEnv

Write-Information "Copy profile files for Microsoft Terminal" -InformationAction Continue
Push-Location (Join-Path $env:USERPROFILE ".dotfiles\microsoft-terminal")
Copy-Item 'profile\*' -Destination $terminalProfileDir
Pop-Location