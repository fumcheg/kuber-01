#!/bin/sh

# Build images
# docker build -f ./dockerfiles/mysql-docker-file -t mysql-image .
docker build -f ./dockerfiles/apache-docker-file -t apache-image .

# Start cluster
minikube start --nodes 3 -p lab-yusufov
minikube config set profile lab-yusufov

# Create configmap from mysql init script
minikube kubectl create configmap mysql-init-configmap -- --from-file=./db-server/ --dry-run=client -o yaml > mysql-init-configmap.yaml

# Import images
# minikube image load mysql-image
minikube image load apache-image

# Apply config files
minikube kubectl apply -- -f mysql-config.yaml
minikube kubectl apply -- -f mysql-secret.yaml
minikube kubectl apply -- -f mysql-init-configmap.yaml
minikube kubectl apply -- -f mysql-deployment.yaml
minikube kubectl apply -- -f apache-deployment.yaml