FROM prom/prometheus:master

MAINTAINER linjiancheng (sys.linjc@gmail.com)

ENV STORAGE_TSDB_RETENTION_TIME="90d" \
STORAGE_TSDB_RETENTION_SIZE="1GB" \
PROMETHEUS_JOB="kong7723"

COPY conf/bin/ /opt/docker/bin/

COPY conf/prometheus.yml /etc/prometheus/

ENTRYPOINT [ "/bin/sh","/opt/docker/bin/entrypoint.sh" ]
