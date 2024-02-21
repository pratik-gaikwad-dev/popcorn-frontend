#!/bin/bash

IMAGE=$IMAGE_NAME

docker rmi -f $IMAGE


echo "******************************************************************"
echo "******************* Building Docker Image ************************"
echo "******************************************************************"

# Build the docker image.

docker build -t $IMAGE .

echo "******************************************************************"
echo "******************* Docker Image Built ***************************"
echo "******************************************************************"

echo "******************************************************************"
echo "******************* Running Docker Image *************************"
echo "******************************************************************"

# Run the docker image.

docker run -v /home/pratik/projects/popcorn-frontend:/app/dist popcorn-frontend

echo "******************************************************************"
echo "******************* Docker Image Running *************************"
echo "******************************************************************"

echo "******************************************************************"
echo "******************* Docker Image Pushing *************************"
echo "****************************************************************** "

# Push the docker image to docker hub.

docker tag $IMAGE:latest pratikgaikwad/$IMAGE:latest
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
docker push pratikgaikwad/$IMAGE

echo "Done!"