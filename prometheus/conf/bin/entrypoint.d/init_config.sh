#!/usr/bin/env bash

# 修改应用配置
sed -ie "s#<PROMETHEUS_JOB>#$PROMETHEUS_JOB#" \
/etc/prometheus/prometheus.yml