#!/bin/bash

container_name=dev_test
echo build the docker image
docker build -t $container_name .
echo "Deploying the updated container"
docker inspect -f '{{ .Created }}' $container_name > DATE
DATE=$(cat DATE)
docker run -d --name $container_name -p 8080:80 --rm $container_name --built_at=$DATE --deploy_at=2022-06-23T10:09:11.2362766Z
echo Deploying the $container_name