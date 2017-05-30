#!/bin/bash

### Method is used to see if command exists on your system
command_exists() {
	type "$1" > /dev/null 2>&1
}

############## Install Essentials ##############
echo "Install Essential Apps? (y/n)"
read install_apps
if [ $install_apps ]; then
	echo "Installing Essential Apps"

	# Latte Dock
	sudo add-apt-repository -y ppa:rikmills/latte-dock
	# QOwnNotes
	sudo add-apt-repository -y ppa:pbek/qownnotes
	# Albert
	sudo add-apt-repository -y ppa:nilarimogard/webupd8
	# Telegram
	sudo add-apt-repository -y ppa:atareao/telegram
	# Chrome
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

	# Update
	sudo apt-get update && sudo apt-get upgrade

	#Install
	sudo apt-get install -y \
	google-chrome-stable \
	git \
	openssh-server \
	sshfs \
	redshift \
	redshift-plasmoid \
	latte-dock \
	gimp \
	qownnotes \
	htop \
	iotop \
	unison \
	unison-gtk \
	gparted \
	curl \
	albert \
	telegram \
	virtualbox \
	virtualbox-guest-dkms \
	remmina \
	wine \
	playonlinux \
	python3-pip
fi

############## Install Atom ##############
echo "Install Atom? (y/n)"
read install_apps
if [ $install_apps ]; then
	echo "Installing Atom"

	# Install Atom & Clang
	sudo add-apt-repository ppa:webupd8team/atom
	sudo apt-get update && sudo apt-get upgrade
	sudo apt-get install -y \
	atom \
	clang \

	# Install Atom Packages
	apm list --installed --bare > ~/.atom/package-list.txt

	# Install PlatformIO Libraries
	cd ~/.platformio/lib/
	git clone https://github.com/adafruit/Adafruit_NeoPixel.git
	git clone https://github.com/kitesurfer1404/WS2812FX.git
	git clone https://github.com/knolleary/pubsubclient.git
	git clone https://github.com/adafruit/Adafruit_Sensor.git
	git clone https://github.com/adafruit/DHT-sensor-library.git
	cd ~
fi


############## Install Spotify ##############
echo "Install Spotify? (y/n)"
read install_apps
if [ $install_apps ]; then
	echo "Installing Spotify"

	# Install Repo
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 && \
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

	# Update
	sudo apt-get update && sudo apt-get upgrade

	# Install
	sudo apt-get install -y spotify-client
fi


############## Install GitKraken ##############
echo "Install GitKraken? (y/n)"
read install_apps
if [ $install_apps ]; then
	echo "Installing GitKraken"
	wget https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz
	tar -xvzf gitkraken-amd64.tar.gz
fi


############## Install Transmission ##############
echo "Install Transmission? (y/n)"
read install_apps
if [ $install_apps ]; then
	echo "Installing Transmission"
	sudo apt-get install -y transmission
fi


############## Install Steam ##############
echo "Install Steam? (y/n)"
read install_apps
if [ $install_apps ]; then
	echo "Installing Steam"
	sudo add-apt-repository -y multiverse
	sudo apt-get update && sudo apt-get upgrade
	sudo apt-get install -y steam
fi

############## Install Thunderbird ##############
echo "Install Thunderbird? (y/n)"
read install_apps
if [ $install_apps ]; then
	echo "Installing Thunderbird"
	sudo apt-get install -y thunderbird
fi
