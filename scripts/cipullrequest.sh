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
git push @github.com/">https://${GITHUB_TOKEN}@github.com/yangerasimuk/yangerasimuk.ru.git

#if [ "$TRAVIS_PULL_REQUEST" != "false" ] ; then

#curl -H "Authorization: token ${GITHUB_TOKEN}" -X POST \
#-d "{\"body\": \"Hello world\"}" \
#"https://api.github.com/repos/${TRAVIS_REPO_SLUG}/issues/${TRAVIS_PULL_REQUEST}/comments"

#fi