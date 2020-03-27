#!/bin/bash

svn_repo_path=/home/dani/svn/
DIR=$(ls "$svn_repo_path")
USER=""
PASS=""

for f in $DIR; do
     if [ -d "$svn_repo_path" ]
        then
                svn up $svn_repo_path$f --non-interactive --trust-server-cert --username $USER --password $PASS --ignore-externals
        fi
    a=$?
    if [ $a -ne 0 ]; then
                        log_error "svn up no termino con exito. Salida: $a"
       fi

done

