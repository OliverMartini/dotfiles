<#
  .SYNOPSIS
    Install dotnet core using chocolatey
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install dotnetcore-sdk" -InformationAction Continue
#
choco install -y dotnetcore-sdk --limit-output

Write-Information "Install azure-functions-core-tools" -InformationAction Continue
#
choco install azure-functions-core-tools-3 --params "'/x64'" --limit-output

RefreshEnv
