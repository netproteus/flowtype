#!/bin/bash

while [ true ]
do
    rsync -rpt /flow-src/* /usr/src/app/src
    sleep 1
done &

flow server --temp-dir /flow
