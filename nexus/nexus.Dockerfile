FROM ubuntu:14.04

ENV SONATYPE_WORK /sonatype-work
ENV NEXUS_VERSION 2.13.0-01
ENV NEXUS_HOME /opt/sonatype/nexus

ENV http_proxy http://xx.xx.xx:8080
ENV https_proxy http://xx.xx.xx:8080

RUN apt-get update && apt-get -y upgrade && apt-get -y install software-properties-common && add-apt-repository ppa:webupd8team/java -y && apt-get update

RUN (echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections) && apt-get install -y oracle-java8-insta$

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV PATH $JAVA_HOME/bin:$PATH

#RUN apt-get update
RUN apt-get install -y ldap-utils curl wget vim nano sudo git unzip

ADD https://download.sonatype.com/nexus/oss/nexus-${NEXUS_VERSION}-bundle.zip nexus-${NEXUS_VERSION}-bundle.zip
#ADD https://download.sonatype.com/nexus/oss/nexus-2.13.0-01-bundle.zip nexus-2.13.0-01-bundle.zip
# Extract Nexus
RUN set -x \
        && unzip nexus-${NEXUS_VERSION}-bundle.zip \
  && mkdir -p ${NEXUS_HOME} \
        && cp -r nexus-${NEXUS_VERSION}/* ${NEXUS_HOME} \
        && rm -rf nexus-${NEXUS_VERSION}-bundle.tar.gz \
  && rm -rf nexus-${NEXUS_VERSION}

RUN groupadd -r nexus -g 3001 && \
    useradd -u 3001 -r -g nexus -m -d ${SONATYPE_WORK} -s /bin/bash -c "Nexus Run User" nexus

VOLUME ${SONATYPE_WORK}

EXPOSE 8081

WORKDIR /opt/sonatype/nexus

ENV CONTEXT_PATH /
ENV MAX_HEAP 768m
ENV MIN_HEAP 256m
ENV JAVA_OPTS -server -XX:MaxPermSize=192m -Djava.net.preferIPv4Stack=true
ENV LAUNCHER_CONF ./conf/jetty.xml ./conf/jetty-requestlog.xml

CMD java \
  -Dnexus-work=${SONATYPE_WORK} -Dnexus-webapp-context-path=${CONTEXT_PATH} \
  -Xms${MIN_HEAP} -Xmx${MAX_HEAP} \
  -cp 'conf/:lib/*' \
  ${JAVA_OPTS} \
  org.sonatype.nexus.bootstrap.Launcher ${LAUNCHER_CONF}
