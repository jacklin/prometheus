FROM prom/prometheus:master

MAINTAINER linjiancheng (sys.linjc@gmail.com)

ENV STORAGE_TSDB_RETENTION_TIME="90d" \
STORAGE_TSDB_RETENTION_SIZE="1GB" \
SCRAPE_INTERVAL="15s" \
EVALUATION_INTERVAL="15s" \
JOB_NAME="prometheus" \
TARGETS="['localhost:9090']" \
JOB_NAMES="prometheus-canal-0" \
JOB_TARGETS="[\'localhost:9090\']"
COPY conf/bin/ /opt/docker/bin/

COPY conf/prometheus.yml /etc/prometheus/

ENTRYPOINT [ "/bin/sh","/opt/docker/bin/entrypoint.sh" ]
