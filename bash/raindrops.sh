#!/usr/bin/env bash

n="$1"
out=""
if (( $(( n % 3 )) == 0 )); then
	out+="Pling"
fi
if (( $(( n % 5 )) == 0 )); then
	out+="Plang"
fi
if (( $(( n % 7 )) == 0 )); then
	out+="Plong"
fi
if [[ "$out" == "" ]]; then
	out+="$n"
fi
echo "$out"
