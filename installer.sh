#!/bin/bash -

# git submodule add git@bitbucket.org:displayflex/bash_helpers.git

function isInstalled() {
  IS_INSTALLED=`crontab -l | grep 'repo_sync' | wc -l`
  echo $IS_INSTALLED
}


if [[ $(isInstalled) -eq "0" ]]; then
  echo "Installing repo_sync ..."
  ##write out current crontab
  crontab -l > mycron
  #echo new cron into cron file
  echo "#repo_sync: Scheduled repo updater" >> mycron
  echo "* * * * * `echo $PWD`/sync.sh" >> mycron
  #install new cron file
  crontab mycron
  rm mycron
fi
