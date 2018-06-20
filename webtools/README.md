# Webtools container

+ yarn
+ npm
+ bower
+ gulp
+ grunt

## Environment

+ WWW - dir where src is (/var/www)
+ GULP_TASK - gulp task to run (default)
+ GRUNT_TASK - grunt task to run
+ NPM_TASK - npm task to run (start)
+ BUILD_TASK - shell command to execute

## Usage

By default this container will:

+ Search for `yarn.lock` file in WWW dir and run `yarn install` if it finds it
+ Search for `package.json` in WWW dir and run `npm install` if it will find it (if `yarn.lock` was not found before)
+ Search for `package.json` in WWW dir and run `npm $NPM_TASK` if it will find it
+ Search for `bower.json` in WWW dir and run bower install if it will find it
+ Search for `gulpfile.js` in WWW dir and run `gulp $GULP_TASK`

## Manual usage

To run tools separately:

    docker run datadoglt/webtools -v /var/www:/var/www yarn install
	docker run datadoglt/webtools -v /var/www:/var/www npm install
	docker run datadoglt/webtools -v /var/www:/var/www bower install
	docker run datadoglt/webtools -v /var/www:/var/www gulp --production
