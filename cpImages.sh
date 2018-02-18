#!/bin/bash


clear

#today=$(date +%Y_%m_%d)
today='2018_02_12'
echo $today
# exit

i=1

for f in photos/*.jpg
do
    day=`echo $f | cut -d '/' -f 2 | cut -d '-' -f 1`
#    echo $day
    if [ "$day" == "$today" ]
    then
        cp $f todayPics/img_$i.jpg
        i=`expr $i + 1`
    fi
done

clear
