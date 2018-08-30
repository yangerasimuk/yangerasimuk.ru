#!/usr/bin/env bash

set -e # halt script on error

git remote update
git fetch

git checkout --track origin/dev
git checkout dev

git checkout --track origin/master
git checkout master

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
