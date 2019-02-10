#!/usr/bin/env bash

set -e # halt script on error

branch=$(git branch -a | grep \* | cut -d ' ' -f2)
if [ $branch != "dev" ]
then
echo "Current git branch is not dev"
exit
fi

echo "> bundle exec jekyll build"
bundle exec jekyll build

echo "> bundle exec htmlproofer ./docs"
bundle exec htmlproofer ./docs

echo "> git add ."
git add .

echo "> Enter message to commit (no quotes, empty for default):"
read message

if [ -z "${message// }" ]
then
date_now=$(date +%Y-%m-%d)
message="Rebuild site at $date_now"
fi

echo "> git commit -m $message"
git commit -m "$message"

#echo "> git push origin"
#git push --force origin
echo "> git push"
git push

echo "> git merge -s ours master"
git merge -s ours master

echo "> git checkout master"
git checkout master

echo "> git merge dev"
git merge dev

echo "> git push origin"
git push origin

echo "> git checkout dev"
git checkout dev