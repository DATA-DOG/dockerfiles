# Webtools container

+ npm
+ bower
+ gulp
+ grunt

## Environment

+ WWW - dir where src is (/var/www)
+ NPM_TASK - npm task to run (start)
+ GULP_TASK - gulp task to run (default)

## Usage

By default this container will:

+ Search for `package.json` in WWW dir and run `npm install` if it will find it
+ Search for `package.json` in WWW dir and run `npm $NPM_TASK` if it will find it
+ Search for `bower.json` in WWW dir and run bower install if it will find it
+ Search for `gulpfile.js` in WWW dir and run `gulp $GULP_TASK`

## Manual usage

To run tools separately:

	docker run datadoglt/webtools -v /var/www:/var/www npm install
	docker run datadoglt/webtools -v /var/www:/var/www bower install
	docker run datadoglt/webtools -v /var/www:/var/www gulp --production