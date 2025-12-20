#!/usr/bin/env bash

declare -r colors=(
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

print_colors() {
	for c in "${colors[@]}"; do
		echo "$c" 
	done
}

get_color() {
	c="$1"
	for (( i=0; i<"${#colors[@]}"; i++ )); do
		if [ "${colors[$i]}" == "$c" ]; then
			echo "$i"
			return 0
		fi
	done
}

input="$1"

if [ "$input" == "colors" ]; then
	output="$(print_colors)"
elif [	"$input" == "code" ]; then
	color="$2"
	output="$(get_color $color)"
fi

printf "%s\n" "$output"
