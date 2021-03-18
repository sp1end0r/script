#!/bin/bash
: <<"END"
HELP
chmod +x check_memory.sh
./check_memory.sh [process name] [time]
- time [ default = 1 ] : echo cycle
END

date
while true; do
process_id=`/bin/ps -a | grep $1 | grep -v "grep" | awk '{print $1}'`
if [ -e "/proc/$process_id/status" ] ; then
	echo "process name : $1 pid : $process_id" 
	grep VmPeak /proc/$process_id/status
	grep VmHWM /proc/$process_id/status
else
	echo "Not founded process."
	break
fi
if [ -z "$2" ] ; then
	sleep 1
else 
	sleep $2;
fi 
done
