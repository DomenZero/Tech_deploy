Tech_deploy
===

Description
-----------
This is a solution for the deployment of a Flask application. 
Docker container with Flask application listens to port 80 and shows information about built image time and start script for deploy.

Idea
----
When I start deployment.sh I use bash scripts to take date properties and save them in the folder __date.properties__.  
Then is generated __configmap.yaml__ with date variables from the __date.properties__  
Finally is started pod with delivered date arguments to Flask application.

Solution tree
-------------
### Project tree:
~~~
Tech_deploy/
├── Dockerfile
├── app.py
├── build.sh
├── deployment.sh
├── requirements.txt
├── kube
│   ├── Deployment.yaml
│   └── configmap.yaml
├── configure-pod-container
│   └── configmap
│       └── date.properties
~~~

Pre-deployment steps
--------------------

0. Install Docker and Minikube 
1. Clone this repository

Deployment
----------
Run __Deployment.sh__

Check
-----
~~~
kubectl port-forward NAME_of_POD 40008:80
~~~
And check solution with GET request __http://127.0.0.1:40008/json__ in a Postman.  
OR enter inside container
~~~
kubectl exec --stdin --tty NAME_of_POD -- sh
/app # wget http://127.0.0.1/json
/app # cat json
~~~

P.S.
----
Check application script
~~~
python app.py --built_at=2022-06-23T10:09:11.2362766Z --deploy_at=2022-06-23T10:09:11.2362766Z
~~~
If you can build and run docker container without k8s start __build.sh__
If it has some errors see a report in log.txt
