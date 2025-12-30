#!/bin/sh
p1=${START_PORT:-16000}
p2=${END_PORT:-16799}
target=${TARGET_IP:-192.168.100.15}

echo "Socratting things from $p1 to $p2 to $target"

for p in $(seq $p1 $p2); do
  socat TCP-LISTEN:$p,fork,reuseaddr TCP:$target:$p & socat UDP4-LISTEN:$p,reuseaddr,fork UDP4:$target:$p &
done

wait
