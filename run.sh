#!/bin/bash
if ! command -v docker &> /dev/null; then
    echo " !!! docker could not be found"
    exit
fi

APP_ID="dart_server"
USING_PORTS="-p 8080:8080"

echo "This will create a sandbox environment for local testing."
echo " > Please check the Dockerfile for more details."
echo 

docker stop $APP_ID &> /dev/null && echo "Stopped previous instances..."
docker rm $APP_ID &> /dev/null && echo "Removed old instances..."
docker build -t $APP_ID . >/dev/null && echo "Sandbox was built..."

echo 
echo "Running on container:"
docker run -d $USING_PORTS --name $APP_ID $APP_ID && echo "Sandbox is running..."