#!/bin/bash -

#=== HEADER ===================================================================
# Title         : auto_backup_files.sh
# Description   : This script will backup files every 5 min.
# Author		    : martokk
# Date          : 20111101
# Version       : 0.1
#=== NOTES ====================================================================
# Run this via cron every 5 minutes.
#   crontab -e
# add a new line:
#   */5 * * * * /home/user/bin/SCRIPTNAME
#==============================================================================

# Stop the execution of script if a command has an error
set -e

######## CHECK & BACKUP FROM 'DOWNLOADS' FOLDER ########
DOWNLOADS_DIR="$HOME/Downloads/"
BACKUP_DIR="$HOME/ownCloud/Apps & Programs/Program Files and Preferences/"


# Move Tampermonkey Backup Files
APP_DIR="$BACKUP_DIR/Chrome Extenstions & Themes/Tampermonkey/"

if [ -f $DOWNLOADS_DIR/tampermonkey-backup-chrome*.txt ]; then
    mv $DOWNLOADS_DIR/tampermonkey-backup-chrome*.txt "$APP_DIR"
fi


# Move Stylish Backup Files
APP_DIR="$BACKUP_DIR/Chrome Extenstions & Themes/Stylish/"

if [ -f $DOWNLOADS_DIR/stylish*.json ]; then
    mv $DOWNLOADS_DIR/stylish*.json "$APP_DIR"
fi


# Move HighlighThis Backup Files
APP_DIR="$BACKUP_DIR/Chrome Extenstions & Themes/HighlightThis/"

if [ -f $DOWNLOADS_DIR/HighlighThis*.txt ]; then
    mv $DOWNLOADS_DIR/HighlighThis*.txt "$APP_DIR"
fi


# Move RES Backup Files
APP_DIR="$BACKUP_DIR/Chrome Extenstions & Themes/RES/"

if [ -f $DOWNLOADS_DIR/RES*.resbackup ]; then
    mv $DOWNLOADS_DIR/RES*.resbackup "$APP_DIR"
fi
