#!/bin/bash

for i in $(ls -l | grep '^d' | awk '{print $9}'); do
    cd $i && git checkout master && git pull && cd ../;
done