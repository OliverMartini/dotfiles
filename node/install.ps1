<#
  .SYNOPSIS
    Install Node.js using chocolatey
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install nvm.portable" -InformationAction Continue
#
choco install -y nvm.portable --limit-output
RefreshEnv

# install latest LTS version
$nodeLtsVersion = choco search nodejs-lts --limit-output | ConvertFrom-String -TemplateContent "{Name:package-name}\|{Version:1.11.1}" | Select -ExpandProperty "Version"
Write-Information "Install node.js $nodeLtsVersion LTS"
#
nvm on
nvm install $nodeLtsVersion
nvm use $nodeLtsVersion

Remove-Variable nodeLtsVersion
