#!/usr/bin/env bash

set -e # halt script on error

git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
git remote update
git fetch

git checkout dev
git pull

git checkout master
git pull

git merge dev


#git config --replace-all remote.origin.fetch +refs/heads/*:refs/remotes/origin/*


#for branch in $(git branch -r|grep -v HEAD) ; do
#	echo branch
#    git checkout ${branch#origin/}
#    echo ${branch#origin/}
#done

#git checkout master
#git checkout dev
#git merge dev
