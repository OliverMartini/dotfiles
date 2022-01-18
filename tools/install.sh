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
sudo apt-get install mc tmux zsh jq -y

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

echo ""
echo ".git-completion.zsh..."
GIT_VERSION=`git --version | awk '{print $3}'`
echo "Now configuring git-completion..."
URL="https://raw.github.com/git/git/v$GIT_VERSION/contrib/completion/git-completion.zsh"
if ! wget "$URL" -q -O "$HOME/.git-completion.zsh"; then
  echo "ERROR: Couldn't download completion script. Make sure you have a working internet connection." && exit 1
fi

# Setup and configure az cli
echo ''
read -p "Do you want to install Azure CLI? y/n (This will take some time...)" -n 1 -r
echo ''
if [[ $REPLY =~ ^[Yy]$ ]] ; then
  echo "Now installing az cli..."
  sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg -y

  curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null

  AZ_REPO=$(lsb_release -cs)
  echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list

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

