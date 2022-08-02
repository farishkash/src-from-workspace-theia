#!/bin/bash

# Start the first process
sleep $VOLUME_LOAD_DELAY # allow time for content image default files to be created in /home/project/ in production k8s pod
ls /content/src/default*
if [[ $? -eq 0 ]]; then
    cp -f /content/src/default* /home/project
fi
export PORT=9000
nohup sh -c /jsbin/bin/jsbin &

# Start the second process
sleep $PROXY_LOAD_DELAY # allow time for content image default files to be loaded before browser request loads empty default
nginx
