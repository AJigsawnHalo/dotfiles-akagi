#!/bin/bash

source /etc/update-motd.d/colors.txt

declare -i num
declare -i lim

lim="70"
TEMP="$(vcgencmd measure_temp | awk -F"temp=" '{print $2}')"
num="$(echo $TEMP | cut -c1,2)"
PRIN=""

if [ "$num" -ge "$lim" ] 
then 
	PRIN+="${RED}${TEMP}"
else
	PRIN+="${GRN}${TEMP}"
fi

echo "$TEMP"
echo "$NUM"
echo -e "$PRIN"
