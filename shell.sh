#!/bin/bash

nohup /root/server_demo &
         
while true; do
    last_line=$(tail -n 1 /root/server.log | tr -d '[:space:]')
    if echo "${last_line}" | grep -q "NicheID"; then
        IFS='NicheID:' read -ra arr <<< "$last_line"
        key=$(echo "${arr[-1]}" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | tr -d '[:space:]')
        curl -i -H 'Accept:application/json' -X POST -d '{"UserId":10,"GameId":4,"NicheId":"'"$key"'"}' http://101.43.14.68:8888/niche/put
    fi
    sleep 5
done
