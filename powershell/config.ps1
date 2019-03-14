<#
  .SYNOPSIS
    Configure PowerShell
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Configure PowerShell" -InformationAction Continue
$profileDir = Split-Path -parent $profile

#--- Set Symbolic Link ---
# profile.ps1
New-Item -Path $profileDir\profile.ps1 -ItemType SymbolicLink -Value $PSScriptRoot\..\powershell\profile.ps1.symlink -Force | out-null
# Microsoft.PowerShell_profile.ps1
New-Item -Path $profileDir\Microsoft.PowerShell_profile.ps1 -ItemType SymbolicLink -Value $PSScriptRoot\..\powershell\Microsoft.PowerShell_profile.ps1.symlink -Force | out-null

Remove-Variable profileDir
