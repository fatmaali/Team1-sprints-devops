#!/bin/bash

if [ $# -eq 2 ]
then

    if [ $1 -gt $2 ]
    then
    echo $1 " is greatest"
    elif  [ $2 -gt $1 ]
    then
     echo $2 " is greatest"
    else
     echo "two number are equal"
    fi
else
    echo "please enter 2 arguments"
fi
