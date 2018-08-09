



One of the items that needs to happen is the "devops" user needs to have a unique, transferable GID (much like Docker's 993 GID)
another solution is to make sure that whateer maps to /repo has 666 perms


this is an older version, the newer version needs to be updated to map to the existing process and flow

## Run Jenkins Docker Containers

mkdir -p /opt/cicd/jenkins/data  
make sure to add "-d" for the production version  
docker run --name myjenkins --rm -p 8880:8080 -p 50000:50000 -v /opt/cicd/jenkins/data:/var/jenkins_home jenkins --prefix=/jenkins  



wget http://ftp.wayne.edu/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz

wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-i586.tar.gz -O jdk-8u171-linux-x64.tar.gz



Test instance configuration:
 docker run --name jenkies --rm -p 9090:8080 -v /opt/cicd/jenkins.test/home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v /opt/cicd/repo:/repo jenkins:sprint

