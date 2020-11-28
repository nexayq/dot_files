#/bin/bash

# Restart Network Manager
sudo systemctl stop NetworkManager
sudo systemctl start NetworkManager

sleep 5

# restart nm-applet
killall nm-applet; setsid nm-applet &
