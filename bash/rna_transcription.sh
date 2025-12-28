#!/usr/bin/env bash

# G -> C
# C -> G
# T -> A
# A -> U

dna="${1:-}"

[ "$dna" == "" ] && exit 0

if ! [[ $dna =~ ^[GCTA]+$ ]]; then
  echo "Invalid nucleotide detected."
  exit 1
fi

comp=""

for (( i=0; i<${#dna}; i++ )); do
    case ${dna:i:1} in
        G)
            comp="${comp}C"
            ;;
        C)
            comp="${comp}G"
            ;;
        T)
            comp="${comp}A"
            ;;
        A)
            comp="${comp}U"
            ;;
    esac
done

echo $comp

