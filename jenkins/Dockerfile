FROM jenkins/jenkins:lts 

MAINTAINER Steve S Gee Jr <ioexcept@gmail.com>

USER root
RUN apt-get update && \
    apt-get -y install apt-transport-https \
      ca-certificates \
	  git \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
   apt-get update && \
   apt-get -y install docker-ce


# ### Install Maven ###
WORKDIR /opt
ADD http://mirrors.ibiblio.org/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz /opt
RUN tar -zxf apache-maven-3.5.4-bin.tar.gz && \
   echo "M2_HOME=/opt/apache-maven-3.5.4" >> /etc/profile && \
   echo "PATH=$PATH:$M2_HOME/bin" >> /etc/profile && \
   echo "export M2_HOME PATH" >> /etc/profile && \
   rm -f /opt/apache-maven-3.5.4-bin.tar.gz && \
   update-alternatives --install /usr/bin/mvn maven /opt/apache-maven-3.5.4/bin/mvn 1

# ### Add the new settings.xml file ###
COPY settings.xml /opt/apache-maven-3.5.4/conf/settings.xml

# ### Update the docker group and jenkins user ###
RUN groupmod -g 993 docker && usermod -aG docker jenkins


# ### Create the Maven Repo ###
RUN mkdir /repo && chown -R jenkins:jenkins /repo

VOLUME /repo
USER jenkins


