FROM php:5.6-cli

USER root
RUN apt-get update \
        && apt-get install -y sudo default-jre wget git php5-common\
        && rm -rf /var/lib/apt/lists/*

USER root
RUN wget http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar

USER root
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

USER root
ENTRYPOINT java -jar swarm-client-2.0-jar-with-dependencies.jar -master http://172.31.0.172/
