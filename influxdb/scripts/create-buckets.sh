#!/bin/bash


#Create additional buckets
influx bucket create -n ${DOCKER_INFLUXDB_SQL_SERVER_BUCKETS} -o ${DOCKER_INFLUXDB_INIT_ORG} -r ${DOCKER_INFLUXDB_INIT_RETENTION}
influx bucket create -n ${DOCKER_INFLUXDB_JMETER_BUCKETS} -o ${DOCKER_INFLUXDB_INIT_ORG} -r ${DOCKER_INFLUXDB_INIT_RETENTION}
influx bucket create -n ${DOCKER_INFLUXDB_SOLR_BUCKETS} -o ${DOCKER_INFLUXDB_INIT_ORG} -r ${DOCKER_INFLUXDB_INIT_RETENTION}
influx bucket create -n ${DOCKER_INFLUXDB_HYBRIS_BUCKETS} -o ${DOCKER_INFLUXDB_INIT_ORG} -r ${DOCKER_INFLUXDB_INIT_RETENTION}
##
# run this command in influx cli to map between bucket and a database that use InfluxQL
#influx v1 dbrp create --db sqlserver_v1 --bucket-id [bucket id exp: 6939f114922dab04] --rp example-rp

