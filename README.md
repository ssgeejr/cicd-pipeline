# docker-nginx-revproxy
nginx reverse-proxy for Docker containers.  Jenkins, Gitbucket, Artifactory, Docker-Registry, K8S ... etc

### SEE DEVELOP BRANCH

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

