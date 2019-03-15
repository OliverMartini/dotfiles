<#
  .SYNOPSIS
    Install tools using chocolatey
    
  .NOTES
    Author: Oliver Martini
#>

#--- Browsers ---
Write-Information "Install Browsers" -InformationAction Continue
#
choco install -y googlechrome   --limit-output
choco install -y firefox        --limit-output

#--- Common Tools ---
Write-Information "Install Common Tools" -InformationAction Continue
#
choco install -y colortool      --limit-output
choco install -y 7zip.install   --limit-output
choco install -y etcher         --limit-output
choco install -y rufus          --limit-output
choco install -y sharex         --limit-output
choco install -y veeam-agent    --limit-output
RefreshEnv
choco install -y windirstat     --limit-output
choco install -y winscp         --limit-output
#
choco install -y audacity       --limit-output
choco install -y audacity-lame  --limit-output

#--- Common Development Tools ---
Write-Information "Install Common Dev Tools" -InformationAction Continue
#
choco install -y sysinternals   --limit-output
choco install -y wireshark      --limit-output
# web dev tools
choco install -y insomnia-rest-api-client --limit-output
