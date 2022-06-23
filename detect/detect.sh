#! /bin/bash

ps_id=$1
file=$2
ps_num=-1

time=$(date "+%Y%m%d-%H%M%S")
log_file=${PWD}/${time}_log.txt
while [ $ps_num != 0 ]
do
	time=$(date "+%Y%m%d-%H%M%S")
	ps_num=$(ps -aux | awk '{print $2}' | grep ${ps_id} | wc -l)
	echo -e "\033[33m${time} ==========================================\033[0m" | tee -a $log_file
	ps -aux | grep $ps_id | head -1 | tee -a ${log_file}
	echo "detect ps num: " $ps_num 
	echo -e "\033[33m-------------- ==========================================\033[0m"  | tee -a ${log_file}
	echo
	sleep 2s
done

echo -e "\033[33mProgram Starting....\033[0m" | tee -a ${log_file}

bash ${file}
