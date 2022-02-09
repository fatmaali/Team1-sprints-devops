#!/bin/bash

X=$(ls -p /home/fatma|grep -v /)
mkdir /home/fatma/backup/
for i in ${X}
do
cp '/home/fatma/'$i '/home/fatma/backup'

done