#!/bin/bash

while true
do
    num=`task active | wc -l`
    if [ $num -gt "1" ]
      then
        notify-send "Task reminder" "`task rc.verbose: rc.report.next.columns:description rc.report.next.labels:1 limit:1 next`"
      else
        notify-send "No Active Tasks" "C'mon! What are you doing?"
    fi
    sleep 1800 # wait 30 min
done
