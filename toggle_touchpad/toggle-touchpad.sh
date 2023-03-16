#!/bin/bash
#
# Purpose: Toggle synaptic touchpad on/off
# Author: Fazle Arefin
# Reference: http://ubuntuforums.org/showthread.php?t=1536305
#

# Tip: Set the keybind to ===> Ctrl + Shift + Alt + m 

TOUCHPADID=$(xinput --list | sed -n '/Touchpad/s/.*id=\([0-9]*\).*/\1/p')

SYNSTATE=$(xinput list-props "$TOUCHPADID" | grep "Device Enabled" | grep -Eo '.$')
if [ $SYNSTATE = 0 ]; then 
    xinput set-prop "$TOUCHPADID" "Device Enabled" 1
else 
    xinput set-prop "$TOUCHPADID" "Device Enabled" 0
fi