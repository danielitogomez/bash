#!/bin/bash
echo "###############################################"
echo "#............... Use Resources ...............#"
echo "###############################################"
echo "/ Server  /  CPU(%) / Memory(%) / RootDisk(%) /"
echo "-----------------------------------------------"
	for server in $HOSTNAME; do
	     	scpu=$(cat /proc/stat | awk '/cpu/{printf("%.2f%\n"), ($2+$4)*100/($2+$4+$5)}' |  awk '{print $0}' | head -1)
	     	smem=$(free | awk '/Mem/{printf("%.2f%"), $3/$2*100}')
	     	sdisk=$(df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | awk 'FNR == 2 {print $1}')
	echo "$server      $scpu     $smem     $sdisk"
done
