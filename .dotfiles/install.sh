#!/usr/bin/env bash

### Method is used to see if command exists on your system
command_exists() {
	type "$1" > /dev/null 2>&1
}

############## Variables ##############
EMAIL=""
BIN="$HOME/Bin"
DOWNLOADS="$HOME/Downloads"
DEVFOLDER="$HOME/Development"

SSH_CLIENT1="martokk@desktop"
SSH_CLIENT2="vserver@vserver"
# SSH_CLIENT3="martokk@desktop"

############## Directories ##############
if [ ! -d "$BIN" ]; then
  mkdir -p $BIN
fi
if [ ! -d "$DOWNLOADS" ]; then
  mkdir -p $DOWNLOADS
fi

############## /etc/hosts ##############
echo "Install '/etc/hosts'? (y/n)"
read install_hosts
if [ $install_hosts ]; then
	echo "Installing /etc/hosts"
	source install/hosts.#!/bin/sh
fi

############## Dotfiles ##############
echo "Install dotfiles? (y/n)"
read install_dotfiles
if [ $install_dotfiles ]; then
	echo "Installing dotfiles"

	# TODO: DO SOMETHING

fi

############## Install Apps ##############
echo "Install Apps? (y/n) NOTE: Please review apps.sh and know what is being installed! Modify for each computer"
read install_apps
if [ $install_apps ]; then
	echo "Installing Apps"
	source install/apps.sh
fi

############## SSH Keys ##############
echo "Install SSH Keys? (y/n)"
read install_ssh_keys
if [ $install_ssh_keys ]; then
	echo "Installing ~/.ssh & SSH Keys"
	if [ ! -d ~/.ssh ]; then
		echo "Installing ~/.ssh & SSH Keys"
		mkdir ~/.ssh
		chmod -R 755 ~/.ssh
		ssh-keygen
		ssh-copy-id $SSH_CLIENT1
		ssh-copy-id $SSH_CLIENT2
		# ssh-copy-id $SSH_CLIENT3
	else
		echo '~/.ssh already exists. Skipping SSH install. Please install manually.'
	fi
fi

############## Install Apps ##############
echo "Install custom cron jobs? (y/n) NOTE: Please review and know what is being installed! Modify for each computer"
read install_crons
if [ $install_crons ]; then
	echo "Installing crons"

	crontab -l | { cat; echo "*/5 * * * * ~/Bin/auto_backup_files.sh"; } | crontab -

fi

############## Install Video Wallaper ##############
echo "Install Video Wallaper for Plasma? (y/n) "
read install_video_wallpaper
if [ $install_video_wallpaper ]; then
	echo "Video Wallaper"
	mkdir .local/share/plasma/wallpapers
	cd ~/.local/share/plasma/wallpapers
	git clone https://github.com/halverneus/org.kde.video.git
	cd ~
fi

echo "Done. Reload your terminal."
