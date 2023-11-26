#!/bin/bash

# Salesforce DX Bash Script Tool

# Function to display the main menu
show_menu() {
    echo "Salesforce DX Operations"
    echo "1. Generate Manifest"
    echo "2. Retrieve"
    echo "3. Deploy"
    echo "4. Exit"
    echo -n "Enter your choice: "
}

# Function for create manifest
manifest() {
    echo "Creating Manifest"
    echo -n "Enter package name: "
    read package_name
    #sfdx force:source:retrieve -x $package_name
}

# Function for retrieving metadata
retrieve() {
    echo "Retrieving Metadata"
    echo -n "Enter package name: "
    read package_name
    #sfdx force:source:retrieve -x $package_name
}

# Function for deploying metadata
deploy() {
    echo "Deploying Metadata"
    echo -n "Enter source directory: "
    read source_dir
    #sfdx force:source:deploy -p $source_dir
}

# Main loop
while true; do
    show_menu
    read choice
    case $choice in
        1) manifest ;;
        2) retrieve ;;
        3) deploy ;;
        4) exit 0 ;;
        *) echo "Invalid choice, please try again." ;;
    esac
done
