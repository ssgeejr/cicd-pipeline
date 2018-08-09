FROM jenkins/jenkins:lts 

MAINTAINER Steve S Gee Jr <ioexcept@gmail.com>

USER root
RUN apt-get update && apt-get install -y git
COPY apache-maven-3.5.4-bin.tar.gz /opt
WORKDIR /opt
RUN tar -zxf apache-maven-3.5.4-bin.tar.gz
RUN echo "M2_HOME=/opt/apache-maven-3.5.4" >> /etc/profile
RUN echo "PATH=$PATH:$M2_HOME/bin" >> /etc/profile
RUN echo "export M2_HOME PATH" >> /etc/profile
RUN rm -f /opt/apache-maven-3.5.4-bin.tar.gz
RUN mkdir /repo
COPY settings.xml /opt/apache-maven-3.5.4/conf/settings.xml
RUN chown -R jenkins:jenkins /repo
VOLUME /repo
USER jenkins




