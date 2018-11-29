#!/bin/bash -

function isInstalled() {
  IS_INSTALLED=`crontab -l | grep 'repo_sync' | wc -l`
  echo $IS_INSTALLED
}


if [[ $(isInstalled) -eq "0" ]]; then
  echo "Installing repo_sync ..."
  crontab -l > mycron
  echo "#repo_sync: Scheduled repo updater" >> mycron
  echo "* * * * * `echo $PWD`/sync.sh" >> mycron
  crontab mycron
  rm mycron
fi
