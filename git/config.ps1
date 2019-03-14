<#
  .SYNOPSIS
    Configure Git
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Configure Git" -InformationAction Continue
#
New-Item -Path ~\.gitconfig -ItemType SymbolicLink -Value $PSScriptRoot\..\git\gitconfig.symlink -Force | out-null
# set variables in .gitconfig_local file
git config --file $env:USERPROFILE\.gitconfig_local user.name $gitAuthorName
git config --file $env:USERPROFILE\.gitconfig_local user.email $gitAuthorEmail
