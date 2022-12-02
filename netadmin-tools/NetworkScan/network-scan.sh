#!/bin/bash

#Variables

list="
www.lala.com
www.danielitogomez.github.io
"

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

#Ping Sweep call funtion loop

for host in $list; do
    pingsweep $host
done

echo "======================"
echo "Ping Sweep completed."
echo "======================"
echo "======================"
echo "List of reachable host"
echo "======================"

host_reachable=$(cat /tmp/reachable | awk '{print $1}')

echo $host_reachable | tr ' ' '\n' | sort

echo "========================"
echo "Starting Network Scan..."
echo "========================"

#Nmap Scan loop

for scan in $host_reachable; do

####nmap --script vuln --script banner $scan

    nmap -sV --script=banner $scan

done

rm -f /tmp/reachable

echo "========================="
echo "Network Scan completed..."
echo "========================="
