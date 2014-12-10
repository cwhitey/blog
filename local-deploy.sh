#!/bin/bash
#Assumes ghost is running on localhost:2368
#Assumes Buster is installed with PIP, we're in the /blog/ repo
#and there is a ../cwhitey.github.io/ repo checked out

git add content/*;
git commit -m "$1";
cd ../;
rm -rf static/;
buster setup --gh-repo="http://cwhitey.github.io";
echo "GENERATING STATIC PAGE...";
buster generate --domain="localhost:2368";
cp -R static/* cwhitey.github.io/;
cd cwhitey.github.io/;
git add --all;
git commit -m "$1";
echo "";
echo "FORCE PUSHING TO GITHUB PAGES...";
git push --force;
