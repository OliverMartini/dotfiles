<#
  .SYNOPSIS
    Install tools using winget
    
  .NOTES
    Author: Oliver Martini
#>

#--- Browsers ---
Write-Information "Install Browsers" -InformationAction Continue
#
winget install --silent Google.Chrome
choco install -y firefox        --limit-output

#--- Common Tools ---
Write-Information "Install Common Tools" -InformationAction Continue
#
winget install --silent 7zip.7zip
winget install --silent Balena.Etcher
winget install --silent Rufus.Rufus
winget install --silent ShareX.ShareX
winget install --silent WinSCP.WinSCP
#
#winget install --silent Audacity.Audacity

#--- Development Tools ---
Write-Information "Install Dev Tools" -InformationAction Continue
winget install --silent WiresharkFoundation.Wireshark

Write-Information "Install Web Dev Tools" -InformationAction Continue
winget install --silent Insomnia.Insomnia

Write-Information "Install Git and tools" -InformationAction Continue
winget install --silent Git.Git
winget install --silent GitHub.cli

Write-Information "Install Visual Studio Code" -InformationAction Continue
choco install --silent Microsoft.VisualStudioCode

Write-Information "Install dotnet SDK" -InformationAction Continue
winget install --silent Microsoft.dotnet

Write-Information "Install Python" -InformationAction Continue
winget install --silent Python.Python.3

Write-Information "Install Microsoft SQL Server Management Studio" -InformationAction Continue
winget install --silent Microsoft.SQLServerManagementStudio

Write-Information "Install Azure Tools" -InformationAction Continue
winget install --silent Microsoft.AzureStorageExplorer
winget install --silent Microsoft.AzureFunctionsCoreTools
winget install --silent Microsoft.AzureDataStudio
winget install --silent Microsoft.Bicep
winget install --silent Microsoft.AzureCLI

Write-Information "Install Docker" -InformationAction Continue
winget install --silent Docker.DockerDesktop

# Install AzCopy v10
$downloadDir = $env:USERPROFILE + "\Downloads"
$azCopyHome = $toolsHome + "\AzCopy"
$azCopyHomeCmd = $azCopyHome + "\AzCopy.exe"
mkdir $azCopyHome -force
Invoke-WebRequest -Uri "https://aka.ms/downloadazcopy-v10-windows" -OutFile $downloadDir/AzCopy.zip -UseBasicParsing
Expand-Archive $downloadDir/AzCopy.zip $downloadDir/AzCopy -Force
Get-ChildItem $downloadDir/AzCopy/*/azcopy.exe | Move-Item -Destination $azCopyHomeCmd
Add-EnvPath -Path $azCopyHome -Container User
