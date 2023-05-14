#!/bin/bash

nohup /root/server_demo &

while true; do
	LOG_FILE="/root/server.log"
	SEARCH_STRING="NicheID:"
	OUTPUT_FILE="output.txt"
	latest_line=$(grep "${SEARCH_STRING}" "${LOG_FILE}" | tail -n 1)
	IFS='NicheID:' read -ra arr <<< "$last_line"
        	key=${arr[-1]}
	curl -i -H 'Accept:application/json' -X POST -d '{"UserId":9,"GameId":13,"NicheId":"'$key'"}' http://101.43.14.68:8888/niche/put
	sleep 1
done