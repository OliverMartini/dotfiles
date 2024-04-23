<#
  .SYNOPSIS
    Install PowerShell Package Provider
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install PowerShell Package Provider" -InformationAction Continue
Install-PackageProvider -Name NuGet -Force