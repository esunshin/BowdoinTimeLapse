#!/bin/bash

clear

if [ "$1" = "y" ]
then
    ## POSITION
    posResetResult="tmpVal"
    isFirst=1
    while [ -n "$posResetResult" ]
    do  
        if [ "$isFirst" -ne 1 ]
        then
            echo "waiting at position reset.."
            sleep 15
        fi
        isFirst=0
        echo "Reseting position.."
        posResetResult=$(curl -s 'http://webcam5.bowdoin.edu:4200/axis-cgi/com/ptz.cgi?gotoserverpresetno=17&camera=1' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.9' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36' -H 'Accept: */*' -H 'Referer: http://webcam5.bowdoin.edu:4200/' -H 'Cookie: ptz_ctl_id=1501579371; _ga=GA1.2.1433504806.1507028518; __utma=253559834.1433504806.1507028518.1507028518.1507050727.2; __utmz=253559834.1507028518.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)' -H 'Connection: keep-alive' --compressed)
        echo "Result from position reset: $posResetResult"
    done
fi

if [ "$2" = "y" ]
then
    ## ZOOM
    zoomOutResult="tmpVal"
    isFirst=1
    while [ -n "$zoomOutResult" ]
    do    
        if [ "$isFirst" -ne 1 ]
        then
            echo "waiting at zoom out.."
            sleep 15
        fi
        isFirst=0
        echo "Zooming out.."
        zoomOutResult=$(curl -s 'http://webcam5.bowdoin.edu:4200/axis-cgi/com/ptz.cgi?camera=1&zoom=1' -H 'Cookie: ptz_ctl_id=1501579371; _ga=GA1.2.1433504806.1507028518; __utma=253559834.1433504806.1507028518.1507028518.1507050727.2; __utmz=253559834.1507028518.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)' -H 'Accept-Encoding: gzip, deflate' -H 'Axis-Orig-Sw: true' -H 'Accept-Language: en-US,en;q=0.9' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36' -H 'Content-Type: text/plain; charset=utf-8' -H 'Accept: text/plain, */*; q=0.01' -H 'Referer: http://webcam5.bowdoin.edu:4200/' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' --compressed)
        echo "Result from zoom out: $zoomOutResult"
    done
fi

if [ "$3" = "y" ]
then
    ## BRIGHTNESS
    lightResetResult="tmpVal"
    isFirst=1
    while [ -n "$lightResetResult" ]
    do    
        if [ "$isFirst" -ne 1 ]
        then
            echo "waiting at light reset.."
            sleep 15
        fi
        isFirst=0
        echo "Reseting brightness.."
        lightResetResult=$(curl -s 'http://webcam5.bowdoin.edu:4200/axis-cgi/com/ptz.cgi?camera=1&brightness=7500' -H 'Cookie: ptz_ctl_id=1501579371; _ga=GA1.2.1433504806.1507028518; __utma=253559834.1433504806.1507028518.1507028518.1507050727.2; __utmz=253559834.1507028518.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)' -H 'Accept-Encoding: gzip, deflate' -H 'Axis-Orig-Sw: true' -H 'Accept-Language: en-US,en;q=0.9' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36' -H 'Content-Type: text/plain; charset=utf-8' -H 'Accept: text/plain, */*; q=0.01' -H 'Referer: http://webcam5.bowdoin.edu:4200/' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' --compressed)
        echo "Result from brightness reset: $lightResetResult" 
    done
fi

echo "Camera prepared, waiting for focus.."
sleep 5
fileName=$(date +%Y_%m_%d-%H_%M_%S)

echo "Downloading image.."

captureResult=$(curl -o ./photos/$fileName.jpg 'http://webcam5.bowdoin.edu:4200/jpg/image.jpg')
echo "Result from image download: $capture"
echo "Image downloaded as: $fileName.jpg" 
