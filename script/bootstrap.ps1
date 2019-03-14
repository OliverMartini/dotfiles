<#
  .SYNOPSIS
    Bootstrap Windows 10 environment
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Bootstrap Windows 10 environment" -InformationAction Continue

# Check for admin rights
$wid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$prp = new-object System.Security.Principal.WindowsPrincipal($wid)
$adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
if (-not $prp.IsInRole($adm)) {
  $errorMessage = "This script requires elevated rights to install software.. Please run from an elevated shell session."
  Write-Error -Message $errorMessage -ErrorAction Stop -Category PermissionDenied -ErrorId $errorMessage
}

# Import EnvPath module
Import-Module $PSScriptRoot\..\bin\EnvPaths

#--- Configuration prompts (dot source the files) ---
. $PSScriptRoot\..\git\prompts.ps1

#--- Add .dotfiles\bin to $PATH
Add-EnvPath -Path $env:USERPROFILE\.dotfiles\bin -Container User
RefreshEnv

#--- Install Chocolatey ---
#
Write-Information "Install Chocolatey" -InformationAction Continue 
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
RefreshEnv

#--- Enable Windows Features ---
#
& "$PSScriptRoot\..\system\enable-windowsFeatures.ps1"

#--- Install Software & Tools ---
Write-Information "Install, configure Software & Tools" -InformationAction Continue
#
& "$PSScriptRoot\..\tools\install.ps1"
# Git
& "$PSScriptRoot\..\git\install.ps1"
# Visual Studio Code
& "$PSScriptRoot\..\vscode\install.ps1"
# Python
& "$PSScriptRoot\..\python\install.ps1"
# Docker
& "$PSScriptRoot\..\docker\install.ps1"

#--- Ubuntu ---
#& "$PSScriptRoot\..\ubuntu\install.ps1"

#--- PowerShell ---
#
# Package Provider
& "$PSScriptRoot\..\powershell\install-packageprovider.ps1"
# Common modules
& "$PSScriptRoot\..\powershell\install-powershell-module.ps1"

#--- Install Visual Studio Code Extensions ---
#
& "$PSScriptRoot\..\vscode\install-vscode-extension.ps1"
& "$PSScriptRoot\..\docker\install-vscode-extension.ps1"
& "$PSScriptRoot\..\powershell\install-vscode-extension.ps1"
& "$PSScriptRoot\..\python\install-vscode-extension.ps1"

#--- Configure environment ---
#
& "$PSScriptRoot\..\system\config.ps1"
# Git
& "$PSScriptRoot\..\git\config.ps1"
