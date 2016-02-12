Docker Jenkins
==============

Docker project providing all our ci stuff in one command:

    docker-compose up -d

Edit the plugins.txt if you encounter missing jenkins plugins.

Jenkins Swarm Client
------------------------

Docker box with swarm client that will connect to the Jenkins master that is already running somewhere.

    docker-compose up -d swarm-client-ansible

The following ENV vars can be configured, their default values right behind it:

    XDEBUG_VERSION 2.3.3
    XDEBUG_MD5 60e6fdf41840104a23debe16db15a2af
    CLIENT_NAME Pakjespiet
    EXECUTORS 2
    OAUTH_TOKEN composer-oauth-token
    SWARM_CLIENT_VERSION 2.0
    
Be sure to edit the JENKINS_MASTER in docker-compose.yml and point it to your Jenkins server.

Configuring Jenkins
------------------------

Simply make a project and tick "Restrict where this project can be run" and add the label for the slave client you want it to run on.
Right now we have php56, ansible, docker and php70