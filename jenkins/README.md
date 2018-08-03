## Run Jenkins Docker Containers

mkdir -p /opt/cicd/jenkins/data  
make sure to add "-d" for the production version  
docker run --name myjenkins --rm -p 8880:8080 -p 50000:50000 -v /opt/cicd/jenkins/data:/var/jenkins_home jenkins --prefix=/jenkins  

