#!/bin/bash

### Method is used to see if command exists on your system
command_exists() {
	type "$1" > /dev/null 2>&1
}



## Install App packages


## Install apps


## Install plugins

### Atom Packages
apm list --installed --bare > ~/.atom/package-list.txt
