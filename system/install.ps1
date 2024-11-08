<#
  .SYNOPSIS
    Install system tools
    
  .NOTES
    Author: Oliver Martini
#>

#--- System Tools ---
Write-Information "Install System Tools" -InformationAction Continue
winget install --silent Microsoft.PowerShell
winget install --silent Microsoft.WindowsTerminal
winget install --silent sysinternals
winget install --silent Microsoft.PowerToys
winget install --silent OpenVPNTechnologies.OpenVPNConnect

Write-Information "Install Bitwarden" -InformationAction Continue
winget install --silent Bitwarden.Bitwarden

RefreshEnv
