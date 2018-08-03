# docker-nginx-revproxy
nginx reverse-proxy for Docker containers.  Jenkins, Gitbucket, Artifactory, Docker-Registry, K8S ... etc

### SEE DEVELOP BRANCH



# Docker commants (helpfuL) 

docker rmi $(docker images | grep "^<none>" | awk '{print $3}')

docker stop $(docker ps -a | awk '{print $1}')

docker rm $(docker ps -a | awk '{print $1}')
