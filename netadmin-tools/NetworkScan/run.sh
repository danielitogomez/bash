#!/bin/bash

name="network-scan"

docker build -t $name . && docker run -it $name
