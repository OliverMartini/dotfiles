<#
  .SYNOPSIS
    PowerShell functions that will be loaded for all PowerShell instances
    
  .NOTES
    Author: Oliver Martini
    References:
      https://github.com/jayharris/dotfiles-windows
#>

Write-Information "Set functions" -InformationAction Continue

# Basic commands
function which($name) { Get-Command $name -ErrorAction SilentlyContinue | Select-Object Definition }
function touch($file) { "" | Out-File $file -Encoding ASCII }

# Common Editing needs
function Edit-Hosts { Invoke-Expression "sudo $(if($null -ne $env:EDITOR)  {$env:EDITOR } else { 'code' }) $env:windir\system32\drivers\etc\hosts" }
function Edit-Profile { Invoke-Expression "$(if($null -ne $env:EDITOR)  {$env:EDITOR } else { 'code' }) $profile" }

# Sudo
function sudo() {
  if ($args.Length -eq 1) {
    start-process $args[0] -verb "runAs"
  }
  if ($args.Length -gt 1) {
    start-process $args[0] -ArgumentList $args[1..$args.Length] -verb "runAs"
  }
}

# System Update - Update RubyGems, NPM, and their installed packages
function System-Update() {
  Install-WindowsUpdate -IgnoreUserInput -IgnoreReboot -AcceptAll
  Update-Module
  Update-Help -Force
  winget upgrade -all
  npm install npm -g
  npm update -g
}

# Reload the Shell
function Reload-Powershell {
  $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
  $newProcess.Arguments = "-nologo";
  [System.Diagnostics.Process]::Start($newProcess);
  exit
}

# Download a file into a temporary folder
function curlex($url) {
  $uri = new-object system.uri $url
  $filename = $uri.segments | Select-Object -Last 1
  $path = join-path $env:Temp $filename
  if ( test-path $path ) { Remove-Item -force $path }

  (new-object net.webclient).DownloadFile($url, $path)

  return new-object io.fileinfo $path
}

# Empty the Recycle Bin on all drives
function Empty-RecycleBin {
  $RecBin = (New-Object -ComObject Shell.Application).Namespace(0xA)
  $RecBin.Items() | ForEach-Object { Remove-Item $_.Path -Recurse -Confirm:$false }
}

# Sound Volume
function Get-SoundVolume {
  <#
  .SYNOPSIS
  Get audio output volume.

  .DESCRIPTION
  The Get-SoundVolume cmdlet gets the current master volume of the default audio output device. The returned value is an integer between 0 and 100.

  .LINK
  Set-SoundVolume

  .LINK
  Set-SoundMute

  .LINK
  Set-SoundUnmute

  .LINK
  https://github.com/jayharris/dotfiles-windows/
  #>
  [math]::Round([Audio]::Volume * 100)
}
function Set-SoundVolume([Parameter(mandatory = $true)][Int32] $Volume) {
  <#
  .SYNOPSIS
  Set audio output volume.

  .DESCRIPTION
  The Set-SoundVolume cmdlet sets the current master volume of the default audio output device to a value between 0 and 100.

  .PARAMETER Volume
  An integer between 0 and 100.

  .EXAMPLE
  Set-SoundVolume 65
  Sets the master volume to 65%.

  .EXAMPLE
  Set-SoundVolume -Volume 100
  Sets the master volume to a maximum 100%.

  .LINK
  Get-SoundVolume

  .LINK
  Set-SoundMute

  .LINK
  Set-SoundUnmute

  .LINK
  https://github.com/jayharris/dotfiles-windows/
  #>
  [Audio]::Volume = ($Volume / 100)
}
function Set-SoundMute {
  <#
  .SYNOPSIS
  Mote audio output.

  .DESCRIPTION
  The Set-SoundMute cmdlet mutes the default audio output device.

  .LINK
  Get-SoundVolume

  .LINK
  Set-SoundVolume

  .LINK
  Set-SoundUnmute

  .LINK
  https://github.com/jayharris/dotfiles-windows/
  #>
  [Audio]::Mute = $true
}
function Set-SoundUnmute {
  <#
  .SYNOPSIS
  Unmote audio output.

  .DESCRIPTION
  The Set-SoundUnmute cmdlet unmutes the default audio output device.

  .LINK
  Get-SoundVolume

  .LINK
  Set-SoundVolume

  .LINK
  Set-SoundMute

  .LINK
  https://github.com/jayharris/dotfiles-windows/
  #>
  [Audio]::Mute = $false
}

### File System functions
### ----------------------------
# Create a new directory and enter it
function CreateAndSet-Directory([String] $path) { New-Item $path -ItemType Directory -ErrorAction SilentlyContinue; Set-Location $path }

# Determine size of a file or total size of a directory
function Get-DiskUsage([string] $path = (Get-Location).Path) {
  Convert-ToDiskSize `
  ( `
      Get-ChildItem .\ -recurse -ErrorAction SilentlyContinue `
    | Measure-Object -property length -sum -ErrorAction SilentlyContinue
  ).Sum `
    1
}

### Utilities
### ----------------------------

# Convert a number to a disk size (12.4K or 5M)
function Convert-ToDiskSize {
  param ( $bytes, $precision = '0' )
  foreach ($size in ("B", "K", "M", "G", "T")) {
    if (($bytes -lt 1000) -or ($size -eq "T")) {
      $bytes = ($bytes).tostring("F0" + "$precision")
      return "${bytes}${size}"
    }
    else { $bytes /= 1KB }
  }
}
#>