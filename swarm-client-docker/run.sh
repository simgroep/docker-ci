#! /usr/bin/env sh

service docker start
service docker status
java -jar swarm-client-2.0-jar-with-dependencies.jar -master $JENKINS_MASTER -labels docker -executors $EXECUTORS -name $CLIENT_NAME
