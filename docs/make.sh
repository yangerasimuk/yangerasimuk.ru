#!/usr/bin/env bash

set -e # halt script on error

echo "> bundle exec jekyll build"
bundle exec jekyll build

echo ""
echo "> bundle exec htmlproofer ./docs"
#bundle exec htmlproofer ./docs

echo "> git add ."
git add .

DATE=`date +%Y-%m-%d`
echo "> git commit -m 'Rebuild site at "+DATE+"'"
git commit -m "Build site at "+DATE

echo "> git push origin"
git push --force origin

echo "git checkout master"
git checkout master

echo "> git merge dev"
git merge dev

echo "> git push origin"
git push origin

echo "> git checkout dev"
git checkout dev