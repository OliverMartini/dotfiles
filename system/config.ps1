<#
  .SYNOPSIS
    Remove unecessary applications that come with Windows out of the box
    Remove shortcuts in Private & Public Desktop folder

  .NOTES
		Author: Oliver Martini
#>

#--- Remove unecessary applications ---
#
Write-Information "Remove applications that come with Windows out of the box" -InformationAction Continue
winget uninstall XING
winget uninstall "Groove Music"
winget uninstall "Get Help"

#--- Remove shortcuts ---
#
Write-Information "Remove shortcuts in Private & Public Desktop folder" -InformationAction Continue

$desktopFolder = [Environment]::GetFolderPath("Desktop")
$commonDesktopFolder = [Environment]::GetFolderPath("CommonDesktopDirectory")

# delete shortcuts on Private Desktop folder
Remove-Item $desktopFolder/*.lnk
# delete shortcuts in Public Desktop folder
Remove-Item $commonDesktopFolder/*.lnk