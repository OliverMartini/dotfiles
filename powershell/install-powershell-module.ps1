<#
  .SYNOPSIS
    Install common PowerShell modules
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install PowerShell modules" -InformationAction Continue
Install-Module -Name CredentialManager -Scope CurrentUser -Force
Install-Module -Name posh-git -Force
RefreshEnv
