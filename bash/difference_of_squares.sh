#!/usr/bin/env bash

# S_n= [n(n+1)(2n+1)]/6
sum_of_square() {
	n="$1"
	s=$(( $(( n * $(( $((n + 1)) * $(( $(( 2 * n )) + 1)) )) )) / 6 ))
	echo "$s"
}

# [n^2(n+1)^2]/4
square_of_sum() {
	n="$1"
	s=$(( $(( $(( n ** 2 )) * $(( $(( n + 1 )) ** 2 )) )) / 4 ))
	echo "$s"
}

option="$1"
num="$2"
res=""

if [ "$option" == "sum_of_squares" ]; then
	res=$(sum_of_square $num)
elif [ "$option" == "square_of_sum" ]; then
	res=$(square_of_sum $num)
elif [ "$option" == "difference" ]; then
	ssum=$(square_of_sum $num)
	ssquare=$(sum_of_square $num)
	res=$((ssum - ssquare))
else
	echo "ERROR"
	exit 1
fi

echo "$res"

