<#
  .SYNOPSIS
    Enable Windows Features
    
  .NOTES
    Author: Oliver Martini
#>

#--- Enable Windows Features ---

Write-Information "Enable Windows Features" -InformationAction Continue
#$featureContainers = Get-WindowsOptionalFeature -Online -FeatureName Containers
#$featureHyperV = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V
$featureWSL = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
# check if Windows Features are enabled
if (#!$featureContainers.State -or
  #!$featureHyperV.State -or
  !$featureWSL.State) {
  #--- do Enable Windows Features ---
  #Enable-WindowsOptionalFeature -Online -FeatureName Containers -All -NoRestart
  #Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
  #Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart
  #
  $RunOnceKey = "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
  set-itemproperty $RunOnceKey "NextRun" ('powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command ' + "iex $PSScriptRoot\script\bootstrap.ps1")
  Write-Information "Enabled Windows Features, restart computer!" -InformationAction Continue
  Restart-Computer -Force
}
else {
  Write-Information "Windows Features already enabled, continue!" -InformationAction Continue
}
#>