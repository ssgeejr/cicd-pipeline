FROM java:8-jre

MAINTAINER Steve S Gee Jr <ioexcept@gmail.com>

ADD gitbucket.war /opt/gitbucket.war

RUN ln -s /gitbucket /root/.gitbucket

VOLUME /gitbucket

# Port for web page
EXPOSE 8080
# Port for SSH access to git repository (Optional)
EXPOSE 29418

CMD ["java", "-jar", "/opt/gitbucket.war", "--prefix=git"]
