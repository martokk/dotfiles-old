#!/usr/bin/env bash

### Method is used to see if command exists on your system
command_exists() {
	type "$1" > /dev/null 2>&1
}

# Setting up some variables
EMAIL=""
BIN="$HOME/Bin"
DOWNLOADS="$HOME/Downloads"
DEVFOLDER="$HOME/Development"

SSH_CLIENT1="martokk@desktop"
SSH_CLIENT2="vserver@vserver"
# SSH_CLIENT3="martokk@desktop"

# Creating needed directories
if [ ! -d "$BIN" ]; then
  mkdir -p $BIN
fi
if [ ! -d "$DOWNLOADS" ]; then
  mkdir -p $DOWNLOADS
fi
if [ ! -d "$DEVFOLDER" ]; then
  mkdir -p $DEVFOLDER
fi

## Add computers to /etc/hosts
echo "Install '/etc/hosts'? (y/n)"
read install_hosts
if [ $install_hosts ]; then
	echo "Installing /etc/hosts"
	source install/hosts.#!/bin/sh
fi

# Import Dotfiles
echo "Install dotfiles? (y/n)"
read install_dotfiles
if [ $install_dotfiles ]; then
	echo "Installing dotfiles"

	# TODO: DO SOMETHING

fi

# Installing the apps that we need
echo "Install Apps? (y/n)"
read install_apps
if [ $install_apps ]; then
	echo "Installing Apps"
	source install/apps.sh
fi

# Setup SSH key if needed
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


echo "Done. Reload your terminal."
