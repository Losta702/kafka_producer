#!/bin/bash
#/opt/zookeeper/apache-zookeeper-3.9.1-binbin/zookeeper-server-start.sh /opt/zookeeper/apache-zookeeper-3.9.1-bin/config/zookeeper.properties &
/opt/zookeeper/apache-zookeeper-3.9.1-bin/bin/zkServer.sh start-foreground #&
#/opt/kafka/kafka_2.11-0.9.0.0/bin/kafka-server-start.sh /opt/kafka/kafka_2.11-0.9.0.0/config/server.properties