#!/usr/bin/env bash

set -e # halt script on error

if [ "$TRAVIS_BRANCH" != "dev" ]; then 
	echo "Branch is not dev"
    exit 0;
fi

#ls -la --group-directories-first

# install bootstrap
#gem install bootstrap -v 4.1.3

export GIT_COMMITTER_EMAIL="yan.gerasimuk@yandex.ru"
export GIT_COMMITTER_NAME="Ян Герасимук via Travis"

#git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* || exit
#git fetch --all || exit

#git checkout dev
#git branch | grep \* | cut -d ' ' -f2
#git pull origin

echo 'git remote set-branches --add origin master'
git remote set-branches --add origin master

echo 'git fetch'
git fetch

echo 'git reset --hard'
git reset --hard

echo 'git checkout master'
git checkout master

echo 'stash'
git stash

echo 'git merge --ff-only "$TRAVIS_COMMIT"'
git merge --ff-only "$TRAVIS_COMMIT"

#git stash
#git checkout master || exit
#git merge "$TRAVIS_COMMIT" || exit
echo 'git push "https://$GITHUB_TOKEN@github.com/yangerasimuk/yangerasimuk.ru.git"'
git push "https://$GITHUB_TOKEN@github.com/yangerasimuk/yangerasimuk.ru.git"
echo 'git stash pop'
git stash pop
#git pull origin

#git checkout dev

#git merge -s ours master
#git checkout master
#git stash
#git merge --no-ff "$TRAVIS_COMMIT" || exit
#git merge dev
#git push "https://$GITHUB_TOKEN@github.com/yangerasimuk/yangerasimuk.ru.git"
#git stash pop

#git stash pop