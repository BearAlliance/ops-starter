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
  git remote add origin https://${GH_TOKEN}@github.com/bearalliance/ops-starter.git
  git push --quiet --set-upstream origin $TRAVIS_BRANCH
}

if [ "$TRAVIS_BRANCH" == "master" ];
    then
        setup_git
        upload_files $GH_TOKEN $TRAVIS_BRANCH
fi
