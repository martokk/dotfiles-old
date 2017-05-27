#!/usr/bin/env bash

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"


clear
echo -e "$COL_YELLOW""=========  RUNNING: UNISON SYNC  =========$COL_RESET"
echo ""

unison -batch homeassistant

echo ""
echo -e "$COL_GREEN""Unison Sync Complete. $COL_RESET"
echo "----------------------------------------------"



echo "" && echo "" && echo ""
echo -e "$COL_YELLOW""=========  RUNNING: HASS CHECK_CONFIG  =========$COL_RESET"
echo ""

CONFIG_ERRORS=`ssh vserver@vserver hass --script check_config -c /home/vserver/server/homeassistant | grep ERROR`

if [ -z "$CONFIG_ERRORS" ]; then
  echo "$CONFIG_ERRORS"
    echo -e "$COL_GREEN""Valid Configuration! $COL_RESET"
else
    echo "$CONFIG_ERRORS"
    echo ""
    echo -e "$COL_RED""INVALID CONFIGURATION! $COL_RESET"
    echo "Do you want to bypass the error? (y/n)"
    read bypass_error
    if [ "$bypass_error" != "y" ]; then
      echo -e "$COL_RED""Exiting script. $COL_RESET"
      exit 1
    fi
fi
echo "----------------------------------------------"



echo "" && echo "" && echo ""
echo -e "Do you want to restart Home Assistant? (y/n)"
read restart_hass

if [ $restart_hass == "y" ]; then
    echo ""
    echo -e "$COL_YELLOW""=========  RUNNING: RESTARTING HASS  =========$COL_RESET"
    echo ""
    ssh -t vserver@vserver systemctl restart home-assistant
fi

echo ""
echo -e "$COL_GREEN""Push HASS Completed. $COL_RESET"
echo "----------------------------------------------"
echo "" && echo "" && echo "" && echo ""&& echo "" && echo "" && echo ""
