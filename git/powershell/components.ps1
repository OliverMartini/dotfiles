<#
  .SYNOPSIS
    Load Git PowerShell component
    
  .NOTES
    Author: Oliver Martini
#>
<#
if (($null -ne (Get-Command git -ErrorAction SilentlyContinue)) -and ($null -ne (Get-Module -ListAvailable Posh-Git -ErrorAction SilentlyContinue))) {
  Import-Module Posh-Git
  #Start-SshAgent -Quiet
}
#>