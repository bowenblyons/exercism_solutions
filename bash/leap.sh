#!/usr/bin/env bash

readonly usage="Usage: leap.sh <year>"

if (( "$#" != 1 )); then
	echo $usage
	exit 1
fi
if ! [[ "$1" =~ ^[0-9][0-9][0-9][0-9]$ ]]; then
	echo $usage
	exit 1
fi

y="$1"
if (( $(( y % 100 )) == 0 )); then
	if (( $(( y % 400 )) == 0 )); then
		echo "true"
		exit 0
	else
		echo "false"
		exit 0
	fi
elif (( $(( y % 4 )) == 0 )); then
	echo "true"
	exit 0
else
	echo false
	exit 0
fi

