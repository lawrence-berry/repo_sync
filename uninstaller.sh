#!/bin/bash -

launchctl stop repo_sync.plist
launchctl unload repo_sync.plist
sudo rm /Library/LaunchAgents/repo_sync.plist

