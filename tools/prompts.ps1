<#
  .SYNOPSIS
    Prompt for tools related input
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Set following values to configure tools:" -InformationAction Continue
$toolsHome = Read-Host 'TOOLS: Home Directory'