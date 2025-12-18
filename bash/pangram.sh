#!/usr/bin/env bash

str="${1,,}"
declare -A cc

for (( i=0; i<${#str}; i++ ))
do
	c="${str:i:1}"
	if [[ "$c" =~ ^[a-zA-Z]$ ]]; then
		cc["$c"]=1
	fi
done

(( "${#cc[@]}" == 26 )) && echo "true" || echo "false"

