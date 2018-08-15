#!/bin/bash

HOTKEY="KEY_LEFTSHIFT"

# Write message to system log
/usr/bin/logger "Screen locked because Yubikey has been disconnected."

# Check, if hotkey is not beeing pressed during lockscreen attempt
kbd_devices=`cat /proc/bus/input/devices | egrep '^H:.* kbd ' | sed 's/.*event\([0-9]\+\).*/event\1/'`
for event_dev in ${kbd_devices}; do
    evtest --query /dev/input/${event_dev} EV_KEY ${HOTKEY}
    if [[ "$?" != "0" ]]; then
        exit 0
    fi
done

# Lock the screen
/home/antonio/dotfiles/scripts/lock.sh
