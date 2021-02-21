#!/bin/bash

HOST=""
COUNT=4
mail=""

pingtest() {
for i in "$@"; do
   ping -c "$COUNT" "$i" && return 0
done
   return 1
}

if pingtest $HOST
then
  echo "Server up" | mail -s "Server Up" $mail
fi

