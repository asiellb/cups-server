#!/bin/bash
TAG="$1"
docker tag $TAG asiellb/$TAG
docker push asiellb/$TAG
