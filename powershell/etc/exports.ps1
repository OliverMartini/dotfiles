<#
  .SYNOPSIS
    PowerShell exports that will be loaded for all PowerShell instances
    
  .NOTES
    Author: Oliver Martini
    References:
      https://github.com/jayharris/dotfiles-windows
#>

Write-Information "Set exports" -InformationAction Continue

# Make vim the default editor
#$env:EDITOR = "gvim --nofork"
#$env:GIT_EDITOR = $env:EDITOR

# Disable the Progress Bar
$ProgressPreference = 'SilentlyContinue'