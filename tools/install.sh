#!/bin/bash

echo "apt-get update ..."
sudo apt-get update -y

echo ""
echo "apt-get upgrade ..."
sudo apt-get upgrade -y

#echo ""
#echo "apt-get upgrade lxd lxd-client netplan.io, as they are kept back"
#sudo apt-get upgrade lxd lxd-client netplan.io -y

echo ""
echo "apt-get autoremove"
sudo apt-get autoremove -y
sudo apt-get clean

echo ""
echo "install build-essential git dfu-util ..."
sudo apt-get install build-essential git dfu-util unzip -y

echo ""
echo "install python3 ..."
sudo apt-get install python3 python3-dev python3-pip python3-venv -y
sudo pip3 install speedtest-cli

echo ""
echo "install tools ..."
sudo apt-get install mc tmux jq -y

echo ""
echo ".git-completion.bash and .git-prompt.sh..."
sudo apt-get install git bash-completion
GIT_VERSION=`git --version | awk '{print $3}'`
echo "Now configuring git-completion..."
URL="https://raw.github.com/git/git/v$GIT_VERSION/contrib/completion/git-completion.bash"
echo "Downloading git-completion for git version: $GIT_VERSION..."
if ! wget "$URL" -q -O "$HOME/.git-completion.bash"; then
  echo "ERROR: Couldn't download completion script. Make sure you have a working internet connection." && exit 1
fi
echo "Now configuring git-prompt..."
URL="https://raw.github.com/git/git/v$GIT_VERSION/contrib/completion/git-prompt.sh"
echo "Downloading git-prompt for git version: $GIT_VERSION..."
if ! wget "$URL" -q -O "$HOME/.git-prompt.sh"; then
	echo "ERROR: Couldn't download prompt script. Make sure you have a working internet connection." && exit 1
fi

# Setup and configure az cli
# https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt#option-2-step-by-step-installation-instructions
echo ''
read -p "Do you want to install Azure CLI? y/n (This will take some time...)" -n 1 -r
echo ''
if [[ $REPLY =~ ^[Yy]$ ]] ; then
  echo "Now installing az cli..."
  sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y

  sudo mkdir -p /etc/apt/keyrings
  curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
    sudo gpg --dearmor -o /etc/apt/keyrings/microsoft.gpg
  sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

  AZ_DIST=$(lsb_release -cs)
  echo "Types: deb
  URIs: https://packages.microsoft.com/repos/azure-cli/
  Suites: ${AZ_DIST}
  Components: main
  Architectures: $(dpkg --print-architecture)
  Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources

  sudo apt-get update 
  sudo apt-get install azure-cli -y

  if [[ $? -eq 0 ]]
  then
    echo "Successfully installed Azure CLI"
  else
    echo "Azure CLI not installed successfully." >&2
  fi
else 
  echo "You chose not to install Azure CLI. Exiting now."
fi

echo ""
echo "install redis-tools ..."
sudo apt-get install redis-tools -y

