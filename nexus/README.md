

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
