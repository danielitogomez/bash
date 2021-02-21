#!/bin/bash

IMAGE_NAME="cidr2netmask"

docker build -t $IMAGE_NAME . && docker run $IMAGE_NAME $1