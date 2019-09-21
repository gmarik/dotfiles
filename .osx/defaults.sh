#!/bin/bash
# vim: ft=sh

# disable auto-switching desktops
sudo defaults write com.apple.dock workspaces-auto-swoosh -bool NO

killall Dock
