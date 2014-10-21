#!/bin/sh
imageUrl=$2
imageStartIndex=13
imageIndex=`expr $3 + $imageStartIndex`
imageName='episode'$imageIndex'.jpg'
echo $imageIndex
echo $imageName
cmd=`curl $imageUrl > $imageName`
echo cmd
