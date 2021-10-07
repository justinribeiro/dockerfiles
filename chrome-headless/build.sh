#!/bin/bash

if [ $# != 1 ]; then
  echo "\$1 must be the tag, like justinribeiro/chrome-headless:20211007-chromium" && exit 1
fi
tag=$1

# Build only the current architecture
docker buildx build -o type=docker -t ${tag} .