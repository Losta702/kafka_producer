FROM ubuntu:latest


# Update package lists and install wget
RUN apt-get update && apt-get install -y wget && apt-get install -y openjdk-8-jdk

RUN apt-get install vim -y

RUN apt-get install --reinstall coreutils

# Set the default Java version
RUN update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

RUN wget https://dlcdn.apache.org/zookeeper/zookeeper-3.9.1/apache-zookeeper-3.9.1-bin.tar.gz -P /opt/zookeeper && \
    tar -zxf /opt/zookeeper/apache-zookeeper-3.9.1-bin.tar.gz -C /opt/zookeeper && \
    rm /opt/zookeeper/apache-zookeeper-3.9.1-bin.tar.gz

# Set up data directory
RUN mkdir -p /opt/zookeeper/apache-zookeeper-3.9.1-bin/data

# Copy zoo.cfg from local system
COPY /zookeeper/zoo.cfg /opt/zookeeper/apache-zookeeper-3.9.1-bin/conf/zoo.cfg

RUN mkdir /opt/kafka

# Download and extract Kafka
RUN wget https://archive.apache.org/dist/kafka/0.9.0.0/kafka_2.11-0.9.0.0.tgz -O /opt/kafka/kafka_2.11-0.9.0.0.tgz && \
    tar -zxf /opt/kafka/kafka_2.11-0.9.0.0.tgz -C /opt/kafka/ && \
    rm /opt/kafka/kafka_2.11-0.9.0.0.tgz

# Set working directory to Kafka
#WORKDIR /opt//kafka/kafka_2.11-0.9.0.0

WORKDIR /opt/kafka/kafka_2.11-0.9.0.0

# Expose Kafka port
EXPOSE 9092

#RUN mkdir /scripts

# Copy the startup script into the container
COPY /test/startservices.sh /scripts/startservices.sh

RUN chmod +rwx /scripts

# Make the script executable
RUN chmod +x /scripts/startservices.sh

RUN chmod +rw /opt/kafka/kafka_2.11-0.9.0.0/config/server.properties

# Start Zookeeper and Kafka
#CMD ["/scripts/startservices.sh"]

#CMD ["vi","/opt/kafka_2.11-0.9.0.0/config/server.properties"]

#CMD ["ls","/opt/kafka_2.11-0.9.0.0/config"]

#CMD ["ls"]

ENTRYPOINT ["sh", "/scripts/startservices.sh"]

