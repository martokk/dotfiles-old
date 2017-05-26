#!/bin/bash

### Method is used to see if command exists on your system
command_exists() {
	type "$1" > /dev/null 2>&1
}



############## Install App Repositories ##############
# Flux
sudo add-apt-repository -y ppa:nathan-renniewaldock/flux
# Latte Dock
sudo add-apt-repository -y ppa:rikmills/latte-dock
# QOwnNotes
sudo add-apt-repository -y ppa:pbek/qownnotes
# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 && \
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# Albert
sudo add-apt-repository -y ppa:nilarimogard/webupd8
# Steam
sudo add-apt-repository -y multiverse
# Telegram
sudo add-apt-repository -y ppa:atareao/telegram
# Atom
sudo add-apt-repository ppa:webupd8team/atom
# Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

############## Apt Update & Upgrade ##############
sudo apt-get update && sudo apt-get upgrade

############## Download Packages ##############
# GitKraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz
tar -xvzf gitkraken-amd64.tar.gz

############## Install App packages ##############
sudo apt-get install -y \
google-chrome-stable \
git \
openssh-server \
sshfs \
clang \
fluxgui \
latte-dock \
gimp \
qownnotes \
spotify-client \
transmission \
htop \
iotop \
unison \
unison-gtk \
gparted \
curl \
albert \
steam \
telegram \
atom \
virtualbox \
virtualbox-guest-dkms \
remmina \
wine \
playonlinux \


# GitKraken
tar -xvzf gitkraken-amd64.tar.gz

############## Install Atom Packages ##############
apm list --installed --bare > ~/.atom/package-list.txt
