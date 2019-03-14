<#
  .SYNOPSIS
    Install Python using chocolatey
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install Python" -InformationAction Continue
#
choco install -y python --limit-output
RefreshEnv
