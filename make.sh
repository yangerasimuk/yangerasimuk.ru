#!/usr/bin/env bash

set -e # halt script on error

git branch -a | grep \* | cut -d ' ' -f2

echo "> bundle exec jekyll build"
bundle exec jekyll build

echo "> bundle exec htmlproofer ./docs"
#bundle exec htmlproofer ./docs

echo "> git add ."
git add .

date=$(date +%Y-%m-%d)
echo "> git commit -m 'Rebuild site at "+date+"'"
git commit -m "Build site at "+date

echo "> git push origin"
git push --force origin

echo "> git checkout master"
git checkout master

echo "> git merge -s ours dev"
git merge -s ours dev

echo "> git merge dev"
git merge dev

echo "> git push origin"
git push origin

echo "> git checkout dev"
git checkout dev