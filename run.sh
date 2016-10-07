#!/bin/bash

TMP_DIR=${TMP_DIR:-/tmp/flow}

echo "Using --temp-dir=${TMP_DIR}"

while [ true ]
do
    rsync -rpt /flow-src/* /usr/src/app/
    sleep 0.5
done &

while [ true ]
do
    flow server --temp-dir ${TMP_DIR}
    sleep 2
done
