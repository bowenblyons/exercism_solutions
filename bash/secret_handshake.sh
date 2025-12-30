#!/usr/bin/env bash

n="${1:-}"

[ "$n" == "0" ] && exit 0

# 1 - wink, 2 - double blink, 4 - close your eyes, 8 - jump, 16 - reverse
rev=$(( n & 16 ))

handshake=(
  [0]=$(( n & 1 ))
  [1]=$(( n & 2 ))
  [2]=$(( n & 4 ))
  [3]=$(( n & 8 ))
)

action=(
  [0]="wink"
  [1]="double blink"
  [2]="close your eyes"
  [3]="jump"
)

output=""

if (( rev == 16 )); then 
  for (( i=$(( ${#handshake[@]} - 1 )); i>=0; i-- )); do
    if (( ${handshake[$i]} != 0 )); then
      output="$output,${action[$i]}"
    fi
  done
else
  for (( i=0; i<${#handshake[@]}; i++ )); do
    if (( ${handshake[$i]} != 0 )); then
      output="$output,${action[$i]}"
    fi
  done
fi

output="${output#?}"

echo "$output"
