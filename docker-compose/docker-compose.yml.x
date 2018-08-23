#version: '3'
#version: '2'
#
#entrypoint:
# - bash
#labels:
# - "HDInsight client VM"


version: '3'
services:
    nginx:
        image: sprintngnx
        container_name: sprintngnx
        networks:
                cicd_net:
                        ipv4_address: 10.10.10.10
        ports:
            - "80:80"
        tty: true
        stdin_open: true
        restart: always

    sprintbucket:
        image: sprintgit
        container_name: sprintgit
        networks:
                cicd_net:
                        ipv4_address: 10.10.10.50
                        aliases:
                                - gitbucket

        ports:
            - "8880:8080"
        volumes:
            - $CICD_HOME/gitbucket/data:/gitbucket
        tty: true
        stdin_open: true
        restart: always

    jenkins:
        image: sprintkins
        container_name: sprintkins
        networks:
                cicd_net:
                        ipv4_address: 10.10.10.20
                        aliases:
                                - jenkins

        ports:
            - "8080:8080"
            - "50000:50000"
        volumes:
            - /var/run/docker.sock:/var/run/docker.sock 
            - $CICD_HOME/jenkins/home:/var/jenkins_home
            - $CICD_HOME/repo:/repo
        environment:
            - "JENKINS_OPTS=--prefix=/jenkins"
        tty: true
        stdin_open: true
        restart: always

    sonarqube:
        image: sprintqube
        container_name: sprintqube
        networks:
                cicd_net:
                        ipv4_address: 10.10.10.40
                        aliases:
                                - sonar
        ports:
            - "9000:9000"
            - "9092:9092"
        volumes:
            - $CICD_HOME/sonarqube/extensions:/opt/sonarqube/extensions
            - $CICD_HOME/sonarqube/data:/opt/sonarqube/data
        tty: true
        stdin_open: true
        restart: always


    nexusint:
        image: sonatype/nexus:oss
        container_name: nexusint
        networks:
                cicd_net:
                        ipv4_address: 10.10.10.60
                        aliases:
                                - nexusint
        ports:
            - 8081:8081
        volumes:
            - $CICD_HOME/nexusint/data:/nexus-data
        #environment:
        # passed as -Dnexus-webapp-context-path. This is used 
        # to define the URL which Nexus is accessed.    
        #    CONTEXT_PATH: nexusint
        # passed as -Xmx. Defaults to 768m.
        # MAX_HEAP:
        # passed as -Xms. Defaults to 256m. 
        # MIN_HEAP:
        # Additional options can be passed to the JVM via this variable.
        # Default: -server -XX:MaxPermSize=192m -Djava.net.preferIPv4Stack=true.
        # JAVA_OPTS:
        # A list of configuration files supplied to the
        # Nexus bootstrap launcher. Default: ./conf/jetty.xml ./conf/jetty-requestlog.xml
        # LAUNCHER_CONF:

        tty: true
        stdin_open: true
        restart: always

    nexusmst:
        image: sonatype/nexus:oss
        container_name: nexusmst
        networks:
                cicd_net:
                        ipv4_address: 10.10.10.65
                        aliases:
                                - nexusmst
#        ports:
#            - 8081:8081
        volumes:
            - $CICD_HOME/nexusmst/data:/nexus-data
        #environment:
        # passed as -Dnexus-webapp-context-path. This is used
        # to define the URL which Nexus is accessed.
        #    CONTEXT_PATH: nexusmst
        # passed as -Xmx. Defaults to 768m.
        # MAX_HEAP:
        # passed as -Xms. Defaults to 256m.
        # MIN_HEAP:
        # Additional options can be passed to the JVM via this variable.
        # Default: -server -XX:MaxPermSize=192m -Djava.net.preferIPv4Stack=true.
        # JAVA_OPTS:
        # A list of configuration files supplied to the
        # Nexus bootstrap launcher. Default: ./conf/jetty.xml ./conf/jetty-requestlog.xml
        # LAUNCHER_CONF:
        tty: true
        stdin_open: true
        restart: always

    registry:
        image: registry:2
        container_name: registry
        networks:
                cicd_net:
                        ipv4_address: 10.10.10.70
                        aliases:
                                - registry
        ports:
            - 5000:5000
        volumes:
            - $CICD_HOME/registry:/var/lib/registry
        tty: true
        stdin_open: true
        restart: always

    prometheus:
        image: prom/prometheus:latest
        container_name: prometheus
        networks:
                cicd_net:
                        ipv4_address: 10.10.10.80
                        aliases:
                                - prom
        ports:
            - "9090:9090"
        volumes:
            - $CICD_HOME/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml
        command:
            - '-config.file=/etc/prometheus/prometheus.yml'
        tty: true
        stdin_open: true
        restart: always

    cadvisor:
        image: google/cadvisor:latest
        container_name: cadvisor
        networks:
                cicd_net:
                        ipv4_address: 10.10.10.90
        ports:
            - "9100:8080"
        volumes:
            - /:/rootfs:ro
            - /var/run:/var/run:rw
            - /sys:/sys:ro
            - /var/lib/docker/:/var/lib/docker:ro
            - /dev/disk/:/dev/disk:ro
        tty: true
        stdin_open: true
        restart: always

networks:
    cicd_net:
        driver: bridge
        ipam:
            driver: default
            config: [{subnet: 10.10.10.0/24}]

