#!/bin/bash
file1=$1
file2=$2

CurRow=1
LastRow=`cat $file1 | wc -l`
echo "">comparetime.txt
while [ $CurRow -le $LastRow ]
do
process1=`awk -F'"' 'NR=='$CurRow' {print $2}' $file1`
time1=`awk -F'"' 'NR=='$CurRow' {print $4}' $file1`
process2=`awk -F'"' 'NR=='$CurRow' {print $2}' $file2`
time2=`awk -F'"' 'NR=='$CurRow' {print $4}' $file2`

if [ "$process1" == "$process2" ];then
echo "process is:$process1 difference is:">>comparetime.txt 
echo $time2 - $time1 | bc>>comparetime.txt
fi
((CurRow++))
done
