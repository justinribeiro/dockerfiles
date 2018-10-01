# USE AT OWN RISK: I HAVE NOT HEAVILY TESTED THIS
# Because I don't want to run the remote config tool, box it and run in...box.
# docker run -it -p 9999:80 justinribeiro/kiiconf
FROM ubuntu:bionic

LABEL maintainer="justin@justinribeiro.com" \
  version="0.1" \
  description="Kiibohd KiiConf Web Configurator for Input Club Whitefox"

# Because something wants tzdata, so we just punch this to the container so
# the apt=get doesn't hang
ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# I pulled this from the kiibohd docker image for the controllers, see
# https://github.com/kiibohd/controller/tree/master/Dockerfiles
RUN apt-get update && \
    apt-get install -qy locales

RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en
RUN locale-gen

# Install our packages (which I pulled from kiibohd dev docker file) and replace
# Node with a more up-to=date version
RUN apt-get update && apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  --no-install-recommends \
  && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
  && apt-get update && apt-get install -qy \
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

# I had to fork the KiiConf so I could make a few changed to the base lighttpd
# config and because I'll probably hack up some other pieces to this
RUN cd /KiiConf \
  && git clone https://github.com/justinribeiro/KiiConf.git . \
  && mkdir -p /KiiConf/tmp && chmod 777 /KiiConf/tmp \
  && npm install \
  && tools/update_all.bash \
  && npm run-script build \
  && chown -R www-data:www-data /KiiConf

# Since we're not running pip install against the reqs, just install some stuff
# at the top level so we can get on with our day
RUN pip3 install layout \
  && pip3 install gitpython \
  && pip3 install kll

# This is pretty heavy handed, but it'll make it work in the container
# 1. use sed to chop out the pipenv check since we're not going to use that in
#    the container (I should dig up a link to why this fails)
# 2. the path gen for kll is wrong, so we replace the specific line numbers for
#    default and partial maps so that we can feed them from the tmp fs
RUN sed -i.bak -e '34,44d' /KiiConf/controller/Keyboards/cmake.bash \
  && sed -i.bak '163s|^.*$|set ( DefaultMap_Args ${DefaultMap_Args} ${PROJECT_BINARY_DIR}/${MAP}.kll )|' /KiiConf/controller/Lib/CMake/kll.cmake \
  && sed -i.bak '192s|^.*$|set ( PartialMap_Args ${PartialMap_Args} ${PROJECT_BINARY_DIR}/${MAP_PART}.kll )|' /KiiConf/controller/Lib/CMake/kll.cmake

# This sets up the lighttpd server and the required PHP
RUN mkdir -p /var/run/lighttpd && chown www-data:www-data /var/run/lighttpd \
  && touch /var/run/lighttpd.pid && chown www-data:www-data /var/run/lighttpd.pid \
  && cp /KiiConf/test_lighttpd.conf /etc/lighttpd/lighttpd.conf \
  && lighttpd-enable-mod fastcgi-php

# We only expose 80 because no cert gen at moment
EXPOSE 80

CMD /usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf
