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
  python3 \
  python3-pil \
  && apt-get purge --auto-remove -y curl \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /KiiConf

RUN cd /KiiConf \
  && git clone https://github.com/justinribeiro/KiiConf.git . \
  && tools/update_controller.bash \
  && mkdir -p /KiiConf/tmp && chmod 777 /KiiConf/tmp \
  && npm install \
  && npm run-script build \
  && chown -R www-data:www-data /KiiConf/dist

RUN mkdir -p /var/run/lighttpd && chown www-data:www-data /var/run/lighttpd
RUN touch /var/run/lighttpd.pid && chown www-data:www-data /var/run/lighttpd.pid
RUN cp /KiiConf/test_lighttpd.conf /etc/lighttpd/lighttpd.conf
RUN lighttpd-enable-mod fastcgi-php

EXPOSE 80

CMD /usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf
