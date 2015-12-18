FROM williamyeh/ansible:ubuntu14.04-onbuild

ENV CLIENT_NAME Uitpakpiet
ENV EXECUTORS 2
ENV JENKINS_MASTER http://172.31.0.172/
ENV SWARM_CLIENT_VERSION 2.0
ENV LABELS ansible

RUN apt-get update \
        && apt-get install -y sudo default-jre wget git python-pip python-dev libssl-dev \
        && rm -rf /var/lib/apt/lists/*

RUN wget http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/$SWARM_CLIENT_VERSION/swarm-client-$SWARM_CLIENT_VERSION-jar-with-dependencies.jar

ENTRYPOINT java -jar swarm-client-2.0-jar-with-dependencies.jar -master $JENKINS_MASTER -labels $LABELS -executors $EXECUTORS -name $CLIENT_NAME