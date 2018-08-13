## configure an nginx instance to run as reverse-proxy front end

```
docker rmi -f nginxsrv
docker stop ngnx
docker rm ngnx
docker build -t nginxsrv .
docker run --name ngnx --rm -p 80:80 -ti nginxsrv
```


```
[docker]
--restart=always
[jenkins]
--prefix=/jenkins
```
