#!/bin/bash
clear

today=$(date +%Y_%m_%d)
echo $today

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

fileName=$(date +%m_%d_%Y)
fileName="${fileName}.mp4"
echo $fileName

avconv -r 30 -i todayPics/img_%d.jpg -r 30 -vcodec libx264 -vf scale=640:360 $fileName

rm todayPics/*.jpg

size=`wc -c < $fileName`
echo $size

response=`twurl -H upload.twitter.com "/1.1/media/upload.json" -d "command=INIT&media_type=video/mp4&total_bytes=$size"`
medID=`echo $response | cut -d ':' -f 2 | cut -d ',' -f 1`
echo $medID

twurl -H upload.twitter.com "/1.1/media/upload.json" -d "command=APPEND&media_id=${medID}&segment_index=0" --file $fileName --file-field "media"
twurl -H upload.twitter.com "/1.1/media/upload.json" -d "command=FINALIZE&media_id=${medID}"

rm $fileName
fileName=`echo $fileName | cut -d '.' -f 1`
twurl "/1.1/statuses/update.json" -d "media_ids=${medID}&status=${fileName}"

echo ""

clear
