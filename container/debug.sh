#!/bin/bash

IMAGE_NAME="test/py37_amzn2"
TAG="1.0"
CONTAINER_NAME="test_py37_amzn2_debug"

docker run \
    --rm \
    --name ${CONTAINER_NAME} \
    -v $(pwd)/src/startup.sh:/task/startup.sh \
    -v $(pwd)/src/config:/task/config \
    -v $(pwd)/src/app:/task/app \
    -v $(pwd)/src/libs:/task/libs \
    --entrypoint="/bin/bash" \
    -it ${IMAGE_NAME}:${TAG}