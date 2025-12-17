#!/usr/bin/env bash

match() {
	[ "$1" == "$2" ] && return 0 || return 1
}

ham_dist() {
	local a="$1"
	local b="$2"
	local len="${#a}"
	local i=0
	local d=0
	until [ $i == $len ]; do
		if ! match ${a:i:1} ${b:i:1}; then
			((d++))
		fi
		((i++))
	done
	echo "$d"
}

readonly usage_msg="Usage: hamming.sh <string1> <string2>"

[[ $# != 2 ]] && { echo $usage_msg; exit 1; }

a="$1"
b="$2"

[[ ${#a} != ${#b} ]] && { echo "strands must be of equal length"; exit 1; }

dist=$(ham_dist $a $b)
echo "$dist"
