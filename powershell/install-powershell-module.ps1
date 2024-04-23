<#
  .SYNOPSIS
    Install common PowerShell modules
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install PowerShell modules" -InformationAction Continue
Install-Module -Name PSWindowsUpdate                                                          -Scope CurrentUser  -Force
# for o-my-posh
Install-Module -Name posh-git, Terminal-Icons                                                 -Scope CurrentUser  -Force
# SecretManagement
Install-Module -Name Microsoft.PowerShell.SecretManagement, Microsoft.PowerShell.SecretStore  -Scope CurrentUser  -Force
# InvokeBuild for PowerShell Module Build
#Install-Module InvokeBuild, BuildHelpers, platyPS, PSScriptAnalyzer                           -Scope CurrentUser -Force
#Install-Module Pester -RequiredVersion 4.10.1                                                 -Scope CurrentUser  -Force

# Powershell
Install-Module -Name Microsoft.Online.SharePoint.PowerShell                                   -Scope CurrentUser -Force
Install-Module -Name Microsoft.Graph                                                          -Scope CurrentUser -Force
RefreshEnv