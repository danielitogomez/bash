#!/bin/bash

echo "======================"
echo "Starting Ping Sweep..."
echo "======================"

function pingsweep() {

target=$1

host_reachable="/tmp/reachable"

if [ ! -f "$host_reachable" ]; then
    touch $host_reachable
fi
    
ping -c1 $target >/dev/null 2>&1 && echo $target is reachable && echo $target is reachable >> $host_reachable || echo $target is down

}

list="list.txt"

if [ ! -f "$list" ]; then
    touch $list
fi

for i in $(cat $list); do
    pingsweep $i
done

echo "======================"
echo "Ping Sweep completed."
echo "======================"

echo "......................"

echo "======================"
echo "List of host reachable"
echo "======================"

host_reachable=$(cat /tmp/reachable | awk '{print $1}')

echo $host_reachable | tr ' ' '\n' | sort

echo "========================"
echo "Starting Network Scan..."
echo "========================"

for z in $host_reachable; do
    nmap $z
done

rm -f /tmp/reachable

echo "========================="
echo "Network Scan completed..."
echo "========================="