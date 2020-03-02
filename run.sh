#!/bin/bash
TAG="$1"
cid="$(docker ps -q --filter "name=${TAG}")"
if [ -n "${cid}" ]; then
	echo "Stopping container..."
	docker stop "${TAG}" > /dev/null
fi
cid="$(docker ps -a -q --filter "name=${TAG}")"
if [ -n "${cid}" ]; then
	echo "Removing container..."
	docker rm "${TAG}" > /dev/null
fi

echo "Running container..."
docker run --name ${TAG} --detach --restart=always --privileged --volume /dev/bus/usb:/dev/bus/usb --publish 631:631 ${TAG}

