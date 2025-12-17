#!/usr/bin/env bash

declare -rA a=(
	[eggs]=1
	[peanuts]=2
	[shellfish]=4
	[strawberries]=8
	[tomatoes]=16
	[chocolate]=32
	[pollen]=64
	[cats]=128
)

# another array because the previous one fails tests due to ordering
declare -rA b=(
	[1]="eggs"
	[2]="peanuts"
	[4]="shellfish"
	[8]="strawberries"
	[16]="tomatoes"
	[32]="chocolate"
	[64]="pollen"
	[128]="cats"
)

# original solution with array a, right answers but wrong order
list() {
	s="$1"
	for k in $(printf "%s\n" "${!a[@]}" | sort -g); do
	       	v="${a[$k]}"
		if (( v & s )); then
			echo "$k"
		fi
	done		
}

listt() {

	s="$1"
	for k in $(printf "%s\n" "${!b[@]}" | sort -g); do
		if (( k & s )); then
			echo "${b[$k]}"
		fi
	done
}

is_allergic() {
	s="$1"
	i="$2"
	x="${a[$i]}"
	let v="$s&$x"
	if [[ $x -eq $v ]]; then
		echo "true"
	else
		echo "false"
	fi
}

main() {
	local score="$1"
	local output=""
	#1 is score
	#2 is list
	#2 is allergic_to allergen
	if [[ "$#" -eq 2 ]]; then
	       # score list
		option="$2"
		[[ option -ne "list" ]] && echo "invalid input"
		output="$(listt $score)"
	elif [[ "$#" -eq 3 ]]; then
		# allergic_to allergen
		option="$2"
		allergen="$3"
		[[ option -ne "allergic_to" ]] && echo "invalid input"
		output="$(is_allergic $score $allergen)"
	fi
	echo "$output"
}

output="$(main $@)"
echo $output
