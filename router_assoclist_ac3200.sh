#!/bin/sh

dir='/jffs/scripts/routerstats'

name="router_assoclist_24"
columns="count"
p1=`wl -i eth2 assoclist | awk '{print $2}' | wc -l`
points="$p1"
$dir/todb2.sh "$name" "$columns=$points"

name="router_assoclist_50"
columns="count"
p1=`wl -i eth1 assoclist | awk '{print $2}' | wc -l`
p2=`wl -i eth3 assoclist | awk '{print $2}' | wc -l`
points=`expr $p1 + $p2`
$dir/todb2.sh "$name" "$columns=$points"

name="router_assoclist_guest_24"
columns="count"
p1=`wl -i wl0.1 assoclist | awk '{print $2}' | wc -l`
p2=`wl -i wl0.2 assoclist | awk '{print $2}' | wc -l`
p3=`wl -i wl0.3 assoclist | awk '{print $2}' | wc -l`
p4=`wl -i wl0.4 assoclist | awk '{print $2}' | wc -l`
p5=`wl -i wl0.5 assoclist | awk '{print $2}' | wc -l`
points1=`expr $p1 + $p2 + $p3 + $p4 + $p5`
$dir/todb2.sh "$name" "$columns=$points1"

name="router_assoclist_guest_50"
columns="count"
p1=`wl -i wl1.1 assoclist | awk '{print $2}' | wc -l`
p2=`wl -i wl1.2 assoclist | awk '{print $2}' | wc -l`
p3=`wl -i wl1.3 assoclist | awk '{print $2}' | wc -l`
p4=`wl -i wl1.4 assoclist | awk '{print $2}' | wc -l`
p5=`wl -i wl1.5 assoclist | awk '{print $2}' | wc -l`
points2=`expr $p1 + $p2 + $p3 + $p4 + $p5`
$dir/todb2.sh "$name" "$columns=$points2"

name="router_assoclist_guest"
columns="count"
points=`expr $points1 + $points2`
$dir/todb2.sh "$name" "$columns=$points"
