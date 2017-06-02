#!/bin/bash

echo "Backing up list of atom packages to ~/.atom/package-list.txt"

apm list --installed --bare > ~/.atom/package-list.txt

echo "Backup of package-list.txt complete. Use '' to install packages from backup."
