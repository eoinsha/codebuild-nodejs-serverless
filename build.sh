#!/bin/bash

RUNTIME=nodejs
VERSION=8.11.0

if [ ! -d aws-codebuild-docker-images ]; then
  git clone https://github.com/aws/aws-codebuild-docker-images.git
fi

pushd aws-codebuild-docker-images/ubuntu/${RUNTIME}/${VERSION}
docker build -t aws/codebuild/${RUNTIME}:${VERSION} .
popd

docker build -t eoinsha/codebuild-${RUNTIME}-serverless:${VERSION} .

