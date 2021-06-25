FROM ubuntu:20.04
# Install OpenJDK-8
RUN apt-get update && \
apt-get install -y openjdk-14-jdk && \
apt-get install -y ant && \
apt-get clean;

# Fix certificate issues
RUN apt-get update && \
apt-get install ca-certificates-java && \
apt-get clean && \
update-ca-certificates -f;

# Setup JAVA_HOME — useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-14-openjdk-amd64/
RUN export JAVA_HOME
COPY bin /server/bin/
COPY conf /server/conf/
COPY lib /server/lib/
COPY logs /server/logs/
COPY pluginlib /server/pluginlib/
COPY LICENSE /server/
COPY NOTICE /server/
WORKDIR /server/
