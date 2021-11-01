<#
  .SYNOPSIS
    Install Common Visual Studio Code Extensions
    
  .NOTES
    Author: Oliver Martini
#>

#--- common ---
Write-Information "Install Visual Studio Code Extensions" -InformationAction Continue
code --install-extension mechatroner.rainbow-csv
code --install-extension johnpapa.vscode-peacock
# python
code --install-extension ms-python.python

#--- azure dev ops ---
#code --install-extension ms-vsts.team
#--- azure ---
code --install-extension ms-vscode.azure-account
code --install-extension ms-vscode.azurecli
code --install-extension ms-vscode.vscode-node-azure-pack
code --install-extension ms-vscode-remote.vscode-remote-extensionpack

#--- languages ---
code --install-extension ms-dotnettools.vscode-dotnet-runtime
code --install-extension ms-dotnettools.csharp
code --install-extension ms-vscode.cpptools
code --install-extension ms-mssql.mssql
code --install-extension ms-vscode.PowerShell

#--- embedded ---
#Write-Information "Install Embedded Visual Studio Code Extensions" -InformationAction Continue
#code --install-extension particle.particle-vscode-pack
  