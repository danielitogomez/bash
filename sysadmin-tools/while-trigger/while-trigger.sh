#!/bin/bash

# Object white_rabbit

OBJ_WHITE_RABBIT="white_rabbit" && mkdir $OBJ_WHITE_RABBIT

# Trigger directory

MY_TRIGGER="my_trigger" && mkdir $MY_TRIGGER

# Function testing my trigger

function test_my_trigger () {
if [ ! -d "$HOME/$MY_TRIGGER" ]; then
    echo "Doing my stuff and break loop"
    rm -rf $OBJ_WHITE_RABBIT
    break
else
    echo "Still existing $MY_TRIGGER"
fi
}

# Function loop delete trigger if eq set time

function loop_delete_my_trigger () {
while [ "$(date '+%Y/%m/%d %H:%M:%S' | awk '{print $2}')" == 00:49:15 ]; do 
  echo "Deleting $MY_TRIGGER"
  rm -rf $MY_TRIGGER
  break
done
}

# Function main loop

function loop_my_trigger () {
while true; 
    do 
    loop_delete_my_trigger;
    test_my_trigger;
done
}

# Call loop function my trigger

loop_my_trigger
