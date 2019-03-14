<#
  .SYNOPSIS
    Install Office 365 using chocolatey
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install Office 365" -InformationAction Continue
#
choco install -y microsoft-teams
choco install -y office365business
RefreshEnv
