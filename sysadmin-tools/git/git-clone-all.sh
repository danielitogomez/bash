#!/bin/bash

## --------------------------------------------------------------------------
## - [GitAutomation] : Script to clone all from your respositories.
## - [DevOps] : Dani Gómez (@danielitogomez)
## --------------------------------------------------------------------------

# variables
USER=""
TOKEN=""
# api endpoint
ORG_URL="https://api.github.com/users/$USER/repos?per_page=100"

# function to clone all
clone_all() {

    ALL_REPOS=$(curl -s -H "Accept: application/vnd.github+json" -H "Authorization: token $TOKEN" "$ORG_URL" | grep \"clone_url\" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1);

    for ORG_REPO in ${ALL_REPOS}; do
        git clone ${ORG_REPO};
    done
}

# call function
clone_all