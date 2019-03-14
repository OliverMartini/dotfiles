<#
  .SYNOPSIS
    Install Visual Studio Code using chocolatey
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install Visual Studio Code" -InformationAction Continue
#
choco install -y vscode --limit-output
RefreshEnv
