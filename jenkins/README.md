## Run Jenkins Docker Containers

mkdir -p /opt/cicd/jenkins/data  
make sure to add "-d" for the production version  
docker run --name myjenkins --rm -p 8880:8080 -p 50000:50000 -v /opt/cicd/jenkins/data:/var/jenkins_home jenkins --prefix=/jenkins  



wget http://ftp.wayne.edu/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz

wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-i586.tar.gz -O jdk-8u171-linux-x64.tar.gz

