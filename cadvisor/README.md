




docker run -p 9100:8080 -d --name=cadvisor google/cadvisor:latest





docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=9100:8080 \
  --detach=true \
  --name=cadvisor \
  --rm \
  google/cadvisor:latest










