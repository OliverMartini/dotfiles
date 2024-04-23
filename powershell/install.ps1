<#
  .SYNOPSIS
    Install powershell using
    
  .NOTES
    Author: Oliver Martini
#>

#--- Powershell ---
Write-Information "Install Powershell" -InformationAction Continue
#
winget install --silent Microsoft.PowerShell

#--- Oh-My-Posh ---
winget install JanDeDobbeleer.OhMyPosh -s winget --silent
RefreshEnv

oh-my-posh font install CascadiaCode



