

NEXUS


CONTEXT_PATH, passed as -Dnexus-webapp-context-path. This is used to define the
URL which Nexus is accessed.
MAX_HEAP, passed as -Xmx. Defaults to 768m.
MIN_HEAP, passed as -Xms. Defaults to 256m.
JAVA_OPTS. Additional options can be passed to the JVM via this variable.
Default: -server -XX:MaxPermSize=192m -Djava.net.preferIPv4Stack=true.
LAUNCHER_CONF. A list of configuration files supplied to the
Nexus bootstrap launcher. Default: ./conf/jetty.xml ./conf/jetty-requestlog.xml




Default credentials are: admin / admin123

docker run -p 8081:8081 --name nexus --rm -v /opt/cicd/nexus/data:/nexus-data sonatype/nexus:oss

## Nexus 3.x.x

https://github.com/calvinlfer/docker-nexus3-oss

https://hub.docker.com/r/sonatype/nexus3/
https://blog.sonatype.com/using-nexus-3-as-your-repository-part-3-docker-images

docker run -d -p 8081:8081 --name nexus -e INSTALL4J_ADD_VM_PARAMS="-Xms2g -Xmx2g -XX:MaxDirectMemorySize=3g  -Djava.util.prefs.userRoot=/some-other-dir" sonatype/nexus3

Of particular note, -Djava.util.prefs.userRoot=/some-other-dir can be set to a persistent path, which will maintain
the installed Nexus Repository License if the container is restarted.

https://www.sonatype.com/download-oss-sonatype



https://www.sonatype.com/nexus-repository-oss-vs.-pro-features

https://www.sonatype.com/nexus-repository-oss

https://www.sonatype.com/oss-thank-you-tar.gz


https://github.com/ansible-ThoTeam/nexus3-oss#ansible-role-nexus-3-oss


https://github.com/sonatype/docker-nexus3-oss#ansible-role-nexus-3-oss

