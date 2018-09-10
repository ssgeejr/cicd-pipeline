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
