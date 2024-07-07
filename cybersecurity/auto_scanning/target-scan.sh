#!/bin/bash

# Create or clear the reachable hosts file
initialize_reachable_file() {
    local host_reachable="/tmp/reachable"
    : > "$host_reachable" || { echo "Failed to create or clear file $host_reachable"; exit 1; }
}

# Ping sweep function
pingsweep() {
    local target=$1
    local host_reachable="/tmp/reachable"

    if ping -c1 "$target" >/dev/null 2>&1; then
        echo "$target is reachable"
        echo "$target is reachable" >> "$host_reachable"
    else
        echo "$target is down"
    fi
}

# Display the list of reachable hosts
display_reachable_hosts() {
    local host_reachable="/tmp/reachable"

    if [ -f "$host_reachable" ]; then
        local reachable_hosts=$(awk '{print $1}' "$host_reachable")
        echo "$reachable_hosts" | tr ' ' '\n' | sort
    else
        echo "No hosts are reachable."
        exit 0
    fi
}

# target scan function
target_scan() {
    local host_reachable="/tmp/reachable"
    local reachable_hosts=$(awk '{print $1}' "$host_reachable")

    for scan in $reachable_hosts; do
        nmap -sV --script=banner "$scan"
    done
}

# Read targets from file
read_targets() {
    local target_file=$1
    if [[ ! -f $target_file ]]; then
        echo "Target file $target_file does not exist."
        exit 1
    fi
    mapfile -t list < "$target_file"
}

# Main function to orchestrate the script
main() {
    local target_file="targets.txt"

    echo "======================"
    echo "Reading targets from $target_file..."
    echo "======================"

    read_targets "$target_file"

    echo "======================"
    echo "Starting Ping Sweep..."
    echo "======================"

    initialize_reachable_file

    for host in "${list[@]}"; do
        pingsweep "$host"
    done

    echo "======================"
    echo "Ping Sweep completed."
    echo "======================"
    echo "======================"
    echo "List of reachable hosts"
    echo "======================"

    display_reachable_hosts

    echo "========================"
    echo "Starting target Scan..."
    echo "========================"

    target_scan

    echo "========================="
    echo "target Scan completed..."
    echo "========================="

    # Clean up
    rm -f /tmp/reachable
}

# Run the main function
main
