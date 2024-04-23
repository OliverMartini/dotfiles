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
winget install --silent Mozilla.Firefox

#--- Common Tools ---
Write-Information "Install Common Tools" -InformationAction Continue
#
winget install --silent 7zip.7zip
winget install --silent Balena.Etcher
winget install --silent Rufus.Rufus
winget install --silent RaspberryPiFoundation.RaspberryPiImager
winget install --silent ShareX.ShareX
winget install --silent WinSCP.WinSCP
#
#winget install --silent Audacity.Audacity
winget install --silent Elgato.StreamDeck

#--- Development Tools ---
Write-Information "Install Dev Tools" -InformationAction Continue
winget install --silent WiresharkFoundation.Wireshark

Write-Information "Install Web Dev Tools" -InformationAction Continue
winget install --silent Insomnia.Insomnia
winget install --silent Postman

Write-Information "Install Git and tools" -InformationAction Continue
winget install --silent Git.Git
winget install --silent GitHub.cli

Write-Information "Install Visual Studio Code" -InformationAction Continue
choco install --silent Microsoft.VisualStudioCode

Write-Information "Install dotnet SDK" -InformationAction Continue
winget install --silent Microsoft.DotNet.SDK.8

Write-Information "Install Python" -InformationAction Continue
winget install --silent Python.Python.3.12

Write-Information "Install Microsoft SQL Server Management Studio" -InformationAction Continue
winget install --silent Microsoft.SQLServerManagementStudio

Write-Information "Install Azure Tools" -InformationAction Continue
winget install --silent Microsoft.Azure.StorageExplorer
winget install --silent Microsoft.Azure.FunctionsCoreTools
winget install --silent Microsoft.AzureDataStudio
winget install --silent Microsoft.Bicep
winget install --silent Microsoft.AzureCLI
winget install --silent Microsoft.Azure.AZCopy.10

Write-Information "Install Docker" -InformationAction Continue
winget install --silent Docker.DockerDesktop

Write-Information "Install Bitwarden" -InformationAction Continue
winget install --silent Bitwarden.Bitwarden

#Write-Information "Install 3d printer stuff" -InformationAction Continue
#winget install --silent Prusa3D.PrusaSlicer

