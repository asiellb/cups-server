#!/bin/bash
# Usage: bash push.sh [dirname]
# Example: bash push.sh cups
TAG="$1"
docker tag $TAG asiellb/$TAG
docker push asiellb/$TAG
