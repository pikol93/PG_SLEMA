#!/bin/bash

envsubst '${API_URL}' < /etc/nginx/templates/default.conf.template > /tmp/helper.conf
envsubst '${REGISTER_URL}' < /tmp/helper.conf > /etc/nginx/conf.d/default.conf
cp /etc/nginx/conf.d/default.conf /etc/nginx/templates/default.conf.template
nginx -g "daemon off;"