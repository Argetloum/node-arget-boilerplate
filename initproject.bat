REM @echo off
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
copy ./templates/app/app.js ./app.js
copy ./templates/app/server.js ./app/server/server.js
copy ./templates/app/init.js ./config/init.js
copy ./templates/app/router.js ./config/router.js
copy ./templates/app/package.json ./package.json
copy ./templates/app/.gitignore ./.gitignore
copy ./templates/app/config.json ./config.json
copy ./templates/app/Makefile ./Makefile
copy ./templates/test/stub.js ./test/stub.js
curl https://raw.github.com/h5bp/html5-boilerplate/master/css/main.css > ./public/css/style.css
copy ./templates/views/500.jade ./app/views/500.jade
copy ./templates/views/404.jade ./app/views/404.jade
copy ./templates/views/index.jade ./app/views/index.jade
copy ./templates/views/layout.jade ./app/views/layout.jade
copy ./templates/less/elements.less ./public/less/elements.less
copy ./templates/less/lesshat.less ./public/less/lesshat.less
copy ./templates/less/style.less ./public/less/style.less
copy ./templates/js/script.js ./public/js/script.js
REM TODO copy over the models

echo "Setting up dependencies from NPM..."
sudo npm install

echo "Removing stuff you don't want..."
del /S /F .git
del /S /F templates
del README.md
del initproject.sh

echo "Initializing new git project..."
git init
git add .
git commit -m"Initial Commit"
