<#
  .SYNOPSIS
    Install Common Visual Studio Code Extensions
    
  .NOTES
    Author: Oliver Martini
#>

#--- common ---
Write-Information "Install Visual Studio Code Extensions" -InformationAction Continue
#
code --install-extension mechatroner.rainbow-csv
code --install-extension ms-vsliveshare.vsliveshare-pack
#--- azure dev ops ---
code --install-extension ms-vsts.team
#--- azure ---
code --install-extension ms-vscode.azure-account
code --install-extension ms-vscode.azurecli
code --install-extension ms-azuretools.vscode-azurefunctions
#--- languages ---
code --install-extension ms-vscode.csharp
code --install-extension ms-mssql.mssql

#--- java script ---
Write-Information "Install JavaScript Visual Studio Code Extensions" -InformationAction Continue
#
code --install-extension dbaeumer.vscode-eslint
#--- vuejs ---
code --install-extension sdras.vue-vscode-extensionpack
#--- browser debuger ---
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension hbenl.vscode-firefox-debug

#--- embedded ---
Write-Information "Install Embedded Visual Studio Code Extensions" -InformationAction Continue
#
code --install-extension particle.particle-vscode-pack
  