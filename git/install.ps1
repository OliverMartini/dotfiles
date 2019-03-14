<#
  .SYNOPSIS
    Install Git and git tools using chocolatey
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install Git and tools" -InformationAction Continue
#
choco install -y git --package-parameters='"/GitAndUnixToolsOnPath /WindowsTerminal"' --limit-output
RefreshEnv
#
choco install -y gitkraken --limit-output
