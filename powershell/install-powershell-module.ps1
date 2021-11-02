<#
  .SYNOPSIS
    Install common PowerShell modules
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install PowerShell modules" -InformationAction Continue
#Install-Module -Name CredentialManager  -Scope CurrentUser  -Force
Install-Module -Name PSWindowsUpdate    -Scope CurrentUser  -Force
# for o-my-posh
Install-Module -Name posh-git, oh-my-posh, Terminal-Icons -Scope CurrentUser  -Force
RefreshEnv
