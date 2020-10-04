#!/bin/bash
if ! command -v docker &> /dev/null; then
    echo " !!! docker could not be found"
    exit 1
fi

if [ -z "$1" ]; then
    COMMAND="default"
else 
    COMMAND=$1
fi

if [ $COMMAND = "standalone" ]; then
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
elif [ $COMMAND = "docker" ]; then
    if ! command -v docker-compose &> /dev/null; then
        echo " !!! docker-compose could not be found"
        exit 1
    fi
    
    echo "Running docker-compose..."
    docker-compose up --build
    docker-compose down
elif [ $COMMAND = "clean" ]; then
    echo "Cleaning docker..."
    docker system prune -a
else 
    echo "Use the following actions:"
    echo " > clean :: cleans the docker system."
    echo " > standalone :: runs a single docker container for the project."
    echo " > docker :: runs all dependencies into docker, including mongodb and redis."
    echo 
    echo " Examples"
    echo " > ./run.sh sandalone"
    echo " > ./run.sh docker"
    echo " > ./run.sh clean"
    echo 
    echo
    echo " By Mateo Olaya - 2020"
fi

