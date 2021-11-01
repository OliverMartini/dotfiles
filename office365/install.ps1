<#
  .SYNOPSIS
    Install Office 365 using chocolatey
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install Office 365" -InformationAction Continue
#
winget install --silent Microsoft.Teams
RefreshEnv
