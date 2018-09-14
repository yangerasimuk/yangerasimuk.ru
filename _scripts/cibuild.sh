#!/usr/bin/env bash

set -e # halt script on error

if [ "$TRAVIS_BRANCH" != "dev" ]; then 
	echo "Branch is not dev"
    exit 0;
fi

echo "git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* || exit"
git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* || exit

echo "> git fetch --all || exit"
git fetch --all || exit

echo "> git checkout dev"
git checkout dev

echo "> git pull origin"
git pull origin

echo "> bundle exec jekyll build"
bundle exec jekyll build
#bundle exec htmlproofer ./docs

