#!/bin/bash

while [ true ]
do
    rsync -rpt /flow-src/* /usr/src/app/
    sleep 0.5
done &

flow server --temp-dir /flow
