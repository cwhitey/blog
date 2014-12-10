#!/bin/bash
python buster.py setup --gh-repo="http://cwhitey.github.io";
npm start > /dev/null 2>&1 &;
python buster.py generate --domain="localhost:2368";
cd static;
git init;
git config user.name $GIT_NAME;
git config user.email $GIT_EMAIL;
git add --all;
git commit -m "Deployed GitHub Pages by Travis (build $TRAVIS_BUILD_NUMBER)";
git push --force "http://cwhitey.github.io";
