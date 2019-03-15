<#
  .SYNOPSIS
    Remove unecessary applications that come with Windows out of the box
    Remove shortcuts in Private & Public Desktop folder

  .NOTES
		Author: Oliver Martini
		References:
			https://github.com/Microsoft/windows-dev-box-setup-scripts/blob/master/scripts/RemoveDefaultApps.ps1
			https://docs.microsoft.com/en-us/windows/application-management/remove-provisioned-apps-during-update
			https://github.com/jayharris/dotfiles-windows/blob/master/windows.ps1#L157
			https://gist.github.com/jessfraz/7c319b046daa101a4aaef937a20ff41f
			https://gist.github.com/alirobe/7f3b34ad89a159e6daa1
			https://github.com/W4RH4WK/Debloat-Windows-10/blob/master/scripts/remove-default-apps.ps1
#>

#--- Remove unecessary applications ---
#
Write-Information "Remove applications that come with Windows out of the box" -InformationAction Continue

function removeApp {
  Param ([string]$appName)
  Write-Verbose "Trying to remove app: $appName"
  Get-AppxPackage $appName -AllUsers | Remove-AppxPackage
  Get-AppXProvisionedPackage -Online | Where-Object DisplayNam -like $appName | Remove-AppxProvisionedPackage -Online
}

$applicationList = @(
  "Microsoft.BingFinance"
  "Microsoft.3DBuilder"
  "Microsoft.BingSports"
  "Microsoft.CommsPhone"
  "Microsoft.Getstarted"
  "*MarchofEmpires*"
  "Microsoft.GetHelp"
  "Microsoft.Messaging"
  "*Minecraft*"
  "Microsoft.MicrosoftOfficeHub"
  "Microsoft.OneConnect"
  "Microsoft.WindowsPhone"
  "Microsoft.WindowsSoundRecorder"
  "*Solitaire*"
  "Microsoft.MicrosoftStickyNotes"
  "Microsoft.Office.Sway"
  "Microsoft.XboxIdentityProvider"
  "Microsoft.ZuneMusic"
  "Microsoft.ZuneVideo"
  "Microsoft.NetworkSpeedTest"
  "Microsoft.FreshPaint"
  "Microsoft.Print3D"
  "*Autodesk*"
  "*BubbleWitch*"
  "king.com*"
  "G5*"
  "*Dell*"
  "*Facebook*"
  "*Keeper*"
  "*Twitter*"
  "*.Duolingo-LearnLanguagesforFree"
  "*.EclipseManager"
  "ActiproSoftwareLLC.562882FEEB491" # Code Writer
  "*.AdobePhotoshopExpress"
);
$applicationListCount = $applicationList.Count

foreach ($app in $applicationList) {
  $percentComplete = (100 / $applicationListCount) * $applicationList.IndexOf($app)
  $count = $applicationList.IndexOf($app) + 1
	
  Write-Progress -Activity "Do remove app..." -Status "Progress [$count of $applicationListCount]" -PercentComplete $percentComplete -CurrentOperation "remove $app"
  removeApp $app
}

#--- Remove shortcuts ---
#
Write-Information "Remove shortcuts in Private & Public Desktop folder" -InformationAction Continue

$desktopFolder = [Environment]::GetFolderPath("Desktop")
$commonDesktopFolder = [Environment]::GetFolderPath("CommonDesktopDirectory")

# delete shortcuts on Private Desktop folder
Remove-Item $desktopFolder/*.lnk
# delete shortcuts in Public Desktop folder
Remove-Item $commonDesktopFolder/*.lnk

#--- ColorTool ---
ColorTool.exe -b solarized_dark
#
& "$PSScriptRoot\cmd-colors\Update-StartMenu.ps1"

