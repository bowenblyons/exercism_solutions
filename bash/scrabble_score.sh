#!/usr/bin/env bash

word="${1:-}"
score=0
[ "$word" == "" ] && { echo "0"; exit 0; }

declare -A letters=(
  [a]=1
  [e]=1
  [i]=1
  [o]=1
  [u]=1
  [l]=1
  [n]=1
  [r]=1
  [s]=1
  [t]=1
  [d]=2
  [g]=2
  [b]=3
  [c]=3
  [m]=3
  [p]=3
  [f]=4
  [h]=4
  [v]=4
  [w]=4
  [y]=4
  [k]=5
  [j]=8
  [x]=8
  [q]=10
  [z]=10
)

word=${word,,}

for (( i=0; i<${#word}; i++ )); do
  c="${word:$i:1}"
  c_pts="${letters[$c]}"
  (( score += c_pts ))
done

echo "$score"
