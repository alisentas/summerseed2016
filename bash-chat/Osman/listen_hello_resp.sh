#!/bin/bash

while true ; do
	MY_IP=$(echo "172.16.5.187")
	MY_NICK_NAME=$(echo "OSMAN")
	echo "MY_IP : $MY_IP"
	echo "MY_NICK_NAME : $MY_NICK_NAME"
	echo "I am waiting a host request"
	
	PACKET=$(nc -l 10000)
	ADDRESS=$(echo $PACKET | cut -d ',' -f1)
	NICK=$(echo $PACKET | cut -d ',' -f2)
	
	echo "Get a request"	
	echo "ADDRESS=$ADDRESS"
	echo "NICK=$NICK"

	#http://stackoverflow.com/questions/2480584/how-do-i-use-a-file-grep-comparison-inside-a-bash-if-else-statement
	if grep --quiet "$ADDRESS"  resPonseId.txt; then
	  echo "exists"
	else
	 	echo "$ADDRESS,$NICK" >> resPonseId.txt
	fi
	

	echo "$MY_IP,$MY_NICK_NAME" | nc $ADDRESS 10001
	echo "Accept request"
	echo "----------------------------"
	echo ""
done
