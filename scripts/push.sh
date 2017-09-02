#!/bin/bash

# Arguments:
GH_TOKEN=$1
TRAVIS_BRANCH=$2

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

upload_files() {
  GH_TOKEN=$1
  TRAVIS_BRANCH=$2
  git remote add origin-changes https://${GH_TOKEN}@github.com/bearalliance/ops-starter.git
  exit `git push --quiet --set-upstream origin-changes $TRAVIS_BRANCH`
}

if [ "$TRAVIS_BRANCH" == "master" ]; then
    echo "Pushing changes to master"
    setup_git
    RESULT=`upload_files $GH_TOKEN $TRAVIS_BRANCH`
    exit $RESULT
else
    echo "Skipping push, branch is not master"
fi

exit 0