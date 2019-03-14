<#
  .SYNOPSIS
    Install Office 365 PowerShell modules
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install Office 365 PowerShell modules" -InformationAction Continue
Install-Module -Name AzureAD -Force
Install-Module -Name MSOnline -Force
Install-Module -Name MicrosoftTeams -Force
Install-Module -Name SharePointPnPPowerShellOnline -Force
RefreshEnv