<#
  .SYNOPSIS
    Handles installation, updates, things like that. Run it periodically
    to make sure you're on the latest and greatest.
    
  .NOTES
    Author: Oliver Martini
#>

#--- Upgrade chocolatey packages ---
choco upgrade all -y