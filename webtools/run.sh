#!/usr/bin/env bash


if [ -z "$WWW" ]; then
    WWW="/var/www"
fi

if [ ! -d "$WWW" ]; then
    echo "Failed to find dir ($WWW)!"
    exit 1
fi

WWW=`realpath "$WWW"`
cd $WWW
echo "Running in $WWW"

if [ -f "$WWW/package.json" ]; then
    echo "Running in npm install"
    npm install
fi

if [ -f "$WWW/bower.json" ]; then
    echo "Running in bower"
    bower install
fi

if [ -f "$WWW/gulpfile.js" ] && [ ! -z "$GULP_TASK" ]; then
    echo "Running in gulp $GULP_TASK"
    gulp $GULP_TASK
fi

if [ -f "$WWW/package.json" ] && [ ! -z "$NPM_TASK" ]; then
    echo "Running in npm $NPM_TASK"
    npm $NPM_TASK
fi
