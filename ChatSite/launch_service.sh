#!/bin/bash

envsubst '${API_URL}' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf
cp /etc/nginx/conf.d/default.conf /etc/nginx/templates/default.conf.template
nginx -g "daemon off;"