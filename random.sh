#!/bin/bash

# Set the URL you want to request
URL="http://localhost:8080"

# Set the minimum and maximum random intervals (in seconds)
MIN_INTERVAL=1
MAX_INTERVAL=5

# Infinite loop to make requests at random intervals
while true; do
    # Generate a random interval between MIN_INTERVAL and MAX_INTERVAL
    RANDOM_INTERVAL=$((RANDOM % (MAX_INTERVAL - MIN_INTERVAL + 1) + MIN_INTERVAL))

    # Make the curl request
    curl $URL

    # Wait for the random interval
    sleep $RANDOM_INTERVAL
done