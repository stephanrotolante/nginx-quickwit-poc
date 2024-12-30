#!/bin/bash

# Start cron in the background
service cron start

# Start Nginx in the foreground
nginx -g "daemon off;"