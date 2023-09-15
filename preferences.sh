#!/bin/bash

## Foxit PDF Reader
/usr/libexec/PlistBuddy -c "Delete ':Preferences.General.SingleKey'" -c "Add ':Preferences.General.SingleKey' string '1'" "$HOME/Library/Preferences/com.foxit-software.Foxit PDF Reader.plist"

## macOS
# Disable Spotlight hotkey
/usr/libexec/PlistBuddy -c "Delete ':AppleSymbolicHotKeys:64:enabled'" -c "Add ':AppleSymbolicHotKeys:64:enabled' bool 'false'" "$HOME/Library/Preferences/com.apple.symbolichotkeys.plist"

# https://apple.stackexchange.com/a/46363
defaults write -g ApplePressAndHoldEnabled -bool false

# Use F1, F2, etc. keys as standard function keys
/usr/libexec/PlistBuddy -c "Delete ':com.apple.keyboard.fnState'" -c "Add ':com.apple.keyboard.fnState' bool 'true'" "$HOME/Library/Preferences/.GlobalPreferences.plist"

/usr/libexec/PlistBuddy -c "Delete ':KeyRepeat'" -c "Add ':KeyRepeat' real '2.000000'" "$HOME/Library/Preferences/.GlobalPreferences.plist"
/usr/libexec/PlistBuddy -c "Delete ':InitialKeyRepeat'" -c "Add ':InitialKeyRepeat' real '15.000000'" "$HOME/Library/Preferences/.GlobalPreferences.plist"

/usr/libexec/PlistBuddy -c "Delete ':autohide'" -c "Add ':autohide' bool 'true'" "$HOME/Library/Preferences/com.apple.dock.plist"

/usr/libexec/PlistBuddy -c "Delete ':AppleInterfaceStyle'" -c "Add ':AppleInterfaceStyle' string 'Dark'" "$HOME/Library/Preferences/.GlobalPreferences.plist"

# Create a solid black image
convert -size 1x1 xc:black "$HOME/.black.png"

# Set the wallpaper to the black image
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$HOME/.black.png\""

/usr/libexec/PlistBuddy -c "Delete ':AppleTemperatureUnit'" -c "Add ':AppleTemperatureUnit' string 'Celsius'" "$HOME/Library/Preferences/.GlobalPreferences.plist"

# Change the measurement system to metric
/usr/libexec/PlistBuddy -c "Delete ':AppleMeasurementUnits'" -c "Add ':AppleMeasurementUnits' string 'Centimeters'" "$HOME/Library/Preferences/.GlobalPreferences.plist"
/usr/libexec/PlistBuddy -c "Delete ':AppleMetricUnits'" -c "Add ':AppleMetricUnits' bool 'true'" "$HOME/Library/Preferences/.GlobalPreferences.plist"
