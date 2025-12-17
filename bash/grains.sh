#!/usr/bin/env bash

pow_two_sum() {
	local x="$1"
	local tot=$(echo "2^($x+1)-1" | bc)
	echo "$tot"
}

n="$1"

if [ "$n" == "total" ]; then
	n=$(pow_two_sum 63)
	printf "%s\n" "$n"
else
	[[ $n < 1 ]] && { echo "Error: invalid input"; exit 1; }
	[[ $n > 64 ]] && { echo "Error: invalid input"; exit 1; }

	n=$(( $n - 1 ))
	n=$(( 2 ** $n ))
	printf "%u\n" "$n"
fi
