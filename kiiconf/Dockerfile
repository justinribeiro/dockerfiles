# WIP so I don't have to run the config remote
# docker run -it -p 9999:80 justinribeiro/kiiconf
FROM ubuntu:xenial

LABEL maintainer="justin@justinribeiro.com" \
  version="0.1" \
  description="Kiibohd KiiConf Web Configurator for Whitefox"

RUN apt-get update && apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  --no-install-recommends \
  && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
  && apt-get update && apt-get install -y \
  binutils-arm-none-eabi \
  bsdmainutils \
  cmake \
  ctags \
  dfu-util \
  gcc-arm-none-eabi \
  git \
  libnewlib-arm-none-eabi \
  libusb-1.0-0-dev \
  lighttpd \
  ninja-build \
  nodejs \
  php-cgi \
  php-zip \
  python3 \
  python3-pil \
  python3-pip \
  vim \
  && apt-get purge --auto-remove -y curl \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /KiiConf

# heavy handed, but close enough for now
RUN cd /KiiConf \
  && git clone https://github.com/justinribeiro/KiiConf.git . \
  && mkdir -p /KiiConf/tmp && chmod 777 /KiiConf/tmp \
  && npm install \
  && tools/update_all.bash \
  && npm run-script build \
  && chown -R www-data:www-data /KiiConf

# Deps for kll building
RUN pip3 install layout \
  && pip3 install gitpython \
  && pip3 install kll

# chop out the pipenv check since that won't fly in container
RUN sed -i.bak -e '34,44d' /KiiConf/controller/Keyboards/cmake.bash

# setup the http side
RUN mkdir -p /var/run/lighttpd && chown www-data:www-data /var/run/lighttpd \
  && touch /var/run/lighttpd.pid && chown www-data:www-data /var/run/lighttpd.pid \
  && cp /KiiConf/test_lighttpd.conf /etc/lighttpd/lighttpd.conf \
  && lighttpd-enable-mod fastcgi-php

EXPOSE 80

CMD /usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf
