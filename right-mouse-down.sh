#!/bin/bash
while true; 
do 
if [[ $(xinput query-state 19 | grep 'button\[3\]=down') ]]
then
echo $(xdotool getmouselocation)
fi
sleep 0.5; 
done
