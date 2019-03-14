<#
  .SYNOPSIS
    Install Docker using chocolatey
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install Docker" -InformationAction Continue
#
choco install -y docker-for-windows --limit-output
RefreshEnv
