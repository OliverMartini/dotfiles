<#
  .SYNOPSIS
    Install Azure CLI using chocolatey
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install Azure CLI" -InformationAction Continue
#
Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'
RefreshEnv
