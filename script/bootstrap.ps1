<#
  .SYNOPSIS
    Bootstrap Windows 10 environment
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Bootstrap Windows 11 environment" -InformationAction Continue

# Check for admin rights
$wid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$prp = new-object System.Security.Principal.WindowsPrincipal($wid)
$adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
if (-not $prp.IsInRole($adm)) {
  $errorMessage = "This script requires elevated rights to install software.. Please run from an elevated shell session."
  Write-Error -Message $errorMessage -ErrorAction Stop -Category PermissionDenied -ErrorId $errorMessage
}

# Import EnvPath module
Import-Module $PSScriptRoot\..\bin\EnvPaths.psm1

#--- Configuration prompts (dot source the files) ---
. $PSScriptRoot\..\git\prompts.ps1
. $PSScriptRoot\..\tools\prompts.ps1

#--- Add .dotfiles\bin to $PATH
Add-EnvPath -Path $env:USERPROFILE\.dotfiles\bin -Container User
RefreshEnv

#--- Enable Windows Features ---
#
& "$PSScriptRoot\..\system\enable-windowsFeatures.ps1"

#--- Install Software & Tools ---
Write-Information "Install, configure Software & Tools" -InformationAction Continue
#
& "$PSScriptRoot\..\tools\install.ps1"
#
& "$PSScriptRoot\..\dotnet-azure-tools\install.ps1"

# PowerShell
& "$PSScriptRoot\..\powershell\install.ps1"

# .NET
& "$PSScriptRoot\..\dotnet\install.ps1"

# Visual Studio Code
& "$PSScriptRoot\..\vscode\install.ps1"

# WSL2 - Ubuntu
& "$PSScriptRoot\..\ubuntu\install.ps1"
# Docker
& "$PSScriptRoot\..\docker\install.ps1"


# Package Provider
#& "$PSScriptRoot\..\powershell\install-packageprovider.ps1"
# Common modules
#& "$PSScriptRoot\..\powershell\install-powershell-module.ps1"

#--- PowerShell ---

#--- Install Visual Studio Code Extensions ---
#
& "$PSScriptRoot\..\tools\install-vscode-extension.ps1"
& "$PSScriptRoot\..\docker\install-vscode-extension.ps1"
& "$PSScriptRoot\..\powershell\install-vscode-extension.ps1"
& "$PSScriptRoot\..\python\install-vscode-extension.ps1"

#--- Configure environment ---
#
& "$PSScriptRoot\..\system\config.ps1"
# Git
& "$PSScriptRoot\..\git\config.ps1"
