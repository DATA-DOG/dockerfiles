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

if [ -f "$WWW/bower.json" ]; then
    echo "Running in bower"
    bower --allow-root install
fi

if [ -f "$WWW/package.json" ]; then
    echo "Running in npm install"
    npm install
fi

if [ ! -z "$GULP_TASK" ]; then
    echo "Running in gulp '$GULP_TASK"
    gulp $GULP_TASK
fi

if [ ! -z "$GRUNT_TASK" ]; then
    echo "Running in grunt '$GRUNT_TASK"
    grunt $GRUNT_TASK
fi

if [ ! -z "$NPM_TASK" ]; then
    echo "Running npm '$NPM_TASK"
    npm $NPM_TASK
fi

if [ ! -z "$BUILD_TASK" ]; then
    echo "Running build task '$BUILD_TASK'"
    exec $BUILD_TASK
fi
