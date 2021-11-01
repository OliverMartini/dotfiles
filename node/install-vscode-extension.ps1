<#
  .SYNOPSIS
    Install Python Visual Studio Code Extensions
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install JavaScript Visual Studio Code Extensions" -InformationAction Continue
#
#code --install-extension dbaeumer.vscode-eslint
#--- vuejs ---
code --install-extension sdras.vue-vscode-extensionpack
#--- browser debuger ---
#code --install-extension msjsdiag.debugger-for-chrome
#code --install-extension hbenl.vscode-firefox-debug
