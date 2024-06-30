# kuber-01

Minikube installation and configuration process is not in the scope of this description.
minikube driver=docker

Deployment process is commented into build.sh script

In this project images from previous modules were used. So image building and importing are also included into script.

cluster lab-yusufov (3 nodes)
|-- lab-yusufov (control-plane node)
|-- lab-yusufov-m02 (node)
|   |-- pod/apache-deployment (IP:10.244.1.2)
|       |-- OS Linux
|       |-- Apache Web-server + PHP (see apache-docker-file)
|-- lab-yusufov-m03 (node)
|   |-- pod/mysql-deployment (IP:10.244.2.3)
|       |-- OS Linux
|       |-- MySQL database (see mysql-docker-file)
|-- service/kubernetes ClusterIP 10.96.0.1 443/TCP (cluster node)
|-- service/apache-service NodePort 10.111.178.192 6969:30069/TCP (apache)
|-- service/mysql-service ClusterIP 10.97.254.47 3306/TCP (mysql)

