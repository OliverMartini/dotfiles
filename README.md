# martini does dotfiles for windows
Your dotfiles are how you personalize your system. These are mine.

While reading about dotfiles to setup shell environments on linux systems, I though a similar approach could be used to setup a new Windows 10 development machine. As I had a notebook ready to test, I gave it a try.

So here they are my "dotfiles for Windows".

Are you looking for my other dotfiles?
  - [dotfiles/master](https://github.com/OliverMartini/dotfiles)
  - [dotfiles/wsl](https://github.com/OliverMartini/dotfiles/tree/wsl)
  
## Install
Run this:

    git clone https://github.com/OliverMartini/dotfiles ~\.dotfiles
    cd ~\.dotfiles
    script\bootstrap.ps1

This will symlink the appropriate files in .dotfiles to your home directory. Everything is configured and tweaked within `~/.dotfiles`.

>If you are using WSL there's a followup step we recommend after running the setup script.  When the script finishes you will only have a root user with a blank password. You should  manually create a non-root user via `$ sudo adduser [USERNAME] sudo` 
with a non-blank password. Use this user going forward. For more info on WSL please refer to the [documentation](https://docs.microsoft.com/en-us/windows/wsl/about).

### Barebone install
To start from scratch without having git installed, use the following command.

    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/OliverMartini/dotfiles/windows/script/bootstrap-barebone.ps1'))

> This will install chocolatey, and git. Execute the statements above to continue with install of your dotfiles.

## Components

There's a few special files in the hierarchy.

  - `bin/`: Anything in `bin/` will get added to your `$PATH` and be made available everywhere
  - `topic/install.ps1`: Any file named `install.ps1` is executed to intall the specific topic and it's tools.
  - `topic/install-vscode-extension.ps1`: Any file named `install-vscode-extension.ps1` is executed to install topic specific Visual Studio Code extensions.
  - `topic/install-powershell-module.ps1`: Any file named `install-powershell-module.ps1` is executed to install topic specific PowerShell modules.
  - `topic/*.symlink`: Any file ending in `*.symlink` gets symlinked into your `$env:USERPROFILE`. THis is so you can keep all of those versioned in your dotfiles but still keep those autoloaded files in your home directory. These get symlinked in when you run `script/bootstrap.ps1`.

## Thanks
I sourced the concepts for my dotfiles from multiple places. Noteworthy are the following:
  - [Jessica Deen's](https://github.com/jldeen) - [dotfiles/wsl](https://github.com/jldeen/dotfiles/tree/wsl)
  - [Zach Holman's](https://github.com/holman) - [dotfiles](https://github.com/holman/dotfiles)
  - [Jay Harris's](https://github.com/jayharris) - [dotfiles-windows](https://github.com/jayharris/dotfiles-windows)
  - [Scripts to simplify setting up a Windows developer box](https://github.com/Microsoft/windows-dev-box-setup-scripts)
