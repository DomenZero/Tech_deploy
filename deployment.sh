#!/bin/bash
exec 3>&1 1>>log.txt 2>&1
container_name=dev-test:v1 
eval $(minikube docker-env)
docker build -t $container_name .
docker inspect -f '{{ .Created }}' $container_name > DATE
DATE=$(cat DATE)
kubectl delete configmap date-config
echo builtat=$DATE > configure-pod-container/configmap/date.properties
script_timestamp=$(date +"%Y-%m-%dT%H:%M:%S") 
echo deployat=$script_timestamp >> configure-pod-container/configmap/date.properties
kubectl create configmap date-config --from-env-file=configure-pod-container/configmap/date.properties
kubectl get configmaps date-config -o yaml
kubectl get configmaps date-config -o yaml > kube/configmap.yaml
kubectl create -f ./kube/Deployment.yaml