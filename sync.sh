#! /bin/bash

set -e
source `dirname $0`/bash_helpers/bin/helpers.sh

export REPOS=(
  /Users/$USER/Projects/util/vim_config
  /Users/$USER/Projects/util/bash_helpers
)


for repo in ${REPOS[@]}
do
  cd $repo
  IS_ON_MASTER=`isOnMaster`
  echo $?
  IS_CLEAN=`isWorkingDirClean`
  echo $?  
  exit 0
  if [[ isOnMaster && isWorkingDirClean ]]; then
    echo "Updating "$repo" from master ..."
    git pull origin master
  fi
done



# git submodule add git@bitbucket.org:displayflex/bash_helpers.git
