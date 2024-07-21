#!/bin/bash

# URL of your Wisecow application
URL="http://localhost:31002"  # Adjust this to the public IP and port if checking from outside the EC2 instance

STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}" $URL)
echo "Received status code: $STATUS_CODE"

if [ "$STATUS_CODE" -eq 200 ]; then
    echo "Wisecow application is up and running."
else
    echo "Wisecow application is down. Status code: $STATUS_CODE"
fi
