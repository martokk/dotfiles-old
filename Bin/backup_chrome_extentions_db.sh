#!/bin/bash

set -e

# Chrome Extentions - IndexedDB Folder & Local Extention Settings Folder
STYLISH="$HOME/.config/google-chrome/Default/IndexedDB/chrome-extension_fjnbnpbmkenffdnngjfgmeleoegfcffe_0.indexeddb.leveldb"

YOUCLEVER="$HOME/.config/google-chrome/Default/Local Extension Settings/agdpdlplhmfgonalmdooaojempaoncmp"


# Chrome Extentions - Local Storage File
HIGHLIGHT="chrome-extension_fgmbnmjmbjenlhbefngfibmjkpbcljaj_0.localstorage"

RES="chrome-extension_kbmfpngjjgdllneeigpgjifpgocmfgmb_0.localstorage"

TAMPER="chrome-extension_dhdgffkkebhmkfjojejmpbldmpobfkfo_0.localstorage"

# Time
TIME=`date +%Y%m%d_%H%M`

# Directories
DEST_DIR="$HOME/ownCloud/Apps & Programs/Program Files and Preferences/Chrome Extenstions & Themes/Backups/$TIME"
LOCAL_STORAGE_DIR="$HOME/.config/google-chrome/Default/Local Storage/"

############### START BACKUP ###############
mkdir -p "$DEST_DIR"

# Backup IndexedDB & Local Extention Settings
echo "Backing up Stylish"
tar -cpzf "$DEST_DIR/stylish.tar.gz" --directory="$STYLISH" .

echo "Backing up YouClever"
tar -cpzf "$DEST_DIR/youclever.tar.gz" --directory="$YOUCLEVER" .

# Backup Local Storage
echo "Backing up Highlight This"
tar -cpzf "$DEST_DIR/highlightthis.tar.gz" -C "$LOCAL_STORAGE_DIR" "$HIGHLIGHT"

echo "Backing up RES"
tar -cpzf "$DEST_DIR/res.tar.gz" -C "$LOCAL_STORAGE_DIR" "$RES"



echo "Backing up TamperMonkey"
tar -cpzf "$DEST_DIR/tampermonkey.tar.gz" -C "$LOCAL_STORAGE_DIR" "$TAMPER"

echo "Backup complete."
