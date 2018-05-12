#!/bin/sh

dir='/jffs/scripts/routerstats'

nice -n -19 $dir/router_cpu.sh
sleep 1
nice -n -19 $dir/router_mem.sh
sleep 1
nice -n -19 $dir/router_net.sh  ## 대부분의 ASUS 공유기
#nice -n -19 $dir/router_net.sh ## AC3200 
sleep 1
nice -n -19 $dir/router_ping_ext.sh
sleep 1
nice -n -19 $dir/router_temp.sh
sleep 1
nice -n -19 $dir/router_assoclist.sh
