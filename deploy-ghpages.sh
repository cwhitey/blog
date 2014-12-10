#!/bin/bash
mkdir out;
cd out;
git init;
git config user.name "Callum White";
git config user.email "callumw1991@gmail.com";
python buster.py setup --gh-repo="http://cwhitey.github.io"
npm start > /dev/null 2>&1 &; #don't worry about killing this?
python buster.py generate --domain="localhost:2368"
cd static/;

git add --all;
git commit -m "Deployed GitHub Pages by Travis (build $TRAVIS_BUILD_NUMBER)";
git push --force
