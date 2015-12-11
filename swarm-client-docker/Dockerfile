FROM ubuntu:latest

ENV CLIENT_NAME Spacedockpiet
ENV EXECUTORS 2
ENV OAUTH_TOKEN 0bb65b4a90dd9f0e3f6c706a4700dd736d7e5c44
ENV JENKINS_MASTER http://172.31.0.172/
ENV SWARM_CLIENT_VERSION 2.0

RUN apt-get update && \
    apt-get install -y curl wget default-jre git && \
    curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    rm -rf /var/lib/apt/lists/*

RUN wget http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/$SWARM_CLIENT_VERSION/swarm-client-$SWARM_CLIENT_VERSION-jar-with-dependencies.jar

CMD java -jar swarm-client-2.0-jar-with-dependencies.jar -master $JENKINS_MASTER -labels docker -executors $EXECUTORS -name $CLIENT_NAME
