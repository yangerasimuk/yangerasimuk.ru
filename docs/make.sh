#!/usr/bin/env bash

set -e # halt script on error

echo "> bundle exec jekyll build"
bundle exec jekyll build

echo ""
echo "> bundle exec htmlproofer ./docs"
#bundle exec htmlproofer ./docs

echo "> git add ."
git add .

echo "> git commit -m 'Rebuild site'"
git commit -m "Rebuild site"

echo "> git push origin"
git push origin

echo "git checkout master"
git checkout master

echo "> git merge dev"
git merge dev

echo "> git push origin"
git push origin

