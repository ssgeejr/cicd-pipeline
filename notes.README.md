# docker-nginx-revproxy
nginx reverse-proxy for Docker containers.  Jenkins, Gitbucket, Artifactory, Docker-Registry, K8S ... etc

### SEE DEVELOP BRANCH



# Docker commants (helpfuL) 

docker rmi $(docker images | grep "^<none>" | awk '{print $3}')

docker stop $(docker ps -a | awk '{print $1}')

docker rm $(docker ps -a | awk '{print $1}')


***PROMETHIUS***
Configure Docker
To configure the Docker daemon as a Prometheus target, you need to specify the metrics-address. The best way to do this is via the daemon.json, which is located at one of the following locations by default. If the file does not exist, create it.

Linux: /etc/docker/daemon.json
Windows Server: C:\ProgramData\docker\config\daemon.json
Docker for Mac / Docker for Windows: Click the Docker icon in the toolbar, select Preferences, then select Daemon. Click Advanced.
If the file is currently empty, paste the following:

{
  "metrics-addr" : "127.0.0.1:9323",
  "experimental" : true
}


https://stefanprodan.com/2016/a-monitoring-solution-for-docker-hosts-containers-and-containerized-services/

https://www.neteye-blog.com/2018/04/how-to-monitor-docker-containers-using-cadvisor-part-1/
