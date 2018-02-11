
counter=0

for f in photos/*.jpg
do
    hr=`echo $f | cut -d '-' -f 2 | cut -d '_' -f 1`
    min=`echo $f | cut -d '-' -f 2 | cut -d '_' -f 2`
#    echo $hr
#    echo $min


    if [ $hr -gt 4  ] && [ $hr -lt 19 ]
    then
        if (( 10#$min % 4 ))
        then
            rm $f
#            echo "delete: $min"
#        else
#            echo "KEEP"
        fi
    else
        if (( 10#$min % 8 ))
        then
#            echo "delete: $min"
            rm $f
#        else
#            echo "KEEP"
        fi
    fi
done
