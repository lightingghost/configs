#!/bin/sh

sudo rm /Library/Preferences/com.apple.Bluetooth.plist
sudo cp /private/var/root/Library/Preferences/com.apple.bluetoothd.plist .
sudo rm /private/var/root/Library/Preferences/com.apple.bluetoothd.plist 
