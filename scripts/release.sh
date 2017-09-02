#!/bin/bash

# Arguments:
TRAVIS_BRANCH=$1

if [ "$TRAVIS_BRANCH" == "master" ]; then
    echo "Running release"
    npm run release
else
    echo "Skipping release, branch is not master"
fi
