#!/bin/sh

# Build images
docker build -f ./dockerfiles/mysql-docker-file -t mysql-image .
docker build -f ./dockerfiles/apache-docker-file -t apache-image .

# Start cluster
minikube start --nodes 3 -p lab-yusufov
minikube config set profile lab-yusufov

# Import images
minikube image load mysql-image
minikube image load apache-image

# Apply config files
kubectl apply -f mysql-config.yaml
kubectl apply -f mysql-secret.yaml
kubectl apply -f mysql-deployment.yaml
kubectl apply -f apache-deployment.yaml