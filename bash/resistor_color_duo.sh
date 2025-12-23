#!/usr/bin/env bash

col1="$1"
col2="$2"

declare -a colors=(
	[0]="black"
	[1]="brown"
	[2]="red"
	[3]="orange"
	[4]="yellow"
	[5]="green"
	[6]="blue"
	[7]="violet"
	[8]="grey"
	[9]="white"
)

ten=""
one=""

for (( i=0; i<"${#colors[@]}"; i++ )); do
	if [ "${colors[$i]}" == "$col1" ]; then
		ten="$i"
	fi
	if [ "${colors[$i]}" == "$col2" ]; then
		one="$i"
	fi
done

if [ "$ten" == "" ]; then
	echo "invalid color"
	exit 1
fi
if [ "$one" == "" ]; then
	echo "invalid color"
	exit 1
fi
[ "$ten" == "0" ] && echo "$one" || echo "$ten$one"
