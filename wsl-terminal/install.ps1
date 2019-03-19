<#
  .SYNOPSIS
    Install WSL Terminal
    
  .NOTES
    Author: Oliver Martini
#>

Write-Information "Install WSL Terminal" -InformationAction Continue

$toolDir = "C:\Tools"
$wslTerminalDir = Join-Path $toolDir "wsl-terminal"
$version = "0.8.12"
$wslTerminal = "wsl-terminal-$version.7z"

if (Test-Path $wslTerminalDir) {
  Write-Information "WSL terminal already installed" -InformationAction Continue
}
else {
  Write-Progress -Activity "Get bits for WSL terminal"
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  Invoke-WebRequest -Uri "https://github.com/goreliu/wsl-terminal/releases/download/v$version/$wslTerminal" -OutFile $wslTerminal

  Write-Progress -Activity "Extract WSL terminal and remove after complete"
  Get-Item $wslTerminal | ForEach-Object {
    $7z_Arguments = @(
      'x'							## eXtract files with full paths
      '-y'						## assume Yes on all queries
      "`"-o$($toolDir)`""		## set Output directory
      "`"$($_.FullName)`""				## <archive_name>
    )
    & 7z.exe $7z_Arguments
    If ($LASTEXITCODE -eq 0) {
      Remove-Item -Path $_.FullName -Force
    }
  }
}

Write-Information "Copy etc config files for WSL Terminal" -InformationAction Continue
Push-Location (Join-Path $env:USERPROFILE ".dotfiles\wsl-terminal")
Copy-Item 'etc\wsl-terminal.conf' -Destination (Join-Path $wslTerminalDir "etc")
Pop-Location
