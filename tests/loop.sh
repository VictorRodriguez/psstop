#!/bin/bash

echo "" > psstop_log
echo "" > ps_log

for i in `seq 0 100 1000`;
do
	./test_linear $i &
    psstop | grep test_linear | cut -d":" -f1 >> psstop_log
    ps aux | grep test_linear | grep R >> ps_log
    wait
done
