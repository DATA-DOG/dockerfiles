#!/bin/bash

BASE=`pwd`
for IMAGE in base php70 php56 php56-loader php55 php55-loader php54 php54-loader nginx nginx-sf nginx-laravel apache supervised webtools; do
  echo "Building [$IMAGE]"

  docker build --pull -t "datadoglt/$IMAGE" "$BASE/$IMAGE"
  docker push "datadoglt/$IMAGE"
done
