#!/bin/bash -

# function isInstalled() {
#   IS_INSTALLED=`crontab -l | grep 'repo_sync' | wc -l`
#   echo $IS_INSTALLED
# }


# if [[ $(isInstalled) -eq "0" ]]; then
#   echo "Installing repo_sync ..."
#   crontab -l > mycron
#   echo "#repo_sync: Scheduled repo updater" >> mycron
#   echo "* * * * * `echo $PWD`/sync.sh" >> mycron
#   sudo crontab -u route mycron
#   rm mycron
# fi

if [[ $(isInstalled) -eq "0" ]]; then
  "installing Repo Sync ..."
  mv ./repo_sync.plist ~/Library/LaunchAgents/repo_sync.plist
  launchctl load ~/Library/LaunchAgents/repo_sync.plist
  launchctl start repo_sync
fi
