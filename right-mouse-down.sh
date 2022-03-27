#!/bin/bash
regex="x:([0-9]*)\sy:([0-9]*)*"
while true; 
do 
if [[ $(xinput query-state 19 | grep 'button\[3\]=down') ]]
then
xyValues=$(xdotool getmouselocation)

if [[ $xyValues =~ $regex ]]
then
  x="${BASH_REMATCH[1]}"
  y="${BASH_REMATCH[2]}"
  echo "$x, $y"
fi
fi
sleep 0.5; 
done
