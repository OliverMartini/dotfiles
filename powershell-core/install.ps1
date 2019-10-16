<#
  .SYNOPSIS
    Install powershell-core using chocolatey
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install powershell-core" -InformationAction Continue
#
choco install -y powershell-core --limit-output
RefreshEnv
