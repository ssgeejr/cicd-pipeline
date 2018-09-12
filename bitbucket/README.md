#Bitbucket Docker Implementation

[Docker Hub Documentation](https://hub.docker.com/r/atlassian/bitbucket-server:5.13.0/)



docker run -v bitbucketVolume:/var/atlassian/application-data/bitbucket --name="bitbucket" -d -p 7990:7990 -p 7999:7999 atlassian/bitbucket-server:5.13.0




docker run -u root -v /data/bitbucket:/var/atlassian/application-data/bitbucket atlassian/bitbucket-server:5.13.0 chown -R daemon  /var/atlassian/application-data/bitbucket




Start Atlassian Bitbucket Server:
docker run -v /data/bitbucket:/var/atlassian/application-data/bitbucket --name="bitbucket" -d -p 7990:7990 -p 7999:7999 atlassian/bitbucket-server:5.13.0

the use of a volume can be substituted for the directory mapping
```
docker volume create --name bitbucketVolume
... -v bitbucketVolume:/var/atlassian/application-data/bitbucket ...
```

Docker-compose:
```
version: '3.4'
services:
    bitbucket:
	    image: 
		name: bitbucket
    sprintbucket:
        image: atlassian/bitbucket-server:5.13.0
        container_name: bitbucket
        networks:
                cicd_net:
                        ipv4_address: 10.10.10.110
                        aliases:
                                - bitbucket

        ports:
            - "7990:7990"
            - "7999:7999"
        volumes:
            - $CICD_HOME/bitbucket/data/var/atlassian/application-data/bitbucket
        tty: true
        stdin_open: true
        restart: always

#this is assumed hte network has already been created and this is part of the cicd-pipeline/docker-compose/docker-compose.yml subset
```


## Bitbucket configurations (https://github.com/blacklabelops/bitbucket)

``` -e "BITBUCKET_CONTEXT_PATH=/bitbucket" \ ```

The bitbucket.properties file is only created when needed by the application, for example, when migrating to an external database, the file will be created if it doesn't exist.

If the file does not exist in $BITBUCKET_HOME/shared feel free to create it and include the SSL configuration that you need. Just make sure that the atlbitbucket user is the owner of the file.

**** HOME DIRECTORY ****
Successfully acquired lock on home directory /var/atlassian/application-data/bitbucket/shared


#sample: bitbucket.properties
server.context-path=/bitbucket
server.port=7443                   # Jira is using 8443
server.secure=true
server.scheme=https
server.ssl.enabled=true
server.ssl.client-auth=want
server.ssl.protocol=TLSv1.2
server.ssl.key-store="path to my keystore"
server.ssl.key-store-password="mypass"
server.ssl.key-password="mypass"
server.require-ssl=true
