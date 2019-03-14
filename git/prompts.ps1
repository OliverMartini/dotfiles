<#
  .SYNOPSIS
    Prompt for git related input
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Set following values to configure git:" -InformationAction Continue
$gitAuthorName = Read-Host 'GIT: Author Name'
$gitAuthorEmail = Read-Host 'GIT: Author Email'