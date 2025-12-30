#!/usr/bin/env bash

num="${1:-}"
n="${2:-}"

[ "$num" == "" ] && { echo "series cannot be empty"; exit 1; }
(( n > ${#num} )) && { echo "slice length cannot be greater than series length"; exit 1; }
(( n == 0 )) && { echo "slice length cannot be zero"; exit 1; }
(( n < 0 )) && { echo "slice length cannot be negative"; exit 1; }

n_ct=$(( $(( ${#num} - n )) + 1 ))

for (( i=0; i<n_ct; i++ )); do
  printf "%s" "${num:i:n}"
  (( i != $(( n_ct - 1 )) )) && printf " "
done

printf "\n"
