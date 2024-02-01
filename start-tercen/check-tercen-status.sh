#!/usr/bin/env bash

FAIL=0



for TRY in {1 .. 30}
do
    docker run --net=host --rm -e TERCEN_USERNAME=test \
    				-e TERCEN_PASSWORD=test \
    				-e TERCEN_URI=$1:$2  \
    				tercen/tercenctl:release session  > /dev/null
    STATUS=$?
    
    if (( STATUS > 0 )); then
        echo "Connecting to $1:$2 unsuccessful ... Retrying in 10 seconds [$TRY/30]"
        sleep 10
    else
        echo "Listen to $1:$2 successful"
        break
    fi
done