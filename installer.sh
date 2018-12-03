#!/bin/bash -

function isInstalled() {
  IS_INSTALLED=`launchctl list | grep 'repo_sync' | wc -l`
  echo $IS_INSTALLED
}

if [[ $(isInstalled) -eq "0" ]]; then
  echo "installing Repo Sync ..."
  sudo cp repo_sync.plist /Library/LaunchAgents
  launchctl load /Library/LaunchAgents/repo_sync.plist
  launchctl start repo_sync.plist
fi
