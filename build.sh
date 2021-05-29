#!/bin/bash
# Usage: bash build.sh [dirname]
# Example: bash build.sh cups
TAG="$1"
BASEDIR=$(dirname "$0")
DIR=$BASEDIR/$TAG
docker build --pull --tag $TAG $DIR
