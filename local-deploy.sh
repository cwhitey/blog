#!/bin/bash
#Assumes:
#  * Ghost is running on localhost:2368 (by running npm start)
#  * Buster is installed with PIP
#  * we're in the /blog/ repo
#  * there is a ../cwhitey.github.io/ repo checked out

if [ "$#" == "0" ]; then
    echo "Usage:"
    echo "  ./local-deploy.sh [commit-msg]"
    exit 1;
fi
git add content/*;
git commit -m "$1";
git push;
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
