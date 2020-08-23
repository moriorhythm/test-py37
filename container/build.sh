#!/bin/bash

IMAGE_NAME="test/py37_amzn2"
TAG="1.0"

docker build -t ${IMAGE_NAME}:${TAG} .