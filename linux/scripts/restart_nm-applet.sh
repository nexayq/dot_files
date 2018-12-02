#/bin/bash

# restart nm-applet
killall nm-applet; setsid nm-applet &
