param(
  [Parameter(Mandatory = $true)]
  [ValidateScript( {Test-Path $_})]
  [string]$Path
)

$lnk = & ("$PSScriptRoot\Get-Link.ps1") $Path

# Set solarized_dark.itermcolors colors
$lnk.ConsoleColors[0] = "#002731"
$lnk.ConsoleColors[1] = "#2175c7"
$lnk.ConsoleColors[2] = "#728905"
$lnk.ConsoleColors[3] = "#259285"
$lnk.ConsoleColors[4] = "#d01b24"
$lnk.ConsoleColors[5] = "#c61b6e"
$lnk.ConsoleColors[6] = "#a57705"
$lnk.ConsoleColors[7] = "#e9e2cb"
$lnk.ConsoleColors[8] = "#004d64"
$lnk.ConsoleColors[9] = "#708183"
$lnk.ConsoleColors[10] = "#465a61"
$lnk.ConsoleColors[11] = "#81908f"
$lnk.ConsoleColors[12] = "#bd3612"
$lnk.ConsoleColors[13] = "#5856b9"
$lnk.ConsoleColors[14] = "#52676f"
$lnk.ConsoleColors[15] = "#fcf4dc"

$lnk.PopUpBackgroundColor = 0xf
$lnk.PopUpTextColor = 0x5
$lnk.ScreenBackgroundColor = 0x0
$lnk.ScreenTextColor = 0x7

$lnk.Save()
Write-Host "Updated $Path"