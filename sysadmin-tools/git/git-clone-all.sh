#!/bin/bash

## --------------------------------------------------------------------------
## - [GitAutomation] : Script to clone all your repositories if they don't already exist locally.
## - [DevOps] : Dani Gómez (@danielitogomez)
## --------------------------------------------------------------------------

# Variables
USER=""
TOKEN=""
# API endpoint
ORG_URL="https://api.github.com/users/$USER/repos?per_page=100"

# Function to clone repositories if they don't already exist
clone_if_not_exist() {
    ALL_REPOS=$(curl -s -H "Accept: application/vnd.github+json" -H "Authorization: token $TOKEN" "$ORG_URL" | grep \"clone_url\" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1)

    for ORG_REPO in ${ALL_REPOS}; do
        REPO_NAME=$(basename ${ORG_REPO} .git)
        if [ -d "$REPO_NAME" ]; then
            echo "Directory $REPO_NAME already exists. Skipping..."
        else
            echo "Cloning $ORG_REPO..."
            git clone ${ORG_REPO}
        fi
    done
}

# Call function
clone_if_not_exist
