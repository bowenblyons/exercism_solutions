#!/usr/bin/env bash

series_product() {
	n="$1"
	prod="${n:0:1}"
	for (( i=1; i<${#n}; i++ ))
	do
		nxt="${n:i:1}"
		prod=$(( prod*nxt ))
	done
	echo "$prod"
}

readonly input="$1"
readonly span="$2"
readonly input_len="${#input}"
readonly span_ct=$(( $(( $input_len - $span )) + 1 ))
prod=0

if (( input_len < span )); then
	echo "span must not exceed string length"
	exit 1
elif (( span <= 0 )); then
	echo "span must not be negative"
	exit 1
fi
[[ "$input" =~ ^[0-9]*$ ]] || { echo "input must only contain digits"; exit 1; }

for (( i=0; i<$span_ct; i++ ))
do
	window=${input:i:span}
	p=$(series_product $window)
	if (( p > prod )); then
		prod=$p
	fi
done

echo "$prod"
