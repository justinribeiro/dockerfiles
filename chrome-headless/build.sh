#!/bin/bash

IMAGE_NAME=$(yq r data.yaml data.image-name)
SEMVER=$(yq r data.yaml data.semver)

BRANCH=$(git rev-parse --abbrev-ref HEAD)
REPO=$(basename "$(git rev-parse --show-toplevel)")

docker build -t ${IMAGE_NAME}:v${SEMVER} \
            --build-arg IMAGE_SRC="docker.io/${IMAGE_NAME}:v${SEMVER}" \
            --build-arg BUILT_BY="$(whoami)" \
            --build-arg BUILT_AT="$(date -u '+%F %T.%3N')" \
            --build-arg SEMVER=${SEMVER} \
            --build-arg GIT_REPO="${REPO}" \
            --build-arg GIT_BRANCH="${BRANCH}" \
            --build-arg GIT_COMMIT="$(git rev-parse HEAD)" \
            --build-arg GIT_STATUS="$(git status -s)" Dockerfile.url2pdf2text
