#!/bin/bash

for conf in /etc/nginx/templates/*.conf; do
    envsubst < $conf > "/etc/nginx/sites-available/"$(basename $conf)
done

# . /root/scripts/run-openssl.sh
