#!/bin/bash
TAG="$1"
BASEDIR=$(dirname "$0")
DIR=$BASEDIR/$TAG
docker build --pull --tag $TAG $DIR

