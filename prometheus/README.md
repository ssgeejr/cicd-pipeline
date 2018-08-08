



SAUCE: https://finestructure.co/blog/2016/5/16/monitoring-with-prometheus-grafana-docker-part-1


docker-compose.yml

version: '2'
services:
prometheus:
    image: prom/prometheus:0.18.0
    volumes:
        - ./prometheus.yml:/etc/prometheus/prometheus.yml
    command:
        - '-config.file=/etc/prometheus/prometheus.yml'
    ports:
        - '9090:9090'


prometheus.yml

global:
    scrape_interval: 5s
    external_labels:
        monitor: 'my-monitor'
scrape_configs:
    - job_name: 'prometheus'
      target_groups:
          - targets: ['localhost:9090']


docker-compose up


------------- PHASE II ----------------------

docker-compose.yml
# docker-compose.yml
version: '2'
services:
    prometheus:
        image: prom/prometheus:0.18.0
        volumes:
            - ./prometheus.yml:/etc/prometheus/prometheus.yml
        command:
            - '-config.file=/etc/prometheus/prometheus.yml'
        ports:
            - '9090:9090'
    node-exporter:
        image: prom/node-exporter:0.12.0rc1
        ports:
            - '9100:9100'

prometheus.yml
global:
    scrape_interval: 5s
    external_labels:
        monitor: 'my-monitor'
scrape_configs:
    - job_name: 'prometheus'
      target_groups:
          - targets: ['localhost:9090']
    - job_name: 'node-exporter'
      target_groups:
          - targets: ['node-exporter:9100']










+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



https://www.robustperception.io/configuring-prometheus-with-docker


docker run -p 9090:9090 prom/prometheus


cat <<EOF > prometheus.yml
global:
  scrape_interval:     10s
  evaluation_interval: 10s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']

EOF

cat <<EOF > Dockerfile
FROM prom/prometheus

# Add in the configuration file from the local directory.
ADD prometheus.yml /etc/prometheus/prometheus.yml
EOF


docker build -t prometheus_simple .
docker run -p 9090:9090 prometheus_simple






---*---*---*---*---*---*---*---*---*---


SOURCE: https://docs.docker.com/config/thirdparty/prometheus/#configure-and-run-prometheus

=====================================================================
# my global config
global:
  scrape_interval:     15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
  # scrape_timeout is set to the global default (10s).

  # Attach these labels to any time series or alerts when communicating with
  # external systems (federation, remote storage, Alertmanager).
  external_labels:
      monitor: 'codelab-monitor'

# Load rules once and periodically evaluate them according to the global 'evaluation_interval'.
rule_files:
  # - "first.rules"
  # - "second.rules"

# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.
scrape_configs:
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
  - job_name: 'prometheus'

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
      - targets: ['localhost:9090']

  - job_name: 'docker'
         # metrics_path defaults to '/metrics'
         # scheme defaults to 'http'.

    static_configs:
      - targets: ['localhost:9323']

=====================================================================

Next, start a single-replica Prometheus service using this configuration.

docker service create --replicas 1 --name my-prometheus \
    --mount type=bind,source=/tmp/prometheus.yml,destination=/etc/prometheus/prometheus.yml \
    --publish published=9090,target=9090,protocol=tcp \
    prom/prometheus
