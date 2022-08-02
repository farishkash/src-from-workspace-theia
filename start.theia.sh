#!/bin/bash

nohup sh -c "/usr/local/n/versions/node/12.18.3/bin/node /home/theia/src-gen/backend/main.js /home/project --hostname=0.0.0.0 --port 30000 --startup-timeout=-1" &

/usr/local/nginx/sbin/nginx -g "daemon off;" -p /etc/nginx/ -c nginx.conf
