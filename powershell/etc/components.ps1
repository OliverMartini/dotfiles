<#
  .SYNOPSIS
    PowerShell components that will be loaded for all PowerShell instances
    
  .NOTES
    Author: Oliver Martini
    References:
      https://github.com/jayharris/dotfiles-windows
#>

Write-Information "Import PowerShell components" -InformationAction Continue

Push-Location (Join-Path $env:USERPROFILE ".dotfiles")
# Git
. .\git\powershell\components.ps1
Pop-Location
