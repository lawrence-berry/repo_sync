#! /bin/bash

set -e
source /Users/$USER/Projects/util/bash_helpers/bin/helpers.sh

export REPOS=(
  /Users/$USER/Projects/util/vim_config
  /Users/$USER/Projects/util/bash_helpers
  /Users/$USER/Projects/util/terminal_aliases
  /Users/$USER/Projects/util/geo_me-makefile
  /Users/$USER/Projects/geome/deployment
  /Users/$USER/Scripts
)

function isOnMaster() {
  ON_MASTER_BRANCH=`git status | grep 'On branch master' | wc -l`
  echo $ON_MASTER_BRANCH
}

function isWorkingDirClean() {
  NO_UNCOMMITTED_FILES=`git status | grep ' working tree clean' | wc -l`
  echo $NO_UNCOMMITTED_FILES
}

for repo in ${REPOS[@]}
do
  cd $repo
  if [[ $(isOnMaster) -eq "1" && $(isWorkingDirClean) -eq "1" ]]; then
    echo "Updating "$repo" from master ..."
    /usr/bin/git fetch
    /usr/bin/git pull --rebase
  fi
done
