#!/bin/bash

echo "======================"
echo "Starting Ping Sweep..."
echo "======================"

function pingsweep {

    target=$1
    touch /tmp/reachable

    ping -c1 $target >/dev/null 2>&1 && echo $target is reachable > /tmp/reachable || echo $target is down

}

network=$(echo 192.168.{0..3}.128)

for i in $network; do
    pingsweep $i &
done

wait

echo "======================"
echo "Ping Sweep completed."
echo "======================"

echo "......................"

echo "======================"
echo "List of host reachable"
echo "======================"

host_reachable=$(cat /tmp/reachable | grep reachable | awk '{print $1}')

echo $host_reachable

echo "========================"
echo "Starting Network Scan..."
echo "========================"

for z in $host_reachable; do
    nmap $z
done

echo "========================="
echo "Network Scan completed..."
echo "========================="