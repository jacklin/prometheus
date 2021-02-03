#!/usr/bin/env bash

# 修改应用配置
sed -ie "s#<SCRAPE_INTERVAL>#$SCRAPE_INTERVAL#" /etc/prometheus/prometheus.yml
sed -ie "s#<EVALUATION_INTERVAL>#$EVALUATION_INTERVAL#" /etc/prometheus/prometheus.yml
sed -ie "s#<JOB_NAME>#$JOB_NAME#" /etc/prometheus/prometheus.yml
sed -ie "s#<TARGETS>#$TARGETS#" /etc/prometheus/prometheus.yml

#创建prometheus的tsdb目录
if [[ ! -d /prometheus/$HOSTNAME ]]; then
	mkdir -p /prometheus/$HOSTNAME
fi