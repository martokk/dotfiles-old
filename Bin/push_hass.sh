#!/usr/bin/env bash

unison -batch homeassistant

echo ""
echo "Unison Sync Complete."
echo "-----------------------"
echo ""
echo "running: HASS check_config"
echo ""

ssh vserver@vserver hass --script check_config -c /home/vserver/server/homeassistant

echo ""
echo "Testing complete."
echo "-----------------------"
echo ""

echo "Do you want to restart Home Assistant? (y/n)"
read restart_hass

if [ $restart_hass == "y" ]; then
    echo "Restarting Home Assistant"
    ssh -t vserver@vserver systemctl restart home-assistant
fi

echo "Completed."
echo "-----------------------"
