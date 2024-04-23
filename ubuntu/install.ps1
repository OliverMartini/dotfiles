<#
  .SYNOPSIS
    Install Ubuntu (WSL)
    
  .NOTES
    Author: Oliver Martini
#>

$featureWSL = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
# check if Windows Features are enabled
if ($featureWSL.State) {
  Write-Information "Install Ubuntu" -InformationAction Continue
  wsl --install --no-launch
}
else {
  $errorMessage = "To install Ubuntu - Windows Subsystem Linux needs to be installed!"
  Write-Error -Message $errorMessage -ErrorAction Continue -Category NotEnabled -ErrorId $errorMessage
}
