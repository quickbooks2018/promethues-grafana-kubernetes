#!/bin/bash
# Purpose: Automated deployment of prometheus and grafana in Kubernetes cluster.
# OS: Ubuntu16/18/20

apt update -y

apt install -y git

git clone https://github.com/quickbooks2018/promethues-grafana-kubernetes.git


# Applying kubectl for Monitoring

cd promethues-grafana-kubernetes

kubectl create ns monitoring

kubectl -n monitoring apply -f prometheus-operator
kubectl -n monitoring apply -f prometheus-cluster-monitoring
kubectl -n monitoring apply -f kube-state-metrics
kubectl -n monitoring apply -f node-exporter
kubectl -n monitoring apply -f grafana
# kubectl -n monitoring apply -f alertmanager

# END


# kubectl -n monitoring port-forward svc/grafana 8080:3000

# kubectl -n monitoring port-forward svc/grafana --address 0.0.0.0 3000:3000

#########################################################################
# https://hub.docker.com/u/kindest
# https://hub.docker.com/r/kindest/node/tags

# kind create cluster --name cloudgeeks-ca

# kind create cluster --name cloudgeeks-ca --image kindest/node:v1.18.6

# kubectl cluster-info --context kind-cloudgeeks-ca

# kind delete cluster --name kind-cloudgeeks-ca

# Delete a cluster ---> docker rm -f $(docker ps -aq)

# Cluster stuck   ----> systemctl restart docker

# Note: For Grafana we are going to import a Dashboard ---> 1860

##########################################################################
