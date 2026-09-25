#!/usr/bin/env bash

FAIL=0



for TRY in {1..30}
do
    docker run --net=host --rm -e TERCEN_USERNAME=test \
    				-e TERCEN_PASSWORD=test \
    				-e TERCEN_URI=$1:$2  \
    				tercen/tercenctl:release session  > /dev/null
    STATUS=$?

    if (( STATUS > 0 )); then
        echo "Connecting to $1:$2 unsuccessful ... Retrying in 10 seconds [$TRY/30]"
        if (( TRY == 30 )); then
            echo "Giving up: $1:$2 did not come up after 30 attempts"
            exit 1
        fi
        sleep 10
    else
        echo "Listen to $1:$2 successful"
        exit 0
    fi
done
