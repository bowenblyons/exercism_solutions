#!/usr/bin/env bash

get_ordinal() {
	n="$1"
	n_len="${#n}"
	if (( $n_len > 1 )); then
		pos=$(( n_len - 2 ))
		sfx="${n:pos:2}"
		case $sfx in
			11)
				echo "th"
				return 0
				;;
			12)
				echo "th"
				return 0
				;;
			13)
				echo "th"
				return 0
				;;
			*1)
				echo "st"
				return 0
				;;
			*2)
				echo "nd"
				return 0
				;;
			*3)
				echo "rd"
				return 0
				;;
			*)
				echo "th"
				return 0
				;;
		esac
	elif (( $n_len == 1 )); then
		case $n in
			1)
				echo "st"
				return 0
				;;
			2)
				echo "nd"
				return 0
				;;
			3)
				echo "rd"
				return 0
				;;
			*)
				echo "th"
				return 0
				;;
		esac
	else
		return 1
	fi
}

name="$1"
num="$2"

ord=$(get_ordinal $num)

echo "$name, you are the $num$ord customer we serve today. Thank you!"
