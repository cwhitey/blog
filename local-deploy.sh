#!/bin/bash
#Assumes ghost is running on localhost:2368
#Assumes Buster is installed with PIP, we're in the /blog/ repo
#and there is a ../cwhitey.github.io/ repo checked out

rm -rf ../static
buster setup --gh-repo="http://cwhitey.github.io";
cd ../;
buster generate --domain="localhost:2368";
cp -R static/* cwhitey.github.io/;
cd cwhitey.github.io/;
git add --all;
git commit -m "Updated GitHub Pages";
git push --force;
