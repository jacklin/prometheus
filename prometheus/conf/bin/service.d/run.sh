#!/usr/bin/env bash

# Init vars
# 
set -x
/bin/prometheus --config.file=/etc/prometheus/prometheus.yml \
--storage.tsdb.path=/prometheus \
--storage.tsdb.retention.time=${STORAGE_TSDB_RETENTION_TIME} \
--storage.tsdb.retention.size=${STORAGE_TSDB_RETENTION_SIZE} \
--storage.tsdb.wal-compression \
--web.console.libraries=/usr/share/prometheus/console_libraries \
--web.console.templates=/usr/share/prometheus/consoles