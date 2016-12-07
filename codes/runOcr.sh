#!/bin/bash


while read line
do

fullPath=$line



IN=$line

OIFS=$IFS
IFS='/'
arr2=$IN
join='/'
cnt=0
inc=1
book=''
name=''
for x in $arr2
do

    cnt=$((cnt+1));
    if [ $cnt -eq 6 ]
    then
            book=$x
    fi

   if [ $cnt -eq 7 ]
    then
            name=$x
    fi

done

mkdir ocr/result/$book

outFile=`basename $name tif`txt

IFS=$OIFS

./i-layout $fullPath
./wordocr "BinImg.tif" ocr/result/$book/$outFile "Blocks.txt" "mal_1000_32_32.model" "MAPS/"


done < $1
