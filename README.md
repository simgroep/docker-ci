Docker Jenkins
==============

Docker project providing all our ci stuff in one command:

    sudo docker-compose up -d

Edit the plugins.txt if you encounter missing jenkins plugins.

Jenkins Swarm Client
------------------------

Docker box that will connect to the Docker master that is already running somewhere.

    docker-compose up -d swarm-client

The following ENV vars can be configured, their default values right behind it:

    XDEBUG_VERSION 2.3.3
    XDEBUG_MD5 60e6fdf41840104a23debe16db15a2af
    CLIENT_NAME Pakjespiet
    EXECUTORS 5
    OAUTH_TOKEN 0bb65b4a90dd9f0e3f6c706a4700dd736d7e5c44
    JENKINS_MASTER http://172.31.0.172/
    SWARM_CLIENT_VERSION 2.0