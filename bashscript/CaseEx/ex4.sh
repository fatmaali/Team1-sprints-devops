#!/bin/bash

if [ $# -eq 3 -a -f $3 ]
then

    if [ "$1" == "-i" ]
    then
        sed -n '/'$2'/p' "$3"
    fi

    if [ "$1" == "-c" ]
    then
        grep -o "$2" "$3" | wc -l
    fi

    if [ "$1" == "-d" ]
    then
        sed '/'$2'/d' "$3"
    fi


else
    echo "you have to enter 3 arguments"
fi
