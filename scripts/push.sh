#!/bin/bash

# Arguments:
GH_TOKEN=$1
BRANCH=$2

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

upload_files() {
  GH_TOKEN=$1
  BRANCH=$2
  git remote add origin-changes https://${GH_TOKEN}@github.com/bearalliance/ops-starter.git
  git push --quiet --set-upstream origin-changes master
  exit $?
}

if [ "$TRAVIS_BRANCH" == "master" ]; then
    echo "Pushing changes to master"
    setup_git
    RESULT=`upload_files $GH_TOKEN $BRANCH`
    exit $RESULT
else
    echo "Skipping push, branch is not master"
fi

exit 0