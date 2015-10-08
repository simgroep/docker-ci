FROM php:5.6-cli

USER root
RUN apt-get update \
        && apt-get install -y sudo default-jre wget git php5-common zlib1g-dev \
        && docker-php-ext-install zip \
        && rm -rf /var/lib/apt/lists/*

# Setup the Xdebug version to install
ENV XDEBUG_VERSION 2.3.3
ENV XDEBUG_MD5 60e6fdf41840104a23debe16db15a2af

# Install Xdebug
RUN set -x \
	&& curl -SL "http://www.xdebug.org/files/xdebug-$XDEBUG_VERSION.tgz" -o xdebug.tgz \
	&& echo $XDEBUG_MD5 xdebug.tgz | md5sum -c - \
	&& mkdir -p /usr/src/xdebug \
	&& tar -xf xdebug.tgz -C /usr/src/xdebug --strip-components=1 \
	&& rm xdebug.* \
	&& cd /usr/src/xdebug \
	&& phpize \
	&& ./configure \
	&& make -j"$(nproc)" \
	&& make install \
	&& make clean

COPY /php-conf.d/ext-xdebug.ini /usr/local/etc/php/conf.d/

USER root
RUN wget http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar

USER root
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

USER root
COPY /php-conf.d/timezone.ini /usr/local/etc/php/conf.d/timezone.ini

USER root
RUN /usr/local/bin/composer config -g github-oauth.github.com 0bb65b4a90dd9f0e3f6c706a4700dd736d7e5c44

USER root
ENTRYPOINT java -jar swarm-client-2.0-jar-with-dependencies.jar -master http://172.31.0.172/ -labels php56
