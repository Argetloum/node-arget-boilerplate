#!/bin/sh
echo "Creating necessary folders..."
mkdir ./public
mkdir ./public/images
mkdir ./public/less
mkdir ./public/css
mkdir ./public/js
mkdir ./app
mkdir ./app/views
mkdir ./app/models
mkdir ./app/server
mkdir ./config
mkdir ./test

echo "Copying code, markup and CSS boilerplate..."
cp ./templates/app/app.js ./app.js
cp ./templates/app/server.js ./app/server/server.js
cp ./templates/app/init.js ./config/init.js
cp ./templates/app/router.js ./config/router.js
cp ./templates/app/package.json ./package.json
cp ./templates/app/.gitignore ./.gitignore
cp ./templates/app/config.json ./config.json
cp ./templates/app/Makefile ./Makefile
cp ./templates/test/stub.js ./test/stub.js
curl https://raw.github.com/h5bp/html5-boilerplate/master/css/main.css > ./public/css/style.css
cp ./templates/views/500.jade ./app/views/500.jade
cp ./templates/views/404.jade ./app/views/404.jade
cp ./templates/views/index.jade ./app/views/index.jade
cp ./templates/views/layout.jade ./app/views/layout.jade
cp ./templates/less/elements.less ./public/less/elements.less
cp ./templates/less/lesshat.less ./public/less/lesshat.less
cp ./templates/less/style.less ./public/less/style.less
cp ./templates/js/script.js ./public/js/script.js
# TODO copy over the models

echo "Setting up dependencies from NPM..."
npm install

echo "Removing stuff you don't want..."
rm -rf .git
rm -rf templates
rm README.md
rm initproject.sh
rm initproject.bat

echo "Initializing new git project..."
git init
git add .
git commit -m"Initial Commit"
