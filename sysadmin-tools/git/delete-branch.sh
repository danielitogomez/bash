#!/bin/bash

for branch in $(git branch -r --merged | grep -v HEAD | grep -v develop | grep -v master | grep -v feature/develop | sed /\*/d); do
    remote_branch=$(echo $branch | sed 's#origin/##')
    git push origin --delete $remote_branch
done

