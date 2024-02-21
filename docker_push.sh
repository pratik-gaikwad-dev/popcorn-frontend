#!/bin/bash

IMAGE=$IMAGE_NAME

echo "******************************************************************"
echo "******************* Docker Image Pushing *************************"
echo "****************************************************************** "

# Push the docker image to docker hub.

docker tag $IMAGE:latest pratikgaikwad/$IMAGE:latest
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
docker push pratikgaikwad/$IMAGE

echo "Done!"