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

if [[ "$JOB_NAMES" != "" && "$JOB_TARGETS" != "" ]]; then
	n=0
	for jt in $JOB_TARGETS; do
		n=`expr $n + 1`
		eval jts$n="$jt"
	done
	# eval echo "The $n element of array is: \$jts1"
	# eval echo "The $n element of array is: \$jts2"
	m=0
	echo "" >> /etc/prometheus/prometheus.yml
	for jn in ${JOB_NAMES}; do
		m=`expr $m + 1`
		echo "  - job_name: ${jn}"  >> /etc/prometheus/prometheus.yml
		echo "    static_configs:"   >> /etc/prometheus/prometheus.yml
		eval echo "\  \  - targets: \$jts$m" >> /etc/prometheus/prometheus.yml
		# echo $l >> /etc/prometheus/prometheus.yml
	done
	cat /etc/prometheus/prometheus.yml
fi
