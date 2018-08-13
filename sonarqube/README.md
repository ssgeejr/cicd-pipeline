


from: https://github.com/SonarSource/docker-sonarqube/issues/146
$ mkdir downloads plugins data

$ docker run -d \
    -v ${PWD}/plugins:/opt/sonarqube/extensions/plugins \
    -v ${PWD}/downloads:/opt/sonarqube/extensions/downloads \
    -v ${PWD}/data:/opt/sonarqube/data \
    --name test \
    -p 9000:9000 \
    sonarqube:6.7.1-alpine
#!/bin/bash

docker stop sprintqube
docker rm sprintqube

docker run -d --name sprintqube  -p 9000:9000 -p 9092:9092 -v /opt/cicd/sonarqube/data:/opt/sonarqube/data -v /opt/cicd/sonarqube/extensions:/opt/sonarqube/extensions sprintqube

docker run -d     --name sonarqube     -p 9000:9000 -p 9092:9092     -e SONARQUBE_JDBC_USERNAME=sonar     -e SONARQUBE_JDBC_PASSWORD=sonar     -e SONARQUBE_JDBC_URL=jdbc:postgresql://postgres/sonar     -v /server_data/sonarqube/data:/opt/sonarqube/data     -v /server_data/sonarqube/extensions:/opt/sonarqube/extensions     sprintqube




$ docker exec test ls /opt/sonarqube/extensions/plugins
checkstyle-sonar-plugin-4.8.jar
sonar-csharp-plugin-6.5.0.3766.jar
sonar-flex-plugin-2.3.jar
sonar-java-plugin-4.15.0.12310.jar
sonar-javascript-plugin-3.2.0.5506.jar
sonar-php-plugin-2.11.0.2485.jar
sonar-python-plugin-1.8.0.1496.jar
sonar-scm-git-plugin-1.3.0.869.jar
sonar-scm-svn-plugin-1.6.0.860.jar
sonar-typescript-plugin-1.1.0.1079.jar
sonar-xml-plugin-1.4.3.1027.jar

$ curl -s http://localhost:9000/api/plugins/installed | jq ".plugins[].key"
"checkstyle"
"flex"
"csharp"
"javascript"
"java"
"php"
"python"
"scmgit"
"scmsvn"
"typescript"
"xml"

$ curl -s http://localhost:9000/api/plugins/installed | jq ".plugins[].key" | wc -l
11
and same 11 plugins even after restart of container:

$ docker stop test && docker start test
$ curl -s http://localhost:9000/api/plugins/installed | jq ".plugins[].key" | wc -l
11

$ docker restart test
$ curl -s http://localhost:9000/api/plugins/installed | jq ".plugins[].key" | wc -l
11
