#!/bin/bash

#Ping sweep Function

function pingsweep() {

    target=$1
    host_reachable="/tmp/reachable"

    if [ ! -f "$host_reachable" ]; then
        touch $host_reachable || echo "Failed to create file $host_reachable"
    fi

    ping -c1 $target >/dev/null 2>&1 && echo $target is reachable && echo $target is reachable >> $host_reachable || echo $target is down

}

echo "======================"
echo "Starting Ping Sweep..."
echo "======================"

#Set Network to scan
network=$(echo 192.168.{0..1}.128)

#Ping Sweep call funtion loop

for host in $network; do
    pingsweep $host
done

echo "======================"
echo "Ping Sweep completed."
echo "======================"
echo "======================"
echo "List of host reachable"
echo "======================"

host_reachable=$(cat /tmp/reachable | grep reachable | awk '{print $1}')

echo $host_reachable | tr ' ' '\n' | sort

echo "========================"
echo "Starting Network Scan..."
echo "========================"

#Nmap Scan loop

for scan in $host_reachable; do
    nmap $scan
done

rm -f /tmp/reachable

echo "========================="
echo "Network Scan completed..."
echo "========================="
