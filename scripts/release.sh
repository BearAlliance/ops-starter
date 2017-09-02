#!/bin/bash

# Arguments:
TRAVIS_BRANCH=$1

echo "release script, travis branch: ${TRAVIS_BRANCH}"

if [ "$TRAVIS_BRANCH" == "master" ];
    then
        npm run release
fi
