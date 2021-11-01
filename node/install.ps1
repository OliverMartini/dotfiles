<#
  .SYNOPSIS
    Install nvm/nodejs
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install nvm" -InformationAction Continue
#
$downloadDir = $env:USERPROFILE + "\Downloads"
$nvmHome = $env:USERPROFILE + "\AppData\Roaming\nvm"
$nvmSymLink = $toolsHome + "\nodejs"
Invoke-WebRequest -Uri "https://github.com/coreybutler/nvm-windows/releases/download/1.1.8/nvm-noinstall.zip" -OutFile $downloadDir/nvm-noinstall.zip -UseBasicParsing
Expand-Archive $downloadDir/nvm-noinstall.zip $nvmHome -Force
Copy-Item .\nvm_settings.txt -Destination $nvmHome\settings.txt -force
mkdir $toolsHome -force
[System.Environment]::SetEnvironmentVariable("NVM_HOME", $nvmHome, "User")
[System.Environment]::SetEnvironmentVariable("NVM_SYMLINK", $nvmSymLink, "User")
Add-EnvPath -Path $env:NVM_HOME -Container User
Add-EnvPath -Path $env:NVM_SYMLINK -Container User

# install latest LTS version
nvm install lts
nvm use lts