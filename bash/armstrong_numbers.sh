#!/usr/bin/env bash

# notes
# substring=${string:start:length}
#

armstrong() {
	n="$1"
	nc=${#n}
	s=0
	for (( i=0; i < nc; i++ )); do
		c="${n:i:1}"
		cc=$(( c ** nc ))
		s=$(( s + cc ))
	done
	if [[ "$s" -eq "$n" ]]; then
		echo "true"
	else
		echo "false"
	fi
}

armstrong "$1"
