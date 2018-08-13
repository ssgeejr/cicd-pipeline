# docker-nginx-revproxy
nginx reverse-proxy for Docker containers.  Jenkins, Gitbucket, Artifactory, Docker-Registry, K8S ... etc

# SEE DEVELOP BRANCH

### For VirtualBox
If you are running VirtualBox, you will need to open ports 90 (nginx) and 9100 (cAdvisor)  
This can be done under 'Settings' / 'Network' / Advanced (down arror) / Port Forwarding (button)  
add the following two entries
* HTTP     	127.0.0.1	  80	192.168.122.1	  80
* cAdvisor	127.0.0.1	9100	192.168.122.1	9100


## Containers:

Container	Mount
* sprintngnx	n/a
* sprintkins	/opt/cicd/jenkins/home
* sprintgit	/opt/cicd/gitbucket/data
* registry	/opt/cicd/registry
* sprintqube 	/opt/cicd/sonarqube/data
* cAdvisor	n/a	
* nexus		/opt/cicd/nexus/data
* sprintqube	/opt/cicd/sonarqube/extensions

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


