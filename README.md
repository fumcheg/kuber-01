# kuber-01

# Create Env variable to define path to mysql persistent storage (no '/' in the end)
export KUBER_PV_MYSQL_DIR=</define/your/path>

# Build images.
./docker-build.sh

# Start cluster.
minikube start --nodes 3 -p lab-yusufov
minikube config set profile lab-yusufov

# Import images
minikube image load mysql-image

# Apply config files
kubectl apply -f