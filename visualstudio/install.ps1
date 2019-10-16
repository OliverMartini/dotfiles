<#
  .SYNOPSIS
    Install Visual Studio 2017/2019 using chocolatey
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install Visual Studio 2017" -InformationAction Continue
#
#--- Visual Studio 2017
choco install -y visualstudio2017enterprise --package-parameters="'--add Microsoft.VisualStudio.Component.Git'" --limit-output
choco install -y visualstudio2017-workload-universal        --limit-output
choco install -y visualstudio2017-workload-manageddesktop   --limit-output
choco install -y visualstudio2017-workload-netweb           --limit-output
choco install -y visualstudio2017-workload-azure            --limit-output
choco install -y visualstudio2017-workload-data             --limit-output
choco install -y visualstudio2017-workload-netcrossplat     --limit-output
choco install -y visualstudio2017-workload-nativecrossplat  --limit-output
choco install -y visualstudio2017-workload-netcoretools     --limit-output

Write-Information "Install Visual Studio 2019" -InformationAction Continue
#
#--- Visual Studio 2019
choco install -y visualstudio2019enterprise
choco install -y visualstudio2019-workload-universal        --limit-output
choco install -y visualstudio2019-workload-manageddesktop   --limit-output
choco install -y visualstudio2019-workload-netweb           --limit-output
choco install -y visualstudio2019-workload-azure            --limit-output
choco install -y visualstudio2019-workload-data             --limit-output
choco install -y visualstudio2019-workload-netcrossplat     --limit-output
choco install -y visualstudio2019-workload-nativecrossplat  --limit-output
choco install -y visualstudio2019-workload-netcoretools     --limit-output
