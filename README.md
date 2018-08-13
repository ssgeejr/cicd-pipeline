# docker-nginx-revproxy
nginx reverse-proxy for Docker containers.  Jenkins, Gitbucket, Artifactory, Docker-Registry, K8S ... etc

# SEE DEVELOP BRANCH

Containers:

Container	Mount
ngnx	
jenkins		/opt/cicd/jenkins/home
sprintbucket	/opt/cicd/gitbucket/data
nexus		/opt/cicd/nexus/data
registry	/opt/cicd/registry
sprintqube	/opt/cicd/sonarqube/extensions
		/opt/cicd/sonarqube/data
kibana	
cadvisor	

to Stop all conainers run: sh stop.all.containers  


### WARNING!!! 
to remove all containers run: sh remove.all.containers  

## Docker commands you will want to know

### List all containers (only IDs)
docker ps -aq  

### List all containers
docker ps -a

###Stop all containers
docker stop $(docker ps -aq)  

### Remove all docker containers
docker rm $(docker ps -aq)  

###List all images
docker images

###Remove all images
docker rmi $(docker images -q)  

###List all containers that are running
docker ps -aq -f status=running  

###List all containers that have exited" 
docker ps -aq -f status=exited  

###Remove all containers that are NOT running
docker rm `docker ps -aq -f status=exited`  


