<#
  .SYNOPSIS
    Install powershell using
    
  .NOTES
    Author: Oliver Martini
#>

#--- Browsers ---
Write-Information "Install Powershell" -InformationAction Continue
#
winget install --silent Microsoft.PowerShell
#
winget install JanDeDobbeleer.OhMyPosh -s winget 