#!/usr/bin/env bash

set -e # halt script on error

echo "$TRAVIS_BRANCH"

if [ "$TRAVIS_BRANCH" != "dev" ]; then 
	echo "Branch is not dev"
    exit 0;
fi
export GIT_COMMITTER_EMAIL="yan.gerasimuk@yandex.ru"
export GIT_COMMITTER_NAME="Ян Герасимук via Travis"

git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* || exit
git fetch --all || exit

git stash

git checkout master || exit
git merge --no-ff "$TRAVIS_COMMIT" || exit
git push ">https://$GITHUB_TOKEN@github.com/yangerasimuk/yangerasimuk.ru.git"

git stash pop