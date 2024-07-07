#!/bin/bash

name="target-scan"

docker build -t $name . && docker run $name
