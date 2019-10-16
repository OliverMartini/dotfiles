<#
  .SYNOPSIS
    Install dotnet core using chocolatey
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install nvm.portable" -InformationAction Continue
#
choco install -y dotnetcore-sdk --limit-output
RefreshEnv
