<#
  .SYNOPSIS
    Bootstrap Windows 10 environment
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Bootstrap Barebone Windows 10 environment" -InformationAction Continue

# Check for admin rights
$wid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$prp = new-object System.Security.Principal.WindowsPrincipal($wid)
$adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
if (-not $prp.IsInRole($adm)) {
  $errorMessage = "This script requires elevated rights to install software.. Please run from an elevated shell session."
  Write-Error -Message $errorMessage -ErrorAction Stop -Category PermissionDenied -ErrorId $errorMessage
}

#--- Install Chocolatey ---
Write-Information "Install Chocolatey" -InformationAction Continue 
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
RefreshEnv

#--- Install Git ---
choco install -y git --package-parameters='"/GitAndUnixToolsOnPath /WindowsTerminal"' --limit-output
RefreshEnv